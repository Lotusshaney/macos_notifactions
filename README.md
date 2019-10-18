Simple Notification Supressor

Simple script that will take multiple bundleID's from Applications and produce a Config Profile that will allow those Applications to be notifcation whitelisted.

You can edit the company name to match your own and alter these settings if needed

`<key>AlertType</key>
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
<true/>`

To find the BundelID for an app you can use 
PlistBuddy

`/usr/libexec/PlistBuddy -c 'Print CFBundleIdentifier' /Applications/Safari.app/Contents/Info.plist
`
com.apple.Safari

2. lsappinfo

`lsappinfo info -only bundleid Google\ Chrome
`
"CFBundleIdentifier"="com.google.Chrome"

3. mdls

`mdls -name kMDItemCFBundleIdentifier -r /Applications/Remote\ Desktop.app
`
com.apple.RemoteDesktop

or use my BID automator app to select multiple apps and output a file containing all of the BundleID's
