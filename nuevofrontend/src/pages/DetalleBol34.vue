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
                       <q-btn icon="looks_two" label="Criterios de Eligibilidad" stack glossy color="purple" style="width:200px; margin:10px 0px 0px 0px"/>
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
                       <q-btn icon="looks_3" label="Requisitos Del proyecto" stack glossy color="purple" style="width:200px; margin:10px 0px 0px 0px" />
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
                       <q-btn icon="looks_4" label="INGENIERIA DEL PROYECTO" stack glossy color="purple" style="width:200px; margin:10px 0px 0px 0px" />
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
                       <q-btn icon="looks_5" label="RESULTADOS DE EVALUACION" stack glossy color="purple" style="width:200px; margin:10px 0px 0px 0px" />
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
          <div class="text-h6"><q-icon name="edit" /> Modificar Registro</div>
        </q-card-section>

        <q-card-section class="q-pt-xs">
          <q-form @submit="onMod" class="q-gutter-md">
           <div class="row">
 <div class="col-6">

             <q-input
              outlined
              v-model="dato2.nombre"
              type="text"
              label="Nombre del proyecto"
              hint="Ingresar Nombre del Proyecto"
              lazy-rules
              :rules="[(val) => (val && val.length > 0) || 'Favor ingresa datos']"
            />
             <q-input
                  outlined
                  type="text"
                  v-model="dato2.codigo"
                    label="Codigo del proyecto "
                  hint="Codigo del Proyecto VIPFE"
                />
            <q-input
              outlined
              v-model="dato2.cite"
              type="text"
              label="CITE carta VIPFE"
               hint="Ingresar CITE carta VIPFE"
            />
             <q-input
                  outlined
                  type="date"
                  v-model="dato2.fecha"
                  hint="Ingresar Fecha de ingre del proyecto"

                />
              <q-input
              outlined
              v-model="dato2.nro"
              type="text"
              label="Numero del proyecto"
               hint="Numero de proyecto"
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
              v-model="dato2.total"
              type="number"
              label="Monto del proyecto"
              hint="Ingrese el Monto del Proyecto "
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
    columna,
    rows:[],
    progress2:0.3,
   // progressLabel2:(progress2*100).toFixed(2)+'%'
    progressLabel2:'0.3 %',
    dialog_form1:false,

  }),
  created() {},
  mounted() {
    this.misdatos();
  },
  methods: {
    misdatos() {
      this.$q.loading.show();
      this.rows=[]
      this.$api
        .get(process.env.API + "/registroid/" + this.$route.params.id)
        .then((res) => {

          this.data=res.data[0]
          console.log(res.data);

          this.rows.push({titulo:"Nombre del Proyecto : ", descripcion: res.data[0].nombre})
          this.rows.push({titulo:"Departamento : ", descripcion: res.data[0].departamento.nombre})
          this.rows.push({titulo:"Municipio : ", descripcion: res.data[0].municipio})
          this.rows.push({titulo:"Comunidades : ", descripcion: res.data[0].comunidades})
          this.rows.push({titulo:"Cite VIFFE : ", descripcion: res.data[0].cite})
          this.rows.push({titulo:"H.R. FPS: ", descripcion: res.data[0].interno})
          this.rows.push({titulo:"Codigo : ", descripcion: res.data[0].codigo});
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
    //  this.dialog_form1=true;


    }
  },
};
</script>
