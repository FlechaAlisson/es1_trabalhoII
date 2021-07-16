
require('dotenv').config()


async function configPhotoPath(callback, id){
    if(typeof callback === 'function'){
        var pratos = await callback(id);
        pratos.map((prato, index) => {
            pratos[index].photoUrl = `${process.env.BACK_HOST}/servico/pratos/${pratos[index].id}/imagem`;
        })
        return pratos;
    }
    throw new Error('Algum erro aconteceu')
}

module.exports = {configPhotoPath}