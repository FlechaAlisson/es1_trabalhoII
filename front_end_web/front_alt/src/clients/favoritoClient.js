import { connRefactor } from "./req.conf"

const setFavorito = (id) => {
    let body = JSON.stringify({ id_prato: id })
    connRefactor.post('/user/1/favoritos', body).then((r) => console.log(r))
}

const deleteFavorito = (id) => {
    let body = JSON.stringify({ id_prato: id })
    connRefactor.delete('/user/1/favoritos', { data: body }).then((r) => console.log(r))
}

const getAllFavorite = () => {
    connRefactor.get('/user/1/favoritos').then(r => console.log(r))
}

export default {
    setFavorito, deleteFavorito, getAllFavorite
}