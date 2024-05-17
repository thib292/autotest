import pytest
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys
import time

@pytest.fixture(scope="module")
def browser():
    driver = webdriver.Chrome(executable_path='D:\chromedriver-win64')  # Remplacez par le chemin vers votre ChromeDriver
    yield driver
    driver.quit()

def test_google_search(browser):
    browser.get('https://www.google.com')
    assert 'Google' in browser.title

    search_box = browser.find_element(By.NAME, 'q')
    search_box.send_keys('Hello World')
    search_box.send_keys(Keys.RETURN)

    time.sleep(2)  # Attendre que les résultats se chargent
    assert 'Hello World' in browser.page_source
