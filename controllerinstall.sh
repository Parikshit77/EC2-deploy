sudo /opt/appdynamics/platform/platform-admin/bin/platform-admin.sh create-platform --name ER_Platform --installation-dir /opt/appdynamics/platform/
sudo /opt/appdynamics/platform/platform-admin/bin/platform-admin.sh add-hosts --hosts platformadmin
sudo /opt/appdynamics/platform/platform-admin/bin/platform-admin.sh submit-job --service controller --job install --args controllerPrimaryHost=platformadmin controllerAdminUsername=admin controllerRootUserPassword=welcome controllerAdminPassword=welcome mysqlRootPassword=welcome controllerProfile=medium
sudo cp /home/appdynamics/license.lic /opt/appdynamics/platform/controller/.
