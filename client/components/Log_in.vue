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
            <div class="sign_up">
                <router-link to='/sign_up'>Créer un compte</router-link>
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

    label{
        color: #004079;
        font-size: 14px;
        margin-bottom: .9em;
    }

    h2{
        text-align: center;
        color: #004079;
    }

    .sign_up{
        color: #004079;
        font-size: 14px;
        margin-bottom: .9em;
    }    
</style>

<script>
    const Sign_up = window.httpVueLoader('./Sign_up.vue')
    const routes = [
        { path: '/sign_up', component: Sign_up},
    ]
    const router = new VueRouter({
        routes
    })
</script>