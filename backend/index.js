const customExpress = require('./config/customExpress');
const port = 3000

//realiza a configuracao Express e outras bibliotecas para o app
const app = customExpress();

/*
Fazer pedido           *
Pegar pratos ativos    *
Adicionar Favoritos    * 
Listar favoritos       *
*/


app.listen(port, () => {
  console.log(`Rodando em http://localhost:${port}`)
})