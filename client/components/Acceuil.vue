<template>
    <div>
        <div>
            <h1>Des T-shirts en veux-tu en voilà !!!</h1>
            <p class="texte-acceuil">
                Notre site a pour vocation de réveiller des vocations. 
                Je sais ce que vous vous dites, c’est du baratin. 
                Mais non j’y crois vraiment. 
            </p> 
        </div>
        <div class="carre-noir">
            <div class="titre-carre">
                <p> Les T-Shirts du mois ! </p>
            </div>
            <div class="texte-carre">
                <p> Des créateurs de talents, des T-shirts de renom :</p>
            </div>
            <div class="images-du-mois">
                <img id="img1" src="./img/logo.jpg" alt="image de tshirt">
                <img id="img2" src="./img/logo.jpg" alt="image de tshirt">
                <img id="img3" src="./img/logo.jpg" alt="image de tshirt">
            </div>
        </div>
    </div>
</template>

<style scoped>
    *{
        font-family: 'Roboto', sans-serif;
    }   
    h1{
        text-align: center;
        font-size: 52px;
        margin-top: 100px;
        margin-bottom: 24px;

    }
    .texte-acceuil{
        text-align: center;
        font-size: 28px;
        margin-left: 120px;
        margin-right:120px;
        margin-bottom : 100px;
    }
    .carre-noir{
        background-color: black;
        width: 100%;
        height: 100%;
    }
    .titre-carre{
        text-align: center;
        font-size: 38px;
        color: white;
        margin-bottom : 24px;
        font-weight: 300;
        padding-top: 50px;
    }
    .texte-carre{
        text-align: center;
        font-size: 26px;
        color: white;
        margin-bottom : 42px;
        font-weight:300;
    }
    .images-du-mois{
        display: flex;
        flex-direction: row;
        width: max-content;
        margin: 0 auto;
    }
    .images-du-mois img{
        width: 300px;
        height: 500px;
        object-fit: cover;
        border-radius: 30px;
        opacity: 70%;
    }
    #img1{
        transform: rotate(15deg);
        margin-left: 20px;
        margin-right: 50px;
    }
    #img2{
        transform: rotate(-15deg);
        margin-top: 75px;
        margin-left: 20px;
        margin-right: 20px;
    }
    #img3{
        transform: rotate(2deg);
        margin-left: 20px;
        margin-right: 20px;
    }
    .images-du-mois img:hover{
        opacity: 100%;
        z-index: 2;
    }
</style>

<script>
</script>
