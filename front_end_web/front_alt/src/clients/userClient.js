import { connRefactor } from "./req.conf"

const getUser = (id) => {
    let body = JSON.stringify({ id_prato: id })
    connRefactor.post(`/user/${id}`, body).then((r) => console.log(r))
}
export default {
    getUser
}