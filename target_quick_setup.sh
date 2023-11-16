cd /home/$(whoami)/net-next/drivers/nvme/target
echo "Entering file"
echo $PWD
rmmod nvmet
rmmod nvmet_tcp
insmod nvmet.ko
insmod nvmet-tcp.ko
   
cd /home/$(whoami)/HomaModule
echo "Entering file"
echo $PWD
rmmod homa
insmod homa.ko


sh /home/$(whoami)/nvmescripts/sethomaparams.sh
sh /home/$(whoami)/nvmescripts/target_script.sh
