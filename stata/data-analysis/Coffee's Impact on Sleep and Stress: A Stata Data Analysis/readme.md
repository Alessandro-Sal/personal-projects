# Café, Sono e Saúde: Evidências do Global Coffee Health Dataset

> **Disciplina:** RCC4705 – Estatística Básica  
> **Instituição:** Universidade de São Paulo – FEA-RP  
> **Departamento:** Administração  
> **Período:** 2025

---

## Resumo

Investigação quantitativa da relação entre consumo de café, sono e estresse com base no **Global Coffee Health Dataset** (Kaggle), contendo 10.000 observações de 20 países. Utilizando o software **Stata**, foram aplicadas técnicas de estatística descritiva, testes de hipóteses (teste t, qui-quadrado) e regressão linear múltipla.

**Principais achados:**
- Consumidores de mais de 4 xícaras/dia dormem em média **23 minutos a menos** por noite
- Alto consumo de café está **associado a maiores níveis de estresse** (χ² = 37,85; p < 0,001)
- Cada xícara adicional reduz o sono em **~1 minuto por noite**, mesmo controlando por idade, IMC e hábitos

---

## Sumário

1. [Introdução e Objetivo](#introdução-e-objetivo)
2. [Dataset](#dataset)
3. [Perguntas de Pesquisa](#perguntas-de-pesquisa)
4. [Importação e Preparação dos Dados](#importação-e-preparação-dos-dados)
5. [Estatística Descritiva](#estatística-descritiva)
6. [Hipótese 1 — Sono e alto consumo de café](#hipótese-1--sono-e-alto-consumo-de-café)
7. [Hipótese 2 — Estresse e alto consumo de café](#hipótese-2--estresse-e-alto-consumo-de-café)
8. [Hipótese 3 — Regressão linear múltipla](#hipótese-3--regressão-linear-múltipla)
9. [Verificação de Pressupostos](#verificação-de-pressupostos)
10. [Conclusão](#conclusão)
11. [Apêndice: Códigos Stata](#apêndice-códigos-stata)
12. [Referências](#referências)

---

## Introdução e Objetivo

O café é uma das bebidas mais consumidas no mundo, presente em diversos países e culturas (Amrouk, Palmeri & Magrini, 2025). Embora traga benefícios como aumento de atenção e energia, pode impactar negativamente o sono e o estresse.

**Objetivo geral:** investigar a relação entre consumo de café, sono e estresse de forma quantitativa, utilizando o Global Coffee Health Dataset.

**Objetivo específico:** avaliar a associação entre consumo de café e horas/qualidade de sono, e verificar se o consumo elevado está relacionado a maior estresse.

**Software utilizado:** Stata — estatística descritiva, testes de hipóteses e regressão linear múltipla.

---

## Dataset

| Atributo | Valor |
|----------|-------|
| **Fonte** | Global Coffee Health Dataset — Kaggle |
| **Observações** | 10.000 |
| **Variáveis** | 16 |
| **Países** | 20 |
| **Cobertura temática** | Demografia, consumo de café e cafeína, sono, IMC, frequência cardíaca, estresse, atividade física, hábitos e ocupação |

**Variáveis principais:**

| Variável | Tipo | Descrição |
|----------|------|-----------|
| `Coffee_Intake` | byte | Xícaras de café por dia |
| `Caffeine_mg` | int | Consumo de cafeína em mg |
| `Sleep_Hours` | float* | Horas de sono por noite |
| `Sleep_Quality` | str | Qualidade do sono (Excellent/Good/Fair/Poor) |
| `Stress_Level` | str | Nível de estresse (Low/Medium/High) |
| `BMI` | float* | Índice de Massa Corporal |
| `Physical_Activity_Hours` | float* | Horas de atividade física por semana |
| `Age` | byte | Idade |
| `Smoking` | byte | Tabagismo (dummy) |
| `Alcohol_Consumption` | byte | Consumo de álcool |

*Corrigidas por divisão por 10 (ver seção de preparação)*

---

## Perguntas de Pesquisa

1. **H1:** Quem bebe mais de 4 xícaras por dia dorme menos?
2. **H2:** O consumo elevado está associado a níveis de estresse mais altos?
3. **H3:** O café prediz as horas de sono? *(controlando por idade, IMC e hábitos)*

---

## Importação e Preparação dos Dados

```stata
set dp comma
import excel "Global Coffee Health Dataset.xlsx", firstrow clear
describe
```

**Resultado do `describe`:** 10.000 observações, 16 variáveis — conforme esperado.

### Correção de escala

Algumas variáveis estavam registradas multiplicadas por 10 (ex: `Sleep_Hours = 66` em vez de `6,6`). Foram criadas variáveis corrigidas e os valores originais substituídos:

```stata
gen Sleep_Hours_real        = Sleep_Hours / 10
gen BMI_real                = BMI / 10
gen Physical_Activity_real  = Physical_Activity_Hours / 10

replace Sleep_Hours             = Sleep_Hours / 10             // 10.000 mudanças
replace BMI                     = BMI / 10                     // 10.000 mudanças
replace Physical_Activity_Hours = Physical_Activity_Hours / 10 //  9.973 mudanças
```

---

## Estatística Descritiva

### Variáveis contínuas

```stata
summarize Sleep_Hours_real BMI_real Physical_Activity_real
```

| Variável | Obs | Média | Desvio Padrão | Mín | Máx |
|----------|-----|-------|---------------|-----|-----|
| `Sleep_Hours_real` | 10.000 | **6,64h** | 1,22 | 3,0 | 10,0 |
| `BMI_real` | 10.000 | **23,99** | 3,91 | 15,0 | 38,2 |
| `Physical_Activity_real` | 10.000 | **7,49h/sem** | 4,32 | 0,0 | 15,0 |

### Qualidade do sono

```stata
tabulate Sleep_Quality
```

| Qualidade | Frequência | % |
|-----------|-----------|---|
| Excellent | 1.352 | 13,52% |
| Fair | 2.050 | 20,50% |
| **Good** | **5.637** | **56,37%** |
| Poor | 961 | 9,61% |

### Nível de estresse

```stata
tabulate Stress_Level
```

| Nível | Frequência | % |
|-------|-----------|---|
| High | 961 | 9,61% |
| **Low** | **6.989** | **69,89%** |
| Medium | 2.050 | 20,50% |

> A maioria dos participantes dorme bem e tem baixo estresse, mas existe uma parcela considerável com sono ruim ou estresse elevado — os grupos potencialmente mais afetados pelo alto consumo de café.

---

## Hipótese 1 — Sono e alto consumo de café

**Teste:** t de médias para amostras independentes (`ttest`)

```stata
gen high_coffee = (Coffee_Intake > 4)
ttest Sleep_Hours, by(high_coffee)
```

### Resultados

| Grupo | N | Média (horas de sono) | IC 95% |
|-------|---|-----------------------|--------|
| `high_coffee = 0` (≤ 4 xícaras) | 893 | **6,985h** | [6,905 ; 7,066] |
| `high_coffee = 1` (> 4 xícaras) | 9.107 | **6,602h** | [6,577 ; 6,627] |
| **Diferença** | — | **0,383h (~23 min)** | [0,299 ; 0,467] |

```
t = 8,98   |   p < 0,001   |   df = 9.998
```

**Conclusão H1:** ✅ Confirmada. Quem bebe mais de 4 xícaras por dia dorme significativamente menos (~23 minutos a menos por noite, p < 0,001).

---

## Hipótese 2 — Estresse e alto consumo de café

**Teste:** Qui-quadrado de independência (`tabulate ... chi2`)

```stata
tabulate Stress_Level high_coffee, chi2
```

### Tabela de contingência

| Nível de estresse | high_coffee = 0 | high_coffee = 1 | Total |
|-------------------|-----------------|-----------------|-------|
| High | 48 | 913 | 961 |
| Low | 701 | 6.288 | 6.989 |
| Medium | 144 | 1.906 | 2.050 |
| **Total** | **893** | **9.107** | **10.000** |

```
Pearson χ²(2) = 37,85   |   p < 0,001
```

**Conclusão H2:** ✅ Confirmada. Existe associação estatisticamente significativa entre alto consumo de café e maiores níveis de estresse (p < 0,001). Os dois fatores não podem ser considerados independentes.

---

## Hipótese 3 — Regressão linear múltipla

**Modelo:** horas de sono como função do consumo de café, controlando por covariáveis

```stata
regress Sleep_Hours Coffee_Intake Age BMI Smoking Alcohol_Consumption Physical_Activity_Hours
```

### Resultados da regressão

| Variável | Coeficiente | Erro padrão | t | p-valor |
|----------|-------------|-------------|---|---------|
| `Coffee_Intake` | **−0,0160** | 0,0008 | −19,38 | **< 0,001** |
| `Age` | 0,0003 | 0,0011 | 0,29 | 0,773 |
| `BMI` | 0,0021 | 0,0031 | 0,68 | 0,496 |
| `Smoking` | 0,0300 | 0,0300 | 1,00 | 0,317 |
| `Alcohol_Consumption` | −0,0131 | 0,0262 | −0,50 | 0,618 |
| `Physical_Activity_Hours` | −0,0029 | 0,0028 | −1,06 | 0,291 |
| `_cons` | 6,9974 | 0,0891 | 78,55 | < 0,001 |

### Qualidade do ajuste

| Métrica | Valor |
|---------|-------|
| R² | 0,0365 |
| R² ajustado | 0,0359 |
| F(6, 9993) | 63,08 |
| Prob > F | < 0,001 |
| Root MSE | 1,1999 |

**Interpretação:**
- Cada xícara adicional de café reduz o sono em **~0,016h (~1 min)** por noite
- Efeito acumulado: 10 xícaras extras → ~10 minutos a menos de sono por noite
- Nenhum dos controles (idade, IMC, fumo, álcool, atividade física) foi significativo
- R² baixo (3,6%) é esperado em pesquisas de comportamento humano, onde inúmeros fatores influenciam o sono

**Conclusão H3:** ✅ Confirmada. O café é o único preditor significativo do modelo, com efeito negativo sobre as horas de sono mesmo após controle por variáveis demográficas e de hábitos.

---

## Verificação de Pressupostos

```stata
sktest Sleep_Hours   // Teste de assimetria e curtose
swilk Sleep_Hours    // Shapiro-Wilk
```

| Teste | Estatística | p-valor | Decisão |
|-------|-------------|---------|---------|
| Skewness/Kurtosis (`sktest`) | χ²(2) = 9,52 | 0,0085 | Rejeita normalidade |
| Shapiro-Wilk (`swilk`) | W = 0,99973; z = 0,774 | 0,219 | Não rejeita normalidade |

**Discussão:** A divergência entre os testes é comum em grandes amostras, onde pequenas variações geram significância em testes mais sensíveis. Com **n = 10.000**, o **Teorema Central do Limite** garante que as estimativas da regressão permanecem válidas e confiáveis independentemente da distribuição dos resíduos.

---

## Conclusão

| Hipótese | Resultado | Evidência principal |
|----------|-----------|---------------------|
| **H1** — Mais de 4 xícaras → menos sono | ✅ Confirmada | Δ = 23 min/noite; p < 0,001 |
| **H2** — Alto consumo → mais estresse | ✅ Confirmada | χ²(2) = 37,85; p < 0,001 |
| **H3** — Café prediz sono (com controles) | ✅ Confirmada | β = −0,016; p < 0,001 |

O estudo evidencia que o consumo excessivo de café prejudica a duração do sono e está associado a maiores níveis de estresse, mesmo após controlar por fatores como idade, IMC e hábitos de saúde. Os resultados estão alinhados com as recomendações médicas vigentes: o café consumido com moderação pode ser positivo, mas o excesso traz consequências mensuráveis para a saúde e o bem-estar.

---

## Apêndice: Códigos Stata

```stata
* ── 1. CONFIGURAÇÃO E IMPORTAÇÃO ──────────────────────────────────────────
set dp comma
import excel "Global Coffee Health Dataset.xlsx", firstrow clear
describe

* ── 2. CORREÇÃO DE ESCALA ─────────────────────────────────────────────────
gen Sleep_Hours_real        = Sleep_Hours / 10
gen BMI_real                = BMI / 10
gen Physical_Activity_real  = Physical_Activity_Hours / 10

replace Sleep_Hours             = Sleep_Hours / 10
replace BMI                     = BMI / 10
replace Physical_Activity_Hours = Physical_Activity_Hours / 10

* ── 3. ESTATÍSTICA DESCRITIVA ─────────────────────────────────────────────
summarize Sleep_Hours_real BMI_real Physical_Activity_real
tabulate Sleep_Quality
tabulate Stress_Level

* ── 4. HIPÓTESE 1 — teste t ───────────────────────────────────────────────
gen high_coffee = (Coffee_Intake > 4)
ttest Sleep_Hours, by(high_coffee)

* ── 5. HIPÓTESE 2 — qui-quadrado ──────────────────────────────────────────
tabulate Stress_Level high_coffee, chi2

* ── 6. HIPÓTESE 3 — regressão múltipla ───────────────────────────────────
regress Sleep_Hours Coffee_Intake Age BMI Smoking Alcohol_Consumption ///
        Physical_Activity_Hours

* ── 7. VERIFICAÇÃO DE PRESSUPOSTOS ───────────────────────────────────────
sktest Sleep_Hours
swilk Sleep_Hours
```

---

## Referências

- AMROUK, E. M.; PALMERI, F.; MAGRINI, E. *Global coffee market and recent price developments*. Rome: Food and Agriculture Organization of the United Nations (FAO), 2025.
- Global Coffee Health Dataset. Kaggle. Disponível em: https://www.kaggle.com

---

*Relatório da disciplina RCC4705 – Estatística Básica | FEA-RP/USP | 2025*
