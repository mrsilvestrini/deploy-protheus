#!/bin/bash

#lines for set hostname
hostnamectl set-hostname deploy-protheus
hostnamectl --static

#echo YOUR SYSTEM REBOOT IN 5 SECONDS...
#shutdown -r -t 5
