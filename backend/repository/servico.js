const db = require("./database");

class User{

    Transacao = async (callback) => {
        await db.query("BEGIN");
        try {
            await callback();
            db.query("COMMIT");
        } catch (e) {
            await db.query("ROLLBACK");
            throw e;
        }
    };

    async ListaPratos(id_cliente){
        return await db.query(`
            SELECT prato.*, coalesce(favoritos.id_pratos, 0) AS favorito FROM prato
            LEFT JOIN favoritos ON favoritos.id_pratos = prato.id AND favoritos.id_cliente = ?;`
            ,[id_cliente]);
    }

    async getPrato(id_prato){
        return await db.query(`SELECT * FROM prato WHERE id = ?`, [id_prato]);
    }

    async RealizaPedido(id_cliente, valor_total ,pratos){
        return await db.query(`
            INSERT INTO pedido(id_cliente, data_pedido, valor_pedido) VALUES (?, CURRENT_TIMESTAMP, ?);
        `, [id_cliente, valor_total])
            .then(resultado => {
                pratos.map(async prato =>{
                    await db.query(`INSERT INTO pratos_pedidos(id_prato, id_pedido, quantidade, valor_acumulado) VALUES (?,?,?, ((SELECT valor FROM prato WHERE prato.id = ?) * ?))`, 
                    [prato.id, resultado.insertId, prato.quantidade, prato.id, prato.quantidade])
                })
            })
            .catch(e => {
                //console.log(e);
                throw e;
            })
    }
}

module.exports = new User();