if [[ $(/usr/bin/id -u) -ne 0 ]]; then
    echo "Not running as root"
    exit
fi

echo "Please Pick an option:"
echo "1) Install NVMe host drivers"
echo "2) Install NVMe target drivers"
echo "3) Install HOMA module"

read -p "Enter choice 1/2/3:" option

echo "You entered"
echo $option

if [ $option -eq 1 ]; then

	cd /home/ubuntu/net-next/drivers/nvme/host
	echo "Entering file"
	echo $PWD
	rmmod nvme
	rmmod nvme-tcp
	
	insmod nvme.ko
	insmod nvme-tcp.ko

elif [ $option -eq 2 ]; then
	cd /home/ubuntu/net-next/drivers/nvme/target
	echo "Entering file"
	echo $PWD
	rmmod nvmet
	rmmod nvmet_tcp
	
	insmod nvmet.ko
	insmod nvmet-tcp.ko

elif [ $option -eq 3 ]; then
	cd /home/ubuntu/HomaModule
	echo "Entering file"
	echo $PWD
	rmmod homa
	insmod homa.ko

fi








