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

        <q-toolbar-title> Admin </q-toolbar-title>

        <div>FONDO NACIONAL DE INVERSION PRODUCTIVA Y SOCIAL</div>
      </q-toolbar>
    </q-header>

    <q-drawer v-model="leftDrawerOpen" show-if-above bordered>
      <q-list>
        <q-item-label header> FPS-LAPAZ </q-item-label>

        <q-item clickable v-ripple to="/" exact>
          <q-item-section avatar>
            <q-icon color="teal" name="home" />
          </q-item-section>

          <q-item-section>Home</q-item-section>
        </q-item>

        <q-item clickable v-ripple to="Login" exact>
          <q-item-section avatar>
            <q-icon color="teal" name="login" />
          </q-item-section>

          <q-item-section>Login</q-item-section>
        </q-item> 

        <q-item clickable v-ripple to="Empresa" exact>
          <q-item-section avatar>
            <q-icon color="teal" name="store" />
          </q-item-section>

          <q-item-section>Empresas</q-item-section>
        </q-item>
        <q-item clickable v-ripple to="Sociedad" exact>
          <q-item-section avatar>
            <q-icon color="teal" name="apartment" />
          </q-item-section>

          <q-item-section>Asociaciones Accidentales</q-item-section>
        </q-item>
        <q-item clickable v-ripple to="Consultor" exact>
          <q-item-section avatar>
            <q-icon color="teal" name="person" />
          </q-item-section>

          <q-item-section>Consultores</q-item-section>
        </q-item>
        <q-item clickable v-ripple to="Proyecto" exact>
          <q-item-section avatar>
            <q-icon color="teal" name="mode" />
          </q-item-section>

          <q-item-section>Proyectos</q-item-section>
        </q-item>
        <q-item clickable v-ripple to="Detalle" exact>
          <q-item-section avatar>
            <q-icon color="teal" name="details" />
          </q-item-section>
          <q-item-section>Detalle</q-item-section>
        </q-item>
        <q-item clickable v-ripple to="Registrar" exact>
          <q-item-section avatar>
            <q-icon color="teal" name="today" />
          </q-item-section>
          <q-item-section>Registrar</q-item-section>
        </q-item>
        <q-item clickable v-ripple @click="logout">
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
export default {
  data(){
    return {
      leftDrawerOpen:false
    }
  },
  methods:{
    toggleLeftDrawer () {
        this.leftDrawerOpen = !this.leftDrawerOpen
      },
    logout(){
      this.$store.dispatch('login/logout')
        .then(() => {
          this.$router.push('/login')
        })
    }
  }
}
</script>
