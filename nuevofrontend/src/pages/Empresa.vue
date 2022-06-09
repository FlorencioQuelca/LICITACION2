<template>
   <div class="q-pa-md">
     <div v-if="$store.state.login.user.tipo==='admin'">
     <q-btn
      label="Nueva Empresa"
      color="orange"
      icon="add_circle"
      @click="alert = true"
      class="q-mb-xs"
    />
     <q-btn
      label="ir a Proyectos"
      color="green"
      icon="add_circle"
      @click= "this.$router.push('Proyecto')"
      class="q-mb-xs"
    />
    <q-btn
      label="ir a Sociedad"
      color="blue"
      icon="add_circle"
      @click= "this.$router.push('Sociedad')"
      class="q-mb-xs"
    />
     </div>
      <!--          ADICIONAR REGISTRO -->
   <q-dialog v-model="alert">
      <q-card style="max-width: 80%; width: 80%">
        <q-card-section class="bg-green-14 text-white">
          <div class="text-h6"><q-icon name="add_circle" /> Nuevo Empresa</div>
        </q-card-section>
        <q-card-section class="q-pt-xs">
          <q-form @submit="onSubmit" @reset="onReset" class="q-gutter-md">
             <div class="row">
             <div class="col-6">
            <q-input
              outlined
              v-model="dato.nit"
              type="text"
              label="N.I.T."
              hint="Ingresar su NIT"
              lazy-rules
              :rules="[(val) => (val && val.length > 0) || 'Favor ingresa datos']"
            />
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
              v-model="dato.nombreEmpresa"
              type="text"
              label="Nombre de la Empresa"
              hint="Ingresa el nombre de la Empresa"
              lazy-rules
              :rules="[(val) => (val && val.length > 0) || 'Favor ingresa datos']"
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
  <!--          tabla PRINCIPAL -->
    <q-table
      :filter="filter"
      title="EMPRESAS REGISTRADAS"
      :rows="data"
      :columns="columns"
      row-key="nit"
      :rows-per-page-options="[50,100]"
       separator="cell"
       dense
   >
       <template v-slot:top-right>
        <q-input outlined  dense debounce="300" v-model="filter" placeholder="Buscar">
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
          <q-td key="nit" :props="props">
            {{props.row.nit}}
          </q-td>
          <q-td key="detalle" :props="props">
          <q-btn
              dense
              round
              flat
              color="red"
              @click="verRow(props)"
              icon="list"
          />
          </q-td>
          <q-td key="nombreEmpresa" :props="props">
            {{props.row.nombreEmpresa}}
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
          <q-td key="observacion" :props="props">
            {{props.row.observacion}}
          </q-td>

          <q-td v-if="$store.state.login.user.tipo==='admin'" key="opcion" :props="props">
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
              v-model="dato2.nit"
              type="text"
              label="N.I.T."
              hint="Ingresar su NIT"
              lazy-rules
              :rules="[(val) => (val && val.length > 0) || 'Favor ingresa datos']"
            />

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
              v-model="dato2.nombreEmpresa"
              type="text"
              label="Nombre de la Empresa"
              hint="Ingresa el nombre de la Empresa"
              lazy-rules
              :rules="[(val) => (val && val.length > 0) || 'Favor ingresa datos']"
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

      <!-- Listar proyectos asociados />-->

    <q-dialog v-model="dialog_list">
      <q-card style="max-width: 80%; width: 80%">
        <q-card-section class="bg-green-14 text-white">
          <div class="text-h6">EMPRESA SE PRESENTO  Y/O TIENE CONTRATO CON LOS PROYECTOS :</div>
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
                    :rows="dato3.proyectos"
                    :columns="subcol"
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
                    :rows="dato3.contratos"
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
           <q-td key="fecha1" :props="props">
            {{ props.row.fecha}}
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
  { name: 'nit', required: true,align:"left", label:'N.I.T.',field: "nit", sortable: true},
  { name: 'detalle', label: 'Detalle', field: 'detalle', sortable: false },
  { name: 'nombreEmpresa',align:"left", label: 'Nombre Empresa', field: 'nombreEmpresa',sortable: true },
  { name: 'nombreLegal', align:"left",label: 'Representante Legal.', field: 'nombreLegal', sortable: true },
  { name: 'fono1', align:"center",label: 'Celular', field: 'fono1', sortable: true },
  { name: 'fono2', align:"center",label: 'Telefono', field: 'fono2', sortable: true },
  { name: 'email',align:"left", label: 'Correo', field: 'email', sortable: true },
  { name: 'direccion', align:"left",label: 'Direccion', field: 'direccion', sortable: true },
  { name: 'observacion',align:"left", label: 'Observacion', field: 'observacion', sortable: true },
  { name: 'opcion', label: 'Opcion', field: 'action', sortable: false }
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
   selected: [],
   filter:'',
   errores: null,
   consultores:[],
   props:[],
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
   data:[],
   dato:{},
   dato2:{},
   dato3:{},
    columns,
       subcol: [
         { name: "departamento",required: true, label: "Departamento", align: "left",field:  row => row.departamento,sortable: true,},
         { name: "nombre",align: "left",label: "Nombre proyecto",field: "nombre", sortable: true },
         { name: "fecha",align: "left",label: "fecha de la Presentacion",field: "fecha",sortable: true},
         { name: "cuce",align: "left",label: "CUCE del proyecto",field: "cuce",sortable: true},
      ],
     subcol1: [
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
    verRow(item) {
      this.dato3 = item.row;
      this.dialog_list = true;
    },
     onReset() {
      this.dato.nombreLegal = null;
      this.dato.nombreEmpresa = null;
      this.dato.nit = null;
      this.dato.departamento=null;
      this.dato.fono1 =null;
      this.dato.fono2 =null;
      this.dato.direccion =null;
      this.dato.email =null;
      this.dato.observacion =null;
    },
    misdatos(){
    this.$q.loading.show();
          this.$api.get(process.env.API+"/empresa").then((res)=>{
          this.data =res.data;
          //console.log(res.data)
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
     onDel() {
      this.$q.loading.show();
      this.$api.delete( process.env.API+"/empresa/" + this.dato2.id).then((res) => {
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
       this.dato.datosp =this.dato.nombres+" "+this.dato.paterno+" "+this.dato.materno;
      this.$q.loading.show();
      this.$api.post(process.env.API+"/empresa/", this.dato).then((res) => {

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
        this.onReset();
        }).catch((e)=>{
          this.$q.loading.hide();
          this.errores = e.response.data.errors;
        });
    },
    //modigicar
     onMod() {
      this.errores =null;
       this.$q.loading.show();
      this.$api.put(process.env.API+"/empresa/"+this.dato2.id,this.dato2).then((res) => {
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
    exportTable () {
     const content = [columns.map(col => wrapCsvValue(col.label))].concat(
          this.data.map(row => columns.map(col => wrapCsvValue(
            typeof col.field === 'function'
              ? col.field(row)
              : row[ col.field === void 0 ? col.name : col.field ],
            col.format
          )).join(','))
        ).join('\r\n')

        const status = exportFile(
          'empresa.csv',
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


};
</script>
