cd /home/$(whoami)/net-next/drivers/nvme/host
echo "Entering file"
echo $PWD
rmmod nvme
rmmod nvme-tcp
insmod nvme.ko
insmod nvme-tcp.ko

cd /home/$(whoami)/HomaModule
echo "Entering file"
echo $PWD
rmmod homa
insmod homa.ko

sh /home/$(whoami)/nvmescripts/sethomaparams.sh
nvme -connect -t tcp -n nvme-test-target -a 192.168.122.201 -s 4420
