<template>
    <div>
        <h2>Des Tshirts ? La réponse est oui !</h2>
        <div id="filtres">
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
