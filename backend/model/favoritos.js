const db = require('../repository/favoritos')

class User {
    ListaFavoritos(id_cliente){
        return db.ListaFavoritos(id_cliente);
    }

    AdicionaFavoritos(id_cliente, id_prato){
        return db.AdicionaFavoritos(id_cliente, id_prato);
    }

    RemoveFavoritos(id_cliente, id_prato){
        return db.RemoveFavoritos(id_cliente, id_prato);
    }
}

module.exports = new User();