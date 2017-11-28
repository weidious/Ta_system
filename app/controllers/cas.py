import requests
from bs4 import BeautifulSoup
import json
import os.path
import sys

def cas_login( NetID, password):
    URL = 'https://cas.tamu.edu/cas/login'
    client = requests.session()
    x = client.get(URL)
    headers = {
        'Origin': 'https://cas.tamu.edu',
        'Accept-Encoding': 'gzip, deflate, br',
        'Accept-Language': 'zh-CN,zh;q=0.8',
        'Upgrade-Insecure-Requests': '1',
        'User-Agent': 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36',
        'Content-Type': 'application/x-www-form-urlencoded',
        'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8',
        'Cache-Control': 'max-age=0',
        'Referer': 'https://cas.tamu.edu/cas/login?service=https://howdy.tamu.edu/uPortal/Login&renew=true',
        'Connection': 'keep-alive',
    }

    data = {'csrfmiddlewaretoken': 'AVEogidzmt8mdHkfpB9miioFFgyGoJ6K', 'username': NetID, 'password': password,
            'lt': 'LT-fdzSgU9v2cPNyFaxwMHCjr1pGeZqklQV-cas-node-1', '_eventId': 'submit'}
    params = (
        ('service', 'https://howdy.tamu.edu/uPortal/Login'),
        ('renew', 'true'),
    )
    data['csrfmiddlewaretoken'] = x.cookies['csrftoken']
    x = client.post(URL, headers=headers, data=data, params=params)
    soup = BeautifulSoup(x.text, 'html.parser')
    error = soup.find('p', {'class': 'alert__title'})
    if error is not None:
        error = error.text
        return error
    else:
        return 'successful'
print(cas_login(sys.argv[1],sys.argv[2]))