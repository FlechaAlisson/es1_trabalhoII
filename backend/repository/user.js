const db = require("./database");

class User{
    async getUser(id_cliente){
        return await db.query(`
            SELECT * FROM cliente WHERE id = ?
        `, [id_cliente]);
    }

}

module.exports = new User();