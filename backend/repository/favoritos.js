const db = require("./database");

class User{
    async ListaFavoritos(id_cliente){
        return await db.query(`
            SELECT prato.* FROM prato
                JOIN favoritos on favoritos.id_pratos = prato.id
                WHERE favoritos.id_cliente = ?
        `, [id_cliente]);
    }

    async AdicionaFavoritos(id_cliente, id_prato){
        return await db.query(`INSERT INTO favoritos(id_cliente, id_pratos) VALUES (?, ?)`
        ,[id_cliente, id_prato]);
    }

    async RemoveFavoritos(id_cliente, id_prato){
        return await db.query(`DELETE FROM favoritos WHERE id_cliente = ? AND id_pratos = ?;`, [id_cliente, id_prato]);
    }

}

module.exports = new User();