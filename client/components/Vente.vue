<template>
    <div>
        <h3 v-if="success">Votre Tshirt est en ligne ! Allez dans votre profil pour le voir !</h3>
        <div class="nouveau_produit">
            <h2>Poster mon Tshirt</h2>
            <form @submit.prevent="addTshirt" id="mon_form">
                <div class="ajouter_produit">
                    <div class="field_description">
                        <input v-model="titre" type="text" id="description" name="description" placeholder="Veuillez saisir un titre">
                    </div>
                    <div class="field_description">
                        <input v-model="description" type="text" id="description" name="description" placeholder="Veuillez saisir une description">
                    </div>
                    <div class="field_catégorie">
                        <label for="Catégorie">Type :</label>
                        <select id="Catégorie" name="catégorie" v-model="type">
                            <option value="none" selected disabled hidden>Type</option>
                            <option v-for="type in types" :key="type.id_type" :value="type.id_type">{{type.nom}}</option>
                        </select>
                    </div>
                    <div class="field_couleur">
                        <label for="Couleur">Couleur :</label>
                        <select id="Couleur" name="couleur" v-model="couleur">
                            <option value="none" selected disabled hidden>Couleur</option>
                            <option v-for="couleur in couleurs" :key="couleur.id_couleur" :value="couleur.id_couleur">{{couleur.nom}}</option>
                        </select>
                    </div>
                    <div class="field_photo">
                        <label for="photo">Photo(s) :</label>
                        <input @change="processFile($event)" type="file" id="photo" name="photo" placeholder="Photo" accept="image/png, image/jpeg">
                    </div>
                    <!--
                    <div class="field_prix">
                        <label for="prix">Prix (en euros) :</label>
                        <input type="number" id="prix" name="prix" placeholder="Veuillez saisir un prix" required>

                        </select>
                    </div>
                    
                    <div class="field_quantité">
                        <label for="quantité">Quantité disponible :</label>
                        <input type="number" id="quantité" name="quantité" placeholder="Veuillez saisir une quantité" required>
                    </div>
                    <div class="field_description">
                        <label for="description">Description :</label>
                        <input type="text" id="description" name="description" placeholder="Veuillez saisir votre description">
                    </div>
                    -->
                </div>
                <div class="bottom">
                    <input id="bouton" type="submit" value="Poster">
                </div>
            </form>
        </div>
        <hr>
        <div class="mes_produits">
            <h2>Mes produits en vente</h2>
            <div class="produits_en_vente">
                <div>
                    <div class="produit_en_vente">
                    </div>
                    <p>Produit2</p>
                </div>
                <div>
                    <div class="produit_en_vente">
                    </div>
                    <p>Produit2</p>
                </div>
                                <div>
                    <div class="produit_en_vente">
                    </div>
                    <p>Produit3</p>
                </div>
            </div>
        </div>
    </div>
</template>

<style scoped>
    h3{
        text-align: center;
        color: rgb(67, 186, 67);
        margin: 20px 0;
    }
    #bouton{
        background-color: #4D74FF;
        color: white;
        border-radius: 50px;
        border: none;
        margin-right: auto;
        margin-left:auto;
        margin-top:20px;
        margin-bottom:20px;
    }
    #bouton:hover{
        background-color: #416aff;
    }
    #bouton:active{
        background-color: #416aff;
        box-shadow: inset 20px 20px 60px #375ad9, 
            inset -20px -20px 60px #4b7aff;
    }
    select{
        border: none;
        height: 25px;
        width: 250px;
    }
    .nouveau_produit{
        margin: 30px auto;
        width: 520px;
        background-color: #ECF0F3;
        border-radius: 10px;
        box-shadow: 10px 10px 20px 0px #cdd3dd;
        padding: 10px;
    }
    .mes_produits{
        margin-left: auto;
        margin-right: auto;
        width: 520px;
        height: 310px;
        margin-bottom: 2em;
        margin-top: 2em;
        background-color: #ECF0F3;
        border-radius: 10px;
        box-shadow: 10px 10px 20px 0px #cdd3dd;
        padding: 10px;
    }
    h2{
        text-align: center;
        margin: 15px 0;
    }
    .bottom{
        margin-left: auto;
        margin-right: auto;
        width: max-content;
    }
    .field_catégorie, .field_couleur, .field_prix, .field_quantité, .field_photo, .field_description{
        margin-bottom: .9em;
        margin-top: .2em;
    }
    .produits_en_vente{
        display: flex;
        flex-direction: row;
    }
    .produit_en_vente{
        display: flex;
        height: 150px;
        width: 150px;
        border: 1px solid gray;
        margin: auto 10px;
        background: white;
    }
    .produits_en_vente p{
        text-align: center;
        font-weight: bold;
    }
    input{
        background-color: white;
        border: none;
        border-bottom: 1px solid black;
        margin-left: auto;
        margin-right: auto;
        margin-bottom: .5em;
        height: 25px;
        width: 250px;
    }
    hr{
        width: 520px;
        margin: 0 auto;
    }
</style>

<script>
module.exports = {
        data () {
            return {
                types: [],
                type: 0,
                couleurs: [],
                couleur: 0,
                titre: "",
                description: "",
                success: false
            }
        },
        async created(){
            const result = await axios.get('/api/types')
            this.types = result.data

            const result2 = await axios.get('/api/couleurs')
            this.couleurs = result2.data
        },
        methods: {
            processFile(e) {
                console.log(e.target.files[0])
            },
            async addTshirt(){
                await axios.post('/api/tshirt', {
                    description: this.description,
                    titre: this.titre,
                    id_type: this.type,
                    couleurs: [this.couleur]
                })
                this.success = true;
            }
        }
    }
</script>
