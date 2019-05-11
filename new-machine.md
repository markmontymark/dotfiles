# macOs

## AnyConnect asks for admin privileges twice 

Issue is that AnyConnect prompts twice to use System keychain whenever trying to connect to a VPN

Remedy

 - Open Keychain Access.
 - Click on System in left pane.
 - Unlock the System keychain top left (if it is locked)
 - Sort the System items by Kind so that the keys are at the top.
 - Look for the private key that keeps asking for password.
 - Double click on it and choose Access Control.
 - Choose "Allow all applications to access this item"


## Rename screenshot files

Screen shot names kind of long, so shortening the prefix to just 'screen' 

```sh
defaults write com.apple.screencapture name "screen"  
killall SystemUIServer 
```

## Hide computer from Shared

### Source 

http://superuser.com/questions/154108/how-do-you-hide-a-computer-name-on-a-network-os-x-10-6

### To turn back off

    sudo /usr/libexec/PlistBuddy -c "Add :ProgramArguments: string '-NoMulticastAdvertisements'" /System/Library/LaunchDaemons/com.apple.mDNSResponder.plist

### To turn back on

    sudo /usr/libexec/PlistBuddy -c "Delete :ProgramArguments:2" /System/Library/LaunchDaemons/com.apple.mDNSResponder.plist

### Afterwards

After completing that run the following command as well to make it take effect:

    sudo launchctl unload /System/Library/LaunchDaemons/com.apple.mDNSResponder.plist
    sudo launchctl load /System/Library/LaunchDaemons/com.apple.mDNSResponder.plist

