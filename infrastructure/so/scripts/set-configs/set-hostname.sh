#lines for set hostname
/bin/hostnamectl set-hostname deploy-protheus
/bin/hostnamectl --static

echo YOUR SYSTEM REBOOT IN 5 SECONDS...
/sbin/shutdown -r -t 5
