# https://askubuntu.com/questions/1234807/no-sound-after-sleep-ubuntu-20-04

echo 1 > /sys/bus/pci/devices/0000:00:1b.0/remove
echo 1 > /sys/bus/pci/rescan
echo "Sound device has been restarted."
