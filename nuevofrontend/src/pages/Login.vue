<template>
  <q-page class="q-pa-md">
    <div class="row">
      <div class="col-12 col-md-2"></div>
      <div class="col-12 col-md-8">
        <q-card class="">
          <q-card-section class="bg-secondary text-white">
            <div class="text-h6">
              <q-icon name="login" />
              Ingreso al sistema
            </div>
            <div class="text-subtitle2">ingresar email y contraseña</div>
          </q-card-section>
          <q-card-section>
            <q-form
              @submit="login"
              @reset="onReset"
              class="q-gutter-md"
            >
              <q-input
                filled
                v-model="email"
                label="Ingresa tu email *"
                hint="Email de ingreso"
                lazy-rules
                :rules="[ val => val && val.length > 0 || 'Please type something']"
              />
              <q-input
                autocomplete="on"
                type="password"
                filled
                v-model="password"
                label="Password *"
                hint="Contraseña "
                lazy-rules
                :rules="[ val => val && val.length > 0 || 'Please type something']"
              />
              <div>
                <q-btn label="Ingresar" type="submit" icon="login" color="positive"/>
                <q-btn label="Reset" type="reset" icon="restart_alt" color="negative" class="q-ml-sm" />
              </div>
            </q-form>

          </q-card-section>
          <q-separator dark />
        
        </q-card>
      </div>
      <div class="col-12 col-md-2"></div>
    </div>
  </q-page>

</template>

<script>
export default {
  data(){
    return{
      email:'',
      password:''
    }
  },
  methods:{
    login(){
      this.$q.loading.show()
        this.$store.dispatch('login/login', { email:this.email, password:this.password })
          .then(() =>{
          // this.$q.loading.hide()
            this.$router.push('/')
          })
          .catch(err => {
         //   this.$q.loading.hide();
            // console.log(err)
            this.$q.notify({
              message:err,
              color:'red',
              icon:'error'
            })
          })
    },
    onReset(){
      this.email=''
      this.password=''
    }
  }
}
</script>

<style scoped>
</style>