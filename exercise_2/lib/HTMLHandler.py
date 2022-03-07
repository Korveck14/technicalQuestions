
import requests
from bs4 import BeautifulSoup
from selenium import webdriver

class HTMLHandler:
    def get_urls_from_website(self, website: str) -> List[str]:

        # Verify the given website actually works, and if not raise an exception
        r = requests.get(website)
        if not r.ok:
            r.raise_for_status()

        # Parse the website with the html.parser
        soup = BeautifulSoup(r.text, 'html.parser')
        
        # Iterate and append the all the urls into a list
        urls = []
        for link in soup.find_all('a'):
            urls.append(link.get('href'))

        return urls


    def check_url_is_ok(self, url) -> bool:
        r = requests.get(url)
        if r.ok:
            return True
        return False


    def check_urls_from_website(self, website: str) -> bool:

        # First get all urls from the website
        urls = get_urls_from_website(self, website)

        # Iterate through all the urls checking that they are ok (no 4xx or 5xx error codes)
        for url in urls:
            if not check_url_is_ok(url):
                return False
        
        return True


    def get_number_of_rows_from_website(self, website: str) -> int:

        # Invoke browser
        driver = webdriver.Chrome(executable_path="C:\\chromedriver.exe")
        driver.maximize_window()

        # Go to the website
        driver.get(website)
        driver.refresh()

        # Identify the number of rows having the <tr> tag
        rows = driver.find_elements_by_xpath("//table/tbody/tr")

        # Close the browser
        driver.close()

        # The size of the list of rows is the number of rows
        return len(rows)