<template>
   <div>
<q-card >
      <q-card-section style="margin-top: 0px">
         <div class="text-subtitle2">SEGUIMIENTO: {{data.seguimiento}} </div>
         <div class="text-subtitle2">fecha de Ingreso: {{data.fechaini}} </div>
         <!--<div class="text-subtitle2">  {{data.car.tipo}}  Placa: {{data.car.placa}} - {{data.car.marca}} -{{data.car.modelo}} </div>
        -->
      </q-card-section>
    </q-card>

   <q-btn @click="alert=true" color="red" icon="add" label="nuevo actividad" class="full-width" />
   <div class="cols-12" v-for="(row, index) in data.trabajos" :key="index">

   <q-card flat bordered class="my-card bg-grey-1">
      <q-card-section>
        <div class="row items-center no-wrap">
          <div class="col">
            <div class="text-subtitle2">{{row.nombre}}</div>
          </div>
          <div class="col-auto">
            <q-btn color="grey-7" round flat icon="more_vert">
              <q-menu cover auto-close>
                <q-list>
                  <q-item clickable>
                    <q-item-section>EDITAR</q-item-section>
                  </q-item>
                  <q-item clickable>
                    <q-item-section>ELIMINAR</q-item-section>
                  </q-item>
                </q-list>
              </q-menu>
            </q-btn>
          </div>
        </div>
      </q-card-section>

      <q-card-section>
       {{row.descripcion}}
      </q-card-section>

      <q-separator />

      <q-card-actions>
        <q-btn flat>ADD FOTOS</q-btn>
        <q-btn flat>VER FOTOS</q-btn>
      </q-card-actions>
    </q-card>
   </div>






    <!--          ADICIONAR NUEVO item  -->
   <q-dialog v-model="alert">
      <q-card style="max-width: 110%; width: 100%">

        <q-card-section class="bg-green-14 text-white">
          <div class="text-h6"><q-icon name="add_circle" /> Nueva Actividad</div>
        </q-card-section>
        <q-card-section class="q-pt-xs">
          <q-form @submit="onSubmit" @reset="onReset" class="q-gutter-md">
                 <div class="row">
              <div class="col-12">
            <q-input
              outlined
              v-model="dato.nombre"
              type="text"
              label="Nombre de Trabajo(s)"
              lazy-rules
              :rules="[(val) => (val && val.length > 0) || 'Favor ingresa datos']"
            />
             <q-input
                  outlined
                  type="textarea"
                  v-model="dato.descripcion"
                   label="Descripcion"
                />
                </div>
             </div>
            <div>
              <q-btn label="Crear " type="submit" color="positive" icon="add_circle" />
              <q-btn label="Cancelar" icon="delete" color="negative" v-close-popup />
            </div>
          </q-form>
        </q-card-section>
      </q-card>
    </q-dialog>

    <q-dialog v-model="upload">
      <q-card style="max-width: 110%; width: 100%">

        <q-card-section class="bg-green-14 text-white">
          <div class="text-h6"><q-icon name="add_circle" /> CARGAR IMAGENES</div>
        </q-card-section>
        <q-card-section class="q-pt-xs">
          <q-form @submit="onSubmit" @reset="onReset" class="q-gutter-md">
                 <div class="row">
              <div class="col-12">
            <q-input
              outlined
              v-model="dato.nombre"
              type="text"
              label="Nombre de Trabajo(s)"
              lazy-rules
              :rules="[(val) => (val && val.length > 0) || 'Favor ingresa datos']"
            />
             <q-input
                  outlined
                  type="textarea"
                  v-model="dato.descripcion"
                   label="Descripcion"
                />
                </div>
             </div>
            <div>
              <q-btn label="Crear " type="submit" color="positive" icon="add_circle" />
              <q-btn label="Cancelar" icon="delete" color="negative" v-close-popup />
            </div>
          </q-form>
        </q-card-section>
      </q-card>
    </q-dialog>

   </div>

</template>

<script>
export default {
    data: () => ({
      data: {},
      dato:{},
      trabajos:[],
      alert:false,
      upload:false,

   }),
   created() {},
  mounted() {
    this.misdatos();
  },
  methods: {
    misdatos() {
      this.$q.loading.show();
      this.$api.get(process.env.API + "/solicitudid/" + this.$route.params.id)
        .then((res) => {
          this.data = res.data[0];
        console.log(res.data)
          this.$q.loading.hide();
        });
    },
    onSubmit(){
      this.$q.loading.show();
      console.log(this.dato);
       this.dato.status = 'activo';
       this.dato.solicitud_id=this.$route.params.id
      this.$api.post(process.env.API+"/Trabajos/", this.dato).then((res) => {

         if(res.data.res===true)
          {
            this.$q.notify({
            color: "green-4",
            textColor: "white",
            icon: "cloud_done",
            message: "Creado Correctamente",
          });
          }else{
              his.$q.notify({
            color: "red-4",
            textColor: "white",
            icon: "cloud_done",
            message: "Error al crear verifique su internet",
          });

          }
            this.$q.loading.hide();

         this.alert= false;
          this.misdatos();
          this.onReset();
        }).catch((e)=>{
          this.$q.loading.hide();
        });

    },
    onReset(){
      this.dato.descripcion = null;
      this.dato.nombre = null;
      this.dato.status = 'activo';
    },

  },
}
</script>

<style>

</style>
