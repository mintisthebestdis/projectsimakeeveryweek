#!/usr/bin/bash

while true; do
    myname=$(whoami)
    myhostname=$(hostname)
    currentpath=$(pwd)

    echo "run man to get current commands."
    read -p "$myname@$myhostname:$currentpath> " a

    case "${a,,}" in
        dir)
            ls
            ;;
        exit)
            echo "exited powershell wrapper."
            exit 0
            ;;
        cd)
            read -p "what is the path you want to cd to?: " p
            cd "$p" 2>/dev/null
            if [ $? -ne 0 ]; then
                echo "invalid path. please check your spelling if possible."
            fi
            ;;
        get-location)
            pwd
            ;;
        winfetch)
            neofetch
            ;;
        clear-host|cls)
            reset
            ;;
        edit-file)
            read -p "choose an editor (nano/micro/hx): " e
            read -p "choose a file: " f
            if command -v "$e" >/dev/null 2>&1; then
                "$e" "$f"
            else
                echo "editor '$e' not found."
            fi
            ;;
        new-item)
            read -p "choose the name of the file/folder: " i
            read -p "choose the type (txt/dir): " t
            if [ "$t" = "dir" ]; then
                mkdir "$i" 2>/dev/null && echo "successfully made directory!" || echo "error creating directory."
            elif [ "$t" = "txt" ]; then
                touch "$i" 2>/dev/null && echo "successfully made file!" || echo "error creating file."
            else
                echo "only options are: txt, dir"
            fi
            ;;
        remove-item)
            read -p "choose the name of the file/folder: " n
            read -p "choose the type (txt/dir): " m
            if [ "$m" = "dir" ]; then
                rmdir "$n" 2>/dev/null && echo "deleted successfully!" || echo "couldn't remove directory. check permissions or naming."
            elif [ "$m" = "txt" ]; then
                rm "$n" 2>/dev/null && echo "deleted successfully!" || echo "couldn't remove file. check permissions or naming."
            else
                echo "only options to delete are: txt, dir"
            fi
            ;;
        copy-item)
            read -p "source file: " src
            read -p "destination path: " dest
            cp "$src" "$dest" 2>/dev/null && echo "copied successfully!" || echo "failed to copy."
            ;;
        move-item)
            read -p "source file/folder: " src
            read -p "destination path: " dest
            read -p "change name? (y/n): " rename
            if [[ "$rename" =~ ^[Yy]$ ]]; then
                read -p "new name: " newname
                mv "$src" "$dest/$newname" 2>/dev/null && echo "moved and renamed successfully!" || echo "failed to move/rename."
            else
                mv "$src" "$dest" 2>/dev/null && echo "moved successfully!" || echo "failed to move."
            fi
            ;;
        type)
            read -p "file to view: " f
            cat "$f" 2>/dev/null || echo "file not found."
            ;;
        man|help)
            echo "all current commands:
dir: shows current contents in directory
exit: exits the powershell wrapper
cd: asks for path then goes to the path
get-location: shows the current path
winfetch: shows system stats
clear-host / cls: resets terminal output
edit-file: asks for editor then the file (nano, micro, hx)
new-item: create file or folder (txt, dir)
remove-item: delete file or folder (txt, dir)
copy-item: copy a file to another location
move-item: move/rename a file or folder
type: display file contents
man/help: shows this message"
            ;;
        *)
            echo "the command '$a' is not recognized. check spelling and try again."
            ;;
    esac
done
