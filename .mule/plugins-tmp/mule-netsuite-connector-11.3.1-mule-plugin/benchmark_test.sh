#!/bin/bash

echo $(date)
echo "***********************************"
mvn clean install -Dmunit.test=metadata/input/AddList.xml -Dtest=none -DfailIfNoTests=false -o 
mvn clean install -Dmunit.test=metadata/input/Default.xml -Dtest=none -DfailIfNoTests=false -o 
mvn clean install -Dmunit.test=metadata/input/Search.xml -Dtest=none -DfailIfNoTests=false -o 
mvn clean install -Dmunit.test=metadata/input/UpdateList.xml -Dtest=none -DfailIfNoTests=false -o 
echo "***********************************"
echo $(date)
