<template> 
   <div class="q-pa-md">
     <q-btn
      label="Nuevo Consultor/Supervisor"
      color="red"
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
      <!--          ADICIONAR REGISTRO -->
   <q-dialog v-model="alert">
      <q-card style="max-width: 80%; width: 80%">
       
        <q-card-section class="bg-green-14 text-white">
          <div class="text-h6"><q-icon name="add_circle" /> Nuevo Consultor</div>
        </q-card-section>
        <q-card-section class="q-pt-xs">
          <q-form @submit="onSubmit" @reset="onReset" class="q-gutter-md">
                 <div class="row">
              <div class="col-6">
            <q-input
              outlined
              v-model="dato.ci"
              type="text"
              label="C.I."
              mask="####XXXXXXXXXXX"
              hint="Ingresar Cedula de Identidad"
              lazy-rules
              :rules="[(val) => (val && val.length > 0) || 'Favor ingresa datos']"
            />
             <q-input
              outlined
              v-model="dato.nit"
              type="text"
              label="N.I.T."
              hint="Ingresar su NIT"
            />
             <q-select
             outlined
            v-model="dato.grado"
            :options="grados"
            label="Grado Academico"
            type="text"
            hint="Seleccionar Grado Academico"
           />
            <q-input
              outlined
              v-model="dato.paterno"
              type="text"
              label="Apellido Paterno"
              hint="Ingresar Apellido Paterno"
              lazy-rules
              :rules="[(val) => (val && val.length > 0) || 'Favor ingresa datos']"
            />
            <q-input
              outlined
              v-model="dato.materno"
              type="text"
              label="Apellido Materno"
              hint="Ingresar Apellido Materno"
             
            />
             <q-input
              outlined
              v-model="dato.nombres"
              type="text"
              label="Nombres"
              hint="Ingresar Nombres"
              lazy-rules
              :rules="[(val) => (val && val.length > 0) || 'Favor ingresa datos']"
            />
             </div>
             <div class="col-6">
                 <q-select
             outlined
            v-model="dato.genero"
            :options="generos"
            label="Genero"
            type="text"
            hint="Seleccionar Genero"
            />
             <q-input
                  outlined                  
                  type="date"
                  v-model="dato.fechaNacimiento"
                  hint="Ingresar Fecha de Nacimiento"
                />
            <q-input
              outlined
              v-model="dato.fono1"
              type="number"
              label="Celular o Telefono 1"
              hint="Ingresar Numero de Telefono"
              lazy-rules
              :rules="[v => !!v || 'Telefono requerido']"
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
              lazy-rules
              :rules="[v => !!v || 'Correo electronio requerido',
                    v => (v && v.length >= 7  && v.length <=50) || 'Cantidad de caracteres invalido',
                    v => (v || '').indexOf(' ') < 0 ||  'no se permite spacios en blanco',
                    v => /.+@.+\..+/.test(v) || 'correo invalido']"
            />
             <q-input
              outlined
              v-model="dato.direccion"
              type="text"
              label="Direccion Domiciliaria"
              hint="Ingresar Direccion Domiciliaria"
            />
                <q-option-group
                v-model="dato.observacion"
                :options="[{label:'Servidor publico', value:'SERVIDOR PUBLICO'},{label:'Natural', value:'NATURAL'}]"
                color="primary"
                inline
              />
                 <q-input v-if='dato.observacion==="SERVIDOR PUBLICO"'
              outlined
              v-model="dato.departamento"
              type="text"
              label="departamento"
              mask="XXXXXXXXXXXX"
              hint="Ingresar departamento de trabajo"
            />
             </div>
             </div>
            <div>
              <q-btn label="Crear Usuario" type="submit" color="positive" icon="add_circle" />
              <q-btn label="Cancelar" icon="delete" color="negative" v-close-popup />
            </div>
          </q-form>
        </q-card-section>
      </q-card>
    </q-dialog>
  <!--          tabla -->

    <q-table
      :filter="filter"
      title="CONSULTORES REGISTRADOS"
      :rows="data"
      :columns="columns"
      row-key="ci"
      :rows-per-page-options="[50,100]"
   >
       <template v-slot:top-right>
        <q-input borderless dense debounce="300" v-model="filter" placeholder="Buscar">
          <template v-slot:append>
            <q-icon name="search" />
          </template>
        </q-input>
      </template>
      <template v-slot:top-row>
        <q-btn
          color="primary"
          icon-right="archive"
          no-caps
          @click="exportTable"
        />
        </template>
     <template v-slot:body="props"> 
        <q-tr :props="props">
          <q-td key="ci" :props="props">
            {{props.row.ci}}
          </q-td>
          <q-td key="grado" :props="props">
            {{props.row.grado}}
          </q-td>
          <q-td key="nombrecompleto" :props="props">
            {{props.row.datosp}}
          </q-td>
           <q-td key="fechanacimiento" :props="props">
            {{props.row.fechaNacimiento}}
          </q-td>
            <q-td key="genero" :props="props">
            {{props.row.genero}}
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
          <q-td key="nit" :props="props">
            {{props.row.nit}}
          </q-td>
          
          <q-td key="opcion" :props="props">
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
              v-model="dato2.ci"
              type="text"
              label="C.I."
              hint="Ingresar Cedula de Identidad"
              lazy-rules
              :rules="[(val) => (val && val.length > 0) || 'Favor ingresa datos']"
            />
             <q-input
              outlined
              v-model="dato2.nit"
              type="text"
              label="N.I.T."
              hint="Ingresar su NIT"
            />
             <q-select
             outlined
            v-model="dato2.grado"
            :options="grados"
            label="Grado Academico"
            type="text"
            hint="Seleccionar Grado Academico"
           />
            <q-input
              outlined
              v-model="dato2.paterno"
              type="text"
              label="Apellido Paterno"
              hint="Ingresar Apellido Paterno"
              lazy-rules
              :rules="[(val) => (val && val.length > 0) || 'Favor ingresa datos']"
            />
            <q-input
              outlined
              v-model="dato2.materno"
              type="text"
              label="Apellido Materno"
              hint="Ingresar Apellido Materno"
             
            />
             <q-input
              outlined
              v-model="dato2.nombres"
              type="text"
              label="Nombres"
              hint="Ingresar Nombres"
              lazy-rules
              :rules="[(val) => (val && val.length > 0) || 'Favor ingresa datos']"
            />
             </div>
             <div class="col-6">
                 <q-select
             outlined
            v-model="dato2.genero"
            :options="generos"
            label="Genero"
            type="text"
            hint="Seleccionar Genero"
            />
             <q-input
                  outlined                  
                  type="date"
                  v-model="dato2.fechaNacimiento"
                  hint="Ingresar Fecha de Nacimiento"
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
              lazy-rules
              :rules="[v => !!v || 'Correo electronio requerido',
                    v => (v && v.length >= 7  && v.length <=50) || 'Cantidad de caracteres invalido',
                    v => (v || '').indexOf(' ') < 0 ||  'no se permite spacios en blanco',
                    v => /.+@.+\..+/.test(v) || 'correo invalido']"
            />
             <q-input
              outlined
              v-model="dato2.direccion"
              type="text"
              label="Direccion Domiciliaria"
              hint="Ingresar Direccion Domiciliaria"
            />
            <q-option-group
                v-model="dato2.observacion"
                :options="[{label:'Servidor publico', value:'SERVIDOR PUBLICO'},{label:'Natural', value:'NATURAL'}]"
                color="primary"
                inline
              />
                 <q-input v-if='dato2.observacion==="SERVIDOR PUBLICO"'
              outlined
              v-model="dato2.departamento"
              type="text"
              label="departamento"
              mask="XXXXXXXXXXXX"
              hint="Ingresar departamento de trabajo"
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
  { name: 'ci', required: true,align:"left", label:'C.I.',field: "ci", sortable: true},
  { name: 'grado', align:"left",label: 'Grado', field: 'grado', sortable: true },
  { name: 'nombrecompleto',align:"left", label: 'Nombre Completo', field: 'datosp', sortable: true },
  { name: 'fechanacimiento', align:"left",label: 'Fecha Nac.', field: 'fechanacimiento', sortable: true },
  { name: 'genero', align:"center",label: 'Genero', field: 'genero', sortable: true },
  { name: 'fono1', align:"center",label: 'Celular', field: 'fono1', sortable: true },
  { name: 'fono2', align:"center",label: 'Telefono', field: 'fono2', sortable: true },
  { name: 'email',align:"Center", label: 'Correo', field: 'email', sortable: true },
  { name: 'direccion', align:"left",label: 'Direccion', field: 'direccion', sortable: true },
  { name: 'nit',align:"center", label: 'nit', field: 'nit', sortable: true },
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
   selected: [],
   filter:'',
   errores: null,
   consultores:[],
   props:[],
   generos:[
      'HOMBRE',
      'MUJER'
  ],
   grados: [
        'LIC.',
        'ING.',
        'ABG.',
        'DIP.',
        'PHD.',
        'MED.',
        'MSC.',
      ],
  
   
   data:[],
   dato:{},
   columns,
   dato2:{},
 
    };
  },
  created(){
    this.misdatos()
  },
  methods:{
     onReset() {
      this.dato.nombres = null;
      this.dato.paterno = null;
      this.dato.materno = null;
      this.dato.ci = null;
      this.dato.nit = null;
      this.dato.datosp =null;
      this.dato.fechaNacimiento =null;
      this.dato.fono1 =null;
      this.dato.fono2 =null;
      this.dato.direccion =null;
      this.dato.email =null;
      this.dato.genero =null;
      this.dato.grado =null;
      this.dato.observacion=null;
      this.dato.departamento=null;
    },
    misdatos(){
    this.$q.loading.show();
       this.$api.get(process.env.API+"/consultor").then((res)=>{
         //console.log(res.data)
         this.data =res.data;
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
      this.$api.delete( process.env.API+"/consultor/" + this.dato2.id).then((res) => {
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
      this.$api.post(process.env.API+"/consultor/", this.dato).then((res) => {
       
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
//      this.dato2={ci:this.dato2.ci,paterno:this.dato2.paterno,materno:this.dato2.materno,nombres:this.dato2.nombres,fechaNacimiento:this.dato2.fechaNacimiento,fono1:this.dato2.fono1,fono2:this.dato2.fono2,grado:this.dato2.grado,datosp:this.dato2.nombres+" "+this.dato2.paterno+" "+this.dato2.materno,genero:this.dato2.genero,nit:this.dato2.nit,email:this.dato2.email,direccion:this.dato2.direccion}
      this.errores =null;
       this.$q.loading.show();
        this.dato.datosp =this.dato.nombres+" "+this.dato.paterno+" "+this.dato.materno; 
      // console.log(this.dato2.id)
      this.$api.put(process.env.API+"/consultor/"+this.dato2.id,this.dato2).then((res) => {
          if(res.data.res===true)
          {
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
          'consultores.csv',
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
