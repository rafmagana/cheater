osascript -e 'tell app "TextMate" to reload bundles'

defaults write com.apple.finder QLEnableXRayFolders 1 #quicklook shows the contents of folder 

cat some_file | pbcopy #copies some_file contents to clipboard