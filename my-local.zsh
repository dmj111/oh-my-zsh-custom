
# load up any local files
echo "hello"

if [ -d ${ZSH_CUSTOM}/local ]; then 
    for config_file (${ZSH_CUSTOM}/local/*.zsh(N)); do
        source $config_file
    done
    unset config_file
fi

    
