echo "starting postinstall.sh"
touch /etc/foo 
rm -f /dev/null /lib/udev/rules.d/75-persistent-net-generator.rules
ln -sf /dev/null /lib/udev/rules.d/75-persistent-net-generator.rules
rm -f /etc/udev/rules.d/70-persistent-net.rules
echo "ending postinstall.sh"
