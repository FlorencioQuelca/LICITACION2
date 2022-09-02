<template>
  <div class="q-pa-md" style="padding:10px">
    <div style="display:flex; justify-content:space-between">
    <q-btn
      label="Registro Bol34"
      color="secondary"
      icon="account_tree"
      @click="this.$router.push('/RegistroBol34')"
      class="q-mb-xs"
    />
    <q-btn
      label="Imprimir reporte"
      color="red"
      icon="print"
      class="q-mb-xs"
      @click="imprimir"
    />
    </div>
    <q-card
    class="my-card text-white"
    style="background: radial-gradient(circle, #35a2ff 0%, #014a88 100%); padding:0px"
    square
    flat bordered
    >
         <q-card-section >
          <div class="row" style="padding:0px">
              <div class="q-pa-md  col-8" style="padding:0px">
                <div  class="row"  style="padding:0px; border:0px; display:flex;" >
                      <div class=" q-pa-md  col-6" style="color:white; text-align:right; padding:0px; border:0px ">
                          <span>DATOS GENERALES DEL PROYECTO  </span>
                      </div>
                      <div class=" q-pa-md  col-6" style="display:flex; justify-content:flex-end">
                        <q-btn
                        label="Comunidades/Distritos"
                        color="red"
                        icon="print"
                        class="q-mb-xs"
                      />
                      <q-btn
                        label="EDITAR"
                        color="green"
                        icon="editt"
                        class="q-mb-xs"
                      />
                      </div>
                </div>
                  <q-table
                    class="my-sticky-header-column-table"
                :rows="rows"
                :columns="columna"
                row-key="titulo"
                separator="cell"
                :rows-per-page-options="[0]"
                hide-bottom
                dense
              >
              </q-table>

          </div>

              <div class=" q-pa-md  col-4"  style=" display: flex; flex-direction:column;  justify-content:center">
                 <div class="row" >
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
                       <q-btn icon="looks_5" label="VARIACION POSITIVA O NEGATIVA" stack glossy @click="view_form5" color="purple" style="width:200px; margin:10px 0px 0px 0px" />
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
                       <q-btn icon="looks_6" label="RESULTADOS DE EVALUACION" stack glossy @click="view_form6" color="purple" style="width:200px; margin:10px 0px 0px 0px" />
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
                       <q-btn icon="brightness_7" label="EVALUACION EN CAMPO" stack glossy @click="view_form7" color="purple" style="width:200px; margin:10px 0px 0px 0px" />
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
          <div class="text-h6"><q-icon name="edit" /> DATOS GENERALES de PROYECTO</div>
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
              <q-btn label="GUARDAR" type="submit" color="positive" icon="add_circle" />
              <q-btn label="SALIR" icon="delete" color="negative" v-close-popup />
            </div>
          </q-form>
        </q-card-section>
      </q-card>
    </q-dialog>

      <!--          formulario 6   -->
    <q-dialog v-model="dialog_form6">
      <q-card style="max-width: 80%; width: 80%">
        <q-card-section class="bg-green-14 text-white">
          <div class="text-h6"><q-icon name="edit" /> {{titulo}}</div>
        </q-card-section>

        <q-card-section class="q-pt-xs">
          <q-form @submit="onMod6" class="q-gutter-md">
           <div class="q-gutter-sm">
               <span> El proyecto Cumple con la Evaluacion ?</span>
              <q-radio v-model="dato.cumple" checked-icon="task_alt" unchecked-icon="panorama_fish_eye" val="SI" label="SI" />
              <q-radio v-model="dato.cumple" checked-icon="task_alt" unchecked-icon="panorama_fish_eye" val="NO" label="NO" />
             </div>
            <q-input
              outlined
              v-model="dato.carta_cite"
              type="text"
               label="Nombre del CITE DEL INFORME"
              hint="Ingresar el CITE DEL INFORME (sacar del SIGEC)"
            />
                  <q-input
                  outlined
                  type="date"
                  v-model="dato.carta_fecha"
                  hint="Ingresar Fecha de envio"
                />

            <q-input
              outlined
              v-model="dato.adjunto"
              type="text"
               label="Describir que se adjunta"
              hint="Ingresar datos adjuntos"
            />
             <div class="q-gutter-sm">
             <span> Dese cambiar el estado del Proyecto a ENVIADO  ?</span>
              <q-radio v-model="dato.status" checked-icon="task_alt" unchecked-icon="panorama_fish_eye" val="ENVIADO" label="SI" />
              <q-radio v-model="dato.status" checked-icon="task_alt" unchecked-icon="panorama_fish_eye" val="NO ENVIADO" label="NO" />
             </div>
            <div>
              <q-btn label="GUARDAR" type="submit" color="positive" icon="add_circle" />
              <q-btn label="SALIR" icon="delete" color="negative" v-close-popup />
            </div>
          </q-form>
        </q-card-section>
      </q-card>
    </q-dialog>

 <!--          formularios 2,3,4 de evaluacion   -->
    <q-dialog v-model="dialog_form2345" persistent>
      <q-card style="max-width: 80%; width: 80%">
        <q-card-section class="bg-green-14 text-white">
          <div style="display: flex; justify-content:space-between ">
          <div class="text-h6"><q-icon name="edit" /> {{titulo}}</div>
          <q-btn label="SALIR" @click="refrescar" color="blue" icon="close" />
          </div>
        </q-card-section>

        <q-card-section class="q-pt-xs">
               <div class="row" v-for="item in evaluaciones" :key="item.id"  style="margin:0;padding:0 ">
                     <div class="col-6"  v-if="item.tipo===op">
                          <q-card-section style="background-color:#F2F3F4">
                          <div class="text-subtitle2">{{item.nombre}} : {{item.descripcion}}</div>
                        </q-card-section>
                     </div>
                     <div class="col-1" v-if="item.tipo===op"   >
                      <div class="q-gutter-sm" dense>
                            <q-radio v-if="item.tipo!='VARIACION'" dense v-model="item.valor" val="SI" label="Cumple" />
                            <q-radio v-if="item.tipo!='VARIACION'" dense v-model="item.valor" val="NO" label="NO Cumple" />
                            <q-radio  v-if="item.tipo==='VARIACION'" dense v-model="item.valor" val="SI" label="SI" />
                            <q-radio  v-if="item.tipo==='VARIACION'" dense v-model="item.valor" val="NO" label="NO" />
                      </div>
                     </div>
                     <div class="col-4"  v-if="item.tipo===op">
                      <q-input
                        outlined
                        v-model="item.descripcion1"
                        type="textarea"
                        label="Observacion"
                        hint="Ingrese la observacion"
                      />
                     </div>
                        <div class="col-1"  v-if="item.tipo===op">
                          <q-btn v-if="item.puntaje==='1.00'"
                        dense
                        round
                        flat
                        color="green"
                        @click="guardar(item)"
                        icon="save"
                      ></q-btn>

                          <q-btn v-else
                        dense
                        round
                        flat
                        color="blue"
                        @click="editar(item)"
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

     <!--          formulario 7  -->
    <q-dialog v-model="dialog_form7">
      <q-card style="max-width: 80%; width: 80%">
        <q-card-section class="bg-green-14 text-white">
          <div class="text-h6"><q-icon name="edit" /> {{titulo}}</div>
        </q-card-section>

        <q-card-section class="q-pt-xs">
          <q-form @submit="onMod7" class="q-gutter-md">
               <div class="q-gutter-sm">
               <span> Realizo la Inspeccion ?</span>
              <q-radio v-model="dato.vinculo" checked-icon="task_alt" unchecked-icon="panorama_fish_eye" val="SI" label="SI" />
              <q-radio v-model="dato.vinculo" checked-icon="task_alt" unchecked-icon="panorama_fish_eye" val="NO" label="NO" />
             </div>
            <q-input
              outlined
              v-model="fecha_inspeccion"
              type="date"
              label="Describir la fecha de inspeccion"
              hint="Ingresar observaciones"
            />
            <div>
              <q-btn label="GUARDAR" type="submit" color="positive" icon="add_circle" />
              <q-btn label="SALIR" icon="delete" color="negative" v-close-popup />
            </div>
          </q-form>
        </q-card-section>
      </q-card>
    </q-dialog>

  </div>
</template>

<script>
import {jsPDF} from "jspdf";
import moment, { now } from 'moment';
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
    dialog_form2345:false,
    dialog_form6:false,
    dialog_form7:false,
    fecha_inspeccion:moment().format('YYYY-MM-DD'),
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
      totalmunicipios:[],
      resultado:{},
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
      this.totalmunicipios=res.data
            res.data.forEach((it)=>{
              this.municipios.push({ label:(it.municipio).toUpperCase(),value:it.id})

            })
             this.$q.loading.hide();
       });
       },
        mis_evaluaciones(){
         this.$q.loading.show();

       this.$api.get(process.env.API+"/evaluacions").then((res)=>{
       //  console.log(res.data);
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
     //     console.log(res.data);
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
          //this.rows.push({titulo:"Puntaje de Evaluacion : ", descripcion: res.data[0].total})
          this.rows.push({titulo:"Proyecto Cumple/ Es elegible : ", descripcion: res.data[0].cumple})
          this.rows.push({titulo:"Se realizo la Inspecion : ", descripcion: res.data[0].vinculo})
          this.rows.push({titulo:"fecha de inspeccion : ", descripcion: res.data[0].copia})
          this.rows.push({titulo:"Fecha de Envio de Informe : ", descripcion: res.data[0].carta_fecha})
          this.rows.push({titulo:"Proyecto Contempla: ", descripcion: res.data[0].adjunto})
          this.rows.push({titulo:"Estado del Proyecto : ", descripcion: res.data[0].status})
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

                 this.dato.evaluacions.forEach(it => {
                         if(it.nombre==="C-1"){
                           this.evaluaciones[0].descripcion1=it.pivot.descripcion
                           this.evaluaciones[0].valor=it.pivot.presenta
                           this.evaluaciones[0].puntaje=it.pivot.puntaje
                         }
                          if(it.nombre==="C-2"){
                           this.evaluaciones[1].descripcion1=it.pivot.descripcion
                           this.evaluaciones[1].valor=it.pivot.presenta
                           this.evaluaciones[1].puntaje=it.pivot.puntaje
                         }
                          if(it.nombre==="C-3"){
                           this.evaluaciones[2].descripcion1=it.pivot.descripcion
                           this.evaluaciones[2].valor=it.pivot.presenta
                           this.evaluaciones[2].puntaje=it.pivot.puntaje
                         }
                 })

       this.dialog_form2345=true;
    },
     view_form3(){
          this.titulo="REQUISITOS DEL PROYECTO"
          this.op="REQUISITO"
           this.dato.evaluacions.forEach(it => {
                         if(it.nombre==="R-1"){
                           this.evaluaciones[3].descripcion1=it.pivot.descripcion
                           this.evaluaciones[3].valor=it.pivot.presenta
                           this.evaluaciones[3].puntaje=it.pivot.puntaje

                         }

                          if(it.nombre==="R-2"){
                           this.evaluaciones[4].descripcion1=it.pivot.descripcion
                           this.evaluaciones[4].valor=it.pivot.presenta
                           this.evaluaciones[4].puntaje=it.pivot.puntaje
                         }
                          if(it.nombre==="R-3"){
                           this.evaluaciones[5].descripcion1=it.pivot.descripcion
                           this.evaluaciones[5].valor=it.pivot.presenta
                           this.evaluaciones[5].puntaje=it.pivot.puntaje
                         }
                          if(it.nombre==="R-4"){
                           this.evaluaciones[6].descripcion1=it.pivot.descripcion
                           this.evaluaciones[6].valor=it.pivot.presenta
                           this.evaluaciones[6].puntaje=it.pivot.puntaje
                         }
                          if(it.nombre==="R-5"){
                           this.evaluaciones[7].descripcion1=it.pivot.descripcion
                           this.evaluaciones[7].valor=it.pivot.presenta
                           this.evaluaciones[7].puntaje=it.pivot.puntaje
                         }
                          if(it.nombre==="R-6"){
                           this.evaluaciones[8].descripcion1=it.pivot.descripcion
                           this.evaluaciones[8].valor=it.pivot.presenta
                           this.evaluaciones[8].puntaje=it.pivot.puntaje
                         }
                          if(it.nombre==="R-7"){
                           this.evaluaciones[9].descripcion1=it.pivot.descripcion
                           this.evaluaciones[9].valor=it.pivot.presenta
                           this.evaluaciones[9].puntaje=it.pivot.puntaje
                         }

                 })
     this.dialog_form2345=true;
    },
    view_form4(){
            this.titulo="INGENIERIA DEL PROYECTO"
            this.op="INGENIERIA"
              this.dato.evaluacions.forEach(it => {
                         if(it.nombre==="I-1"){
                           this.evaluaciones[10].descripcion1=it.pivot.descripcion
                           this.evaluaciones[10].valor=it.pivot.presenta
                           this.evaluaciones[10].puntaje=it.pivot.puntaje
                         }

                          if(it.nombre==="I-2"){
                           this.evaluaciones[11].descripcion1=it.pivot.descripcion
                           this.evaluaciones[11].valor=it.pivot.presenta
                           this.evaluaciones[11].puntaje=it.pivot.puntaje
                         }
                          if(it.nombre==="I-3"){
                           this.evaluaciones[12].descripcion1=it.pivot.descripcion
                           this.evaluaciones[12].valor=it.pivot.presenta
                           this.evaluaciones[12].puntaje=it.pivot.puntaje
                         }
                         if(it.nombre==="I-4"){
                           this.evaluaciones[13].descripcion1=it.pivot.descripcion
                           this.evaluaciones[13].valor=it.pivot.presenta
                           this.evaluaciones[12].puntaje=it.pivot.puntaje
                         }

                          if(it.nombre==="I-5"){
                           this.evaluaciones[14].descripcion1=it.pivot.descripcion
                           this.evaluaciones[14].valor=it.pivot.presenta
                           this.evaluaciones[14].puntaje=it.pivot.puntaje
                         }
                          if(it.nombre==="I-6"){
                           this.evaluaciones[15].descripcion1=it.pivot.descripcion
                           this.evaluaciones[15].valor=it.pivot.presenta
                           this.evaluaciones[15].puntaje=it.pivot.puntaje
                         }
                         if(it.nombre==="I-7"){
                           this.evaluaciones[16].descripcion1=it.pivot.descripcion
                           this.evaluaciones[16].valor=it.pivot.presenta
                           this.evaluaciones[16].puntaje=it.pivot.puntaje
                         }

                          if(it.nombre==="I-8"){
                           this.evaluaciones[17].descripcion1=it.pivot.descripcion
                           this.evaluaciones[17].valor=it.pivot.presenta
                           this.evaluaciones[17].puntaje=it.pivot.puntaje
                         }
                          if(it.nombre==="I-9"){
                           this.evaluaciones[18].descripcion1=it.pivot.descripcion
                           this.evaluaciones[18].valor=it.pivot.presenta
                           this.evaluaciones[18].puntaje=it.pivot.puntaje
                         }
                          if(it.nombre==="I-10"){
                           this.evaluaciones[19].descripcion1=it.pivot.descripcion
                           this.evaluaciones[19].valor=it.pivot.presenta
                           this.evaluaciones[19].puntaje=it.pivot.puntaje
                         }
                 })


            this.dialog_form2345=true;
    },
    view_form5(){
      this.titulo="VARIACION POSITIVA O NEGATIVA "
       this.op="VARIACION"
      this.dialog_form2345=true;
    },

      onMod1() {
       this.dato.departamento_id=this.departamento.value;
       this.dato.municipio=this.municipio.label;
       this.dato.nombre=((this.dato.nombre).toUpperCase()).trim()
        this.totalmunicipios.forEach(it => {
            if((it.municipio).toUpperCase()===this.dato.municipio){
              this.dato.autoridad =it.municipio_codigo
            }
         })
        if (this.dato.total>0) {
              this.dato.puntaje2=10
        }
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
     onMod6() {
        if(this.dato.carta_fecha!=null){
          this.dato.puntaje4=10
        }
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
          this.dialog_form6 = false;
          this.misdatos();
          this.$q.loading.hide();
        });
    },
    onMod7() {
      this.$q.loading.show();
         if(this.dato.vinculo=="SI"){
          // console.log("correcto")
              this.dato.puntaje1=50.00
         }
         if(this.fecha_inspeccion!=null){
       //    console.log("correcto2")
                 this.dato.copia=this.fecha_inspeccion
         }

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
          this.dialog_form7 = false;
          this.misdatos();
          this.$q.loading.hide();
        });
    },
    guardar(item){
      if(item.valor==null){
                this.$q.notify({
                            color: "red-4",
                            textColor: "white",
                            icon: "cloud_done",
                            message: "debe seleccionar SI 'CUMPLE' O 'NO CUMPLE'",
                          });
      }else if(item.descripcion1==null){
                this.$q.notify({
                            color: "red-4",
                            textColor: "white",
                            icon: "cloud_done",
                            message: "debe colocar una descripcion'",
                          });
      }else {
        this.resultado.presenta=item.valor;
        this.resultado.descripcion=item.descripcion1;
        this.resultado.id=item.id
        this.resultado.tipo=item.tipo;
        this.resultado.nombre=item.nombre;
        this.resultado.puntaje=2
        item.puntaje="2.00"
        this.$api.put(process.env.API + "/registroevaluacion/"+this.dato.id,this.resultado).then((res) => {
                    this.$q.notify({
                            color: "green-4",
                            textColor: "white",
                            icon: "cloud_done",
                            message: "Guardado Correctamente",
                          });
                       //   this.misdatos();
                          });
      }
    },
      editar(item){
         this.dato.evaluacions.forEach(it => {
                if(it.nombre===item.nombre){
                    this.resultado.nombre=item.nombre;
                    item.puntaje="3.00"
                    this.resultado.evaluacion_id=item.id
                    this.resultado.registro_id=it.pivot.registro_id
                    this.resultado.puntaje="3.00"
                     this.resultado.descripcion=item.descripcion1
                       this.resultado.presenta=item.valor
                    this.resultado.tipo=it.tipo;

                      this.$api.put(process.env.API+"/registroevaluacion1/"+it.pivot.id,this.resultado).then((res) => {
                          this.$q.notify({
                          color: "green-4",
                          textColor: "white",
                          icon: "cloud_done",
                          message: "Modificado correctamente",
                        });
                         // this.misdatos();

                        });

                }
         })
      },
      refrescar(){
        this.misdatos();
        this.misDepartamentos()
        this.misMunicipios()
        this.mis_evaluaciones()
        this.dato.puntaje3=Number(this.dato.puntaje3)+1
     //  console.log(this.dato.puntaje3)
        this.$api
        .put(process.env.API + "/registros/" + this.dato.id, this.dato)
        .then((res) => {
        });


        this.dialog_form2345=false;
      },
      imprimir(){

        let text1="En atencíon a nota CITE: "+this.dato.cite+", mediante la cual se solicita realizar la verificacíon y avaluación de requisitos exigidos del proyecto "+this.dato.nombre+" correspondiente al municipio de "+this.cambiarminiscula(this.dato.municipio)+" del departamento de "+this.cambiarminiscula(this.dato.departamento.nombre)+", mediante el Programa Nacional de Emergencia para la Generación de Empleo BOL34/2021; al respecto, tengo a bien informar el resultado de la evaluación y verificación del contenido del proyecto presentado.";
        let text2="Según lo establecido en el Reglamento Operativo del Programa Nacional de Emergencia para la Generación de Empleo BOL-34/2021 se menciona:";
        let text3="•    Punto 1.2. Objetivos del Programa – componente I: Infraestructura y Supervisión de Obras, mediante el cual se financiará la ejecución de Obras de Infraestructura urbana – rural y la Supervisión de las obras de las siguientes tipologías: (i) Vial (enlosetado de vías vehiculares y peatonales) …"
        let text4="•    Punto 2.3 Funciones y Responsabilidades de los Actores – inciso a.  – Ministerio de Planificación del Desarrollo (MPD); punto vi. Prioriza la ejecución de proyectos; comunicando al FPS mediante nota de atención, y envía copia de la misma a FONPLATA para su conocimiento.  y vii. Garantiza la gestión de los recursos para la ejecución de los Proyectos."
        let text5="De la revisión a la documentación concerniente a la solicitud de enlosetado y según el Reglamento Operativo del Programa Nacional de Emergencia para la Generación de Empleo BOL-34/2021. El proyecto "+this.dato.nombre+" del departamento de "+this.cambiarminiscula(this.dato.departamento.nombre)+" es elegible de acuerdo a la tipología de proyectos establecida en el ROP del Programa punto 2.4 (cuadro N°3- Proyectos Elegibles), en este sentido el mismo se desarrolla de acuerdo al siguiente detalle:"
        let c1="Debe beneficiar a la mayor cantidad de familias/juntas vecinales involucradas."
        let c2="Proyecto que atienda a infraestructuras públicas de salud, educación y/o que se complementen con otras intervenciones realizadas con anterioridad."
        let c3="El proyecto no debe encontrarse en áreas y/o zonas de riesgos naturales y geológicos que puedan comprometer a la infraestructura."
        let r1="Solicitud de financiamiento del proyecto por las Juntas Vecinales y/o GAMs y/o GAIOCs u otras organizaciones sociales debidamente constituidas y reconocidas en el ordenamiento vigente (Personería Jurídica para J.V. y/o OTBs)"
        let r2="Monto máximo por proyecto a ser financiado no podrá ser mayor a Bs 3.000.000.- (Tres Millones 00/100 bolivianos.) (De acuerdo a la convocatoria MPD)"
        let r3="Certificación escrita de existencia de servicios (agua potable, alcantarillado sanitario, etc) por las empresas proveedoras o administradoras de estos servicios. A excepción de los Municipios con categoría “A” (según ROP numeral 2.5. punto vii)."
        let r4="Acta de Consenso Social de las Organizaciones Sociales o Juntas Vecinales, para la ejecución del proyecto (De acuerdo a Usos y Costumbres)."
        let r5="Acta de compromiso para la ejecución de cordones de acera por los beneficiarios y/o municipio. Los cordones de acera deberán estar concluidos previamente al inicio del proceso de contratación del proyecto. (según ROP numeral 2.5. punto v)."
        let r6="Planimetría Aprobada por el GAM correspondiente de los lugares de intervención que permita la ejecución del proyecto donde se muestre ancho de vía y si corresponde ubicación de áreas verdes. A excepción de los municipios de categoría A. (según ROP numeral 2.5. punto iv)."
        let r7="Acta de Compromiso para firmar el Convenio CTF /CFP por las Juntas Vecinales y/o GAMs y/o GAIOCs u otras organizaciones sociales."
        let i1="Resumen Ejecutivo (Antecedentes, Justificación, Objetivos, Costo de Inversión, Ubicación Geográfica y tiempo de ejecución)"
        let i2="Diagnóstico del proyecto /Estudio Socioeconómico (Considerando el alcance del proyecto, el mismo deberá contener un diagnóstico de situación actual, área de influencia del proyecto; características físicas, condiciones socioeconómicas de los beneficiarios)"
        let i3="Localización (Croquis de Ubicación)"
        let i4="Presupuesto General"
        let i5="Precios Unitarios (Verificación de precios de los materiales acorde al lugar de intervención)"
        let i6="Cómputos Métricos"
        let i7="Cronograma de Ejecución."
        let i8="Planos Constructivos (planos de planta, detalles constructivos de las obras de arte, perfil longitudinal y transversal )"
        let i9="Especificaciones Técnicas."
        let i10="Informe Fotográfico (Que muestre las actividades a ser implementadas)"
        let c11=""
        let c11presenta=""
        let c22=""
        let c22presenta=""
        let c33=""
        let c33presenta=""
        let r11=""
        let r22=""
        let r33=""
        let r44=""
        let r55=""
        let r66=""
        let r77=""
        let i11=""
        let i22=""
        let i33=""
        let i44=""
        let i55=""
        let i66=""
        let i77=""
        let i88=""
        let i99=""
        let i100=""
        this.dato.evaluacions.forEach(it =>{
                if(it.nombre==="C-1"){
                  c11=it.pivot.descripcion
                  c11presenta=it.pivot.presenta + " CUMPLE"
                }
                if(it.nombre==="C-2"){
                  c22=it.pivot.descripcion
                  c22presenta=it.pivot.presenta + " CUMPLE"
                }
                if(it.nombre==="C-3"){
                  c33=it.pivot.descripcion
                  c33presenta=it.pivot.presenta + " CUMPLE"
                }
                if(it.nombre==="R-1"){
                  r11=it.pivot.descripcion
                }
                if(it.nombre==="R-2"){
                  r22=it.pivot.descripcion
                }
                if(it.nombre==="R-3"){
                  r33=it.pivot.descripcion
                }
                if(it.nombre==="R-4"){
                  r44=it.pivot.descripcion
                }
                if(it.nombre==="R-5"){
                  r55=it.pivot.descripcion
                }
                if(it.nombre==="R-6"){
                  r66=it.pivot.descripcion
                }
                if(it.nombre==="R-7"){
                  r77=it.pivot.descripcion
                }

                if(it.nombre==="I-1"){
                  i11=it.pivot.descripcion
                }
                if(it.nombre==="I-2"){
                  i22=it.pivot.descripcion
                }
                if(it.nombre==="I-3"){
                  i33=it.pivot.descripcion
                }
                if(it.nombre==="I-4"){
                  i44=it.pivot.descripcion
                }
                if(it.nombre==="I-5"){
                  i55=it.pivot.descripcion
                }
                if(it.nombre==="I-6"){
                  i66=it.pivot.descripcion
                }
                if(it.nombre==="I-7"){
                  i77=it.pivot.descripcion
                }
                if(it.nombre==="I-8"){
                  i88=it.pivot.descripcion
                }
                if(it.nombre==="I-9"){
                  i99=it.pivot.descripcion
                }
                if(it.nombre==="I-10"){
                  i100=it.pivot.descripcion
                }
        })

        let con1="De la revisión de la documentación concerniente a la solicitud de enlosetado del proyecto "+this.dato.nombre+" del Departamento de "+this.cambiarminiscula(this.dato.departamento.nombre)+" y según el Reglamento Operativo del Programa Nacional de Emergencia para la Generación de Empleo BOL-34/2021 se concluye:"
        let con2="1 De la solicitud del proyecto presentado por el GAM "+this.dato.nombre+" del municipio de "+this.cambiarminiscula(this.dato.municipio)+" del departamento de "+this.cambiarminiscula(this.dato.departamento.nombre)+" es elegible de acuerdo a la tipología de proyectos establecida en el ROP del Programa punto 2.4 (cuadro N°3- Proyectos Elegibles)"
        let con3=""
        let rec1=""
        if(this.dato.cumple==="SI"){
          con3="2 El proyecto "+this.dato.nombre+" del departamento de "+this.cambiarminiscula(this.dato.departamento.nombre)+" CUMPLE con los criterios de elegibilidad y requisitos establecidos en el marco del ROP del programa BOL34/2021 desarrollados en el presente informe."
          rec1="De la verificación y evaluación realizada, se determina que el proyecto "+this.dato.nombre+" correspondiente al municipio de "+this.cambiarminiscula(this.dato.municipio)+" del Departamento de "+this.cambiarminiscula(this.dato.departamento.nombre)+" presentado CUMPLE con los requisitos establecidos para su ejecución en el marco del ROP del programa BOL34/2021."
        }else{
          con3="2 El proyecto "+this.dato.nombre+" del departamento de "+this.cambiarminiscula(this.dato.departamento.nombre)+" debe ser COMPLEMENTADO Y/O AJUSTADO  de acuerdo a los criterios de elegibilidad y requisitos establecidos en el marco del ROP del programa BOL34/2021 desarrollados en el presente informe."
          rec1="De la verificación y evaluación realizada, se determina que el proyecto "+this.dato.nombre+" correspondiente al municipio de "+this.cambiarminiscula(this.dato.municipio)+" del Departamento de "+this.cambiarminiscula(this.dato.departamento.nombre)+" debe ser COMPLEMENTADO Y/O AJUSTADO de acuerdo a los requisitos establecidos en el marco del ROP del programa BOL34/2021."

        }

        let rec2="Por lo expuesto anteriormente se recomienda a Dirección General Ejecutiva del FPS poner a consideración del Ministerio de Planificación del Desarrollo (MPD) el presente informe de acuerdo al resultado de la verificación y evaluación del proyecto presentado del Departamento de "+this.cambiarminiscula(this.dato.departamento.nombre)+"."
        let rec3="Es todo cuanto podemos informar para los fines consiguientes."
        let gerente="Sergio Janco Vargas"
        let gerente1="Rosmery Julia Santalla Acarapi"
        let gerente2="Rosmery Julia Santalla Acarapi"
        let mosca= this.mosca(gerente)+"/"+this.mosca(gerente1)+"/"+this.mosca(this.$store.state.login.user.name)
        let copia="C.c. Archivo Programa Bol-34/2021"
        let adjunto="Se adjunta : "+this.dato.adjunto
        let vinculo ="VINCULO H.R. Nº "+this.dato.interno
        let informe=this.dato.carta_cite+"."

        let referencia="RESPUESTA A LA SOLICITUD DE EVALUACION Y VERIFICACION DE CONTENIDO PROYECTO: "+this.dato.nombre
        let profesional="Ing. "+this.$store.state.login.user.name


        let doc = new jsPDF('portrait' ,null, 'letter');
          let logofps = new Image();
           logofps.src = 'logofps.png';
          let chacanapiso = new Image();
           chacanapiso.src = 'chacanapiso.png';
          let chacana = new Image();
           chacana.src = 'chacana.png';
            doc.addImage(chacana, 'PNG', 25, 10, 20, 20);
            doc.addImage(logofps, 'PNG', 175, 10, 28, 20);
            doc.addImage(chacanapiso, 'PNG', 0, 184, 215, 96);
               doc.setFont('times')
             doc.setFontSize(10, 'normal')
             doc.text('ESTADO PLURINACIONAL DE BOLIVIA', 75, 20)
             doc.setFontSize(10, 'normal')
             doc.text('FONDO NACIONAL DE INVERSION PRODUCTIVA Y SOCIAL', 63, 25)
             doc.line(80,30,135,30)
             doc.setFontSize(12, 'normal')
             doc.text(informe, 78,45)
             doc.text("Ing. "+gerente, 65,55)
             doc.text("Ing. "+gerente1, 65,68)
             doc.text("Ing. "+gerente2, 65,80)
             doc.text(profesional, 65,93)
             //PIE DE PAGINA
             doc.setFontSize(8, 'normal')
              doc.text('La Paz - Bolivia Oficina Departamental La Paz Av. Camacho esq. C. Colón Edif. Krsul Piso 8',60, 262)
            doc.text('Of. 810 Telf. 2125454 - 2125482 Fax. 2110623',85, 266)
            doc.setFontSize(9, 'bold')
            doc.text('Web: www.fps.gob.bo – La Paz - Bolivia',85, 270)

             doc.setFontSize(12,"bold")
             doc.text('INFORME', 100,40)
             doc.text("INFORME", 100,40,).setFontSize(12).setFont(undefined, 'bold');
             doc.text("GERENTE DE PROGRAMAS Y PROYECTOS", 65,60)
             doc.text("GERENTE DEPARTAMENTAL DE FPS LA PAZ", 65,73)
             doc.text("JEFE DE UNIDAD TECNICA LA PAZ", 65,85)
             doc.text("PROFESIONAL TECNICO FPS", 65,98)
             doc.text("A:", 35,55)
             doc.text("Vía:", 35,68)
             doc.text("DE:", 35,93)
             doc.text("REF:", 35,105)

             doc.text(referencia, 65,105,{maxWidth: 125,align: "justify"})
             doc.text("FECHA", 35,130)
            let fecha_informe=this.dato.carta_fecha==null ?  moment().format('YYYY-MM-DD') : this.dato.carta_fecha
            let departamento=this.$store.state.login.user.status
             const fechaDeCarta= this.fechalarga(fecha_informe,departamento)
             doc.text(fechaDeCarta, 65,130)
             doc.line(30,134,190,134)

             doc.text("1. ANTECEDENTES", 35,140).setFontSize(12).setFont(undefined, 'normal');
             doc.text(text1, 30,148,{maxWidth: 160,align: "justify"}).setFontSize(12).setFont(undefined, 'bold');

             doc.text("2. DESARROLLO", 35,187).setFontSize(12).setFont(undefined, 'normal');
             doc.text(text2, 30,193,{maxWidth: 160,align: "justify"})
             doc.text(text3, 40,205,{maxWidth: 150,align: "justify"})
             doc.text(text4, 40,225,{maxWidth: 150,align: "justify"})
                    //hoja 2
            doc.addPage();
            doc.addImage(chacana, 'PNG', 25, 10, 20, 20);
            doc.addImage(logofps, 'PNG', 175, 10, 28, 20);
            doc.addImage(chacanapiso, 'PNG', 0, 184, 215, 96);
            doc.setFont('times')
            doc.setFontSize(10, 'normal')
            doc.text('ESTADO PLURINACIONAL DE BOLIVIA', 75, 20)
            doc.setFontSize(10, 'normal')
            doc.text('FONDO NACIONAL DE INVERSION PRODUCTIVA Y SOCIAL', 63, 25)
            doc.line(80,30,135,30)
            doc.setFontSize(8, 'normal')
            doc.text('La Paz - Bolivia Oficina Departamental La Paz Av. Camacho esq. C. Colón Edif. Krsul Piso 8',60, 262)
            doc.text('Of. 810 Telf. 2125454 - 2125482 Fax. 2110623',85, 266)
            doc.setFontSize(9, 'bold')
            doc.text('Web: www.fps.gob.bo – La Paz - Bolivia',85, 270)
            doc.setFontSize(12, 'bold')
              doc.text(text5, 30,40,{maxWidth: 160,align: "justify"})
                   //CUDARO  1 HOJA 2
             // doc.rect(30,75, 160,70)///70 corregir segun aldo de los datos
              doc.rect(30,75, 160,5)
              doc.rect(30,75, 80,25) // corregir 25
              doc.rect(30,75, 80,40)  //corregir 40
              doc.rect(30,75, 80,65)  //corregir 70
              doc.rect(110,75, 30,25)
              doc.rect(110,75, 30,40)
              doc.rect(110,75, 30,65)
              doc.rect(140,75, 50,25)
              doc.rect(140,75, 50,40)
              doc.rect(140,75, 50,65)
             doc.setFontSize(10, 'bold')
             doc.text('         CRITERIOS DE ELIGIBILIDAD                       Cumple/No cumple      OBSERVACIONES', 35, 79)
             doc.text(c1, 32,85,{maxWidth: 75,align: "justify"})
             doc.text(c2, 32,105,{maxWidth: 75,align: "justify"})
             doc.text(c3, 32,120,{maxWidth: 75,align: "justify"})

             doc.text(c11presenta, 112,85,{maxWidth: 30,align: "justify"})
             doc.text(c22presenta, 112,105,{maxWidth: 30,align: "justify"})
             doc.text(c33presenta, 112,120,{maxWidth: 30,align: "justify"})

             doc.text(c11, 142,85,{maxWidth: 44,align: "justify"})
             doc.text(c22, 142,105,{maxWidth: 44,align: "justify"})
             doc.text(c33, 142,120,{maxWidth: 44,align: "justify"})

             //CUADRO 2 HOJA 2
              doc.rect(30,145, 160,5)
              doc.rect(30,145, 80,30) // corregir 25
              doc.rect(30,145, 80,75)  //corregir 40
              doc.rect(30,145, 80,100)  //corregir 70
              doc.rect(110,145, 80,30)
              doc.rect(110,145, 80,75)
              doc.rect(110,145, 80,100)
            doc.setFontSize(10, 'bold')
            doc.text('         REQUISITOS DEL PROYECTO                                             OBSERVACION', 35, 149)
            doc.text(r1, 32,157,{maxWidth: 75,align: "justify"})
            doc.text(r2, 32,190,{maxWidth: 75,align: "justify"})
            doc.text(r3, 32,226,{maxWidth: 75,align: "justify"})

            doc.text(r11, 112,157,{maxWidth: 75,align: "justify"})
            let infraestructura="Infraestructura Bs. "+this.dato.monto1
            let supervision ="Supervision Bs. "+this.dato.monto2
            let total = "Total, Proyecto Bs. "+this.dato.total

            doc.text("Presupuesto y Estructura de Financiamiento", 112,180,{maxWidth: 75,align: "left"})
            doc.text(infraestructura, 120,185,{maxWidth: 75,align: "justify"})
            doc.text(supervision, 120,190,{maxWidth: 75,align: "justify"})
            doc.text(total, 120,195,{maxWidth: 75,align: "justify"})
            doc.text(r22, 112,200,{maxWidth: 75,align: "justify"})

            doc.text(r33, 112,226,{maxWidth: 75,align: "justify"})
   //hoja 3
            doc.addPage();
            doc.addImage(chacana, 'PNG', 25, 10, 20, 20);
            doc.addImage(logofps, 'PNG', 175, 10, 28, 20);
            doc.addImage(chacanapiso, 'PNG', 0, 184, 215, 96);
            doc.setFont('times')
            doc.setFontSize(10, 'normal')
            doc.text('ESTADO PLURINACIONAL DE BOLIVIA', 75, 20)
            doc.setFontSize(10, 'normal')
            doc.text('FONDO NACIONAL DE INVERSION PRODUCTIVA Y SOCIAL', 63, 25)
            doc.line(80,30,135,30)
            doc.setFontSize(8, 'normal')
            doc.text('La Paz - Bolivia Oficina Departamental La Paz Av. Camacho esq. C. Colón Edif. Krsul Piso 8',60, 262)
            doc.text('Of. 810 Telf. 2125454 - 2125482 Fax. 2110623',85, 266)
            doc.setFontSize(9, 'bold')
            doc.text('Web: www.fps.gob.bo – La Paz - Bolivia',85, 270)
             //CUADRO 1 HOJA 3
              doc.rect(30,35, 80,15) // corregir 25
              doc.rect(30,35, 80,40)  //corregir 40
              doc.rect(30,35, 80,65)  //corregir 70
              doc.rect(30,35, 80,85)  //corregir 70

              doc.rect(110,35, 80,15)
              doc.rect(110,35, 80,40)
              doc.rect(110,35, 80,65)
              doc.rect(110,35, 80,85)
              doc.setFontSize(10, 'bold')
              doc.text(r4, 32,38,{maxWidth: 75,align: "justify"})
              doc.text(r5, 32,53,{maxWidth: 75,align: "justify"})
              doc.text(r6, 32,78,{maxWidth: 75,align: "justify"})
              doc.text(r7, 32,103,{maxWidth: 75,align: "justify"})

              doc.text(r44, 112,38,{maxWidth: 75,align: "justify"})
              doc.text(r55, 112,53,{maxWidth: 75,align: "justify"})
              doc.text(r66, 112,78,{maxWidth: 75,align: "justify"})
              doc.text(r77, 112,103,{maxWidth: 75,align: "justify"})

                    //CUADRO 2 HOJA 3
              doc.rect(30,125, 160,5)  //corregir 40
              doc.rect(30,125, 80,20) // corregir 25
              doc.rect(30,125, 80,50)  //corregir 70
              doc.rect(30,125, 80,60)
              doc.rect(30,125, 80,65)
              doc.rect(30,125, 80,75)
              doc.rect(30,125, 80,85)
              doc.rect(30,125, 80,95)
              doc.rect(30,125, 80,110)
              doc.rect(30,125, 80,115)
              doc.rect(30,125, 80,125)

              doc.rect(110,125, 80,20)
              doc.rect(110,125, 80,50)
              doc.rect(110,125, 80,60)
              doc.rect(110,125, 80,65)
              doc.rect(110,125, 80,75)
              doc.rect(110,125, 80,85)
              doc.rect(110,125, 80,95)
              doc.rect(110,125, 80,110)
              doc.rect(110,125, 80,115)
              doc.rect(110,125, 80,125)
            doc.setFontSize(10, 'bold')
              doc.text('         INGENIERIA DEL PROYECTO(*)                                           OBSERVACION', 40, 129)
             doc.text(i1, 32,133,{maxWidth: 75,align: "justify"})
             doc.text(i2, 32,148,{maxWidth: 75,align: "justify"})
             doc.text(i3, 32,178,{maxWidth: 75,align: "justify"})
             doc.text(i4, 32,188,{maxWidth: 75,align: "justify"})
             doc.text(i5, 32,193,{maxWidth: 75,align: "justify"})
             doc.text(i6, 32,203,{maxWidth: 75,align: "justify"})
             doc.text(i7, 32,213,{maxWidth: 75,align: "justify"})
             doc.text(i8, 32,223,{maxWidth: 75,align: "justify"})
             doc.text(i9, 32,238,{maxWidth: 75,align: "justify"})
             doc.text(i10,32,243,{maxWidth: 75,align: "justify"})

             doc.text(i11, 112,133,{maxWidth: 75,align: "justify"})
             doc.text(i22, 112,148,{maxWidth: 75,align: "justify"})
             doc.text(i33, 112,178,{maxWidth: 75,align: "justify"})
             doc.text(i44, 112,188,{maxWidth: 75,align: "justify"})
             doc.text(i55, 112,193,{maxWidth: 75,align: "justify"})
             doc.text(i66, 112,203,{maxWidth: 75,align: "justify"})
             doc.text(i77, 112,213,{maxWidth: 75,align: "justify"})
             doc.text(i88, 112,223,{maxWidth: 75,align: "justify"})
             doc.text(i99, 112,238,{maxWidth: 75,align: "justify"})
             doc.text(i100,112,243,{maxWidth: 75,align: "justify"})

                    //hoja 4
            doc.addPage();
            doc.addImage(chacana, 'PNG', 25, 10, 20, 20);
            doc.addImage(logofps, 'PNG', 175, 10, 28, 20);
            doc.addImage(chacanapiso, 'PNG', 0, 184, 215, 96);
            doc.setFont('times')
            doc.setFontSize(10, 'normal')
            doc.text('ESTADO PLURINACIONAL DE BOLIVIA', 75, 20)
            doc.setFontSize(10, 'normal')
            doc.text('FONDO NACIONAL DE INVERSION PRODUCTIVA Y SOCIAL', 63, 25)
            doc.line(80,30,135,30)
            doc.setFontSize(8, 'normal')
             doc.text('La Paz - Bolivia Oficina Departamental La Paz Av. Camacho esq. C. Colón Edif. Krsul Piso 8',60, 262)
            doc.text('Of. 810 Telf. 2125454 - 2125482 Fax. 2110623',85, 266)
            doc.setFontSize(9, 'bold')
            doc.text('Web: www.fps.gob.bo – La Paz - Bolivia',85, 270)
             doc.setFontSize(12, 'bold').setFontSize(12).setFont(undefined, 'bold');

             doc.text("3. CONCLUSIONES", 35,38).setFontSize(12).setFont(undefined, 'normal');
             doc.text(con1, 30,45,{maxWidth: 160,align: "justify"})
             doc.text(con2, 40,70,{maxWidth: 150,align: "justify"})
             doc.text(con3, 40,95,{maxWidth: 150,align: "justify"}).setFontSize(12).setFont(undefined, 'bold');

             doc.text("4. RECOMENDACIONES", 35,120).setFontSize(12).setFont(undefined, 'normal');
             doc.text(rec1, 30,130,{maxWidth: 160,align: "justify"})
            //CASO EXCEPCIONAL


             doc.text(rec2, 30,155,{maxWidth: 160,align: "justify"})
            // doc.text(rec2, 30,155,{maxWidth: 160,align: "justify"})
             doc.text(rec3, 30,180,{maxWidth: 160,align: "justify"}).setFontSize(8).setFont(undefined, 'normal');


               doc.text(mosca, 30,220)
               doc.text(copia, 30,224)
               doc.text(adjunto, 30,228)
               doc.text(vinculo, 30,232)

            doc.text('*', 214, 280) //milimetros
            let descargarnombre=this.dato.codigo+".pdf"
            doc.save(descargarnombre);
      },
      mosca(cadena){
          let text=cadena.split(" ")
          let ans=""
          for(let i=0;i<text.length;i++){
               ans+=text[i][0]
          }
          return ans
      },
      fechalarga(fecha, depa1){
         let fecha1=fecha.split("-")
         let depa=depa1.split(" ")
         let ans=""
          for(let i=0;i<depa.length;i++){
               ans+=depa[i][0]
               ans+=(depa[i].slice(1,depa[i].length)).toLowerCase()
               ans+=" "
          }
         let meses={
            1:"enero",
            2:"febrero",
            3:"marzo",
            4:"abril",
            5:"mayo",
            6:"junio",
            7:"julio",
            8:"agosto",
            9:"septiembre",
            10:"octubre",
            11:"noviembre",
            12:"diciembre",
         }

         let answer=ans.trim()+", "+Number(fecha1[2])+" de "+meses[Number(fecha1[1])]+" de "+fecha1[0]
    return answer
      },
      cambiarminiscula(depa1){
         let depa=depa1.split(" ")
         let ans=""
          for(let i=0;i<depa.length;i++){
               ans+=depa[i][0]
               ans+=(depa[i].slice(1,depa[i].length)).toLowerCase()
               ans+=" "
          }
         let answer=ans.trim()
        return answer
      },
        view_form6(){
     this.titulo="RESULTADOS DE EVALUACION"

          if(this.dato.carta_cite==null){
            this.dato.carta_cite="INF/FPS/GDLP"
          }
          if(this.dato.cumple==null){
              this.dato.cumple="NO"
          }
          if(this.dato.carta_fecha==null){
            this.dato.carta_fecha =moment().format('YYYY-MM-DD');
          }
          if(this.dato.adjunto==null){
            this.dato.adjunto=" 1 Carpeta (fojas XXX y 1 CD)"
          }

      this.dialog_form6=true

    },
    view_form7(){
      this.titulo="EVALUACION EN CAMPO"
        if(this.dato.vinculo==null){
          this.dato.vinculo="NO"
        }
        if(this.dato.copia==null){
          this.fecha_inspeccion=moment().format('YYYY-MM-DD');
        }
      this.dialog_form7=true;
    },

  },
};
</script>
