<template>
  <q-page class="flex flex-center">
          <div>
          <div class="row">
              <img
              alt="Quasar logo"
              src="~assets/logofps.png"
              style="width: 200px; height: 200px"
            >

          </div>
          <br>
          <div>
          <q-btn
                class="q-mt-xl"
                color="primary"
                text-color="white"
                to="/Licitaciones"
                label=" Ver proyectos Licitados "
                no-caps
              />
          </div>

          </div>
       <q-footer bordered class="bg-white text-primary">
        <q-tabs no-caps active-color="primary" indicator-color="transparent" class="text-grey" >
         <h6>
          Copyright © 2022 <br> FPS - LAPAZ
         </h6>
          <div class="text-purple q-gutter-md" style="font-size: 2em">
           <q-icon round color="primary" name="facebook" ></q-icon>
          </div>
           <a href="https://www.facebook.com/fpslapaz" target="_blanck"> Ir a la pagina</a>

        </q-tabs>
      </q-footer>

  </q-page>
</template>

<script>
import { defineComponent } from 'vue';

export default defineComponent({
  name: 'PageIndex'
})
</script>
