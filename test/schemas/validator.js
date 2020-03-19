'use strict';

if( process.argv.length != 4 ) {
  console.log('Useage: node validator.js my_schema.json my_data.json');
  exit;
}

const Ajv = require('ajv');
const fs = require('fs');

const schema_dir_name = '/schemas/';

// Read the schema and determine the root schema directory
const schema_root_path = process.argv[2].split( schema_dir_name )[0].concat( schema_dir_name );
let raw_json = fs.readFileSync( process.argv[2] );
let schema = JSON.parse( raw_json );
const schema_root_uri = schema.$id.split( schema_dir_name )[0].concat( schema_dir_name );

// Read the JSON data to validate
raw_json = fs.readFileSync( process.argv[3] );
let test_data = JSON.parse( raw_json );

// Validate the schema
var ajv = new Ajv({ loadSchema: loadSchema });
ajv.compileAsync( schema ).then( function( validate ) {
  let valid = validate( test_data );
  if( !valid ) {
    console.log( ajv.errorsText( validate.errors ) );
    console.log( 'FAIL' );
  } else if( !checkLookups( validate.schema, test_data ) ) {
    console.log( 'FAIL' );
  } else {
    console.log( 'PASS' );
  }
}).catch( function( err ) { console.log( err.name + ": " + err.message ); });

// Load sub-schemas
function loadSchema(uri) {
  console.log( 'Opening: ' + uri );
  let path = schema_root_path.concat( uri.split( schema_root_uri )[1] );
  return Promise.resolve( JSON.parse( fs.readFileSync( path ) ) );
}

// Check lookups in the schema
function checkLookups( schema, test_data ) {

  // Finish if needed

  return true;
}
