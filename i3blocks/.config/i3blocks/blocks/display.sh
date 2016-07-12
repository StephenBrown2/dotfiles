#!/usr/bin/env bash
shopt -s extglob

xrandrOut=$(xrandr)

defaultName=$(echo "${xrandrOut}" | grep -i 'default' | awk '{print $1}')
hdmiName=$(echo "${xrandrOut}" | grep -i 'HDMI' | awk '{print $1}')
vgaName=$(echo "${xrandrOut}" | grep -i 'VGA' | awk '{print $1}')
edpName=$(echo "${xrandrOut}" | grep -i 'EDP' | awk '{print $1}')
dpName=$(echo "${xrandrOut}" | grep -i 'DP' | awk '{print $1}')

activeDisplays=$(echo "${xrandrOut}" | grep " connected" | sed -e "s/\([a-zA-Z0-9]\+\) connected.*/\1/" | tr -s '\n' ' ')
activeDisplays=${activeDisplays##*( )}
activeDisplays=${activeDisplays%%*( )}
displayFile='/tmp/.displays'

if [[ -f "${displayFile}" ]]; then
    oldDisplays=$(cat "${displayFile}")
else
    oldDisplays=""
fi

if [[ "${oldDisplays}" != "${activeDisplays}" ]]; then
    change="yes"
else
    change="no"
fi
echo "${activeDisplays}"
echo "${activeDisplays}"
echo ""
exit 0

# External, HDMI + VGA
if [[ "$activeDisplays" =~ "${hdmiName}" && "$activeDisplays" =~ "${dpName}" ]]; then
  #if [[ "${change}" = "yes" ]]; then
  #  $(xrandr --output "${edpName}" --off)
  #  $(xrandr --output "${vgaName}" --auto)
  #  $(xrandr --output "${hdmiName}" --primary --auto)
  #fi
  echo "VGA1 & HDMI"
  echo "VGA1 & HDMI"
  echo ""
# External, HDMI
elif [[ "$activeDisplays" =~ "${hdmiName}" ]]; then
  #if [[ "${change}" = "yes" ]]; then
  #  $(xrandr --output "${edpName}" --off)
  #  $(xrandr --output "${vgaName}" --off)
  #  $(xrandr --output "${hdmiName}" --primary --auto)
  #fi
  echo "HDMI"
  echo "HDMI"
  echo ""
# External, VGA
elif [[ "$activeDisplays" =~ "${vgaName}" ]]; then
  #if [[ "${change}" = "yes" ]]; then
  #  $(xrandr --output "${edpName}" --off)
  #  $(xrandr --output "${vgaName}" --primary --auto)
  #  $(xrandr --output "${hdmiName}" --off)
  #fi
  echo "VGA"
  echo "VGA"
  echo
# Only one internal
elif [[ "$activeDisplays" =~ "${edpName}" ]]; then
  #if [[ "${change}" = "yes" ]]; then
  #  $(xrandr --output "${edpName}" --primary --auto)
  #  $(xrandr --output "${vgaName}" --off)
  #  $(xrandr --output "${hdmiName}" --off)
  #fi
  echo "eDP"
  echo "eDP"
  echo ""
fi

if [[ "${change}" = "yes" ]]; then
  echo "${activeDisplays}" > "${displayFile}"
fi
