#!/bin/bash
# vars to use script and set current logged in user dock
killall="/usr/bin/killall"
loggedInUser=$( ls -l /dev/console | awk '{print $3}' )
LoggedInUserHome="/Users/$loggedInUser"
UserPlist=$LoggedInUserHome/Library/Preferences/com.apple.dock.plist
################################################################################
# Use Dockutil to Modify Logged-In User's Dock
################################################################################
echo "------------------------------------------------------------------------"
echo "Current logged-in user: $loggedInUser"
echo "------------------------------------------------------------------------"
echo "Removing all Items from the Logged-In User's Dock..."
sudo -u $loggedInUser $dockutil --remove all --no-restart $UserPlist
echo "Creating New Dock..."
sudo -u $loggedInUser $dockutil --add "System/Applications/Launchpad.app" --no-restart $UserPlist
sudo -u $loggedInUser $dockutil --add "/Applications/Microsot Edge.app" --no-restart $UserPlist
sudo -u $loggedInUser $dockutil --add "/Applications/Microsoft Excel.app" --no-restart $UserPlist
sudo -u $loggedInUser $dockutil --add "/Applications/Micosoft OneNote.app" --no-restart $UserPlist
sudo -u $loggedInUser $dockutil --add "/Applications/Micosoft Outlook.app" --no-restart $UserPlist
sudo -u $loggedInUser $dockutil --add "/Applications/Microsoft PowerPoint" --no-restart $UserPlist
sudo -u $loggedInUser $dockutil --add "/Applications/Microsoft Teams.app" --no-restart $UserPlist
sudo -u $loggedInUser $dockutil --add "/Applications/Microsoft Word.app" --no-restart $UserPlist
sudo -u $loggedInUser $dockutil --add "/Applications/Company Portal.app" --no-restart $UserPlist
sudo -u $loggedInUser $dockutil --add "System/Applications/System Settings.app" --no-restart $UserPlist
sudo -u $loggedInUser $dockutil --add "~/Applications" --section others --view auto --display folder --no-restart $UserPlist
sudo -u $loggedInUser $dockutil --add "~/Downloads" --section others --view auto --display folder --no-restart $UserPlist
echo "Restarting Dock..."
sudo -u $loggedInUser $killall Dock

exit 0