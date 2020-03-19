#!/usr/bin/python3

import os
import pyowm
import urllib.request
import datetime

times = datetime.datetime.now()

API_key = 'f68237332758a41ef7a6e1e737175dde'    # API-key https://openweathermap.org/
owm = pyowm.OWM(API_key, language='ru')

sity = 'Лондон'  # you location sity
observation = owm.weather_at_place(sity)
w = observation.get_weather()
temperature = w.get_temperature('celsius')['temp']
observation_list = owm.weather_around_coords(-22.57, -43.12)
atmospheric_pressure = w.get_pressure()['press']
humidity_percentage = w.get_humidity()
speeed = w.get_wind()['speed']
cloud = w.get_clouds()
znak = w.get_weather_icon_url()
icon_znak = urllib.request.urlopen(znak)

selfpath = os.path.join(os.path.dirname(os.path.realpath(__file__)))
txtfilepath = os.path.join(selfpath, 'weather.txt')
iconfilepath = os.path.join(selfpath, '../images/icons_weather.png')

file = open(iconfilepath, 'wb')
file.write(icon_znak.read())
file.close()

file = open(txtfilepath, 'w')     # path to file
file.write('На ' + times.strftime("%d-%m-%Y %H:%M") + '\n')
file.write('В ' + sity + 'е наблюдается:\n')
file.write(w.get_detailed_status() + '. Влажноcть ' + str(humidity_percentage) + '%')
file.write('\nТемпература воздуха: ' + str(temperature) + '℃')
file.write('\nДавление, мм рт.ст: ' + str(atmospheric_pressure) + ' hpa')
file.write('\nСкорость ветра: ' + str(speeed) + 'м\с')
file.close()
