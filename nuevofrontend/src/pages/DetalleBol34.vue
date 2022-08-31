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
              <q-btn label="GUARDAR" type="submit" color="positive" icon="add_circle" />
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
          <q-form @submit="onMod5" class="q-gutter-md">
            <q-input
              outlined
              v-model="dato.carta_cite"
              type="text"
               label="Nombre del CITE DEL INFORME"
              hint="Ingresar el CITE DEL INFORME (sacar del SIGEC)"
            />
             <q-input
              outlined
              v-model="dato.carta_a"
              type="text"
              label="Nombre del GERENTE DE PROGRAMAS Y PROYECTOS"
              hint="Ingresar Nombre del GERENTE DE PROGRAMAS Y PROYECTOS"
            />
             <q-input
                  outlined
                  type="text"
                  v-model="dato.carta_via"
                     label="Nombre del GERENTE DEPARTAMENTAL"
              hint="Ingresar Nombre del GERENTE DEPARTAMENTAL FPS "
                />
            <q-input
              outlined
              v-model="dato.carta_cite"
              type="text"
               label="Nombre del CITE DEL INFORME"
              hint="Ingresar el CITE DEL INFORME (sacar del SIGEC)"
            />
             <q-input
              outlined
              v-model="dato.carta_ref"
              type="text"
              label="Referencia"
              hint="Ingresar de REFERENCIA"
            />
            <div>
              <q-btn label="GUARDAR" type="submit" color="positive" icon="add_circle" />
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
               <div class="row" v-for="item in evaluaciones" :key="item.id"  style="margin:0;padding:0 ">
                     <div class="col-6"  v-if="item.tipo===op">
                          <q-card-section style="background-color:#F2F3F4">
                          <div class="text-subtitle2">{{item.nombre}} : {{item.descripcion}}</div>
                        </q-card-section>
                     </div>
                     <div class="col-1" v-if="item.tipo===op"   >
                      <div class="q-gutter-sm" dense>
                            <q-radio dense v-model="item.valor" val="SI" label="Cumple" />
                            <q-radio dense v-model="item.valor" val="NO" label="NO Cumple" />
                      </div>
                     </div>
                     <div class="col-4"  v-if="item.tipo===op">
                      <q-input
                        outlined
                        v-model="item.descripcion1"
                        type="text"
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
                        color="green"
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

  </div>
</template>

<script>
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

       this.dialog_form234=true;
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
     this.dialog_form234=true;
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


            this.dialog_form234=true;
    },
    view_form5(){
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
     onMod5() {
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
          this.dialog_form5 = false;
          this.misdatos();
          this.$q.loading.hide();
        });
    },
    guardar(item){
      console.log("esta guardando");
      console.log(item)
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
                          this.misdatos();
                          // console.log(res.data)
                          });
      }
    },
      editar(item){
        console.log("esta editando");
       console.log(item);
         this.dato.evaluacions.forEach(it => {
                if(it.nombre===item.nombre){
                  console.log(it)
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
                          this.misdatos();

                        });

                }
         })
      }


  },
};
</script>
