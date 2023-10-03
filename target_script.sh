if [[ $(/usr/bin/id -u) -ne 0 ]]; then
    echo "Not running as root"
    exit
fi



cd /sys/kernel/config/nvmet/subsystems
mkdir nvme-test-target
cd nvme-test-target/
echo 1 | sudo tee -a attr_allow_any_host > /dev/null
mkdir namespaces/1
cd namespaces/1


path_to_nvme_device=$(sudo nvme list | grep /dev/nvme | awk '{print $1}')

echo "Path to NVMe device: $path_to_nvme_device"

echo -n $path_to_nvme_device |sudo tee -a device_path > /dev/null
echo 1|sudo tee -a enable > /dev/null


sudo mkdir /sys/kernel/config/nvmet/ports/1
cd /sys/kernel/config/nvmet/ports/1



echo 192.168.122.51 |sudo tee -a addr_traddr > /dev/null

echo tcp|sudo tee -a addr_trtype > /dev/null
echo 4420|sudo tee -a addr_trsvcid > /dev/null
echo ipv4|sudo tee -a addr_adrfam > /dev/null

ln -s /sys/kernel/config/nvmet/subsystems/nvme-test-target/ /sys/kernel/config/nvmet/ports/1/subsystems/nvme-test-target
