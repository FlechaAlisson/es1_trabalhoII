import { connRefactor } from "./req.conf"

const getUser = async (id) => {
    return await connRefactor.get(`/user/${id}`).then((r) => {
        return r.data[0]
    })
}
export default {
    getUser
}