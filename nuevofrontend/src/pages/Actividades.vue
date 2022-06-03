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

   <q-btn @click="veralert" color="red" icon="add" label="nuevo actividad" class="full-width" />
   <div class="cols-12" v-for="(row, index) in data.trabajos" :key="index">

   <q-card flat bordered class="my-card bg-grey-1">

      <q-card-section>
        <div class="row items-center no-wrap">
          <div class="col">
            <div class="text-subtitle2">{{row.nombre}}</div>
             <div class="text-subtitle2"> Mantenimiento Aprox: Bs. {{row.costo}}</div>
             <div >  {{row.descripcion}}</div>

          </div>
          <div class="col-auto">
            <q-btn color="grey-7" round flat icon="more_vert">
              <q-menu cover auto-close>
                <q-list>
                  <q-item clickable @click="editRow(row)" exact>
                    <q-item-section  >EDITAR</q-item-section>
                  </q-item>
                  <q-item clickable @click="deleteRow(row)" exact>
                    <q-item-section>ELIMINAR</q-item-section>
                  </q-item>
                  <q-item clickable exact >
                    <q-item-section>CERRAR</q-item-section>
                  </q-item>
                </q-list>
              </q-menu>
            </q-btn>
          </div>
        </div>
      </q-card-section>

      <div v-if="row.repuesto!=null">
        <q-card-section style="margin-top: -30px">
       <div class="row items-center no-wrap">
          <div class="col">
             <div class="text-subtitle2">Repuestos: {{row.repuesto}}</div>
          </div>
       </div>
       </q-card-section>
      </div>

      <div v-if="row.factura!=null">
        <q-card-section style="margin-top: -30px">
       <div class="row items-center no-wrap">
          <div class="col">
             <div class="text-subtitle2">factura: {{row.factura}}</div>
             <div class="text-subtitle2"> Total Aprox: Bs. {{row.total}}</div>
          </div>
       </div>
       </q-card-section>
      </div>
      <q-separator />
      <q-card-actions>
        <q-btn   color="primary" @click="add_photo(row)" >ADD FOTOS</q-btn>
        <q-btn   color="secondary" @click="ver_photos(row)">VER FOTOS</q-btn>
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
              dense

              v-model="dato.nombre"
              type="text"
              label="Nombre de Trabajo(s)"

              lazy-rules
              :rules="[(val) => (val && val.length > 0) || 'Favor ingresa datos']"
            />
             <q-input
                  outlined
                  dense
                  type="textarea"
                  v-model="dato.descripcion"
                   label="breve descripcion"
                />
                 <q-input
              outlined
              dense
              v-model="dato.costo"
             type="number"
              step =0.01
              label="Costo Aproximado del mantenimiento"
              lazy-rules
              :rules="[(val) => (val>0 ) || 'Favor ingresa datos']"
            />

                <q-toggle style="margin-top: -30px"
                :label="`Tiene repuesto ? = ${repuesto}`"
                v-model="repuesto"
              />
               <q-input v-if="repuesto==true" style="margin-top: -10px"
              outlined
              dense
              v-model="dato.repuesto"
              type="text"
              label="Nombre(s) de los repuestos"
              lazy-rules
              :rules="[(val) => (val && val.length > 0) || 'Favor ingresa datos']"
            />
              <q-toggle style="margin-top: -30px"
                :label="`Tiene factura ? = ${factura}`"
                v-model="factura"
              />
               <q-input v-if="factura==true" style="margin-top: -10px"
              outlined
              dense
              v-model="dato.factura"
              type="text"
              label="Numero de factura"
              lazy-rules
              :rules="[(val) => (val && val.length > 0) || 'Favor ingresa datos']"
            />
             <q-input v-if="factura==true" style="margin-top: -10px"
              outlined
              dense
              v-model="dato.total"
              type="number"
              step =0.01
              label="costo total de la factura"
              lazy-rules
              :rules="[(val) => (val> 0) || 'Favor ingresa datos']"
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




    <!--          EDITAR  item  -->
   <q-dialog v-model="dialog_mod">
      <q-card style="max-width: 100%; width: 100%">

        <q-card-section class="bg-green-14 text-white">
          <div class="text-h6"><q-icon name="edit" /> Editar</div>
        </q-card-section>
        <q-card-section class="q-pt-xs">
          <q-form @submit="onMod"  class="q-gutter-md">
                 <div class="row">
              <div class="col-12">
            <q-input
              outlined
              dense
              v-model="dato2.nombre"
              type="text"
              label="Nombre de Trabajo(s)"
              lazy-rules
              :rules="[(val) => (val && val.length > 0) || 'Favor ingresa datos']"
            />
             <q-input
                  outlined
                  dense
                  type="textarea"
                  v-model="dato2.descripcion"
                   label="breve descripcion"
                />
                 <q-input
              outlined
              dense
              v-model="dato2.costo"
              type="number"
              label="Costo Aproximado del mantenimiento"
              lazy-rules
              :rules="[(val) => (val>0) || 'Favor ingresa datos']"
            />

                <q-toggle style="margin-top: -30px"
                :label="`Tiene repuesto ? = ${repuesto}`"
                v-model="repuesto"
              />
               <q-input v-if="repuesto==true" style="margin-top: -10px"
              outlined
              dense
              v-model="dato2.repuesto"
              type="text"
              label="Nombre(s) de los repuestos"
              lazy-rules
              :rules="[(val) => (val && val.length > 0) || 'Favor ingresa datos']"
            />
              <q-toggle style="margin-top: -30px"
                :label="`Tiene factura ? = ${factura}`"
                v-model="factura"
              />
               <q-input v-if="factura==true" style="margin-top: -10px"
              outlined
              dense
              v-model="dato2.factura"
              type="text"
              label="Numero de factura"
              lazy-rules
              :rules="[(val) => (val && val.length > 0) || 'Favor ingresa datos']"
            />
             <q-input v-if="factura==true" style="margin-top: -10px"
              outlined
              dense
              v-model="dato2.total"
              type="number"
              step =0.01
              label="costo total de la factura"
              lazy-rules
              :rules="[(val) => (val>0) || 'Favor ingresa datos']"
            />

                </div>
             </div>
            <div>
              <q-btn label="EDIT" type="submit" color="positive" icon="add_circle" />
              <q-btn label="Cancel" icon="delete" color="negative" v-close-popup />
            </div>
          </q-form>
        </q-card-section>
      </q-card>
    </q-dialog>

    <!--          ELIMINAR REGISTRO -->
      <q-dialog v-model="dialog_del">
      <q-card>
        <q-card-section class="row items-center">
          <q-avatar icon="clear" color="red" text-color="white" />
          <span class="q-ml-sm">Seguro de eliminar Registro.</span>
        </q-card-section>

        <q-card-actions align="right">
          <q-btn flat label="Eliminar" color="deep-orange" @click="onDel" />
          <q-btn flat label="Cancelar" color="primary" v-close-popup />
        </q-card-actions>
      </q-card>
    </q-dialog>
   <!--          dialog photo upload -->
      <q-dialog v-model="dialog_photo">
      <q-card style="max-width: 100%; width: 100%">

        <q-card-section class="bg-green-14 text-white">
          <div class="text-h6"><q-icon name="upload" /> Subir Imagenes</div>
        </q-card-section>



              <q-uploader
                      :factory="uploadFile"
                      label="Subir Imagen(es)"
                      multiple
                      class="full-width"
                      accept=".jpg,.png,.jpeg, image/*"
                      max-file="15"

                    />
           <q-card-section class="bg-green-14 text-white">
         </q-card-section>


      </q-card>
    </q-dialog>


   <!--          lista de imagenes -->
      <q-dialog v-model="dialog_ver_photos">
      <q-card style="max-width: 100%; width: 100%">

        <q-card-section class="bg-green-14 text-white">
          <div class="text-h6">Lista de imagenes </div>
        </q-card-section>
              <q-carousel
                animated
                v-model="slide"
                arrows
                navigation
                infinite
              >
                <q-carousel-slide
                :name="index"
                v-for="(row,index) in dato2"
                :key="index"
                :img-src="url+'/../imagenes/'+row.url">
                    <q-btn
                      icon="delete"  round color="deep-orange" @click="delete_photo(row)"
                    />
                </q-carousel-slide>
                </q-carousel>
           <q-card-section class="bg-green-14 text-white">
              <q-btn label="Cancelar" color="red" v-close-popup />
         </q-card-section>
      </q-card>
    </q-dialog>
  <!--          ELIMINAR REGISTRO -->
      <q-dialog v-model="dialog_del_photo">
      <q-card>
        <q-card-section class="row items-center">
          <q-avatar icon="clear" color="red" text-color="white" />
          <span class="q-ml-sm">Seguro de eliminar ? :( </span>
        </q-card-section>

        <q-card-actions align="right">
          <q-btn flat label="Eliminar" color="deep-orange" @click="onDel_photo" />
          <q-btn flat label="Cancelar" color="primary" v-close-popup />
        </q-card-actions>
      </q-card>
    </q-dialog>

   </div>

</template>

<script>
export default {
    data: () => ({
      url:process.env.API,
      data: {},
      dato:{},
      dato2:{},
      dato3:{},
      trabajos:[],
      alert:false,
      dialog_mod:false,
      dialog_del:false,
      dialog_photo:false,
      dialog_ver_photos:false,
      dialog_del_photo:false,
      repuesto:false,
      factura:false,
      archivo:{},
      slide: 0,
      fullscreen: false,

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
       // console.log(res.data)
          this.$q.loading.hide();
        });
    },
    onSubmit(){
      this.$q.loading.show();
      console.log(this.dato);
       this.dato.status = 'activo';
       this.dato.solicitud_id=this.$route.params.id
       this.dato.nombre=(this.dato.nombre).toUpperCase()
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
      this.factura=false;
      this.repuesto=false;
    },
    veralert(){
      this.onReset();
      this.alert=true;
    },
    editRow(item) {
      this.dato2 = item
       if(item.repuesto!=null)
       {
         this.repuesto=true;
       }else
       {
         this.repuesto=false;
       }
       if(item.factura!=null)
       {
         this.factura=true;
       }else
       {
         this.factura=false;
       }

     // console.log(this.dato2);
     this.dialog_mod = true;
    },

    onMod() {
       this.$q.loading.show();
       this.dato2.status = 'activo';
       this.dato2.solicitud_id=this.$route.params.id
       this.dato2.nombre=(this.dato2.nombre).toUpperCase()
       this.$api.put(process.env.API+"/Trabajos/"+this.dato2.id,this.dato2).then((res) => {
          if(res.data.res===true)
          {
            this.$q.notify({
            color: "green-4",
            textColor: "white",
            icon: "cloud_done",
            message: "Modificado correctamente",
          });
          }else{

            this.$q.notify({
            color: "red-4",
            textColor: "white",
            icon: "cloud_done",
            message: "no se se pudo modificar el registro",
          });
          }
           this.$q.loading.hide();
         this.dialog_mod = false;
          this.misdatos();
        }).catch((e)=>{
          this.$q.loading.hide();
        });
    },
     deleteRow(item) {
      this.dato2 = item
     this.dialog_del = true;
    },
    onDel() {
      this.$q.loading.show();
      this.$api.delete( process.env.API+"/Trabajos/" + this.dato2.id).then((res) => {
        this.$q.notify({
         color: "green-4",
         textColor: "white",
         icon: "cloud_done",
         message: "Eliminado correctamente",
       });
        this.dialog_del = false;
        this.misdatos();
      });
    },
    add_photo(item) {
     this.dato2 = item
     this.dialog_photo = true;
    },
    uploadFile(files){
      this.$q.loading.show()
    // console.log(files);
       const fileData= new FormData()
       this.archivo.categoria=9   // categoria no definida
       this.archivo.nombre=this.dato2.nombre
      fileData.append('photo',files[0])
      fileData.append('trabajo_id',this.dato2.id)
      fileData.append('nombre',this.dato2.id)
      fileData.append('categoria_id',this.archivo.categoria)
      fileData.append('user_id',this.$store.state.login.user.id)

     this.$api.post(process.env.API+'/uploadPhotos',fileData)
      .then(res=>{
         if(res.data.res===true)
          {
            this.$q.notify({
            color: "green-4",
            textColor: "white",
            icon: "cloud_done",
            message: "insertado correctamente",
          });
          }else{

            this.$q.notify({
            color: "red-4",
            textColor: "white",
            icon: "cloud_done",
            message: "imagen no subida",
          });
          }

      })
       // console.log(res.data)
     this.misdatos()
     this.dialog_photo = false;
    },
    ver_photos(item) {
     this.dato2 = item.archivos
     //this.url=process.env.API+'/../imagenes/'+this.dato2.archivos[50].url;
     console.log(this.dato2)
     this.slide=0;
     this.url=process.env.API
     this.dialog_ver_photos = true;
    },
    refresh (item) {
        url = process.env.API+'/../imagenes/'+this.item.url;
      },
     delete_photo(item) {
       this.dato3 = item
     console.log(item);
     this.dialog_del_photo = true;
    },
    onDel_photo() {
      this.$q.loading.show();
      this.$api.delete( process.env.API+"/archivos/" + this.dato3.id).then((res) => {
               if(res.data.res===true)
          {
            this.$q.notify({
            color: "green-4",
            textColor: "white",
            icon: "cloud_done",
            message: "eliminado Correctamente",
          });
          }else{
              his.$q.notify({
            color: "red-4",
            textColor: "white",
            icon: "cloud_done",
            message: "Error al eliminar",
          });
          }
        this.dialog_ver_photos = false;
        this.dialog_del_photo = false;
        this.misdatos();

      });

    },


  },
}
</script>

<style>

</style>
