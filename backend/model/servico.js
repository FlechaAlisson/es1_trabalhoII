const db = require('../repository/servico')
const { configPhotoPath } = require('../public/globals')


class Servico{

    async ListaPratos(){
       return await configPhotoPath(db.ListaPratos)
    }
    
    async getPrato(id_prato){
        return await configPhotoPath(db.getPrato, id_prato)
    }

    async RealizaPedido(id_cliente, valor_total , pratos){
        return db.Transacao(async () => {await db.RealizaPedido(id_cliente, valor_total , pratos)})
    }

}

module.exports = new Servico();