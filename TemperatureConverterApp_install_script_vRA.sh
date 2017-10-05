#! /bin/sh

echo "External Repo value="  $ExternalRepo
if [ $ExternalRepo ];
then
        echo "Getting file from External Repo"
        wget --no-check-certificate -O /tmp/temperature-converter.war $repoURL/temperature-converter.war
        cp /tmp/temperature-converter.war $wildflyHome/wildfly-11.0.0.CR1/standalone/deployments
else
      echo "Using local Repo"
      cp $sourceLocation/temperature-converter.war $wildflyHome/wildfly-11.0.0.CR1/standalone/deployments
fi

i=1
while [ $i -le 12 ]
do
        if  (( $(/usr/bin/tail -10 $wildflyHome/wildfly-11.0.0.CR1/standalone/log/server.log | /bin/grep 'Deployed "temperature-converter.war"' | /usr/bin/wc -l) == 1));
        then
                echo Application deployment complete
                /usr/bin/tail -50  $wildflyHome/wildfly-11.0.0.CR1/standalone/log/server.log
                i=12
        else
                echo wait for application to  deploy..
        fi
        sleep 5
        ((i++))
done

