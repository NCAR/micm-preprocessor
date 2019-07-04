# MechanismToCode
Web service converting JSON representation of chemical mechanism into code to be used by a solver.

## Install
0. Install [node.js](https://nodejs.org "Node Homepage") if it is not on your machine
1. git clone this repository
2. MechanismToCode> npm install
3. MechanismToCode> node combined.js &

You may wish to edit combined.js to specify a alternative to port 8080 in the http.listen() at end of combined.js

If you do so, you will need to edit the port number (and potentially the host name) in test/sequence.calls.csh

## Test
0. MechanismToCode> cd test
1. MechanismToCode/test> chmod u+x sequence.calls.csh
2. MechanismToCode/test> ./sequence.calls.csh chapman.json
3. MechanismToCode/test> diff kinetics\_utilities.F90 expected/kinetics\_utilities.F90
4. MechanismToCode/test> diff factor\_solve\_utilites.F90 expected/factor\_solve\_utilities.F90

You may see minor differences with the last two diffs, such as the tag (version) of the git commit


