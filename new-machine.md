# macOs

## AnyConnect

Issue is that AnyConnect prompts twice to use System keychain whenever trying to connect to a VPN

Remedy

 - Open Keychain Access.
 - Click on System in left pane.
 - Unlock the System keychain top left (if it is locked)
 - Sort the System items by Kind so that the keys are at the top.
 - Look for the private key that keeps asking for password.
 - Double click on it and choose Access Control.
 - Choose "Allow all applications to access this item"

