<template>
    <div>
        <h2>Des Créateurs de qualité pour des tshirts de qualité !</h2>
        <div id="filtres">
            <div class="caracteristiques">
                <label for="categorie">Catégorie :</label>
                    <select name="cat" id="cat-select">
                        <option value="">Choississez un type de T-shirt</option>
                        <option value="Rond">Col Rond</option>
                        <option value="V">Col V</option>
                        <option value="UV">Col Ultra V</option>
                    </select>
                <label for="note">Note :</label>
                    <select name="note" id="note-select">
                        <option value="">Choississez une note de T-shirt</option>
                        <option value="0+">0+</option>
                        <option value="1+">1+</option>
                        <option value="2+">2+</option>
                        <option value="3+">3+</option>
                        <option value="4+">4+</option>
                        <option value="5">5</option>
                    </select>
                <label for="note">Couleur :</label>
                    <select name="note" id="note-select">
                        <option value="">Choississez une couleur de T-shirt</option>
                        <option value="Bleu">Bleu</option>
                        <option value="Rouge">Rouge</option>
                        <option value="Vert">Vert</option>
                        <option value="Jaune">Jaune</option>
                        <option value="Rose">Rose</option>
                        <option value="Orange">Orange</option>
                        <option value="Violet">Violet</option>
                        <option value="Noir">Noir</option>
                        <option value="Blanc">Blanc</option>
                        <option value="Marron">Marron</option>
                        <option value="Gris">Gris</option>
                        <option value="Cyan">Cyan</option>
                    </select>
            </div>
            <button>Recherche</button>
        </div>
        <annonce></annonce>
    </div>
</template>

<style scoped>
    h2{
        margin: 20px 0;
        text-align: center;
        color: grey;
    }
    #filtres{
        width: 500px;
        height: 300px;
        box-shadow: 0 0 19px rgba(0, 0, 0, 0.25);
        border-radius: 17px;
        margin: 0 auto;
        display: flex;
        flex-direction:column;
    }
    #filtres button{
        background-color: #4D74FF;
        color: white;
        padding: 10px 20px;
        border-radius: 50px;
        border: none;
    }
    #filtres button:hover{
        background-color: #416aff;
    }
    #filtres button:active{
        background-color: #416aff;
        box-shadow: inset 20px 20px 60px #375ad9, 
            inset -20px -20px 60px #4b7aff;
    }
    .caracteristiques{
        display: flex;
        flex-direction: column;
        font-size : 24px;
        padding : 20px;
    }
    .caracteristiques label{
      margin-bottom: 10px;
    }
    .caracteristiques select{
      margin-bottom: 15px;
    }
</style>
<script>
const Annonce = window.httpVueLoader('./components/Annonce.vue')

module.exports = {
    components : {
        Annonce
    },
    created : function(){
        console.log("test")
    }
}
</script>
