PATH=$PATH:/opt/vmware-jre/bin
export PATH

echo Adding Admin user
$wildflyHome/wildfly-11.0.0.CR1/bin/add-user.sh $AdminUser $AdminPassword
echo Admin user added
