import { connRefactor } from "./req.conf"


const saveOrder = (pedidos) => {
    let list = []
        pedidos.pratos.forEach(element => {
            list.push({id: element.id, quantidade: element.quantidade})
        });
        let body = JSON.stringify({
            id_cliente: 1,
            pratos: list,
            valor_total: pedidos.valor_total
        })
        
    connRefactor.post('/servico/pedido-confirmado', body).then((r) => { return r.data;})
}

export default {saveOrder}