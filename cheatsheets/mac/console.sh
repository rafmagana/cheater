osascript -e 'tell app "TextMate" to reload bundles'
osascript -e 'tell app "Safari" to open "http://www.google.com"' #opens a file://
osascript -e 'tell app "Safari" to open location "http://www.google.com/"'
osascript -e 'tell app "Safari" to close tab 1 of window 1' #it closes the first tab of the current window

osascript -e 'tell application "System Event"' -e 'keystroke "a" using command down' -e 'end tell'

osascript -e 'tell application "Safari" keystroke "a" using command down'

osascript -e 'tell app "Safari" to display dialog "Now paste to Keynote"'


defaults write com.apple.finder QLEnableXRayFolders 1 #quicklook shows the contents of folder 

cat some_file | pbcopy #copies some_file contents to clipboard

#mounting and unmounting disks
diskutil list #list of connected drives and usb sticks
diskutil mountDisk /dev/disk2 #mount disk2
diskutil unmountDisk /dev/disk2 #unmount disk2

