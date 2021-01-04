<template>
    <div>
        <div>
            <h1>Des T-shirts en veux-tu en voilà !!!</h1>
            <p>
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
                <p> Des créateurs de talents, des T-shirts de renom </p>
            </div>
            <div class="images-du-mois">
                <img src="./img/logo.jpg" alt="image de tshirt">
                <img src="./img/logo.jpg" alt="image de tshirt">
                <img src="./img/logo.jpg" alt="image de tshirt">
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
        font-size: 64px;
        margin-top: 12px;
        margin-bottom: 24px;

    }
    p{
        text-align: center;
        font-size: 36px;
        margin-left: 120px;
        margin-right:120px;
        margin-bottom : 24px;
    }
    .carre-noir{
        background-color: black;
        width: 100%;
        height: 100%;
        margin-top: 5%;
    }
    .titre-carre{
        text-align: center;
        font-size: 64px;
        color: white;
    }
    .texte-carre{
        text-align: center;
        font-size: 48px;
        color: white;
    }
    .images-du-mois{
        display: flex;
        flex-direction: row;
        justify-content: space-between;
        border-radius: 50%;
    }
</style>

<script>
</script>
