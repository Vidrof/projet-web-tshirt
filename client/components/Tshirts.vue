<template>
    <div>
        <h2>Des Tshirts ? La réponse est oui !</h2>
        <div id="filtres">
            <div class="caracteristiques">
                <label for="categorie">Catégorie :</label>
                    <select v-model="type">
                        <option v-for="type in types" v-bind:key="type.id_type" v-bind:value="type.id_type">{{type.nom}}</option>                        
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
                    <select v-model="couleur">
                        <option v-for="couleur in couleurs" v-bind:key="couleur.id_couleur" v-bind:value="couleur.id_couleur">{{couleur.nom}}</option>                        
                    </select>
                <label for="creator-search">Chercher un créateur</label>
                <input v-model="createur" type="search" id="creator-search" name="q" aria-label="Rechercher un createur particulier">
            </div>
            <button @click="refreshTshirts()">Recherche</button>
        </div>
        <annonce 
            :un_tshirt="tshirt"
            :type="types.find(x => x.id_type === tshirt.id_type)"
            v-for="tshirt in tshirts"
            v-bind:key="tshirt.id">
        </annonce>
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
        margin-right: auto;
        margin-left:auto;
        margin-top:20px;
        margin-bottom:20px;
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
    data () {
        return {
            types: [],
            type: 0,
            couleurs: [],
            couleur: 0,
            tshirts: [],
            tshirt:0,
            createur: ""
        }
    },
    async created(){
        const result = await axios.get('/api/types')
        this.types = result.data
        

        const result2 = await axios.get('/api/couleurs')
        this.couleurs = result2.data

        const result3 = await axios.get('/api/tshirt')
        this.tshirts = result3.data
    },
    methods:{
        async refreshTshirts(){
            const result = await axios.get('/api/tshirt')
            this.tshirts = result.data

            var tshirt_tmp=[]

            for(var tshirt of this.tshirts){
                var ok = true
                if(this.type!==0){
                    if(tshirt.id_type!==this.type){
                        ok=false
                    }
                }
                const result2 = await axios.get('/api/couleur/tshirt/'+tshirt.id_tshirt)
                var couleurs = result2.data
                if(this.couleur!==0){
                    if(typeof couleurs.find(x => x.id_couleur === this.couleur) === 'undefined'){
                        ok=false
                    }
                }
                if(ok){
                    tshirt_tmp.push(tshirt)
                }
            }
            this.tshirts=tshirt_tmp
        }
    }
}
</script>
