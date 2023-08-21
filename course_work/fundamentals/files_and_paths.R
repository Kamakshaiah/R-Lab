# file system
## https://theautomatic.net/2018/07/11/manipulate-files-r/
# https://sparkbyexamples.com/r-programming/delete-file-or-directory-in-r/#google_vignette

ls()
list.files() # list.dirs()
rm()
dir.create('your directory path') # to create directory
unlink('mydir', recursive = T) # to remove directory

## paths

path = readClipboard()
path
path_ch <- gsub("\\\\", "/", path)
setwd(path_ch)
getwd()
list.files()
setwd('~') # back to home
getwd()
