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

sity = 'Гавиржов'  # you location sity
mgr = owm.weather_manager()
observation = mgr.weather_at_place(sity)
w = observation.weather
temperature = w.temperature('celsius')['temp']
#observation_list = owm.weather_around_coords(-22.57, -43.12)
#atmospheric_pressure = w.pressure()
humidity_percentage = w.wind().get('humidity', 0)
speed = w.wind().get('speed', 0)
#cloud = w.clouds()
#znak = w.get_weather_icon_url()
#icon_znak = urllib.request.urlopen(znak)

selfpath = os.path.join(os.path.dirname(os.path.realpath(__file__)))
txtfilepath = os.path.join(selfpath, 'weather.txt')
#iconfilepath = os.path.join(selfpath, '../images/icons_weather.png')

#file = open(iconfilepath, 'wb')
#file.write(icon_znak.read())
#file.close()

file = open(txtfilepath, 'w')     # path to file
file.write('На ' + times.strftime("%d-%m-%Y %H:%M") + '\n')
file.write('В ' + sity + 'е наблюдается:\n')
#file.write(w.get_detailed_status() + '. Влажноcть ' + str(humidity_percentage) + '%')
file.write('\nТемпература воздуха: ' + str(temperature) + ' ' + u'\u00B0C')
#file.write('\nДавление, мм рт.ст: ' + str(atmospheric_pressure) + ' hpa')
file.write('\nСкорость ветра: ' + str(speed) + ' ' + 'м\с')
file.close()
