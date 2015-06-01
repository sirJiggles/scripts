#!/bin/bash

function createService {

  checkRoot

  checkIFStandAlone "service"

  # store the kebabcase value of the service name
  kebabCase=$( kebabCase $1 )
  serviceName=$1

  if [ $standAlone == "y" ] ; then
    # create the stand alone module with the name etc they sent in as args

    # copy over the files and create the structure
    mkdir src/scripts/modules/"$kebabCase"
    cp -r "$scriptPath"/base/scripts/service/ ./src/scripts/modules/"$kebabCase"

    #replace the constants
    replaceIn ./src/scripts/modules/"$kebabCase" "SERVICENAME" "$serviceName"
    replaceIn ./src/scripts/modules/"$kebabCase" "SERVICEMODULE" "$kebabCase"

    #rename the service file
    mv ./src/scripts/modules/"$kebabCase"/service.js ./src/scripts/modules/"$kebabCase"/"$serviceName".js

    # add the module to the app
    appendModule $kebabCase

    echo "-------------------------"
    echo "service $1 created"
    echo "-------------------------"

  else
    # if we are here we are creating the directive as part of an existing module

    # get all directory names
    #ls -l ./src/scripts/modules | grep '^d'


    # ask the user for the name of the module they would like to put the directive inside
    echo "should ask the user what module to add to"
  fi
}