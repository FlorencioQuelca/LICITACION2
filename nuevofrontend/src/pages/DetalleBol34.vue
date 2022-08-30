<template>
  <div class="q-pa-md">
    <q-btn
      label="Registro Bol34"
      color="secondary"
      icon="account_tree"
      @click="this.$router.push('/RegistroBol34')"
      class="q-mb-xs"
    />
    <q-card
    class="my-card text-white"
    style="background: radial-gradient(circle, #35a2ff 0%, #014a88 100%)"
    square
    flat bordered
    >
         <q-card-section >
          <div class="row ">
              <div class="q-pa-md  col-8">
                <div style="color:white; text-align:center; padding:0px; border:0px">
                    <span>DATOS GENERALES DEL PROYECTO  </span>
                </div>
                  <q-table
                    class="my-sticky-header-column-table"
                :rows="rows"
                :columns="columna"
                row-key="titulo"
                separator="cell"
                :rows-per-page-options="[0]"
                hide-bottom
              >
              </q-table>

          </div>

              <div class=" q-pa-md  col-4"  style=" display: flex; flex-direction:column;  justify-content:center">
                 <div class="row">
                      <div class="col" >
                       <q-btn icon="looks_one" label="Datos Generales" stack glossy @click="view_form1" color="purple" style="width:200px" />
                        </div>
                        <div class="col">
                         <q-linear-progress size="50px" :value="progress2" color="accent" class="q-mt-sm">
                        <div class="absolute-full flex flex-center">
                          <q-badge color="white" text-color="accent" :label="progressLabel2" />
                        </div>
                        </q-linear-progress>
                     </div>
                   </div>
                   <div class="row">
                      <div class="col">
                       <q-btn icon="looks_two" label="Criterios de Eligibilidad" stack glossy @click="view_form2" color="purple" style="width:200px; margin:10px 0px 0px 0px"/>
                        </div>
                        <div class="col">
                         <q-linear-progress size="50px" :value="progress2" color="accent" class="q-mt-sm" style="margin:20px 0px 0px 0px">
                        <div class="absolute-full flex flex-center">
                          <q-badge color="white" text-color="accent" :label="progressLabel2" />
                        </div>
                        </q-linear-progress>
                     </div>
                   </div>

                   <div class="row">
                      <div class="col">
                       <q-btn icon="looks_3" label="Requisitos Del proyecto" stack glossy @click="view_form3" color="purple" style="width:200px; margin:10px 0px 0px 0px" />
                        </div>
                        <div class="col">
                         <q-linear-progress size="50px" :value="progress2" color="accent" class="q-mt-sm" style="margin:20px 0px 0px 0px">
                        <div class="absolute-full flex flex-center">
                          <q-badge color="white" text-color="accent" :label="progressLabel2" />
                        </div>
                        </q-linear-progress>
                     </div>
                   </div>

<div class="row">
                      <div class="col">
                       <q-btn icon="looks_4" label="INGENIERIA DEL PROYECTO" stack glossy @click="view_form4" color="purple" style="width:200px; margin:10px 0px 0px 0px" />
                        </div>
                        <div class="col">
                         <q-linear-progress size="50px" :value="progress2" color="accent" class="q-mt-sm" style="margin:20px 0px 0px 0px">
                        <div class="absolute-full flex flex-center">
                          <q-badge color="white" text-color="accent" :label="progressLabel2" />
                        </div>
                        </q-linear-progress>
                     </div>
                   </div>

        <div class="row">
                      <div class="col">
                       <q-btn icon="looks_5" label="RESULTADOS DE EVALUACION" stack glossy @click="view_form5" color="purple" style="width:200px; margin:10px 0px 0px 0px" />
                        </div>
                        <div class="col">
                         <q-linear-progress size="50px" :value="progress2" color="accent" class="q-mt-sm" style="margin:20px 0px 0px 0px">
                        <div class="absolute-full flex flex-center">
                          <q-badge color="white" text-color="accent" :label="progressLabel2" />
                        </div>
                        </q-linear-progress>
                     </div>
                   </div>



               </div>
          </div>


        </q-card-section>
    </q-card>

      <!--          formulario 1   -->
    <q-dialog v-model="dialog_form1">
      <q-card style="max-width: 80%; width: 80%">
        <q-card-section class="bg-green-14 text-white">
          <div class="text-h6"><q-icon name="edit" /> DATOS GENERALES</div>
        </q-card-section>

        <q-card-section class="q-pt-xs">
          <q-form @submit="onMod1" class="q-gutter-md">
           <div class="row">
              <div class="col-6">

             <q-input
              outlined
              v-model="dato.nombre"
              type="text"
              label="Nombre del proyecto"
              hint="Ingresar Nombre del Proyecto"
              lazy-rules
              :rules="[(val) => (val && val.length > 0) || 'Favor ingresa datos']"
            />
             <q-input
                  outlined
                  type="text"
                  v-model="dato.codigo"
                    label="Codigo del proyecto "
                  hint="Codigo del Proyecto VIPFE"
                />
            <q-input
              outlined
              v-model="dato.cite"
              type="text"
              label="CITE carta VIPFE"
               hint="Ingresar CITE carta VIPFE"
            />
             <q-input
              outlined
              v-model="dato.interno"
              type="text"
              label="Hoja de ruta FPS"
              hint="Ingresar HOJA DE RUTA Del fps Nacional"
              lazy-rules
              :rules="[(val) => (val && val.length > 0) || 'Favor ingresa datos']"
            />

             </div>
             <div class="col-6">


            <q-select
              outlined
              v-model="departamento"
              :options="departamentos"
               disable
              label="Departamento"
              type="text"
                hint="Ingresar Departamento que corresponde"

            />
              <q-select
              outlined
              v-model="municipio"
              :options="municipios"
              label="Municipio"
              type="text"
                hint="Ingresar Municipio que corresponde"
            />
             <q-input
              outlined
              v-model="dato.monto1"
              type="number"
               step="0.01"
              label="Monto de la  Infraestructura"
              hint="Ingrese  un numero "
            />
            <q-input
              outlined
              v-model="dato.monto2"
              type="number"
               step="0.01"
              label="Monto de la Supervision"
              hint="Ingrese un numero "
            />
            <q-input
              outlined
              v-model="dato.total"
              type="number"
               step="0.01"
              label="Monto Total del Proyecto"
              hint="Ingrese el numero "
            />
            </div>
             </div>
            <div>
              <q-btn label="Crear" type="submit" color="positive" icon="add_circle" />
              <q-btn label="Cancelar" icon="delete" color="negative" v-close-popup />
            </div>
          </q-form>
        </q-card-section>
      </q-card>
    </q-dialog>

      <!--          formulario 5   -->
    <q-dialog v-model="dialog_form5">
      <q-card style="max-width: 80%; width: 80%">
        <q-card-section class="bg-green-14 text-white">
          <div class="text-h6"><q-icon name="edit" /> {{titulo}}</div>
        </q-card-section>

        <q-card-section class="q-pt-xs">
          <q-form @submit="onMod1" class="q-gutter-md">



             <q-input
              outlined
              v-model="dato.nombre"
              type="text"
              label="Nombre del proyecto"
              hint="Ingresar Nombre del Proyecto"
              lazy-rules
              :rules="[(val) => (val && val.length > 0) || 'Favor ingresa datos']"
            />
             <q-input
                  outlined
                  type="text"
                  v-model="dato.codigo"
                    label="Codigo del proyecto "
                  hint="Codigo del Proyecto VIPFE"
                />
            <q-input
              outlined
              v-model="dato.cite"
              type="text"
              label="CITE carta VIPFE"
               hint="Ingresar CITE carta VIPFE"
            />
             <q-input
              outlined
              v-model="dato.interno"
              type="text"
              label="Hoja de ruta FPS"
              hint="Ingresar HOJA DE RUTA Del fps Nacional"
              lazy-rules
              :rules="[(val) => (val && val.length > 0) || 'Favor ingresa datos']"
            />


            <div>
              <q-btn label="Crear" type="submit" color="positive" icon="add_circle" />
              <q-btn label="Cancelar" icon="delete" color="negative" v-close-popup />
            </div>
          </q-form>
        </q-card-section>
      </q-card>
    </q-dialog>

 <!--          formularios 2,3,4 de evaluacion   -->
    <q-dialog v-model="dialog_form234">
      <q-card style="max-width: 80%; width: 80%">
        <q-card-section class="bg-green-14 text-white">
          <div class="text-h6"><q-icon name="edit" /> {{titulo}}</div>
        </q-card-section>

        <q-card-section class="q-pt-xs">
               <div class="row" v-for="item in evaluaciones" :key="item.id">
                     <div class="col-6"  v-if="item.tipo===op">
                          <q-card-section>
                          <div class="text-subtitle2">{{item.nombre}} : {{item.descripcion}}</div>
                        </q-card-section>
                     </div>
                     <div class="col-1" v-if="item.tipo===op">
                      <div class="q-gutter-sm" dense>
                            <q-radio  dense v-model="c1" val="SI" label="Cumple" />
                            <q-radio dense v-model="c1" val="NO" label="NO Cumple" />
                      </div>
                     </div>
                     <div class="col-4"  v-if="item.tipo===op">
                      <q-input
                        outlined
                        v-model="dato.total"
                        type="text"
                        label="Observacion"
                        hint="Ingrese la observacion "
                      />


                     </div>
                        <div class="col-1"  v-if="item.tipo===op">
                          <q-btn
                        dense
                        round
                        flat
                        color="green"
                        @click="guardar(item)"
                        icon="save"
                      ></q-btn>
                        </div>
               </div>


        </q-card-section>
        <q-card-section class="bg-green-14 text-white">
          <div class="text-h6"> No olvide llenar cada uno de los del Proyecto </div>
        </q-card-section>
      </q-card>
    </q-dialog>

  </div>
</template>

<script>
import LoginVue from './Login.vue';


const columna = [
  {
    name: 'titulo',
    required: true,
    label: 'Titulo',
    align: 'right',
    field: 'titulo'
  },
  { name: 'descripcion',   align:'lefth', label: 'Descripcion', field: 'descripcion' },

];


export default {
  data: () => ({
    id: 145,
    data: {},
    dato2:{},
    dato:{},
    columna,
    rows:[],
    progress2:0.3,
   // progressLabel2:(progress2*100).toFixed(2)+'%'
    progressLabel2:'0.3 %',
    dialog_form1:false,
    dialog_form234:false,
    dialog_form5:false,
    categoria_municipal:"",
     departamentos:[],
      departamento:{},
      municipios:[],
      municipio:{},
      criterios:[],
      criterio:{},
      requisitos:[],
      requisito:{},
      ingenierias:[],
      ingenieria:{},
      evaluaciones:[],
      c1:"NO",
      titulo:"",
      op:"",

  }),
  created() {},
  mounted() {
    this.misdatos();
       this.misDepartamentos()
    this.misMunicipios()
     this.mis_evaluaciones()
  },
  methods: {
    misDepartamentos(){
         this.$q.loading.show();
         this.departamentos=[]
       this.$api.get(process.env.API+"/departamentos").then((res)=>{
          //console.log(res.data)
            res.data.forEach((it)=>{
              this.departamentos.push({label:it.nombre, value:it.id})
            })
          this.$q.loading.hide();
       });
       },
       misMunicipios(){
         this.$q.loading.show();
         this.municipios=[]
       this.$api.get(process.env.API+"/municipioid/"+this.$store.state.login.user.ci).then((res)=>{
     //  console.log(res.data)
            res.data.forEach((it)=>{
              this.municipios.push({ label:(it.municipio).toUpperCase(),value:it.id})
              if( (it.municipio).toUpperCase() ===this.$store.state.login.user.status){
                      this.categoria_municipal=it.municipio_codigo
              }
            })
             this.$q.loading.hide();
       });
       },
        mis_evaluaciones(){
         this.$q.loading.show();

       this.$api.get(process.env.API+"/evaluacions").then((res)=>{
          console.log(res.data);
          this.evaluaciones=res.data



             this.$q.loading.hide();
       });
       },

    misdatos() {
      this.$q.loading.show();
      this.rows=[]
      this.$api
        .get(process.env.API + "/registroid/" + this.$route.params.id)
        .then((res) => {

          this.dato=res.data[0]
          console.log(res.data);

          this.rows.push({titulo:"Nombre del Proyecto : ", descripcion: res.data[0].nombre})
          this.rows.push({titulo:"Departamento : ", descripcion: res.data[0].departamento.nombre})
          this.rows.push({titulo:"Municipio : ", descripcion: res.data[0].municipio})
          this.rows.push({titulo:"Comunidades : ", descripcion: res.data[0].comunidades})
          this.rows.push({titulo:"Cite VIFFE : ", descripcion: res.data[0].cite})
          this.rows.push({titulo:"H.R. FPS: ", descripcion: res.data[0].interno})
          this.rows.push({titulo:"Codigo : ", descripcion: res.data[0].codigo})
          this.rows.push({titulo:"Categoria Municpal : ", descripcion: res.data[0].autoridad})
          this.rows.push({titulo:"Infraestructura : ", descripcion: res.data[0].monto1})
          this.rows.push({titulo:"Supervision : ", descripcion: res.data[0].monto2})
          this.rows.push({titulo:"Total : ", descripcion: res.data[0].total})
          this.rows.push({titulo:"Fecha de Ingreso : ", descripcion: res.data[0].fecha})
          this.rows.push({titulo:"Puntaje de Evaluacion : ", descripcion: res.data[0].total})
          this.rows.push({titulo:"Cumple : ", descripcion: res.data[0].cumple})
          this.$q.loading.hide();
        });
    },
    view_form1(){
         this.municipio={}
      this.municipios.forEach(it => {
           if(it.label===this.dato.municipio){
                this.municipio={label:it.label,value:it.value}
           }
        });
      this.departamento={}
      this.departamentos.forEach(it => {
           if(it.label===this.dato.departamento.nombre){
                this.departamento={label:it.label,value:it.value}
           }
        });
     this.dialog_form1=true;
    },
    view_form2(){
 this.titulo="CRITERIOS DE ELEGIBILIDAD"
 this.op="CRITERIO"
     this.dialog_form234=true;

    },
     view_form3(){
this.titulo="REQUISITOS DEL PROYECTO"
this.op="REQUISITO"
     this.dialog_form234=true;
    },view_form4(){
this.titulo="INGENIERIA DEL PROYECTO"
this.op="INGENIERIA"
     this.dialog_form234=true;
    },view_form5(){
      this.titulo="RESULTADOS DE EVALUACION"
      this.dialog_form5=true;
    },

      onMod1() {
       this.dato.departamento_id=this.departamento.value;
       this.dato.municipio=this.municipio.label;
       this.dato.nombre=((this.dato.nombre).toUpperCase()).trim()
        this.totalmunicipios.forEach(it => {
            if((it.municipio).toUpperCase()===this.dato.municipio){
              this.dato.autoridad =it.municipio_codigo
             // console.log(this.dato.autoridad);
            }
         })

      this.$q.loading.show();
      this.$api
        .put(process.env.API + "/registros/" + this.dato.id, this.dato)
        .then((res) => {
          if (res.data.res === true) {
            this.$q.notify({
              color: "green-4",
              textColor: "white",
              icon: "cloud_done",
              message: "Modificado correctamente",
            });
          }
          this.dialog_form1 = false;
          this.misdatos();
          this.$q.loading.hide();
        });
    },
    guardar(item){
      console.log(item);
    }


  },
};
</script>
