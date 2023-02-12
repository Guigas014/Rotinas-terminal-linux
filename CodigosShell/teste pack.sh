#!/bin/bash

head -n -2 package1.json > package.json
#mv package.json package1.json


echo -e "  \"license\" : \"MIT\",
  \"scripts\" : {
    \"dev\" : \"ts-node-dev src/server.ts\"
  }
}" >> package.json


