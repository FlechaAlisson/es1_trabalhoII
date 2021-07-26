<template>
  <div id="app">
    <h1>RESTAURANTE</h1>

    <div v-if="user != undefined">
      <b> Usuário: {{user.nome}} </b>
    </div>
    
    <b-row align-content="start" v-for="prato in list_pratos" :key="prato.id">
      <b-col class="col"><b-avatar variant="info" size="3rem" :src="prato.photoUrl"></b-avatar></b-col>
      <b-col class="col">{{ prato.nome }}</b-col>
      <b-col class="col">{{ prato.descricao_breve }}</b-col>
      <b-col class="col"> R$ {{ prato.valor }}</b-col>
      <b-col class="col">
        <b-button variant="success" @click="addCarrinho(prato)"
          >adicionar ao carrinho</b-button
        ></b-col
      >
      <b-col @click="toogleFavorite(prato)" v-if="prato.favorito != 0 " class="col"> <b-icon-heart-fill></b-icon-heart-fill></b-col>
      <b-col @click="toogleFavorite(prato)" v-else class="col"> <b-icon-heart></b-icon-heart></b-col>
   
    </b-row>

    <div class="card carrinho">
      <div class="card-body">
        <b-row>
          <h3 class="card-title">CARRINHO:</h3>

          <div v-if="this.carrinho.length == 0">carrinho vazio</div>
          <div v-else>
            <div v-for="prato in carrinho.pratos" :key="prato.id">
              <b-col class="col"
                >{{ prato.nome }} - {{ prato.quantidade }}x</b-col
              >
            </div>
            <b-col class="col"
              ><b-button class="btn" variant="danger" @click="clearLittleCar"
                >limpar carrinho</b-button
              >
              <b-button class="btn" variant="success" @click="saveOrder"
                >fazer pedido</b-button
              ></b-col
            >
          </div>
        </b-row>
      </div>
    </div>


    <div></div>
  </div>
</template>

<script>
import pratosClient from "./clients/pratosClient";
import pedidoClient from "./clients/pedidoClient";
import favoritoClient from "./clients/favoritoClient"
import userClient from "./clients/userClient"

export default {
  name: "App",

  data() {
    return {
      list_pratos: [],
      carrinho: {
        valor_total: 0,
        pratos: [],
      },
      favoritos: [],
      user: undefined
    };
  },

  methods: {

    toogleFavorite(prato){
      if (prato.favorito != 0) {
        prato.favorito = 0
        favoritoClient.deleteFavorito(prato.id)
        
      } else {
        prato.favorito = prato.id
        favoritoClient.setFavorito(prato.id)
      }
    },
    clearLittleCar(){
      this.carrinho = {
        valor_total: 0,
        pratos: [],
      }
    },
    addCarrinho(prato) {
      let exists = false;

      this.carrinho.pratos.forEach((e) => {
        if (prato.id == e.id) {
          exists = true;
        }
      });

      if (!exists) {
        this.carrinho.pratos.push({ ...prato, quantidade: 1 });
      } else {
        this.carrinho.pratos.forEach((e) => {
          if (prato.id == e.id) {
            e.quantidade++;
          }
        });
      }

      this.carrinho.valor_total += prato.valor;
    },

    saveOrder() {
      if (this.carrinho.pratos.length > 0) {
        pedidoClient.saveOrder(this.carrinho);
      this.carrinho = {
        valor_total: 0,
        pratos: [],
      }
      window.alert("pedido realizado!");
      } else {
        window.alert('escolha um prato.')
        
      }
    },
  },

  created() {
    pratosClient.getAllPratosFromUser().then((r) => (this.list_pratos = r));
    userClient.getUser(1).then(r => {this.user = r})
  },
};
</script>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}

.col {
  padding: 10px 10px 10px 10px;
}
.carrinho {
  margin-top: 50px;
  margin-left: 15px;
  margin-right: 15px;
}
.btn {
  margin-left: 5px;

  margin-right: 5px;
}
</style>
