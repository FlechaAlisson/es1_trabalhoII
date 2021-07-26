import { conn } from "./req.conf"

const getAllPratosFromUser = async () => {
     const r =  await conn.get("user/1/favoritos")
     return (r.data)
}

export default{
    getAllPratosFromUser
}