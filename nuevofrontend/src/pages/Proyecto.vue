<template> 
   <div class="q-pa-md">
     <q-btn
      label="Nuevo proyecto"
      color="positive"
      icon="add_circle"
      @click="alert = true"
      class="q-mb-xs"
    />
      <!--          ADICIONAR REGISTRO -->
   <q-dialog v-model="alert">
      <q-card style="max-width: 80%; width: 80%">
       
        <q-card-section class="bg-green-14 text-white">
          <div class="text-h6"><q-icon name="add_circle" /> Nuevo proyecto</div>
        </q-card-section>
        <q-card-section class="q-pt-xs">
          <q-form @submit="onSubmit" @reset="onReset" class="q-gutter-md">
                 <div class="row">
              <div class="col-6">
            <q-input
              outlined
              v-model="dato.ci"
              type="text"
              label="Programa"
              hint="Seleccionar el programa"
              lazy-rules
              :rules="[(val) => (val && val.length > 0) || 'Favor ingresa datos']"
            />
             <q-input
              outlined
              v-model="dato.codigo"
              type="text"
              label="Codigo"
              hint="Ingresar su Codigo"
            />
             <q-select
             outlined
            v-model="dato.departamentos"
            :options="departamentos"
            label="Departamentos"
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
              v-model="dato.link"
              type="text"
              label="link de la Reunion"
              hint="link de la reunion"
             
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
                  v-model="dato.fecha"
                  hint="Ingresar Fecha de Apertura"
                />
                <q-input
                  outlined                  
                  type="time"
                  v-model="dato.hora"
                  hint="Ingresar Hora de Apertura"
                />
            <q-input
              outlined
              v-model="dato.precio"
              type="number"
              label="precio Referencial"
              hint="Ingresar precio Referencial"
             
            />
            <q-input
              outlined
              v-model="dato.plazo"
              type="number"
              label="Plazo de Entrega"
              hint="Ingresar plazo de Entrega"
              
            />
            
             <q-input
              outlined
              v-model="dato.nombre"
              type="text"
              label="Nombre del proyecto"
              hint="Ingresar Nombre del proyecto"
             
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
      title="PROYECTOS"
      :rows="data"
      :columns="columns"
      row-key="nombre"
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
          <q-td key="Departamento" :props="props">
            {{props.row.departamento_id}}
          </q-td>
          <q-td key="programa" :props="props">
            {{props.row.programa}}
          </q-td>
          <q-td key="codigo" :props="props">
            {{props.row.codigo}}
          </q-td>
           <q-td key="nombre" :props="props">
            {{props.row.nombre}}
          </q-td>
            <q-td key="link" :props="props">
            {{props.row.link}}
          </q-td>
            <q-td key="fecha" :props="props">
            {{props.row.fecha}}
          </q-td>
           <q-td key="hora" :props="props">
            {{props.row.hora}}
          </q-td>
          <q-td key="precio" :props="props">
            {{props.row.precio}}
          </q-td>
          <q-td key="plazo" :props="props">
            {{props.row.plazo}}
          </q-td>
          <q-td key="lotes" :props="props">
            {{props.row.lotes}}
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
   { name: 'departamento', align:"center",label: 'Departamento', field: 'departamento', sortable: true },
  { name: 'programa',align:"center", label: 'Programa', field: 'programa', sortable: true },
  { name: 'codigo', align:"left", label:'Codigo(s)',field: "codigo", sortable: true},
  { name: 'nombre',required: true, align:"left",label: 'Nombre del Proyecto', field: 'nombre', sortable: true },
  { name: 'link',align:"left", label: 'link de la reunion', field: 'link', sortable: true },
  { name: 'fecha', align:"left",label: 'Fecha', field: 'fecha', sortable: true },
  { name: 'hora', align:"center",label: 'hora', field: 'hora', sortable: true },
  { name: 'precio', align:"center",label: 'Precio', field: 'precio', sortable: true },
  { name: 'plazo', align:"center",label: 'plazo', field: 'plazo', sortable: true },
  { name: 'lotes',align:"Center", label: 'Lotes', field: 'lotes', sortable: true },
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
  departamentos: [
        'LA PAZ',
        'ORURO',
        'COCHABAMBA',
        'SANTA CRUZ',
        'CHUQUISACA',
        'PANDO',
        'BENI',
        'POTOSI',
        'TARIJA'
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
    },
    misdatos(){
    this.$q.loading.show();
       this.$api.get(process.env.API+"/proyectos").then((res)=>{
         console.log(res.data)
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
      this.$api.delete( process.env.API+"/proyectos/" + this.dato2.id).then((res) => {
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
      this.$api.put(process.env.API+"/proyectos/"+this.dato2.id,this.dato2).then((res) => {
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
          'prroyectos.csv',
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
