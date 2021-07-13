const db = require("./database");

class User{
    async ListaPratos(){
        return await db.query(`SELECT * FROM prato`);
    }

    async valorPratos(pratos){
        var valor_total = 0;

        for(var i in pratos){

            var result = await db.query(`SELECT valor FROM prato WHERE id = ?`, [pratos[i]])

            valor_total += result[0].valor;
        }

        return valor_total;
    }

    async RealizaPedido(id_cliente, pratos){
        const total = await this.valorPratos(pratos);

        return await db.query(`
            INSERT INTO pedido(id_cliente, data_pedido, valor_pedido) VALUES (?, CURRENT_TIMESTAMP, ?);
        `, [id_cliente, total])
            .then(resultado => {
                pratos.map(async prato =>{
                    await db.query(`INSERT INTO pratos_pedidos(id_prato, id_pedido) VALUES (?,?)`, [prato, resultado.insertId])
                        .then()
                        .catch(e => {
                            //console.log(e);
                            throw e;
                        })
                })
            })
            .catch(e => {
                //console.log(e);
                throw e;
            })
    }
}

module.exports = new User();