<template>
    <div id="annonce">
        <img class="tshirt_img" src="img/logo.jpg" alt="tshirt image">
        <div class="texte">
            <div class="titre">
                <h3 id="titre_annonce">Tshirt de qualité</h3>
                <div class="note"><h3>4.2 </h3><img class="star" src="img/star.svg" alt="little star"></div>
            </div>
            <div class="description">
                <p>{{annonce.titre}}</p>
            </div>
            <button>En savoir plus</button>
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
    }
    .texte .titre{
        display: flex;
        flex-direction: row;
    }
    .titre #titre_annonce{
        margin: 20px auto;
    }
    .note{
        display: flex;
        flex-direction: row;
        float: left;
        margin: auto 0;
    }
    .note h3{
        width: min-content;
    }
    .star{
        height: 30px;
        width: 30px;
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
}
}
</script>
