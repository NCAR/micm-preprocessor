# MechanismToCode
Web service converting JSON representation of chemical mechanism into code to be used by a solver.

## Install
0. Install node.js if it is not on your machine
1. git clone this repository
2. MechanismToCode> Edit http.listen() at end of combined.js to specify an alternative to port 8080 if you wish.
3. MechanismToCode> npm install
3. MechanismToCode> node combined.js &

## Test
0. MechanismToCode> cd test
1. MechanismToCode/test> chmod u+x sequence.calls.csh
2. MechanismToCode/test> ./sequence.calls.csh chapman.json
3. MechanismToCode/test> diff kinetics\_utilities.F90 expected/kinetics\_utilities.F90
4. MechanismToCode/test> diff factor\_solve\_utilites.F90 expected/factor\_solve\_utilities.F90

You may see minor differences with the last step, such as the tag number present for the github repository


