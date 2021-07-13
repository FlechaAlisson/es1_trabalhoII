const db = require('../repository/user')

class User {
    ListaFavoritos(id_cliente){
        return db.ListaFavoritos(id_cliente);
    }

    AdicionaFavoritos(id_cliente, id_prato){
        return db.AdicionaFavoritos(id_cliente, id_prato);
    }
}

module.exports = new User();