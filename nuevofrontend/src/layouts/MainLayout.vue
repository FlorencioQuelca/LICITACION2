<template>
  <q-layout view="lHh Lpr lFf">
    <q-header elevated>
      <q-toolbar>
        <q-btn
          flat
          dense
          round
          icon="menu"
          aria-label="Menu"
          @click="toggleLeftDrawer"
        />

        <q-toolbar-title>
          {{this.$store.state.login.user.name}}

         </q-toolbar-title>

        <div>FPS</div>
      </q-toolbar>
    </q-header>

    <q-drawer v-model="leftDrawerOpen" show-if-above bordered  class="bg-grey-1">
      <q-list bordered padding class="rounded-borders text-primary">
        <q-item-label header
        class="text-grey-8">   Opciones del menu </q-item-label>

        <q-item clickable active-class="my-menu-link" to="/" exact>
          <q-item-section avatar>
            <q-icon color="teal" name="home" />
          </q-item-section>
          <q-item-section>Principal</q-item-section>
        </q-item>

           <q-item v-if="$store.state.login.licitaciones" active-class="my-menu-link" clicklable to= "/Licitaciones" exact>
          <q-item-section avatar>
            <q-icon color="teal" name="account_tree" />
          </q-item-section>
          <q-item-section>Licitaciones</q-item-section>
        </q-item>

        <q-item v-if="!$store.getters['login/isLoggedIn']"
         clickable v-ripple to="/Login" exact>
          <q-item-section avatar>
            <q-icon color="teal" name="login" />
          </q-item-section>

          <q-item-section>Login</q-item-section>
        </q-item>

        <q-item   v-if="$store.state.login.empresas"
         active-class="my-menu-link"
         clickable
          to="/Empresa" exact>
          <q-item-section avatar>
            <q-icon color="teal" name="store" />
          </q-item-section>
          <q-item-section>Empresas</q-item-section>
        </q-item>

        <q-item  v-if="$store.state.login.sociedades"
         active-class="my-menu-link"
        clickable
        exact
         to="/Sociedad"
         >
          <q-item-section avatar>
            <q-icon color="teal" name="apartment" />
          </q-item-section>
          <q-item-section>Sociedades</q-item-section>
        </q-item>

        <q-item  v-if="$store.state.login.personas"
        clickable  active-class="my-menu-link" to="/Consultor" exact>
          <q-item-section avatar>
            <q-icon color="teal" name="person" />
          </q-item-section>

          <q-item-section>Consultores</q-item-section>
        </q-item>

        <q-item   v-if="$store.state.login.proyectos"
        clickable  active-class="my-menu-link" to="/Proyecto" exact>
          <q-item-section avatar>
            <q-icon color="teal" name="mode" />
          </q-item-section>

          <q-item-section>Proyectos</q-item-section>
        </q-item>



        <q-item    v-if="$store.state.login.contratos"
         clickable   active-class="my-menu-link" to="/Contratos" exact>
          <q-item-section avatar>
            <q-icon color="teal" name="today" />
          </q-item-section>
          <q-item-section>Contratos</q-item-section>
        </q-item>

        <q-item    v-if="$store.state.login.solicitud"
         clickable   active-class="my-menu-link" to="/Solicitud" exact>
          <q-item-section avatar>
            <q-icon color="teal" name="garage" />
          </q-item-section>
          <q-item-section>Solicitud</q-item-section>
        </q-item>

        <q-item    v-if="$store.state.login.trabajos"
         clickable   active-class="my-menu-link" to="/Trabajos" exact>
          <q-item-section avatar>
            <q-icon color="teal" name="garage" />
          </q-item-section>
          <q-item-section>Trabajos</q-item-section>
        </q-item>

      <q-item    v-if="$store.state.login.visitas"
         clickable   active-class="my-menu-link" to="/Visitas" exact>
          <q-item-section avatar>
            <q-icon color="teal" name="tour" />
          </q-item-section>
          <q-item-section>Visitas</q-item-section>
        </q-item>

      <q-item    v-if="$store.state.login.visitantes"
         clickable   active-class="my-menu-link" to="/Visitantes" exact>
          <q-item-section avatar>
            <q-icon color="teal" name="badge" />
          </q-item-section>
          <q-item-section>Visitantes</q-item-section>
        </q-item>


         <q-item    v-if="$store.state.login.reportes"
         clickable   active-class="my-menu-link" to="/Reportes" exact>
          <q-item-section avatar>
            <q-icon color="teal" name="summarize" />
          </q-item-section>
          <q-item-section>Reportes</q-item-section>
        </q-item>

           <q-item   v-if="$store.state.login.usuarios"
           clickable   active-class="my-menu-link" to="/Usuarios" exact>
          <q-item-section avatar>
            <q-icon color="teal" name="today" />
          </q-item-section>
          <q-item-section>Usuarios</q-item-section>
        </q-item>

          <q-item  v-if="$store.state.login.registro"
           clickable   active-class="my-menu-link" to="/RegistroBol34" exact>
          <q-item-section avatar>
            <q-icon color="teal" name="summarize" />
          </q-item-section>
          <q-item-section>RegistroBol34</q-item-section>
        </q-item>

          <q-item  v-if="$store.state.login.reportebol34"
           clickable   active-class="my-menu-link" to="/ReporteBol34" exact>
          <q-item-section avatar>
            <q-icon color="teal" name="summarize" />
          </q-item-section>
          <q-item-section>ReporteBol34</q-item-section>
        </q-item>


        <q-item  v-if="$store.getters['login/isLoggedIn']"
         clickable  @click="logout">
          <q-item-section avatar>
            <q-icon color="teal" name="logout" />
          </q-item-section>
          <q-item-section>Salir</q-item-section>
        </q-item>
      </q-list>
    </q-drawer>

    <q-page-container>
      <router-view />
    </q-page-container>
  </q-layout>
</template>

<script>
import { defineComponent, ref } from 'vue'
export default defineComponent({
  name: 'MainLayout',
  components: {
    // EssentialLink
  },
  setup () {
    const leftDrawerOpen = ref(false)
    return {
      // essentialLinks: linksList,
      leftDrawerOpen,
      toggleLeftDrawer () {
        leftDrawerOpen.value = !leftDrawerOpen.value
      }
    }
  },
  methods:{
    logout(){
      this.$q.loading.show()
      this.$store.dispatch('login/logout')
        .then(() => {
          this.$q.loading.hide()
          this.$router.push('/login')
        })
    }
  },
  mounted() {
    // console.log(this.$store.state.login.user.name)
  }
})
</script>
<style lang="sass">
.my-menu-link
  color: blue
  background: #F2C037
</style>
