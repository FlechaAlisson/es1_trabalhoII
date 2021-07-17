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

    async ListaPratos(){
        return await db.query(`SELECT * FROM prato;`);
    }

    async getPrato(id_prato){
        return await db.query(`SELECT * FROM prato WHERE id = ?`, [id_prato]);
    }

    async valor_pratos(pratos){
        var id_pratos = Array.from(pratos, (prato) => {return prato.id})
        var qt_pratos = Array.from(pratos, (prato) => {return prato.quantidade})
        const valores = await db.query(`SELECT valor FROM prato WHERE id in (?)`,[id_pratos])
        return qt_pratos.reduce((total, qt, index) => 
            total += (qt * valores[index].valor),0
        )
    }

    async RealizaPedido(id_cliente, total, pratos){
        return await db.query(`
            INSERT INTO pedido(id_cliente, data_pedido, valor_pedido) VALUES (?, CURRENT_TIMESTAMP, ?);
        `, [id_cliente, total])
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