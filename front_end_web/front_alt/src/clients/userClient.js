import { conn } from "./req.conf"

const getUser = async (id) => {
    return await conn.get(`/user/${id}`).then((r) => {
        return r.data[0]
    })
}
export default {
    getUser
}