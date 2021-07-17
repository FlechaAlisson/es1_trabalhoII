const db = require('../repository/favoritos')
const { configPhotoPath } = require('../public/globals')

class Favoritos {
    async ListaFavoritos(id_cliente){
        return await configPhotoPath(db.ListaFavoritos , id_cliente);
    }

    AdicionaFavoritos(id_cliente, id_prato){
        return db.AdicionaFavoritos(id_cliente, id_prato);
    }

    RemoveFavoritos(id_cliente, id_prato){
        return db.RemoveFavoritos(id_cliente, id_prato);
    }
}

module.exports = new Favoritos();