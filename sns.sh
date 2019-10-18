#!/bin/bash

#Simple Notification Supressor
#Daniel Shane 2019

#v1.0 11/10/19

#Check for input
if [[ ! $# -ge 1 ]] ; then
	echo "$(basename "$0") MUST be given at least 1 Bundle Identifier"
	echo "e.g. $(basename "$0") com.apple.itunes"
	exit 1
fi

#report number of id's
echo "SNS : Processing $# BundleID's"

#Company Name for profile
company="changemetoyourcompanyname"

#Generate two UUIDs for configuration profile payload identifiers
PayloadUUID1=$(/usr/bin/uuidgen)
PayloadUUID2=$(/usr/bin/uuidgen)

#Start xml
 cat << 'EOF' > /tmp/notecp
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
	<key>PayloadContent</key>
	<array>
		<dict>
			<key>NotificationSettings</key>
			<array>
EOF

for bundle in "$@" ; do 
	echo Adding "$bundle"
	cat << EOF >> /tmp/notecp
	<dict>
						<key>AlertType</key>
						<integer>1</integer>
						<key>BadgesEnabled</key>
						<true/>
						<key>BundleIdentifier</key>
						<string>$bundle</string>
						<key>CriticalAlertEnabled</key>
						<false/>
						<key>NotificationsEnabled</key>
						<true/>
						<key>ShowInLockScreen</key>
						<true/>
						<key>ShowInNotificationCenter</key>
						<true/>
						<key>SoundsEnabled</key>
						<true/>
					</dict>
EOF
done

#end XML
cat << EOF >> /tmp/notecp
			</array>
			<key>PayloadDescription</key>
			<string>Manage Notifications settings for $company used apps.</string>
			<key>PayloadDisplayName</key>
			<string>Managed Notifications</string>
			<key>PayloadEnabled</key>
			<true/>
			<key>PayloadIdentifier</key>
			<string>$PayloadUUID1</string>
			<key>PayloadOrganization</key>
			<string>$company</string>
			<key>PayloadType</key>
			<string>com.apple.notificationsettings</string>
			<key>PayloadUUID</key>
			<string>$PayloadUUID1</string>
			<key>PayloadVersion</key>
			<integer>1</integer>
		</dict>
	</array>
	<key>PayloadDescription</key>
	<string>Manage Notifications settings for $company used apps.</string>
	<key>PayloadDisplayName</key>
	<string>Managed Notifications</string>
    <key>PayloadEnabled</key>
    <true/>
	<key>PayloadIdentifier</key>
	<string>$PayloadUUID2</string>
	<key>PayloadOrganization</key>
	<string>$company</string>
	<key>PayloadRemovalDisallowed</key>
	<false/>
	<key>PayloadScope</key>
	<string>System</string>
	<key>PayloadType</key>
	<string>Configuration</string>
	<key>PayloadUUID</key>
	<string>$PayloadUUID2</string>
	<key>PayloadVersion</key>
	<integer>1</integer>
</dict>
</plist>
EOF

#Reformat and output to Current Desktop
xmllint --format /tmp/notecp > ~/Desktop/notifications.mobileconfig
cat ~/Desktop/notifications.mobileconfig

#Clean up
rm -rf /tmp/notecp 

exit 0