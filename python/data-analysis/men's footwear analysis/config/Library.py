import os
import time
import random
import datetime as dt
import re

# Environment variables
from dotenv import load_dotenv
import base64
import hashlib
from urllib.parse import urljoin

# Data manipulation and visualization
import pandas as pd
import numpy as np
import seaborn as sns
import matplotlib.pyplot as plt
import matplotlib.ticker as mticker

# Web scraping and HTTP requests
import requests
from bs4 import BeautifulSoup as bs
import undetected_chromedriver as uc
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC