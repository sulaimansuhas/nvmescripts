cd /home/$USER/net-next/drivers/nvme/target
echo "Entering file"
echo $PWD
rmmod nvmet
rmmod nvmet_tcp
insmod nvmet.ko
insmod nvmet-tcp.ko
   
cd /home/$USER/HomaModule
echo "Entering file"
echo $PWD
rmmod homa
insmod homa.ko


sh /home/$USER/nvmescripts/sethomaparams.sh
sh /home/$USER/nvmescripts/target_script.sh
