#!/usr/bin/python3

import os
import pyowm
import urllib.request
import datetime
from pyowm.utils.config import get_default_config

config_dict = get_default_config()
config_dict['language'] = 'ru'

times = datetime.datetime.now()

API_key = 'f68237332758a41ef7a6e1e737175dde'    # API-key https://openweathermap.org/
owm = pyowm.OWM(API_key, config_dict)

city = 'Гавиржов'  # you location city
mgr = owm.weather_manager()
observation = mgr.weather_at_place(city)
w = observation.weather
temperature = w.temperature('celsius')['temp']
humidity_percentage = w.humidity
speed = w.wind().get('speed', 0)
znak = w.weather_icon_url()
icon_znak = urllib.request.urlopen(znak)

selfpath = os.path.join(os.path.dirname(os.path.realpath(__file__)))
txtfilepath = os.path.join(selfpath, 'weather.txt')
iconfilepath = os.path.join(selfpath, 'images/icons_weather.png')

file = open(iconfilepath, 'wb')
file.write(icon_znak.read())
file.close()

file = open(txtfilepath, 'w')     # path to file
file.write('На ' + times.strftime("%d-%m-%Y %H:%M") + '\n')
file.write('В ' + city + 'е наблюдается:\n')
file.write(w.detailed_status + ', влажноcть ' + str(humidity_percentage) + '%')
file.write('\nТемпература воздуха: ' + str(temperature) + ' ' + u'\u00B0C')
file.write('\nСкорость ветра: ' + str(speed) + ' ' + 'м\с')
file.close()
