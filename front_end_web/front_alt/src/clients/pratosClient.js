import { connRefactor } from "./req.conf"

const getAllPratosFromUser = async () => {
     const r =  await connRefactor.get("user/1/favoritos")
     return (r.data)
}

export default{
    getAllPratosFromUser
}