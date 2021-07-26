import { conn } from "./req.conf"

const setFavorito = (id) => {
    let body = JSON.stringify({ id_prato: id })
    conn.post('/user/1/favoritos', body).then((r) => console.log(r))
}

const deleteFavorito = (id) => {
    let body = JSON.stringify({ id_prato: id })
    conn.delete('/user/1/favoritos', { data: body }).then((r) => console.log(r))
}

const getAllFavorite = () => {
    conn.get('/user/1/favoritos').then(r => console.log(r))
}

export default {
    setFavorito, deleteFavorito, getAllFavorite
}