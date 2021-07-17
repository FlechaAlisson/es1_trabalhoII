const db = require('../repository/user')

class User {
    async getUser(id_cliente){
        return await db.getUser(id_cliente);
    }
}

module.exports = new User();