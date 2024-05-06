#!/usr/bin/python3

import requests
import re
import textwrap
from bs4 import BeautifulSoup as bs

headers = {'accept': '*/*',
           'user-agent': 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) '
                         'Chrome/79.0.3945.130 Safari/537.36'}

base_url_inflation = 'https://www.cbr.ru/key-indicators/'
base_url_rate = 'https://www.cbr.ru/eng/currency_base/daily/'

month = 'NULL'
inflation = 'NULL'
eur_to_rub = 'NULL'
date = 'NULL'

def writeToFile(month, inflation, eur_to_rub, date):
    file = open('financedata.txt', 'w')

    # Inflation rate in RF
    file.write('Инфляция в ' + month + 'е' + ' (ЦБ РФ): ' + inflation + '\n')
    # EUR to RUB rate
    file.write('\n' + 'Курсы валют' + ' на ' + date + '\n')
    file.write('1 EUR' + ' = ' + eur_to_rub + ' RUB\n')

    # Close the file handler
    file.close()


def finance_parse(headers):
    session = requests.Session()
    request_inflation = session.get(base_url_inflation, headers=headers)
    if request_inflation.status_code == 200:
        soup = bs(request_inflation.content, 'lxml')
        div = soup.find('div', {'class': 'rate col-md-7 offset-md-1'})
        title = str(textwrap.wrap(div.text))
        #print(title)
        month = title.split()[1].lower()
        #date_now = (title[3:14])
        print(month)
        inflation = title.split()[3][:-2]
        #print(inflation)
    else:
        print('ERROR')
    
    session2 = requests.Session()
    request_rate = session2.get(base_url_rate, headers=headers)
    if request_rate.status_code == 200:
        soup = bs(request_rate.content, 'lxml')
        table = soup.findChildren('table', {'class': 'data'})[0]
        rows = table.findChildren(['th', 'tr'])

        for row in rows:
            cells = row.findChildren('td')
            for cell in cells:
                value = cell.string
                if value=="EUR":
                    #print(cells[4].string)
                    eur_to_rub = cells[4].string

        date = soup.find('button', {'class': 'datepicker-filter_button'}).string
        #print(date)

    else:
        print('ERROR')

    writeToFile(month, inflation, eur_to_rub, date)

if __name__ == '__main__':
    finance_parse(headers)