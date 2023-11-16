cd /home/ubuntu/net-next/drivers/nvme/target
echo "Entering file"
echo $PWD
rmmod nvmet
rmmod nvmet_tcp
insmod nvmet.ko
insmod nvmet-tcp.ko
   
cd /home/ubuntu/HomaModule
echo "Entering file"
echo $PWD
rmmod homa
insmod homa.ko


sh /home/ubuntu/nvmescripts/sethomaparams.sh
sh /home/ubuntu/nvmescripts/target_script.sh
