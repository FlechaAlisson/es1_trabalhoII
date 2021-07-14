const servicoModel = require("../model/servico");


module.exports = (app) => {
    
    app.get("/servico/pratos/:id_cliente", async (req, res) => {
        servicoModel.ListaPratos(req.params.id_cliente)
            .then(pratos => {
                return res.json(pratos);
            })
            .catch(err => {
                return res.status(500).json(err)
            });
    })

    app.get("/servico/pratos/:id", (req, res) => {
        servicoModel.getPrato(req.params.id)
            .then(prato => {
                return res.json(prato);
            })
            .catch(err => {
                return res.status(500).json(err);
            })
    })
    
    app.post("/servico/pedido-confirmado", (req, res) => {
        try{
            servicoModel.RealizaPedido(req.body.id_cliente, req.body.valor_total, req.body.pratos)
            return res.json({mensagem: 'Pedido realizado!'});
        }
        catch(err){
            return res.status(400).json(err)
        }
    })

}