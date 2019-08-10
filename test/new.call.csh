#!/bin/bash
echo $1
MechanismToCode="https://chemistrycafe-devel.acom.ucar.edu/preprocessor/"
echo $MechanismToCode
curl -X POST -d @$1 $MechanismToCode/constructJacobian --header "Content-Type:application/json" | python -m json.tool > $1.processed
python -c 'import sys, json; print json.load(sys.stdin)["kinetics_utilities_module"]' < $1.processed > kinetics_utilities.F90
python -c 'import sys, json; print json.load(sys.stdin)["rate_constants_utility_module"]' < $1.processed > rate_constants_utility.F90
python -c 'import sys, json; print json.load(sys.stdin)["factor_solve_utilities_module"]' < $1.processed > factor_solve_utilities.F90


