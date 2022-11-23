<template>
   <div class="q-pa-md">
     <div v-if="$store.state.login.user.tipo==='admin'">
     <q-btn
      label="Nueva Sociedad/Asociacion Accidental"
      color="blue"
      icon="add_circle"
      @click="nuevaAsociacion"
      class="q-mb-xs"
    />
     <q-btn
      label="Empresa"
      color="red"
      icon="add_circle"
      @click= "this.$router.push('Empresa')"
      class="q-mb-xs"
    />
     <q-btn
      label="ir a Proyectos"
      color="green"
      icon="add_circle"
      @click= "this.$router.push('Proyecto')"
      class="q-mb-xs"
    />
     </div>
      <!--          ADICIONAR REGISTRO -->
   <q-dialog v-model="alert">
      <q-card style="max-width: 80%; width: 80%">
        <q-card-section class="bg-green-14 text-white">
          <div class="text-h6"><q-icon name="add_circle" /> Nuevo Sociedad/Asociacion</div>
        </q-card-section>
        <q-card-section class="q-pt-xs">
          <q-form @submit="onSubmit"  class="q-gutter-md">
             <div class="row">
             <div class="col-6">
                <q-input
              outlined
              v-model="dato.codigo"
              type="number"
              label="Codigo"
              hint="Ingresar codigo Identificativo"
               lazy-rules
              :rules="[v => !!v || 'Telefono requerido']"
            />
             <q-input
              outlined
              v-model="dato.matricula"
              type="text"
              label="Matricula"
              hint="Ingresar Matricula"
            />
              <q-input
              outlined
              v-model="dato.nombreEmpresa"
              type="text"
              label="Nombre de la Sociedad Accidental"
              hint="Ingresa el nombre de la Sociedad Accidental"
              lazy-rules
              :rules="[(val) => (val && val.length > 0) || 'Favor ingresa datos']"
            />
              <q-input
              outlined
              v-model="dato.ci"
              type="text"
              label="C.I."
              hint="Ingresar ci"
            />
          <q-input
              outlined
              v-model="dato.nombreLegal"
              type="text"
              label="Nombre del Representante Legal"
              hint="Ingresar Nombre del Representante Legal"
              lazy-rules
              :rules="[(val) => (val && val.length > 0) || 'Favor ingresa datos']"
            />
             </div>
             <div class="col-6">
             <q-select
             outlined
            v-model="dato.departamento"
            :options="departamentos"
            label="Departamento"
            type="text"
            hint="Seleccionar Departamento"
           />
            <q-input
              outlined
              v-model="dato.fono1"
              type="number"
              label="Celular o Telefono 1"
              hint="Ingresar Numero de Telefono"

            />
            <q-input
              outlined
              v-model="dato.fono2"
              type="number"
              label="Celular o Telefono 2"
              hint="Ingresar Numero de Telefono"
            />
              <q-input
              outlined
              v-model="dato.email"
              type="email"
              label="Correo Electronico"
              hint="Ingresar Correo Electronico"
            />
             <q-input
              outlined
              v-model="dato.direccion"
              type="text"
              label="Direccion Domiciliaria"
              hint="Ingresar Direccion Domiciliaria"

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
  <!--          tabla PRINCIPAL-->

    <q-table
      :filter="filter"
      title="ASOCIACIONES O SOCIEDADES ACCIDENTALES REGISTRADAS"
      :rows="data"
      :columns="columns"
      row-key="nit"
      :rows-per-page-options="[10,20,50,100,0]"
       separator="cell"
       dense
   >
       <template v-slot:top-right>
        <q-input outlined borderless dense debounce="300" v-model="filter" placeholder="Buscar">
          <template v-slot:append>
            <q-icon name="search" />
          </template>
        </q-input>
      </template>
      <!--
      <template v-slot:top-row>
        <q-btn
          color="primary"
          icon-right="archive"
          no-caps
          @click="exportTable"
        />
        </template>
        -->
       <template v-slot:body="props">
        <q-tr :props="props">
          <q-td key="departamento" :props="props">
            {{props.row.departamento}}
          </q-td>
            <q-td key="codigo" :props="props">
            {{props.row.codigo}}
          </q-td>
           <q-td key="detalle" :props="props">
          <q-btn
              dense
              round
              flat
              color="red"
              @click="verRow1(props)"
              icon="list"
          />
          </q-td>
          <q-td key="nombreEmpresa" :props="props">
            {{props.row.nombreEmpresa}}
          </q-td>
           <q-td key="empresas" :props="props">
              <ul>
              <span v-for="(empresas,index) in props.row.empresas" :key="index">
                  <li>
                    {{empresas.nit}}  ({{empresas.pivot.participacion}}) % - {{empresas.nombreEmpresa}}
                </li>
              </span>
            </ul>
          </q-td>

          <q-td v-if="$store.state.login.user.tipo==='admin'" key="opcion" :props="props">
                   <q-btn
                        dense
                        round
                        flat
                        color="green"
                        @click="addRow(props)"
                        icon="playlist_add"
                      ></q-btn>
                        <q-btn
                        dense
                        round
                        flat
                        color="green"
                        @click="verRow(props)"
                        icon="list"
                      ></q-btn>
          </q-td>
          <q-td key="matricula" :props="props">
            {{props.row.matricula}}
          </q-td>
          <q-td key="ci" :props="props">
            {{props.row.ci}}
          </q-td>
          <q-td key="nombreLegal" :props="props">
            {{props.row.nombreLegal}}
          </q-td>
            <q-td key="fono1" :props="props">
            {{props.row.fono1}}
          </q-td>
           <q-td key="fono2" :props="props">
            {{props.row.fono2}}
          </q-td>
          <q-td key="email" :props="props">
            {{props.row.email}}
          </q-td>
          <q-td key="direccion" :props="props">
            {{props.row.direccion}}
          </q-td>
          <q-td v-if="$store.state.login.user.tipo==='admin'"  key="action" :props="props">
             <q-btn
              dense
              round
              flat
              color="yellow"
              @click="editRow(props)"
              icon="edit"
          />
            <q-btn
              dense
              round
              flat
              color="red"
              @click="deleteRow(props)"
              icon="delete"
            ></q-btn>
          </q-td>
           </q-tr>
      </template>
    </q-table>
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

   <!--          MODIFICAR REGISTRO -->
    <q-dialog v-model="dialog_mod">
      <q-card style="max-width: 80%; width: 80%">
        <q-card-section class="bg-green-14 text-white">
          <div class="text-h6"><q-icon name="edit"/> Modificar Registro</div>
        </q-card-section>
         <errores
         v-if="errores !== null"
          :errores="errores"
        ></errores>
        <q-card-section class="q-pt-xs">
          <q-form @submit="onMod" class="q-gutter-md">
               <div class="row">
             <div class="col-6">
               <q-input
              outlined
              v-model="dato2.codigo"
              type="number"
              label="Codigo"
              hint="Ingresar codigo Identificativo"
               lazy-rules
              :rules="[v => !!v || 'Telefono requerido']"
            />
               <q-input
              outlined
              v-model="dato2.matricula"
              type="text"
              label="Matricula"
              hint="Ingresar Matricula"
            />
           <q-input
              outlined
              v-model="dato2.nombreEmpresa"
              type="text"
              label="Nombre de la Empresa"
              hint="Ingresa el nombre de la Empresa"
              lazy-rules
              :rules="[(val) => (val && val.length > 0) || 'Favor ingresa datos']"
            />

             <q-input
              outlined
              v-model="dato2.ci"
              type="text"
              label="C.I."
              hint="Ingresar C.I."
            />


             <q-input
              outlined
              v-model="dato2.nombreLegal"
              type="text"
              label="Nomrbre del Representante Legal"
              hint="Ingresar Nombre del Representante Legal"
              lazy-rules
              :rules="[(val) => (val && val.length > 0) || 'Favor ingresa datos']"
            />
             </div>
             <div class="col-6">
 <q-select
             outlined
            v-model="dato2.departamento"
            :options="departamentos"
            label="Departamento"
            type="text"
            hint="Seleccionar Departamento"
           />

            <q-input
              outlined
              v-model="dato2.fono1"
              type="number"
              label="Celular o Telefono 1"
              hint="Ingresar Numero de Telefono"
              lazy-rules
              :rules="[v => !!v || 'Telefono requerido']"
            />
            <q-input
              outlined
              v-model="dato2.fono2"
              type="number"
              label="Celular o Telefono 2"
              hint="Ingresar Numero de Telefono"

            />
              <q-input
              outlined
              v-model="dato2.email"
              type="email"
              label="Correo Electronico"
              hint="Ingresar Correo Electronico"

            />
             <q-input
              outlined
              v-model="dato2.direccion"
              type="text"
              label="Direccion Domiciliaria"
              hint="Ingresar Direccion Domiciliaria"

            />
             </div>
             </div>
            <div>
              <q-btn label="Modificar Registro" type="submit" color="positive" icon="add_circle" />
              <q-btn label="Cancelar" icon="delete" color="negative" v-close-popup />
            </div>
          </q-form>

        </q-card-section>
      </q-card>
    </q-dialog>
    <!-- empresas asociados />-->
      <q-dialog v-model="dialog_addEmpresa">
      <q-card>
        <q-card-section class="row ">
          <q-form class="col-12" @submit.prevent="onaddEmpresa">
          <q-input
              outlined
              v-model="nit"
              type="text"
              label="N.I.T."
              hint="Ingresar Numero de NIT"

            />

             <q-input
              outlined
              v-model="participacion"
              type="number"
              label="participacion."
              hint="Ingresar % participacion"
              lazy-rules
              :rules="[v => !!v || 'Dato requerido']"
            />


            <q-card-actions align="right">
              <q-btn icon="send" label="Agregar" color="deep-orange" type="submit" />
              <q-btn icon="delete"  label="Cancelar" color="negative" v-close-popup />
            </q-card-actions>
          </q-form>
        </q-card-section>

      </q-card>
    </q-dialog>

  <!-- empresas asociados  adicionar empresa/>-->
      <q-dialog v-model="dialog_add">
      <q-card style="max-width: 80%; width: 50%">
        <q-card-section class="bg-green-14 text-white">
          <div class="text-h6">Agregar Empresa</div>
        </q-card-section>
        <q-card-section class="q-pt-xs">

          <q-form @submit.prevent="onAdd" class="q-gutter-md">
            <q-input
              outlined
              v-model="dat.nit"
              type="text"
              label="NIT empresa"
              hint="Ingresar NIT"
               lazy-rules
              :rules="[(val) => val!='' && val!=null || 'Por favor ingresa datos']"
            />
            <q-input
              outlined
              v-model="dat.participacion"
              type="text"
              label="Participacion"
              hint="Ingresar Paticipacion"
            />
            <div>
              <q-btn label="Agregar" type="submit" color="positive" icon="add_circle" />
              <q-btn label="Cancelar" icon="delete" color="negative" v-close-popup />
            </div>
          </q-form>
        </q-card-section>
      </q-card>
    </q-dialog>
   <!-- empresas asociados listar  />-->

    <q-dialog v-model="dialog_list">
      <q-card style="max-width: 80%; width: 60%">
        <q-card-section class="bg-green-14 text-white">
          <div class="text-h6">Lista de Asociados</div>
        </q-card-section>
        <q-card-section class="q-pt-xs">
                <q-table
                    title="Empresas Asociadas"
                    :rows="dato3.empresas"
                    :columns="subcol"

                    >
      <template v-slot:body="props">
          <q-tr :props="props">

            <q-td key="nit" :props="props">
            {{ props.row.nit}}
          </q-td>
          <q-td key="empresa" :props="props">
            {{ props.row.nombreEmpresa }}
          </q-td>
            <q-td key="participacion" :props="props">
            {{ props.row.pivot.participacion }}
          </q-td>
          <q-td>

                      <q-btn
                        dense
                        round
                        flat
                        color="red"
                        @click="deletesub(props)"
                        icon="delete"
                      ></q-btn>
          </q-td>
          </q-tr>
          </template>
          </q-table>
            <div>
              <q-btn label="Cancelar" icon="delete" color="negative" v-close-popup />
            </div>
        </q-card-section>
      </q-card>
    </q-dialog>

        <!-- empresas asociados eliminar empresa/>-->
    <q-dialog v-model="dialog_delsub">
      <q-card>
        <q-card-section class="row items-center">
          <q-avatar icon="clear" color="red" text-color="white" />
          <span class="q-ml-sm">Seguro de eliminar Registro.</span>
        </q-card-section>

        <q-card-actions align="right">
          <q-btn flat label="Eliminar" color="deep-orange" @click="onDelsub" />
          <q-btn flat label="Cancelar" color="primary" v-close-popup />
        </q-card-actions>
      </q-card>
    </q-dialog>


      <!-- Listar proyectos asociados />-->

    <q-dialog v-model="dialog_list1">
      <q-card style="max-width: 80%; width: 80%">
        <q-card-section class="bg-green-14 text-white">
          <div class="text-h6">LA ASOCIACION ACCIDENTAL SE PRESENTO  Y/O TIENE CONTRATO CON LOS PROYECTOS :</div>
        </q-card-section>

         <div class="row">
        <div class="col-12">
          <q-option-group
            v-model="group"
            :options="opciones"
            color="primary"
            inline
          />
        </div>
        </div>
        <q-card-section v-if="group==='op1'" class="q-pt-xs">
                <q-table
                    :rows="dato4.proyectos"
                    :columns="subcol1"
                    >
      <template v-slot:body="props">
          <q-tr :props="props">

            <q-td key="departamento" :props="props">
            {{ props.row.departamento.nombre}}
          </q-td>
          <q-td key="nombre" :props="props">
            {{ props.row.nombre }}
          </q-td>
            <q-td key="fecha" :props="props">
            {{ props.row.fecha }}
          </q-td>
           <q-td key="cuce" :props="props">
            {{ props.row.cuce }}
          </q-td>

          </q-tr>
          </template>
          </q-table>
        </q-card-section>

          <q-card-section v-if="group==='op2'" class="q-pt-xs">
                <q-table
                    :rows="dato4.contratos"
                    :columns="subcol2"

                    >
      <template v-slot:body="props">
          <q-tr :props="props">

            <q-td key="departamento" :props="props">
            {{ props.row.proyecto.departamento.nombre}}
          </q-td>
          <q-td key="nombre" :props="props">
            {{ props.row.nombre }}
          </q-td>
            <q-td key="fecha" :props="props">
            {{ props.row.fechaini }}
          </q-td>
           <q-td key="fecha1" :props="props">
            {{ props.row.fechafin}}
          </q-td>
         <q-td key="status" :props="props">
            {{ props.row.status}}
          </q-td>
          </q-tr>
          </template>
          </q-table>

        </q-card-section>
      </q-card>
    </q-dialog>


  </div>
</template>

<script>
import errores from 'components/errores.vue'
import { exportFile } from 'quasar'
import Empresa from "pages/Empresa"
 function wrapCsvValue(val, formatFn) {
  let formatted = formatFn !== void 0
    ? formatFn(val)
    : val
  formatted = formatted === void 0 || formatted === null
    ? ''
    : String(formatted)
  formatted = formatted.split('"').join('""')
 return `"${formatted}"`
}
const  columns= [
  { name: 'departamento', align:"left",label: 'Departamento', field: 'departamento', sortable: true },
   { name: 'codigo',required:true,align:"left", label: 'Codigo', field: 'codigo',sortable: true },
   { name: 'detalle', label: 'Detalle', field: 'detalle', sortable: false },
  { name: 'nombreEmpresa',align:"left", label: 'Nombre Empresa', field: 'nombreEmpresa',sortable: true },
  { name: 'empresas',align:"left", label: 'Asociados', field: 'empresas', sortable: true },
   { name: 'opcion',align:"center",label: 'Accion', field: 'opcion', sortable: false },
  { name: 'matricula',align:"left", label: 'matricula', field: 'matricula',sortable: true },
  { name: 'ci', align:"left",label: 'C.I.', field: 'ci', sortable: true },
  { name: 'nombreLegal', align:"left",label: 'Representante Legal.', field: 'nombreLegal', sortable: true },
  { name: 'fono1', align:"center",label: 'Celular', field: 'fono1', sortable: true },
  { name: 'fono2', align:"center",label: 'Telefono', field: 'fono2', sortable: true },
  { name: 'email',align:"Center", label: 'Correo', field: 'email', sortable: true },
  { name: 'direccion', align:"left",label: 'Direccion', field: 'direccion', sortable: true },
  { name: 'action',align:"center", label: 'Accion', field: 'action', sortable: false }
   ]
export default {
    components: {
    errores
    },
  data() {
    return {
   alert:false,
   dialog_del:false,
   dialog_mod:false,
   dialog_add:false,
   dialog_list:false,
   dialog_list1:false,

   dialog_addEmpresa:false,

   dialog_delsub:false,
   selected: [],
   filter:'',
   errores: null,
   consultores:[],
   props:[],
   mensaje:"empresa no encontrada INGRESE El NIT",
   txtBuscar:{},
   dat:{},
   respuesta:[],
      departamentos: [
        'LA PAZ',
        'ORURO',
        'COCHABAMBA',
        'SANTA CRUZ',
        'CHUQUISACA',
        'PANDO',
        'BENI',
        'POTOSI',
        'TARIJA',
        'EXTRANGERO',
      ],
       subcol: [
         { name: "nit",required: true, label: "NIT", align: "left",field: "nit",sortable: true,},
         { name: "empresa",align: "left",label: "Nombre Empresa",field: "empresa", sortable: true },
         { name: "participacion",align: "left",label: "Participacion",field: "participacion",sortable: true},
      ],


   data:[],
   dato:{},
   dato2:{},
   dato4:{},
   dato5:{},
   asociados:[],
   dato3:{},
   daot4:{},
   columns,
       subcol1: [
         { name: "departamento",required: true, label: "Departamento", align: "left",field:  row => row.departamento,sortable: true,},
         { name: "nombre",align: "left",label: "Nombre proyecto",field: "nombre", sortable: true },
         { name: "fecha",align: "left",label: "fecha de la Presentacion",field: "fecha",sortable: true},
         { name: "cuce",align: "left",label: "CUCE del proyecto",field: "cuce",sortable: true},
      ],
     subcol2: [
         { name: "departamento",required: true, label: "Departamento", align: "left",field:  row => row.departamento,sortable: true,},
         { name: "nombre",align: "left",label: "Nombre proyecto",field: "nombre", sortable: true },
         { name: "fecha",align: "left",label: "fecha de la Presentacion",field: "fecha",sortable: true},
         { name: "fecha1",align: "left",label: "Fecha de Culminacion",field: "fecha1",sortable: true},
          { name: "status",align: "left",label: "Estado",field: "status",sortable: true},
      ],
    opciones: [
        {
          label: 'Presentados',
          value: 'op1'
        },
        {
          label: 'Contratos',
          value: 'op2'
        }
      ],
      group: 'op1',
    };
  },
  created(){
    this.misdatos()
  },
  methods:{
     verRow1(item) {
      this.dato4 = item.row;
      this.dialog_list1 = true;
    //  console.log(item)
      console.log(item.row)
    },
     onReset() {
      this.dato.nombreLegal = null;
      this.dato.codigo = null;
      this.dato.mombreEmpresa = null;
      this.dato.departamento=null;
      this.dato.fono1 =null;
      this.dato.fono2 =null;
      this.dato.direccion =null;
      this.dato.email =null;
      this.dato.observacion =null;
    },
    misdatos(){
    this.$q.loading.show();
       this.$api.get(process.env.API+"/sociedad").then((res)=>{
         this.data =res.data;
      //  console.log(this.data);
       this.$q.loading.hide();
       });
    },
    editRow(item) {
      this.dato2 = item.row
     this.dialog_mod = true;
    },
    deleteRow(item) {
      this.dato2 = item.row;
      this.dialog_del = true;
    },
    agregarunidad(item){
      this.dato2 = item.row;
      this.dialog_unidad = true;
    },
    agregarEmpresas(item){
      this.dato3 = item.row;
      this.dialog_addEmpresa = true;
    },
     addRow(item) {
      this.dato3 = item.row;
      this.dat={}
      this.dialog_add = true;
    },
    verRow(item) {
      this.dato3 = item.row;
      this.dialog_list = true;
    },
    deletesub(item) {
      this.dato4 = item.row;
      this.dialog_delsub = true;
    },
    nuevaAsociacion(){

      let  maxi=-99;
      this.dato.codigo=1

      this.data.forEach(it=>{
     //  console.log(it.num)
          if(Number(it.codigo) > maxi){
            this.dato.codigo=Number(it.codigo)+1
            maxi=Number(it.codigo)
          }
      })
      if(maxi<0){
        this.dato.codigo=1
      }
         this.alert=true
    },

       onDelsub() {
      this.$q.loading.show();
         this.$api.put(process.env.API + "/empresasociedaddetach/"+this.dato3.id,this.dato4).then((res) => {
                         this.$q.notify({
                          color: "green-4",
                          textColor: "white",
                          icon: "cloud_done",
                          message: "Desasociado Correctamente",
                        });
                       this.dialog_delsub=false;
                        this.dialog_list = false;
                        this.misdatos();
                      });

    },
     onDel() {
      this.$q.loading.show();
      this.$api.delete( process.env.API+"/sociedad/" + this.dato2.id).then((res) => {
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
     onSubmit() {
       this.errores =null;
     //  this.dato.datosp =this.dato.nombres+" "+this.dato.paterno+" "+this.dato.materno;
      this.$q.loading.show();
      this.$api.post(process.env.API+"/sociedad/", this.dato).then((res) => {

         if(res.data.res===true)
          {
            this.$q.notify({
            color: "green-4",
            textColor: "white",
            icon: "cloud_done",
            message: "Creado Correctamente",
          });

          }else{
            this.$q.loading.hide();
            this.errores = res.data.errors;
          }
         this.alert= false;
          this.misdatos();
        }).catch((e)=>{
          this.$q.loading.hide();
          this.errores = e.response.data.errors;
        });
    },
    //modigicar
     onMod() {
      this.errores =null;
       this.$q.loading.show();
      this.$api.put(process.env.API+"/sociedad/"+this.dato2.id,this.dato2).then((res) => {
          if(res.data.res===true){
            this.$q.notify({
            color: "green-4",
            textColor: "white",
            icon: "cloud_done",
            message: "Modificado correctamente",
          });
          }else{
            this.$q.loading.hide();
            this.errores = res.data.errors;
          }
         this.dialog_mod = false;
          this.misdatos();
        }).catch((e)=>{
          this.$q.loading.hide();
          this.errores = e.response.data.errors;
        });
    },
    //adicion de empresas

     onAdd() {
      this.$q.loading.show();
       this.$api.get(process.env.API+ "/empresanit/"+this.dat.nit).then((res1) => {
          if (res1.data.length===0) {
         this.$q.notify({
            color: "red-4",
            textColor: "white",
            icon: "cloud_done",
            message: "Empresa no registrada,  Registre Porfavor",
          });
               this.dialog_add = false;
            this.$q.loading.hide();

       }else{
                console.log(res1.data[0])
                console.log(this.dato3.id)
                res1.data[0].participacion=this.dat.participacion
                this.$api.put(process.env.API + "/empresaSociedad/"+this.dato3.id,res1.data[0]).then((res) => {
                     console.log('enlazado')
                     //console.log(res.data)

                     this.$q.notify({
                          color: "green-4",
                          textColor: "white",
                          icon: "cloud_done",
                          message: "Agregado Correctamente",
                        });
                        // console.log('respuesta del join emporesa')
                       // console.log(res.data)
                        this.dialog_add = false;
                        this.misdatos();
                      });
       }



      });


    },
      buscarEmpresa(){

       },


    exportTable(){
     const content = [columns.map(col => wrapCsvValue(col.label))].concat(
          this.data.map(row => columns.map(col => wrapCsvValue(
            typeof col.field === 'function'
              ? col.field(row)
              : row[ col.field === void 0 ? col.name : col.field ],
            col.format
          )).join(','))
        ).join('\r\n')

        const status = exportFile(
          'sociedades.csv',
          "\ufeff"+content,
          'text/csv'
        )

        if (status !== true) {
          $q.notify({
            message: 'Browser denied file download...',
            color: 'negative',
            icon: 'warning'
          })
        }
     }

  },
  computed:{
     total(){
       let s=0
       this.respuesta.forEach(r=>{
         s=s+parseInt(r.nit)
       })
       return s;
     }
  }


};
/*  CODIGO RESGUARDO

 lazy-rules
              :rules="[v => !!v || 'Telefono requerido']"
  lazy-rules
              :rules="[v => !!v || 'Correo electronio requerido',
                    v => (v && v.length >= 7  && v.length <=50) || 'Cantidad de caracteres invalido',
                    v => (v || '').indexOf(' ') < 0 ||  'no se permite spacios en blanco',
                    v => /.+@.+\..+/.test(v) || 'correo invalido']"
                   */
</script>
