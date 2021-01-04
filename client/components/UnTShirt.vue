<template>
    <div>
        <div id="body">
            <img id="image_annonce" src="./img/young1pact.jpeg">
            <div id="titre_note">
                <h2 id="titre_annonce">Des tshirts de qualité</h2>
                <div class="note">
                    <h3>4.2 </h3><img class="star" src="img/star.png" alt="little star">
                </div>
            </div>
            <p>11/12/2020</p>
            <hr>
            <h3 class="titre">Description :</h3>
            <p id="description">Des tshirts de qualité avec le message du collectif young 1-pac, nique les salopes qui parlents en scred, si le savoir est une arme hé ba nique ta mere, nique la canine et les stups parce qu’ils nous ont bien... Tu connais</p>
            <hr>
            <div class="row">
                <div id="notes">
                    <h3 class="titre">Avis :</h3>
                    <div id="moyenne">
                        <img class="star" src="img/star.png">
                        <img class="star" src="img/star.png">
                        <img class="star" src="img/star.png">
                        <img class="star" src="img/star.png">
                        <img class="star" src="img/star.png">
                        <p>4,2 sur 5</p>
                    </div>
                    <div class="pourcentage">
                        <p>5 étoiles</p>
                        <div class="barre"></div>
                        <p>81%</p>
                    </div>
                    <div class="pourcentage">
                        <p>4 étoiles</p>
                        <div class="barre"></div>
                        <p>81%</p>
                    </div>
                    <div class="pourcentage">
                        <p>3 étoiles</p>
                        <div class="barre"></div>
                        <p>81%</p>
                    </div>
                    <div class="pourcentage">
                        <p>2 étoiles</p>
                        <div class="barre"></div>
                        <p>81%</p>
                    </div>
                    <div class="pourcentage">
                        <p>1 étoiles</p>
                        <div class="barre"></div>
                        <p>81%</p>
                    </div>
                </div>
                <div id="commentaires">
                    <div id="form_commentaire">
                        <div id="stars">
                            <img class="star" src="img/star.png">
                            <img class="star" src="img/star.png">
                            <img class="star" src="img/star.png">
                            <img class="star" src="img/star.png">
                            <img class="star" src="img/star.png">
                        </div>
                        <input id="titre_form" type="text" placeholder="Titre">
                        <textarea id="description_form" type="text" placeholder="Description"></textarea>
                        <button>Poster l'avis</button>
                    </div>
                    <div class="commentaire">
                        <div class="profil">
                            <img src="./img/logo.jpg" alt="">
                            <p>Mathéo du 99</p>
                        </div>
                        <div id="stars">
                            <img class="star" src="img/star.png">
                            <img class="star" src="img/star.png">
                            <img class="star" src="img/star.png">
                            <img class="star" src="img/star.png">
                            <img class="star" src="img/star.png">
                            <h4>Pas mal mais la police n'aime pas beaucoup</h4>
                        </div>
                        <p>J’ai bien essayé de porter ce tshirt à levalois mais la police m’a arrêté et depuis mon anus s’est agrandi de 2.3 centimètres donc je ne peux pas mettre le 5 étoiles ... A bon entendeur......</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<style scoped>
hr{
    border: 1px solid #9C9C9C;
}
.commentaire h4{
    margin-bottom: 10px;
}
.commentaire p{
    font-weight: 300;
}
.profil{
    display: flex;
    flex-direction: row;
    line-height: 50px;
    margin-bottom: 10px;
}
.profil img{
    width: 50px;
    height: 50px;
    border-radius: 50%;
}
.profil p{
    margin-left: 20px;
    width: max-content;
}
.commentaire{
    box-shadow: 0px 0px 17px rgba(0, 0, 0, 0.25);
    padding: 20px;
    margin-bottom: 20px;
}
#form_commentaire button{
    background-color: #4D74FF;
    color: white;
    padding: 10px 20px;
    border-radius: 50px;
    border: none;
}
#form_commentaire button:hover{
    background-color: #416aff;
}
#form_commentaire button:active{
    background-color: #416aff;
    box-shadow: inset 20px 20px 60px #375ad9, 
        inset -20px -20px 60px #4b7aff;
}
#titre_form{
    margin: 10px 0;
    border: 1px solid #D1D1D1;
    padding: 10px;
}
#description_form{
    padding: 10px;
    margin-bottom: 10px;
    border: 1px solid #D1D1D1;
    height: 200px;
    resize: vertical;
}
#commentaires{
    padding-left: 20px;
    width: 480px;
}
#form_commentaire{
    box-shadow: 0px 0px 17px rgba(0, 0, 0, 0.25);
    padding: 20px;
    display: flex;
    flex-direction: column;
    margin-bottom: 20px;
}
.row{
    display: flex;
    flex-direction: row;
}
#description{
    font-weight: 300;
}
.pourcentage{
    display: flex;
    flex-direction: row;
    margin: 10px 0;
}
.pourcentage .barre{
    width: 150px;
    margin: 0 5px;
    background-color: rgb(255, 174, 0);
}
#notes{
    width: 300px;
}
#moyenne{
    display: flex;
    flex-direction: row;
    margin-bottom: 10px;
}
#moyenne p{
    line-height: 30px;
    margin-left: 10px;
}
#body{
    width: 800px;
    margin: 0 auto;
}
#image_annonce{
    object-fit: cover;
    width: 800px;
    height: 350px;
    border-radius: 17px;
    margin: 20px 0;
}
#titre_annonce{
    width: max-content;
    margin-bottom: 10px;
}
.note{
    display: flex;
    flex-direction: row;
    margin-left: auto;
}
.note h3{
    width: min-content;
    line-height: 30px;
    margin-right: 5px;
}
.star{
    height: 30px;
    width: 30px;
}
#titre_note{
    margin-top: 20px;
    display: flex;
    flex-direction: row;
}
hr{
    margin: 20px 0;
}
.titre{
    margin-bottom: 10px;
}
</style>
<script>
</script>
