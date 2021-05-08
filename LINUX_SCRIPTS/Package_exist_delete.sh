
I came up with a script for it (Fedora 17). Assuming that the current directory where script is running is also the directory of where the rpms are located:

install_packages(){
    echo "Installing/Checking Fedora packages. Process may take a while..."
    for i in *
    do
        if test -f "$i" #Test if it is a file
        then
           i=$(basename $i) #Remove parent directory part of the string
           PACKAGE_NAME=${i::-4} #Remove .rpm from the end of file name
           if rpm -q $PACKAGE_NAME | grep "not installed" > /dev/null #If package not yet installed
           then
            echo "Installing $i ..."
                yum localinstall ./fc17/"$i" -y > /dev/null #Install this package 
           fi
        fi
    done    
    echo "Packages checked/installed"
