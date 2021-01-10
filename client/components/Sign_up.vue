<template>
    <div>
        <div id="register">
            <h2>Créer votre compte</h2>
            <form @submit.prevent="createUser()">
                <div>
                    <label for="pseudo">Pseudo*</label>
                    <div class="field_pseudo"> 
                        <input type="texte" id="pseudo" v-model="pseudo" placeholder="Pseudo">
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
                    <p id="consigne">Votre mot de passe doit contenir 8 caractères, dont au moins une minuscule, une majuscule et un chiffre.</p>
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
                <div class="required">
                    <p>*Champs obligatoires</p>
                </div>
                <div id="bouton_créer">                   
                    <button type="submit">Créer un compte</button>
                </div>
            </form>
        </div>
        <div id="login">
            <h2> Vous avez déjà un compte ?<br>Connectez-vous</h2>
            <p id="se_connecter"><router-link to='/log_in'>Se connecter</router-link></p>
        </div>
    </div>
</template>

<style scoped>
    #register{
        margin: 0 auto;
        width : 230px;
        margin-bottom: 2em;
        margin-top: 5em;
    }
    #login{
        margin: 0 auto;
        width: 330px;
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
        margin-bottom: 1.5em;
    }
    button{
        background-color: grey;
        color: white;
        padding: 10px 20px;
        border-radius: 50px;
        border: none;
        margin-top: .5em;
    }
    .field_pseudo, .field_mail, .field_password, .field_cpassword{
        display: block;
        margin-bottom: .9em;
        margin-top: .2em;
    }
    #consigne{
        color: #6C6B6C;
        font-size: smaller;
        text-align: justify;
    }
    .required{
        margin-left: auto;
        margin-right: auto;
        width: 200px;
        color: #6C6B6C;
        font-size: smaller;
        text-align: justify;
        margin-bottom: .9em;
        margin-top: .2em;
    }
    #se_connecter{
        text-align: center;
    }
    input{
        background-color: white;
        border: none;
        border-bottom: 1px solid black;
        margin-left: auto;
        margin-right: auto;
        margin-bottom: .5em;
        height: 25px;
        width: 200px;
    }
</style>

<script>
    const Log_in = window.httpVueLoader('./components/Log_in.vue')
    const routes = [
        { path: '/log_in', component: Log_in, meta :{title: 'Se connecter'}},
    ]
    module.exports = {
        data () {
            return {
                pseudo: '',
                email: '',
                password: '',
                c_password: ''
            }
        },
        async mounted () {
        },
        methods: {
            async createUser() {
                if(this.c_password === this.password){
                    console.log('les password sont identiques !')
                    const res = await axios.post('/api/register', {
                        pseudo: this.pseudo,
                        email: this.email,
                        password: this.password
                    })
                    console.log("tout c'est bien passé")
                }
            }
        }
    }
</script>