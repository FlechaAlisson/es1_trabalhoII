const http = require("http");
const express = require("express");
const app = express();

var cors = require('cors')

app.use(cors())

app.get("/prato", (req, res) => {
    res.json(
        [
            {
                id:1,
                valor: "12.30",
                nome: "Ratattoile",
                photoPath: 'images/rato.png',
                descricao: 'É a comida do rato lá'
            },
            {
                id: 2,
                valor: "30,13",
                nome: "Sopa de cebola",
                photoPath: 'images/sopinha.png',
                descricao: 'É light'
            },
            {
                id: 3,
                valor: "60.50",
                nome: "Canard à l'Orange",
                photoPath: 'images/orange.png',
                descricao: 'É um pato ao molho de laranja'
            }
        ]
    );
});

app.get("/prato/1", (req, res) => {
    res.json(
        {
            valor: "12.30",
            nome: "Ratattoile",
            photoPath: 'images/rato.png',
            descricao_completa: 'É uma clássica receita francesa provençal de legumes cozidos do século XVIII, podendo ser servida quente ou fria, sozinha ou como acompanhamento.',
            ingredientes: 'Abobrinha, berinjela, cebola, alho, tomates, pimentões, alecrim, manjericão, '

        }
    )
})

app.get("/prato/2", (req, res) => {
    res.json(
        {
            valor: "30.13",
            nome: "Sopa de cebola",
            photoPath: 'images/sopinha.png',
            descricao_completa: 'A sopa de cebola gratinada é uma especialidade tradicional da culinária de França.',
            ingredientes: "Alho, farinha de trigo, lata de creme de leite sem soro, batatas pré-cozidas picadas, 2 colheres de manteiga, 4 xícaras de água fervente, 400 g de cebola fatiada"

        }
    )
})




app.get("/prato/3", (req, res) => {
    res.json(
        {
            valor: "60.50",
            nome: "Canard à l'Orange",
            photoPath: 'images/orange.png',
            descricao_completa: 'É um pato ao molho de laranja',
            ingredientes: 'Carne de pato, laranja, batata, açucar, óleo de soja e vinha.'
        }
    )
})
http.createServer(app).listen(3000, () => console.log("Servidor rodando local na porta 3000"));
