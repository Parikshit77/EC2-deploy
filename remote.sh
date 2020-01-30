cd /home/appdynamics/
#touch test
#echo "aws s3 cp s3://appdynamics-assets/download-files/devops/platform-admin/$1/$2/platform-setup-64bit-linux.sh ." >> test
~/.local/bin/aws s3 cp s3://appdynamics-assets/download-files/devops/platform-admin/$1/$2/platform-setup-64bit-linux.sh .
cd /opt
sudo mv /home/appdynamics/platform-setup-64bit-linux.sh .
chmod 755 platform-setup-64bit-linux.sh
host_name=$(curl -s http://169.254.169.254/latest/meta-data/public-hostname)
sudo sed -i "1s/host/${host_name}/" responsePlatform.varfile
sudo ./platform-setup-64bit-linux.sh -q -dir /opt/appdynamics/platform -varfile responsePlatform.varfile
cd /opt/appdynamics/platform/platform-admin/archives/controller/4.*/playbooks
sudo sed -i 's/controller_min_ram_in_mb\(.*\)/controller_min_ram_in_mb = 1 * 1024/' controller-medium.groovy
sudo sed -i 's/controller_min_cpus\(.*\)/controller_min_cpus = 2/' controller-medium.groovy
sudo sed -i 's/controller_data_min_disk_space_in_mb\(.*\)/controller_data_min_disk_space_in_mb = 2 * 1024/' controller-medium.groovy
