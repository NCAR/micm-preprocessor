'use strict';

if( process.argv.length != 4 ) {
  console.log('Useage: node validator.js my_schema.json my_data.json');
  exit;
}

const Ajv = require('ajv');
const fs = require('fs');

let raw_json = fs.readFileSync( process.argv[2] );
let schema = JSON.parse( raw_json );

raw_json = fs.readFileSync( process.argv[3] );
let test_data = JSON.parse( raw_json );

let ajv = new Ajv( );
let valid = ajv.validate( schema, test_data );
if( !valid ) {
  console.log( ajv.errorsText( ) );
  console.log( 'FAIL' );
} else {
  console.log( 'PASS' );
}
