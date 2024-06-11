if [[ "$1" == "--output" ]]; then
    pulseaudio-control --icons-volume " , " --icon-muted " " \
        --format '$NODE_NICKNAME ${VOL_LEVEL}%' \
        --node-nicknames-from "device.description" \
        --node-nickname "alsa_output.pci-0000_04_00.6.analog-stereo:󰕾" \
        --node-nickname "bluez_sink.6C_D3_EE_7A_3A_7F.a2dp_sink:󰋎" \
        --node-nickname "alsa_output.usb-Kingston_HyperX_Virtual_Surround_Sound_00000000-00.analog-stereo:󰋎  Headphones" \
        listen

elif [[ "$1" == "--input" ]]; then
    pulseaudio-control --node-type input\
        --format '$NODE_NICKNAME ${VOL_LEVEL}%' \
        --node-nickname "alsa_input.pci-0000_04_00.6.analog-stereo:󰌢" \
        --node-nickname "stereo:󰋎" \
        --node-nickname "󰥰" \
        --node-blacklist "*.monitor" listen
fi
