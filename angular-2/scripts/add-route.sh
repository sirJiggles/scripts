#!/bin/bash

function addRoute {

  # add the route to the routing table
  # -0777 read whole file
  # -i replce inline (had to be seperate on osx)
  perl -0777 -i -pe "s/(\@RouteConfig\(\[(.|\n)*)(.*)?(\n\]\))/\1\3\n\ \ \{path\:'\/$1'\, name\: '$2'\, component\: $2Component\}\,\4/g" ./app/components/app/app.ts


  # insert the component injection into the app also
  perl -0777 -i -pe "s/(import.*\n)\n/\1import\ \{$2Component\}\ from\ '\.\.\/$1\/index'\;\n\n/g" ./app/components/app/app.ts
}
