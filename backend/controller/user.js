const userModel = require("../model/user");

module.exports = (app) => {
    
    app.get("/user/:id", (req, res) => {
        userModel.getUser(req.params.id)
            .then(user => {
                return res.json(user); 
            })
            .catch(e =>{
                return res.status(404).json(e)
            })
    })
}