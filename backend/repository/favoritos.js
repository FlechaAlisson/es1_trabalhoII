const db = require("./database");

class Favoritos{
    async ListaFavoritos(id_cliente){
        return await db.query(`
            SELECT prato.*, coalesce(favoritos.id_pratos, 0) AS favorito FROM prato
            LEFT JOIN favoritos ON favoritos.id_pratos = prato.id AND favoritos.id_cliente = ?;
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

module.exports = new Favoritos();