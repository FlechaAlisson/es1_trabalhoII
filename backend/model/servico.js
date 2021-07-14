const db = require('../repository/servico')


class Servico{

    ListaPratos(id_cliente){
        return db.ListaPratos(id_cliente);
    }
    
    getPrato(id_prato){
        return db.getPrato(id_prato);
    }

    RealizaPedido(id_cliente, valor_total , pratos){
        return db.RealizaPedido(id_cliente, valor_total , pratos);
    }

}

module.exports = new Servico();