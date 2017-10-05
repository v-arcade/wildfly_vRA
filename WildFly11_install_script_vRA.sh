#! /bin/bash

echo "External Repo value="  $ExternalRepo
if [  $useExternalRepo ];
then
        echo "Getting file from External Repo"
        wget --no-check-certificate -O /tmp/wildfly-11.0.0.CR1.tar.gz $repoURL/wildfly-11.0.0.CR1.tar.gz
       cd /tmp
        /bin/gunzip /tmp/wildfly-11.0.0.CR1.tar.gz
        mv /tmp/wildfly-11.0.0.CR1.tar $wildflyHome
else
      echo "Using local Repo"
      cd $sourceLoc
     /bin/gunzip $sourceLoc/wildfly-11.0.0.CR1.tar.gz
     mv $sourceLoc/wildfly-11.0.0.CR1.tar $wildflyHome
fi

cd $wildflyHome
/bin/tar -xvf $wildflyHome/wildfly-11.0.0.CR1.tar






