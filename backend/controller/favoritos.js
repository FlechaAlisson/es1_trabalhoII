const favModel = require("../model/favoritos");

module.exports = (app) => {
    
    app.get("/user/:id/favoritos", (req, res) => {
        favModel.ListaFavoritos(req.params.id)
            .then(favoritos => {
                return res.json(favoritos); 
            })
            .catch(e =>{
                return res.status(404).json(e)
            })
    })

    
    app.post("/user/:id/favoritos", async (req, res) => {
        favModel.AdicionaFavoritos(req.params.id, req.body.id_prato)
        .then(() => {
            return res.json({mensagem: 'Prato adicionado aos favoritos'});
        })
        .catch(e => {
            console.log(e);
            return res.status(400).json(e)
        })
    })
    app.delete("/user/:id/favoritos", (req, res) => {
        favModel.RemoveFavoritos(req.params.id, req.body.id_prato)
            .then(() => {
                return res.json({mensagem: 'Prato removido dos favoritos'});
            })
            .catch(e => {
                console.log(e);
                return res.status(400).json(e)
            })
    })
}