<template>
    <div>
        <div id=login>
            <h2>Se connecter</h2>
            <form @submit.prevent="loginUser()">
                <div>
                    <label for="mail">Adresse email*</label>
                    <div class="field_mail">
                        <input id="mail" v-model="email" placeholder="Email">
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
        <div id="register">
            <h2>Vous n'avez pas encore de compte ?<br>Créer un compte</h2>
            <div class="sign_up">
                <p id="senregistrer"><router-link to='/sign_up'>Créer un compte</router-link></p>
            </div>
        </div>
    </div>
</template>

<style scoped>
    #login{
        margin : 0 auto;
        width: max-content;
        margin-top: 5em;
        margin-bottom : 2em;
    }
    #register{
        margin :auto;
        width: 420px;
    }
    .field_mail, .field_password{
        display: block;
        margin-bottom: .9em;
        margin-top: .2em;
    }
    #bouton_se_connecter{
        margin: 0 auto;
        width: 120px;
    }
    label{
        color: #004079;
        font-size: 14px;
        margin-bottom: .9em;
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
    #senregistrer{
        text-align: center;
    }
    .sign_up{
        color: #004079;
        font-size: 14px;
        margin-bottom: .9em;
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
    module.exports = {
        data () {
            return {
                email: '',
                password: '',
            }
        },
        async mounted () {
        },
        methods: {
            async loginUser() {
                this.$emit('login', {
                    email: this.email,
                    password: this.password
                })
            }
        }
    }
</script>