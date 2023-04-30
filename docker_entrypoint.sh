#!/bin/bash

service mariadb start
screen -dmS xi_map bash -c "/asb/xi_map"
screen -dmS xi_world bash -c "/asb/xi_world"
screen -dmS xi_search bash -c "/asb/xi_search"
screen -dmS xi_connect bash -c "/asb/xi_connect"

tail -f /asb/log/*