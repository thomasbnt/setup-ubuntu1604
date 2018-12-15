rm /etc/resolv.conf
touch /etc/resolv.conf
echo "nameserver 1.1.1.1" >> /etc/resolv.conf
echo "nameserver 1.0.0.1" >> /etc/resolv.conf
# IPV6 :  2606:4700:4700::1111,2606:4700:4700::1001
# Website : https://1.1.1.1  
# Yeah, one.one.one.one 
cat /etc/resolv.conf
