const mysql = require( 'mysql' );
require('dotenv').config()
class Database {
    constructor( config ) {
        this.connection = mysql.createConnection( config );
    }
    query( sql, args ) {
        return new Promise( ( resolve, reject ) => {
            this.connection.query( sql, args, ( err, rows ) => {
                if ( err )
                    return reject( err );
                resolve( rows );
            } );
        } );
    }
    close() {
        return new Promise( ( resolve, reject ) => {
            this.connection.end( err => {
                if ( err )
                    return reject( err );
                resolve();
            } );
        } );
    }
}

module.exports = new Database({
    host: process.env.RDS_HOST, 
    user: process.env.RDS_USER, 
    password: process.env.RDS_PASS, 
    database: process.env.RDS_DB
});