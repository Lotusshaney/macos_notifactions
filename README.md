Simple Notification Supressor

Simple script that will take multiple bundleID's from Applications and produce a Config Profile that will allow those Applications to be notifcation whitelisted.

You can edit the company name to match your own and alter these settings if needed

```xml
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
```

To find the Bund`elID for an app you can use 
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

Example of Usage

`sns.sh com.microsoft.autoupdate.fba com.microsoft.companyportal com.microsoft.edge.canary com.microsoft.excel com.microsoft.onedrive com.microsoft.outlook com.microsoft.rdc.macos com.microsoft.skypeforbusiness.webmeetings com.microsoft.word`

will result in a notifications.mobileconfig file on the current users desktop and an ouput in the terminal of :-

```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
  <dict>
    <key>PayloadContent</key>
    <array>
      <dict>
        <key>NotificationSettings</key>
        <array>
          <dict>
            <key>AlertType</key>
            <integer>1</integer>
            <key>BadgesEnabled</key>
            <true/>
            <key>BundleIdentifier</key>
            <string>com.microsoft.autoupdate.fba</string>
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
          <dict>
            <key>AlertType</key>
            <integer>1</integer>
            <key>BadgesEnabled</key>
            <true/>
            <key>BundleIdentifier</key>
            <string>com.microsoft.companyportal</string>
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
          <dict>
            <key>AlertType</key>
            <integer>1</integer>
            <key>BadgesEnabled</key>
            <true/>
            <key>BundleIdentifier</key>
            <string>com.microsoft.edge.canary</string>
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
          <dict>
            <key>AlertType</key>
            <integer>1</integer>
            <key>BadgesEnabled</key>
            <true/>
            <key>BundleIdentifier</key>
            <string>com.microsoft.excel</string>
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
          <dict>
            <key>AlertType</key>
            <integer>1</integer>
            <key>BadgesEnabled</key>
            <true/>
            <key>BundleIdentifier</key>
            <string>com.microsoft.onedrive</string>
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
          <dict>
            <key>AlertType</key>
            <integer>1</integer>
            <key>BadgesEnabled</key>
            <true/>
            <key>BundleIdentifier</key>
            <string>com.microsoft.outlook</string>
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
          <dict>
            <key>AlertType</key>
            <integer>1</integer>
            <key>BadgesEnabled</key>
            <true/>
            <key>BundleIdentifier</key>
            <string>com.microsoft.rdc.macos</string>
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
          <dict>
            <key>AlertType</key>
            <integer>1</integer>
            <key>BadgesEnabled</key>
            <true/>
            <key>BundleIdentifier</key>
            <string>com.microsoft.skypeforbusiness.webmeetings</string>
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
          <dict>
            <key>AlertType</key>
            <integer>1</integer>
            <key>BadgesEnabled</key>
            <true/>
            <key>BundleIdentifier</key>
            <string>com.microsoft.word</string>
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
        </array>
        <key>PayloadDescription</key>
        <string>Manage Notifications settings for changemetoyourcompanyname used apps.</string>
        <key>PayloadDisplayName</key>
        <string>Managed Notifications</string>
        <key>PayloadEnabled</key>
        <true/>
        <key>PayloadIdentifier</key>
        <string>039326A7-F679-4A32-91EA-BFD0545899BC</string>
        <key>PayloadOrganization</key>
        <string>changemetoyourcompanyname</string>
        <key>PayloadType</key>
        <string>com.apple.notificationsettings</string>
        <key>PayloadUUID</key>
        <string>039326A7-F679-4A32-91EA-BFD0545899BC</string>
        <key>PayloadVersion</key>
        <integer>1</integer>
      </dict>
    </array>
    <key>PayloadDescription</key>
    <string>Manage Notifications settings for changemetoyourcompanyname used apps.</string>
    <key>PayloadDisplayName</key>
    <string>Managed Notifications</string>
    <key>PayloadEnabled</key>
    <true/>
    <key>PayloadIdentifier</key>
    <string>0763C0A1-F648-4328-AD2B-3091C135E8CD</string>
    <key>PayloadOrganization</key>
    <string>changemetoyourcompanyname</string>
    <key>PayloadRemovalDisallowed</key>
    <false/>
    <key>PayloadScope</key>
    <string>System</string>
    <key>PayloadType</key>
    <string>Configuration</string>
    <key>PayloadUUID</key>
    <string>0763C0A1-F648-4328-AD2B-3091C135E8CD</string>
    <key>PayloadVersion</key>
    <integer>1</integer>
  </dict>
</plist>
```
