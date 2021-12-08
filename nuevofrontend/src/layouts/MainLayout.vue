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

        <div>FONDO NACIONAL DE INVERSION PUBLICA Y SOCIAL</div>
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

        <q-item clickable v-ripple to="Login">
          <q-item-section avatar>
            <q-icon color="teal" name="login" />
          </q-item-section>

          <q-item-section>Login</q-item-section>
        </q-item> 

        <q-item clickable v-ripple to="Empresa">
          <q-item-section avatar>
            <q-icon color="teal" name="store" />
          </q-item-section>

          <q-item-section>Empresas</q-item-section>
        </q-item>
        <q-item clickable v-ripple to="Sociedad">
          <q-item-section avatar>
            <q-icon color="teal" name="apartment" />
          </q-item-section>

          <q-item-section>Asociaciones Accidentales</q-item-section>
        </q-item>
        <q-item clickable v-ripple to="Consultor">
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
        <q-item clickable v-ripple to="Detalle">
          <q-item-section avatar>
            <q-icon color="teal" name="details" />
          </q-item-section>
          <q-item-section>Detalle</q-item-section>
        </q-item>
        <q-item clickable v-ripple to="Registrar">
          <q-item-section avatar>
            <q-icon color="teal" name="today" />
          </q-item-section>
          <q-item-section>Registrar</q-item-section>
        </q-item>
        <q-item clickable v-ripple >
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
import { defineComponent, ref } from "vue";

export default defineComponent({
  name: "MainLayout",

  components: {
    // EssentialLink
  },

  setup() {
    const leftDrawerOpen = ref(false);

    return {
      //  essentialLinks: linksList,
      leftDrawerOpen,
      toggleLeftDrawer() {
        leftDrawerOpen.value = !leftDrawerOpen.value;
      },
    };
  },
});
</script>
