const servicoModel = require("../model/servico");


module.exports = (app) => {

    app.get('/servico/pratos/:id/imagem', (req, res) => {
        servicoModel.getPrato(req.params.id)
            .then(prato => {
                var dir = __dirname;
                dir = dir.replace('controller', 'images')
                res.sendFile(dir + "\\" + prato[0].photoPath);
            })
            .catch(err => {
                return res.status(500).json(err);
            })
    })
    
    app.get("/servico/pratos/", (req, res) => {
        servicoModel.ListaPratos(req.params.id)
            .then(pratos => {
                console.log(pratos);
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