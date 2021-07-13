const userModel = require("../model/user");


module.exports = (app) => {
    app.get("/user/:id/favoritos/lista", (req, res) => {
        userModel.ListaFavoritos(req.params.id)
            .then(favoritos => {
                return res.json(favoritos); 
            })
            .catch(e =>{
                return res.status(404).json(e)
            })
        })

    app.post("/user/:id/favoritos/adiciona", async (req, res) => {
        userModel.AdicionaFavoritos(req.params.id, req.body.id_prato)
            .then(() => {
                return res.json({mensagem: 'Adicionado'});
            })
            .catch(e => {
                console.log(e);
                return res.status(400).json(e)
            })
    })
}