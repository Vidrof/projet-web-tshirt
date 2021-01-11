<template>
    <div id="annonce">
        <img class="tshirt_img" src="img/logo.jpg" alt="tshirt image">
        <div class="texte">
            <div class="titre">
                <h3 id="titre_annonce">{{annonce.titre}}</h3>
                <div class="note"><h3>4.2 </h3><img class="star" src="img/star.svg" alt="little star"></div>
            </div>
            <div class="description">
                <p>{{annonce.description}}</p>
                <p>couleur :</p><div v-for="c in couleurs" class='couleurs'></div>
                <p>type : {{type.nom}}</p>
            </div>
            <button @click="ouvrirTshirt()">En savoir plus</button>
        </div>
    </div>
</template>

<style scoped>
    #annonce{
        margin: 20px auto;
        width: 700px;
        box-shadow: 0 0 19px rgba(0, 0, 0, 0.25);
        border-radius: 17px;
        display: flex;
        flex-direction: row;
        height: 250px;
    }
    .tshirt_img{
        height: 250px;
        width: 250px;
        border-radius: 17px 0px 0px 17px;
    }
    .texte{
        display: flex;
        flex-direction: column;
        width: 450px;
    }
    .texte .titre{
        display: flex;
        flex-direction: row;
    }
    .titre #titre_annonce{
        margin: 20px 0;
        width: 400px;
        text-align: center;
    }
    .note{
        display: flex;
        flex-direction: row;
    }
    .note h3{
        width: min-content;
        margin-top: 21px;
    }
    .star{
        height: 30px;
        width: 30px;
        margin-top: 15px;
    }
    .description{
        margin: 30px 30px;
        font-weight: 300;
    }
    button{
        background-color: #80FFC2;
        color: #00A807;
        border: none;
        padding: 10px 20px;
        border-radius: 50px;
        margin: 0 auto;
    }
</style>
<script>
module.exports = {
    name:"Annonce",
    props: {
        annonce: {type:Object},
        type: {type:Object},
        couleurs: {type:Array},
    },
    methods:{
        ouvrirTshirt(){
            this.$router.push('/un_tshirt/?id_tshirt='+this.annonce.id_tshirt)
        }
    }
}
</script>
