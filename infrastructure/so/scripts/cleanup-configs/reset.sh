# Credits this tutorial:
# https://community.spiceworks.com/how_to/151558-create-a-rhel-centos-6-7-template-for-vmware-vsphere

#Step 1: Stop the Logging Services

# You’re going to all this trouble to create a clean deployable template,
# so you might as well stop writing new data. Otherwise all your deployed
# VMs will have a log of you shutting the VM down.

# Issue the following commands to stop the logging services:
/sbin/service rsyslog stop 
/sbin/service auditd stop 

# Step 2: Remove any old kernels

# You need yum-utils installed to get package-cleanup. 
# This has to go before the yum cleanup in the next step
# as it needs your channel data. I usually let the post-deployment
# configuration management take care of this, but this is nice when
# we create a new template for a intermediate/point release, or just
# to cover a security hole.

# Issue the following command to remove the old kernels (if there are any):
yum install yum-utils -y
package-cleanup --oldkernels --count=1

# Step 3: Clean out Yum

# Yum keeps a cache in /var/cache/yum that can grow quite large,
# especially after applying patches to the template. 
# For example,my lab host currently has 360 MB of stuff in yum’s cache right now,
# just from a few months of incremental patching. In the interest of 
# keeping my template as small as possible I wipe this.

# Issue the following command to clean the cache:
yum clean all

# Step 4: Force the logs to rotate and remove old logs we don’tneed

# Starting fresh with the logs is nice. It means that you don’t have
# old, irrelevant log data on all your cloned VMs. It also means that
# your template image is smaller. Change out the “rm” command for one
# that matches whatever your logrotate renames files as. As an aside,
# because people usually neglect this step, if you get really, 
# really bored it’s fun to look at the old log data people leave on
# virtual appliances in cloud templates. Lots of leaked information there ;)

# Issue the following commands to clear the logs:
/usr/sbin/logrotate –f /etc/logrotate.conf
/bin/rm –f /var/log/*-???????? /var/log/*.gz
/bin/rm -f /var/log/dmesg.old
/bin/rm -rf /var/log/anaconda

# Step 5: Truncate the audit logs (and other logs we want to keep placeholders for)

# This whole /dev/null business is a neat function that lets you clear
# a file without restarting the process associated with it, useful in
# many more situations than just template-building.

# Issue the following commands to truncate the audit logs:
/bin/cat /dev/null > /var/log/audit/audit.log
/bin/cat /dev/null > /var/log/wtmp
/bin/cat /dev/null > /var/log/lastlog
/bin/cat /dev/null > /var/log/grubby

# Step 6: Remove the udev persistent device rules

# Have you ever noticed that if you clone/deploy a 
# Linux VM that won't bring up it single network interface
# and renames the interface to something like eth1? Yep, well
# that's the udev persistent network interface rules coming back
# to haunt you. This is how I've decided to deal with the problem.

# This generally affects CentOS /RHEL 6 and you shouldn't have to 
# do it in v7 but it won't hurt anything.

# Issue the following command to remove the udev persistent rules:
/bin/rm -f /etc/udev/rules.d/70*

# Step 7: Remove the traces of the template MAC address and UUIDs

# This is a corollary to step 5, just removing unique identifiers
# from the template so the cloned VM gets its own. You can also change
# the “-i” to “-i.bak” if you want to keep a backup copy of the file.

# Issue the following command to clear the identifiers:
/bin/sed -i ‘/^(HWADDR|UUID)=/d’ /etc/sysconfig/network-scripts/ifcfg-e*

# Step 8: Clean /tmp out

# Under normal, non-template circumstances you really don’t 
# ever want to run rm on /tmp like this. Use tmpwatch or any
# other manner of safer ways to do this, since there are attacks
# people can use by leaving symlinks and what-not in /tmp that
# rm might traverse (“whoops, I don’t have an /etc/passwd anymore!”).
# Plus, users and processes might actually be using /tmp, and it’s
# impolite to delete their files. However, this is your template image,
# and if there are people attacking your template you should reconsider
# how you’re doing business really.

/bin/rm –rf /tmp/*
/bin/rm –rf /var/tmp/*

# Step 9: Remove the SSH host keys

# If you don’t do this all your VMs will have all the same keys,
# which has negative security implications. It’s also annoying to
# fix later when you’ve realised that you’ve deployed a couple of
# years worth of VMs and forgot to do this in your prep script.
# Not that I would know anything about that. Nope.

/bin/rm –f /etc/ssh/*key*

# Step 10: Remove the root user’s shell history

# No sense in keeping this history around, it’s 
# irrelevant to the cloned VM.

/bin/rm -f ~root/.bash_history
unset HISTFILE

# Step 11: Remove the root user’s SSH history and other stuff

# You might choose to just remove ~root/.ssh/known_hosts if 
# you have SSH keys you want to keep around.

/bin/rm -rf ~root/.ssh/
/bin/rm -f ~root/anaconda-ks.cfg

# Step 12: Clear bash history and shutdown for template creation

# Time to clear the history of everything you've just done and 
# shutdown the server in a clean state for converting to a VM:

history –c
sys-unconfig

# The server will automatically now shutdown.