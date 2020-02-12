#!/bin/bash

# lines for set firewall
systemctl stop firewalld
systemctl disable firewalld
systemctl status firewalld
