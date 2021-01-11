<template>
    <div id="body">
        <img id="image_annonce" src="./img/young1pact.jpeg">
        <div id="titre_note">
            <h2 id="titre_annonce"> {{tshirt.titre}}</h2>
            <div class="note_créateur">
                <h3>4.2 </h3><img class="star" src="img/star.png" alt="little star">
            </div>
        </div>
        <div class="créateur">
            <h3>Créateur du T-shirt :</h3> {{users.pseudo}}
        </div>
        <hr>
        <div class="type_couleur">
            <div>
                <h3>Type de T-shirt :</h3> {{types.nom}}
            </div>
            <div class="couleur">
                <h3 lcass="titre couleur">Couleur du T-shirt:</h3> <p class="text_couleur" v-for="c in couleur" :key="c.id_couleur"> {{c.nom}}</p>
            </div>
        </div>
        <hr>
        <div class=description>
            <h3>Description :</h3>
            <p id="description">{{tshirt.description}}</p>
        </div>
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
            <div id="avis">
                <div id="form_avis">
                    <div id="note">
                        <img @click="setNote(1)" class="clickable star" :src="'img/'+isEmpty(1)">
                        <img @click="setNote(2)" class="clickable star" :src="'img/'+isEmpty(2)">
                        <img @click="setNote(3)" class="clickable star" :src="'img/'+isEmpty(3)">
                        <img @click="setNote(4)" class="clickable star" :src="'img/'+isEmpty(4)">
                        <img @click="setNote(5)" class="clickable star" :src="'img/'+isEmpty(5)">
                    </div>
                    <input id="titre_form" type="text" placeholder="Titre" v-model="titre">
                    <textarea id="description_form" type="text" placeholder="Description" v-model="contenu"></textarea>
                    <button @click="posterAvis">Poster l'avis</button>
                </div>
                <div id="commentaire">
                    <div id="user_note">
                        <div class="user_commentaire">
                            <img src="./img/user.png" alt="">
                            <p>{{getUsername(avi.id_user)}}</p>
                        </div>
                        <div id="note">
                            <img class="star" :src="'img/'+isEmptyCommentaire(avi.note, 1)">
                            <img class="star" :src="'img/'+isEmptyCommentaire(avi.note, 2)">
                            <img class="star" :src="'img/'+isEmptyCommentaire(avi.note, 3)">
                            <img class="star" :src="'img/'+isEmptyCommentaire(avi.note, 4)">
                            <img class="star" :src="'img/'+isEmptyCommentaire(avi.note, 5)">
                        </div>
                    </div>
                    <div id="titre_commentaire">
                        <h4>{{avi.titre}}</h4>
                    </div>
                    <div id="contenu_commentaire">
                        <p>{{avi.contenu}}</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<style scoped>
    .clickable{
        cursor: pointer;
        width: 30px;
    }
    hr{
        border: 1px solid #9C9C9C;
    }
    .créateur h3, .type_couleur h3{
        display: inline;
    }
    .couleur{
        display: block;
    }
    .titre_couleur, .text_couleur{
        display: inline-block;
    }
    .commentaire h4{
        margin-bottom: 10px;
    }
    .commentaire p{
        font-weight: 300;
    }
    .user_commentaire{
        display: flex;
        flex-direction: row;
        line-height: 50px;
        margin-bottom: 10px;
    }
    .user_commentaire img{
        width: 50px;
        height: 50px;
        border-radius: 50%;
    }
    .user_commentaire p{
        margin-left: 20px;
        width: max-content;
    }
    .commentaire{
        box-shadow: 0px 0px 17px rgba(0, 0, 0, 0.25);
        padding: 20px;
        margin-bottom: 20px;
    }
    #form_avis button{
        background-color: #4D74FF;
        color: white;
        padding: 10px 20px;
        border-radius: 50px;
        border: none;
    }
    #form_avis button:hover{
        background-color: #416aff;
    }
    #form_avis button:active{
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
    #avis{
        padding-left: 20px;
        width: 480px;
    }
    #form_avis{
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
        margin-bottom: 2em;
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
    .note_créateur{
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
    #titre_note, #user_note{
        margin-top: 20px;
        display: flex;
        flex-direction: row;
    }
    hr{
        margin: 20px 0;
    }
    h3{
        margin-bottom: 10px;
    }
    #commentaire{
        width: 450px;
    }
    #note{
        display: flex;
        flex-direction: row;
        margin-left: auto;
    }
    #titre_commentaire h4{
        margin-bottom: .3em;
    }
</style>

<script>
    module.exports = {
        props: {
            isConnected: { type: Boolean }
        },
        data () {
            return {
                type: {},
                tshirt: {},
                id: 1,
                titre: "",
                contenu: "",
                avis:{},
                note: 0,
                couleur: {},
                type: {},
                users: {},
            }
        },
        async created(){
            const result = await axios.get('/api/types/'+this.id)
            this.types = result.data
            console.log(result)

            const result2 = await axios.get('/api/tshirt/'+this.id)
            this.tshirt = result2.data
            console.log(result2)

            const result3 = await axios.get('/api/avis/tshirt/'+this.id)
            this.avis = result3.data
            console.log(result3)

            const result4 = await axios.get('/api/couleur/tshirt/'+this.id)
            this.couleur = result4.data
            console.log(result4)

            const result5 = await axios.get('/api/users/'+ this.tshirt.id_user)
            this.users = result5.data
            console.log(result5)

            const result6 = await axios.get('/api/users/'+ this.avis.id_user)
            this.users = result6.data
            console.log(result6)

        },
        methods: {
                async posterAvis() {
                    console.log(this.isConnected)
                    if(this.isConnected && this.contenu!=="" && this.titre!=="" && this.note!==0){
                        const result = await axios.post('/api/avis', {
                            note: this.note,
                            contenu: this.contenu,
                            titre: this.titre,
                            id_tshirt: this.id
                        }).catch(function (error) {
                            console.log(error.response.data)
                        })
                    }else{
                        console.log('error')
                    }
                },
                setNote(note){
                    this.note = note
                },
                isEmpty(note){
                    if(note>this.note){
                        return 'star_none.png'
                    }else{
                        return 'star.png'
                    }
                },
                async getUsername(id_user){
                    const result = await axios.get('/api/users/'+id_user)
                    user = result.data
                    console.log(user)
                    return user.pseudo
                },
                isEmptyCommentaire(note, position){
                    if(position>note){
                        return 'star_none.png'
                    }else{
                        return 'star.png'
                    }
                }
            }
    }
</script>
