<template>
    <div>
        <div class="nouveau_produit">
            <h2>Ajouter un nouveau produit à la vente</h2>
            <form action="Ajouter un produit" method="post" onsubmit="return false" id="mon_form">
                <div class="ajouter_produit">
                    <div class="field_catégorie">
                        <label for="Catégorie">Catégorie</label>
                        <select id="Catégorie" name="catégorie">
                            <option value="none" selected disabled hidden>Catégorie</option>
                            <option value="col_rond">Col rond</option>
                            <option value="col_v">Col V</option>
                        </select>
                    </div>
                    <div class="field_couleur">
                        <label for="Couleur">Couleur</label>
                        <select id="Couleur" name="couleur" multiple="yes">
                            <option value="rouge">Rouge</option>
                            <option value="jaune">Jaune</option>
                            <option value="bleu">Bleu</option>
                            <option value="vert">Vert</option>
                            <option value="rouge">Blanc</option>
                            <option value="jaune">Noir</option>
                            <option value="bleu">Marron</option>
                            <option value="vert">Rose</option>
                        </select>
                    </div>
                    <div class="field_prix">
                        <label for="prix">Prix (en euros) :</label>
                        <input type="number" id="prix" name="prix" placeholder="Veuillez saisir un prix" required>

                        </select>
                    </div>
                    <div class="field_photo">
                        <label for="photo">Photo(s) :</label>
                        <input type="file" id="photo" name="photo" placeholder="Photo" accept="image/png, image/jpeg">
                    </div>
                    <div class="field_quantité">
                        <label for="quantité">Quantité disponible :</label>
                        <input type="number" id="quantité" name="quantité" placeholder="Veuillez saisir une quantité" required>
                    </div>
                    <div class="field_description">
                        <label for="description">Description :</label>
                        <input type="text" id="description" name="description" placeholder="Veuillez saisir votre description">
                    </div>
                </div>
                <div class="bottom">
                    <button id='ajouter'>Ajouter mon produit à la vente</button>
                    <button id='supprimer' onclick="supprimer_element()">Tout supprimer</button>
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
    select{
        border: none;
        height: 25px;
        width: 250px;
    }
    .field_couleur select{
        height: 60px;
    }
    .nouveau_produit{
        margin-left: auto;
        margin-right: auto;
        width: 520px;
        height: 420px;
        margin-bottom: 2em;
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
</script>
