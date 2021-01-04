<template>
    <div>
        <h2>Vous avez déjà un compte</h2>
        <div id=login>
            <form @submit.prevent="loginUser()">
                <div>
                    <label for="mail">Adresse email*</label>
                    <div class="field_mail">
                        <input id="mail" v-model="email" placeholder="email">
                    </div>
                </div>
                <div>
                    <label for="password">Mot de passe*</label>
                    <div class="field_password">
                        <input type="password" id="password" v-model="password" placeholder="Mot de passe">
                    </div>
                </div> 
                <div id="bouton_se_connecter">
                    <button type="submit">Se connecter</button>
                </div>
            </form>
        </div>
        <h2>Vous n'avez pas encore de compte</h2>
        <div id="register">
            <form @submit.prevent="createUser()">
                <div>
                    <label for="civilité">Civilité*</label>
                    <div class="select_civilité">
                        <select id="civilité" name="civilité">
                            <option value="none" selected disabled hidden>Civilité</option>
                            <option value="mme">Mme</option>
                            <option value="m">M</option>
                        </select>
                    </div>
                </div>
                <div>
                    <label for="lastname">Nom*</label>
                    <div class="field_lastname"> 
                        <input type="texte" id="lastname" v-model="text" placeholder="Nom">
                    </div>
                </div>
                <div>
                    <label for="name">Prénom*</label>
                    <div class="field_firstname"> 
                        <input type="texte" id="name" v-model="text" placeholder="Prénom">
                    </div>
                </div>
                <div>
                    <label for="mail">Email*</label>   
                        <div class="field_mail">
                            <input type="text" id="mail" v-model="email" placeholder="Email">
                        </div>
                </div>    
                <div>
                    <label for="password">Mot de passe*</label>
                    <div class="field_password"> 
                        <input type="password" id="password" v-model="password" placeholder="Mot de passe">
                    </div>
                </div>
                <div>
                    <label for="cpassword">Confirmation du mot de passe*</label>
                    <div class="field_cpassword">
                        <input type="password" id="cpassword" v-model="c_password" placeholder="Confirmation du mot de passe">
                    </div> 
                </div>
                <div id="bouton_créer">                   
                    <button type="submit">Créer un compte</button>
                </div>
            </form>
        </div>
        <main>
            <router-view>
                :prop="prop"
                @recup-emit="RecupEmit"
            </router-view>
        </main>
    </div>
</template>

<style scoped>
    #register, #login{
        margin :auto;
        width: max-content;
        margin-top: 2em;
        margin-bottom : 2em;
    }

    .field_mail, .field_password{
        display: block;
        margin-bottom: .9em;
        margin-top: .2em;
    }

    #bouton_se_connecter{
        margin: 0 auto;
        width: 100px;
    }

    .producteur, .acheteur{
        color: #004079;
        font-size: 14px;
        margin-bottom: .9em;
    }    

    label{
        color: #004079;
        font-size: 14px;
        margin-bottom: .9em;
    }

    #bouton_créer{
        margin: 0 auto;
        width: 150px;
    }

    h2{
        text-align: center;
        color: #004079;
    }

    .select_civilité, .field_lastname, .field_firstname, .field_mail, .field_password, .field_cpassword{
        display: block;
        margin-bottom: .9em;
        margin-top: .2em;
    }
</style>

<script>
    const Register_producteur = window.httpVueLoader('./Register_producteur.vue')
    const Register_acheteur = window.httpVueLoader('./Register_acheteur.vue')
    const routes = [
        { path: '/register_producteur', component: Register_producteur},
        { path: '/register_acheteur', component: Register_acheteur}
    ]
    const router = new VueRouter({
        routes
    })
</script>