service apache2 stop
service shellinabox stop
service openvpnas stop
confirm () {
    # call with a prompt string or use a default
    read -r -p "${1:-do you want to reboot? [y/N]} " response
    case $response in
        [yY][eE][sS]|[yY]) 
            reboot now
            ;;
        *)
            
            ;;
    esac
}
confirm
