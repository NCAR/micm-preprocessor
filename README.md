MICM Preprocessor
=================

Web service converting JSON representation of chemical mechanism into code to be used by a solver.

[![License](https://img.shields.io/github/license/NCAR/micm-preprocessor.svg)](https://github.com/NCAR/micm-preprocessor/blob/master/LICENSE)

Copyright (C) 2018-2020 National Center for Atmospheric Research

## Install
0. Install [node.js](https://nodejs.org "Node Homepage") if it is not on your machine
1. git clone this repository
2. micm-preprocessor> npm install
3. micm-preprocessor> node combined.js &

You may wish to edit combined.js to specify an alternative to port 3000 in the http.listen() at end of combined.js

If you do so, you will need to edit the port number (and potentially the host name) in test/sequence.calls.csh

## Test
0. micm-preprocessor> cd test
1. micm-preprocessor/test> ./new.call.csh chapman.json
2. micm-preprocessor/test> diff kinetics\_utilities.F90 expected/kinetics\_utilities.F90
3. micm-preprocessor/test> diff factor\_solve\_utilities.F90 expected/factor\_solve\_utilities.F90
4. micm-preprocessor/test> diff rate\_constants\_utility.F90 expected/rate\_constants\_utility.F90

You may see minor differences with the last three diffs, such as the tag (version) of the git commit


