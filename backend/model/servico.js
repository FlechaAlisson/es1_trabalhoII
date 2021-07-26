const db = require('../repository/servico')
const { configPhotoPath } = require('../common/funcoes')


class Servico{

    async ListaPratos(){
       return await configPhotoPath(db.ListaPratos)
    }
    
    async getPrato(id_prato){
        return await configPhotoPath(db.getPrato, id_prato)
    }

    async RealizaPedido(id_cliente, pratos){
        const soma = await db.valor_pratos(pratos);
        return db.Transacao(async () => {await db.RealizaPedido(id_cliente, soma, pratos)})
    }

}

module.exports = new Servico();