#!/bin/bash

# Installs all system updates, reboot and does it again if necessary.

# Execute on a new mac via:

# sudo curl https://gist.githubusercontent.com/ChristopherA/0ddc4c27f8ec7d5a0aed/raw/2e694c616c728593c2af155d18aeeff68b25a222/gistfile1.txt | sh

# Initially, based on https://jamfnation.jamfsoftware.com/discussion.html?id=7827 which works on 10.8 and untested on 10.9 or 10.10

SWUL=`/usr/sbin/softwareupdate -l | /usr/bin/awk '{printf "%s", $0}'`
SWULER=`/usr/sbin/softwareupdate -l 2>&1 | /usr/bin/head -1`
NoRestartUpdates=`/usr/sbin/softwareupdate -l | /usr/bin/grep -v restart | /usr/bin/grep -B1 recommended | /usr/bin/grep -v recommended | /usr/bin/awk '{print $2}' | /usr/bin/awk '{printf "%s ", $0}'`
osvers=`sw_vers -productVersion | awk -F. '{print $2}'`

if [[ $osvers -lt 8 ]]; then
/bin/echo "Script only for 10.8+ ONLY"
exit 1
elif [ "$SWULER" == "No new software available." ]; then
/bin/echo "$SWULER"
exit 1
elif [[ "$SWUL" == *"[restart]"* ]]; then
echo "Installing Updates that require Restart"
/usr/bin/sudo /usr/sbin/softwareupdate -d -a
/usr/libexec/PListBuddy -c "Copy CompletedProducts InstallAtLogout" /Library/Updates/index.plist
/usr/bin/touch /var/db/.SoftwareUpdateAtLogout
/bin/chmod og-r /var/db/.SoftwareUpdateAtLogout
/usr/libexec/PListBuddy -c "Add -RootInstallMode STRING YES" /var/db/.SoftwareUpdateOptions
/usr/libexec/PListBuddy -c "Add -SkipConfirm STRING YES" /var/db/.SoftwareUpdateOptions
/bin/chmod og-r /var/db/.SoftwareUpdateOptions
elif [[ "$SWUL" == *"[recommended]"* ]]; then
/bin/echo "Installing Updates that does not require Restart"
/usr/bin/sudo /usr/sbin/softwareupdate -i $NoRestartUpdates
fi

exit 0
