<template>
    <div>
        <h2>Des Tshirts ? La réponse est oui !</h2>
        <div id="filtres">
            <div class="colonne1">
                <nav>
                    <li><a href="#">Catégorie</a>
                        <ul>
                            <li><a href="#">Col rond</a></li>
                            <li><a href="#">Col V</a></li>
                        </ul>
                    </li>
                    <li><a href="#">Note</a>
                        <ul>
                            <li><a href="#">0+</a></li>
                            <li><a href="#">1+</a></li>
                            <li><a href="#">2+</a></li>
                            <li><a href="#">3+</a></li>
                            <li><a href="#">4+</a></li>
                            <li><a href="#">5</a></li>
                        </ul>
                    </li>
                    <li><a href="#">Couleur</a>
                        <ul>
                            <li><a href="#">Bleu</a></li>
                            <li><a href="#">Rouge</a></li>
                            <li><a href="#">Jaune</a></li>
                            <li><a href="#">Vert</a></li>
                            <li><a href="#">Noir</a></li>
                            <li><a href="#">Blanc</a></li>
                            <li><a href="#">Orange</a></li>
                            <li><a href="#">Violet</a></li>
                            <li><a href="#">Rose</a></li>
                            <li><a href="#">Marron</a></li>
                            <li><a href="#">Gris</a></li>
                        </ul>
                    </li>
            </nav>
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
    li {
        list-style:none !important;
        color:#FFF;
        padding:10px;
        font-size:20px;
        text-decoration:none;
    }
 
    nav ul {
        background-color:#64abfb;
        padding:0;
        margin:0;
    }
 
    nav ul li {
        list-style: none;
        line-height:44px;
        float:left;
        background-color:#64abfb;
    }
 
    nav ul li a {
        color:#FFF;
        padding:10px;
        font-size:20px;
    text-decoration:none;
    }
 
    li a:hover {
        border-bottom:3px #FFF solid;
    }
    nav ul li ul { display:none; } /* Rend le menu déroulant caché par défaut */
 
    nav ul li:hover ul { /* Affiche la dropNav au survol de la souris avec la class .drop */
        z-index:99999;
        display:list-item !important;
        position:absolute;
        margin-top:5px;
        margin-left:-10px;
    }
 
    nav ul li:hover ul li {
        float:none;
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
