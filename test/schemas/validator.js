'use strict';

if( process.argv.length != 3 ) {
  console.log('Useage: node validator.js my_data.json');
  exit;
}

const Ajv = require('ajv');
const fs = require('fs');

let raw_json = fs.readFileSync( '../../schemas/chemical_species.json' );
let chemical_species_schema = JSON.parse( raw_json );

raw_json = fs.readFileSync( '../../schemas/chemical_species_standard_properties/molecular_weight.json' );
let molecular_weight_schema = JSON.parse( raw_json );

raw_json = fs.readFileSync( '../../schemas/chemical_species_standard_properties/henrys_law_constant.json' );
let henrys_law_constant_schema = JSON.parse( raw_json );

raw_json = fs.readFileSync( '../../schemas/chemical_species_standard_properties/diffusion_coefficient.json' );
let diffusion_coefficient_schema = JSON.parse( raw_json );

raw_json = fs.readFileSync( process.argv[2] );
let test_data = JSON.parse( raw_json );

let ajv = new Ajv({ verbose : true });
let validate = ajv.addSchema( molecular_weight_schema      )
                  .addSchema( henrys_law_constant_schema   )
                  .addSchema( diffusion_coefficient_schema )
                  .compile(   chemical_species_schema      );
let valid = validate( test_data );
if( !valid ) {
  console.log( ajv.errorsText( ) );
  console.log( 'FAIL' );
} else {
  console.log( 'PASS' );
}
