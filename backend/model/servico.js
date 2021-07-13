const db = require('../repository/servico')


class Servico{

    ListaPratos(){
        return db.ListaPratos();
    }
    
    getPrato(id_prato){
        return db.getPrato(id_prato);
    }

    RealizaPedido(id_cliente, valor_total , pratos){
        return db.RealizaPedido(id_cliente, valor_total , pratos);
    }

}

module.exports = new Servico();