export PATH=/usr/local/git/bin:$PATH
## distinguish operating systems. If mac then alias emacs and skim
if [[ `uname -s` == *"Darwin"* ]]
then
    alias emacs="/usr/local/Cellar/emacs/24.5/Emacs.app/Contents/MacOS/Emacs"
    alias skim="/Applications/Skim.app/Contents/MacOS/Skim"
fi

if [ -f ~/.bashrc ]; then
   source ~/.bashrc
fi
