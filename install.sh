#! /bin/bash

myshi=$(ls -av1 -I "install.sh")

for i in $myshi; do
    if [[ $i != "." && $i != ".." && $i != "README.md" && $i != ".git" && $i != "install.sh" ]]; then
        if [[ -d "./$i" ]]; then

            if [[ -L "$HOME/.config/$i" ]]; then
                echo "$HOME/.config/$i already exists." 
            else
		    ln -s "$(pwd)/$i" $HOME/.config/
            fi
        else
            if [[ -L "$HOME/$i" ]]; then
                echo "$HOME/$i already exists." 
            else
		    ln -s "$(pwd)/$i" $HOME/
            fi

        fi
    fi
done
