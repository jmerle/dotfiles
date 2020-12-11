# Set up SDKMAN if it is installed
if [[ -d "/home/jasper/.sdkman" ]]; then
    export SDKMAN_DIR="/home/jasper/.sdkman"
    [[ -s "/home/jasper/.sdkman/bin/sdkman-init.sh" ]] && source "/home/jasper/.sdkman/bin/sdkman-init.sh"
fi
