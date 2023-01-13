#!/bin/bash

if [[ -z "${MECHANISM_FOLDER}" ]]; then
  echo "You must set the MECHANISM_FOLDER environment variable to the directory where your mechanism config.json file exists."
  return
fi

if [[ ! -d "${MECHANISM_FOLDER}" ]]; then
  echo "MECHANISM_FOLDER must point to an existing directory"
  return
fi

cd $MECHANISM_FOLDER
nohup bash -c "node /micm-preprocessor/combined.js &" && sleep 4 \
&& python3 /micm-preprocessor/etc/get_mechanism_code.py -c config.json -p localhost:3000
