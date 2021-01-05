<template>
    <div>
        <h2>Créer votre compte</h2>
        <div id="register">
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
    </div>
</template>

<style scoped>
    #register{
        margin: 0 auto;
        width : 200px;
        margin-bottom: 2em;
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

    .field_pseudo, .field_mail, .field_password, .field_cpassword{
        display: block;
        margin-bottom: .9em;
        margin-top: .2em;
    }
</style>

<script>
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