echo $1 $2 $3
cp hosts.config hosts
ansible-playbook -i hosts pa-cli-test.yml --extra-vars "branch=$1" --extra-vars "build=$2"
#ansible-playbook -i hosts pa-cli-copy.yml --extra-vars "branch=$1" --extra-vars "build=$2"
if [ ! -z $3 ] 
then
 ansible-playbook -i hosts pa-cli-mysql.yml
 demoapp_host=$(grep 'ec2' hosts | cut -d' ' -f1)
 echo ${demoapp_host}
 sed -i '' "s/host/$demoapp_host/" deploy-EComm-DemoApp.sh
 cp hosts.config hosts
 ansible-playbook -i hosts EComm-App-test.yml --extra-vars "branch=$1" --extra-vars "build=$2"
 ansible-playbook -i hosts EComm-App-copy.yml
fi
