xrdb -merge $HOME/.Xresources
if [ -s ~/.Xmodmap ]
then
        xmodmap ~/.Xmodmap
fi
