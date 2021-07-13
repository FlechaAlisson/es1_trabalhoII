const db = require('../repository/servico')


class Servico{

    ListaPratos(){
        return db.ListaPratos();
    }
    
    RealizaPedido(id_cliente, pratos){
        return db.RealizaPedido(id_cliente, pratos);
    }

}

module.exports = new Servico();