#!/bin/bash
echo $1
MechanismToCode="http://localhost:8080"
echo $MechanismToCode
curl -X POST -d @$1 $MechanismToCode/constructJacobian --header "Content-Type:application/json" | python -m json.tool > $1.jac
#python -c 'import sys, json; print json.load(sys.stdin)["j_map"]' < $1.jac > j_map.F90
#python -c 'import sys, json; print json.load(sys.stdin)["k_collection"]' < $1.jac > k_collection.F90
#python -c 'import sys, json; print json.load(sys.stdin)["special_k_collection"]' < $1.jac > special_k_collection.F90
python -c 'import sys, json; print json.load(sys.stdin)["rate_constant_module"]' < $1.jac > rate_constants_utility.F90


curl -X POST -d @$1.jac $MechanismToCode/constructSparseLUFactor --header "Content-Type:application/json" | python -m json.tool > $1.LU
#python -c 'import sys, json; print json.load(sys.stdin)["backsolve_L_y_eq_b_fortran"]' < $1.LU > backsolve_L_y_eq_b.F90
#python -c 'import sys, json; print json.load(sys.stdin)["backsolve_U_x_eq_y_fortran"]' < $1.LU > backsolve_U_x_eq_y.F90
#python -c 'import sys, json; print json.load(sys.stdin)["factor_LU_fortran"]' < $1.LU > factor.F90
#python -c 'import sys, json; print json.load(sys.stdin)["solve"]' < $1.LU > solve.F90
python -c 'import sys, json; print json.load(sys.stdin)["module"]' < $1.LU > factor_solve_utilities.F90

curl -X POST -d @$1.LU $MechanismToCode/toCode --header "Content-Type:application/json" | python -m json.tool > $1.jac.init
#python -c 'import sys, json; print json.load(sys.stdin)["init_jac_code_string"]' < $1.jac.init > jacobian_init.F90
#python -c 'import sys, json; print json.load(sys.stdin)["init_kinetics"]' < $1.jac.init > kinetics_init.F90
#python -c 'import sys, json; print json.load(sys.stdin)["final_kinetics"]' < $1.jac.init > kinetics_final.F90
#python -c 'import sys, json; print json.load(sys.stdin)["force"]' < $1.jac.init > force.F90
#python -c 'import sys, json; print json.load(sys.stdin)["factored_alpha_minus_jac"]' < $1.jac.init > factored_alpha_minus_jac.F90
#python -c 'import sys, json; print json.load(sys.stdin)["dforce_dy_times_vector"]' < $1.jac.init > dforce_dy_times_vector.F90
python -c 'import sys, json; print json.load(sys.stdin)["module"]' < $1.jac.init > kinetics_utilities.F90
