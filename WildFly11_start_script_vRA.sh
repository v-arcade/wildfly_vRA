#! /bin/bash


PATH=$PATH:/opt/vmware-jre/bin
export PATH
cd $wildflyHome/wildfly-11.0.0.CR1/bin
$wildflyHome/wildfly-11.0.0.CR1/bin/standalone.sh -b=0.0.0.0 -bmanagement=0.0.0.0 &

i=1
while [ $i -le 12 ]
do
        if  (( $(/bin/ps -ef | /bin/grep wildfly | /bin/grep -v grep | /usr/bin/wc -l ) == 2));
        then
                echo WildFly Process started
                i=12
        else
                echo Waiting for initialization...
        fi
        sleep 5
        ((i++))
done

i=1
while [ $i -le 12 ]
do
        if  (( $(/usr/bin/tail -10 $wildflyHome/wildfly-11.0.0.CR1/standalone/log/server.log | /bin/grep '(WildFly Core 3.0.1.Final) started' | /usr/bin/wc -l) == 1));
        then
                echo WildFly Server initialization complete
                /usr/bin/tail -10  $wildflyHome/wildfly-11.0.0.CR1/standalone/log/server.log
                i=12
        else
                echo Waiting for server to start..
        fi
        sleep 10
        ((i++))
done

