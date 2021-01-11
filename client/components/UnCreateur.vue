<template>
    <div>
        <div id="body">
            <img id="image_annonce" src="./img/logo.jpg">
            <div id="titre_note">
                <h2 id="titre_annonce">{{user.pseudo}}</h2>
            </div>
            <p>11/12/2020</p>
            <hr>
            <h3 class="titre">Description :</h3>
            <p id="description">{{user.description}}</p>
            <hr>
            <h3 class="titre">Ses création :</h3>
            <div id="creations">
                <div v-for="creation in creations" :key="creation.id_tshirt" class="creation">
                    <img src="./img/young1pact.jpeg" alt="un de ses tshirts" @click="ouvrirTshirt(creation.id_tshirt)">
                    <h3>{{creation.titre}}</h3>
                </div>
            </div>
        </div>
    </div>
</template>

<style scoped>
#creations{
    width: 800px;
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
}
.creation{
    margin: 10px;
    width: 200px;
    display: flex;
    flex-direction: column;
}
.creation img{
    width: 200px;
}
.creation h3{
    text-align: center;
}
.creation img:hover{
    width: 200px;
    filter: blur(2px);
    cursor: pointer;
}
button{
    background-color: #4D74FF;
    color: white;
    padding: 10px 20px;
    border-radius: 50px;
    border: none;
    margin: auto 0 ;
}
button:hover{
    background-color: #416aff;
}
button:active{
    background-color: #416aff;
    box-shadow: inset 20px 20px 60px #375ad9, 
        inset -20px -20px 60px #4b7aff;
}
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
    module.exports = {
        data () {
            return {
                user: {},
                creations: []
            }
        },
        async mounted () {
        },
        async created(){
            const result = await axios.get('/api/users/' + this.$route.query.id_user)
            this.user = result.data

            const result2 = await axios.get('api/tshirt/user/' + this.user.id_user)
            this.creations = result2.data

        },
        methods: {
            ouvrirTshirt(id_tshirt){
                this.$router.push('/un_tshirt/?id_tshirt='+id_tshirt)
            }
        }
    }
</script>
