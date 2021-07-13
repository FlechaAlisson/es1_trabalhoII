const servicoModel = require("../model/servico");


module.exports = (app) => {
    
    app.get("/servico/pratos", async (req, res) => {
        servicoModel.ListaPratos()
            .then(pratos => {
                return res.json(pratos);
            })
            .catch(err => {
                return res.status(500).json(err)
            });
    })
    
    app.post("/servico/pedido-confirmado", (req, res) => {
        servicoModel.RealizaPedido(req.body.id_cliente, req.body.id_pratos)
            .then(() =>{
                return res.json({mensagem: 'Pedido realizado!'});
            }) 
            .catch(err => {
                return res.status(400).json(err)
            })
    })

}