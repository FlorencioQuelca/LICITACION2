<template> 
   <div class="q-pa-md">
     <q-btn
      label="Nuevo proyecto para Licitación"
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
         <errores
         v-if="errores !== null" 
          :errores="errores"
        ></errores>
        <q-card-section class="q-pt-xs">
          <q-form @submit="onSubmit" @reset="onReset" class="q-gutter-md">
                 <div class="row">
              <div class="col-6">
                 <q-select
             outlined
            v-model="depa"
            :options="departamentos"
            label="Departamentos"
            type="text"
            hint="Seleccionar Departamento"
             lazy-rules
              :rules="[(val) => val!='' && val!=null || 'Por favor ingresa datos']"
           />
            <q-select
             outlined
            v-model="tipo"
            :options="tipos"
            label="Categoria"
            type="text"
            hint="Seleccionar Categoria"
             lazy-rules
              :rules="[(val) => val!='' && val!=null || 'Por favor ingresa datos']"
           />
           <q-select
             outlined
            v-model="prog"
            :options="programas"
            label="Programas"
            type="text"
            hint="Seleccionar Programa"
             lazy-rules
              :rules="[(val) => val!='' && val!=null || 'Por favor ingresa datos']"
           />
          
            <q-input
              outlined
              v-model="dato.nombre"
              type="text"
              label="Nombre del proceso"
              hint="Ingresar el nombre del proceso"
              lazy-rules
              :rules="[(val) => (val && val.length > 0) || 'Favor ingresa datos']"
            />
            <q-input
              outlined
              v-model="dato.cuce"
              type="text"
              label="escriba el CUCE"
              hint="Ingresar el CUCE del proceso"
            
            />
             <q-input
              outlined
              v-model="dato.link"
              type="text"
              label="Enlace meet/zoom/otro"
              hint="Ingresar enlace para zoom"
            />
           
             </div>
             <div class="col-6">  
             <q-input
                  outlined                  
                  type="date"
                  v-model="dato.fecha"
                  hint="Ingresar Fecha de Apertura"
                   lazy-rules
              :rules="[(val) => val!='' && val!=null || 'Por favor ingresa datos']"
                />
                <q-input
                  outlined                  
                  type="time"
                  v-model="dato.hora"
                  hint="Ingresar Hora de Apertura"
                   lazy-rules
              :rules="[(val) => val!='' && val!=null || 'Por favor ingresa datos']"
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
              v-model="dato.lotes"
              type="text"
              label="Numero de Lotes"
              hint="Ingresar numero de lotes"
             
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
  <!--          tabla -->

    <q-table
      :filter="filter"
      title="PROYECTOS REGISTRADOS PARA LICITACION"
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
          <q-td key="departamento" :props="props">
            {{props.row.departamento.nombre}}
          </q-td>
          <q-td key="programa" :props="props">
            {{props.row.programa.nombre}}
          </q-td>
           <q-td key="tipo" :props="props">
            {{props.row.tipo.nombre}}
          </q-td>
          <q-td key="codigo" :props="props">
            {{props.row.codigo}}
          </q-td>
           <q-td key="codigos" :props="props">
              <ul>
              <span v-for="(codigos,index) in props.row.codigos" :key="index">
                  <li>
                    {{codigos.nombre}}        
                </li>
              </span>
             </ul>
          </q-td>
            <q-td key="action" :props="props">
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
           <q-td key="nombre" :props="props">
            {{props.row.nombre}}
          </q-td>
           <q-td key="action1" :props="props">
                      <q-btn
                        dense
                        round
                        flat
                        color="purple"
                        @click="addRow1(props)"

                        icon="style"
                      ></q-btn>
            </q-td>      
           <q-td key="cuce" :props="props">
            {{props.row.cuce}}
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
           <q-select
             outlined
             v-model="depa"
              label="Departamentos"
            :options="departamentos"
             lazy-rules
              :rules="[(val) => val!='' && val!=null || 'Por favor ingresa datos']"
           />
            <q-select
             outlined
            v-model="tipo"
            :options="tipos"
            label="Categoria"
            type="text"
            hint="Seleccionar Categoria"
            
             lazy-rules
              :rules="[(val) => val!='' && val!=null || 'Por favor ingresa datos']"
           />
           <q-select
             outlined
            v-model="prog"
            :options="programas"
            label="Programas"
            type="text"
            hint="Seleccionar Programa"
             lazy-rules
              :rules="[(val) => val!='' && val!=null || 'Por favor ingresa datos']"
           />
            <q-input
              outlined
              v-model="dato2.nombre"
              type="text"
              label="Nombre del proceso"
              hint="Ingresar el nombre del proceso"
              lazy-rules
              :rules="[(val) => (val && val.length > 0) || 'Favor ingresa datos']"
            />
            <q-input
              outlined
              v-model="dato2.cuce"
              type="text"
              label="escriba el CUCE"
              hint="Ingresar el CUCE del proceso"
            />
             <q-input
              outlined
              v-model="dato2.link"
              type="text"
              label="Enlace meet/zoom/otro"
              hint="Ingresar su Codigo"
            />
             </div>
             <div class="col-6">  
             <q-input
                  outlined                  
                  type="date"
                  v-model="dato2.fecha"
                  hint="Ingresar Fecha de Apertura"
                   lazy-rules
              :rules="[(val) => val!='' && val!=null || 'Por favor ingresa datos']"
                />
                <q-input
                  outlined                  
                  type="time"
                  v-model="dato2.hora"
                  hint="Ingresar Hora de Apertura"
                   lazy-rules
              :rules="[(val) => val!='' && val!=null || 'Por favor ingresa datos']"
                />
            <q-input
              outlined
              v-model="dato2.precio"
              type="number"
              label="precio Referencial"
              hint="Ingresar precio Referencial"
            />
            <q-input
              outlined
              v-model="dato2.plazo"
              type="number"
              label="Plazo de Entrega"
              hint="Ingresar plazo de Entrega"
            />
             <q-input
              outlined
              v-model="dato2.lotes"
              type="text"
              label="Numero de Lotes"
              hint="Ingresar numero de lotes"
             
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


      <!-- empresas asociados  adicionar codigo/>-->
      <q-dialog v-model="dialog_add">
      <q-card style="max-width: 80%; width: 50%">
        <q-card-section class="bg-green-14 text-white">
          <div class="text-h6">Agregar Codigo</div>
        </q-card-section>
        <q-card-section class="q-pt-xs">
      
          <q-form @submit="onAdd" class="q-gutter-md">
            <q-input
              outlined
              v-model="codigo.nombre"
              type="text"
              label="Codigo de proyecto"
              hint="Ingresar codigo de proyecto"
               lazy-rules
              :rules="[(val) => val!='' && val!=null || 'Por favor ingresa datos']"
            />
       
            <div>
              <q-btn label="Agregar" type="submit" color="positive" icon="add_circle" />
              <q-btn label="Cancelar" icon="delete" color="negative" v-close-popup />
            </div>
          </q-form>
        </q-card-section>
      </q-card>
    </q-dialog>
      <!-- empresas asociados  VER LISTA Y ELIMINAR />-->
   <q-dialog v-model="dialog_list">
      <q-card style="max-width: 80%; width: 50%">
        <q-card-section class="bg-green-14 text-white">
          <div class="text-h6">Codigos</div>
        </q-card-section>
        <q-card-section class="q-pt-xs">
                <q-table
                    title="Codigos de proyecto"
                    :rows="dato2.codigos"
                    :columns="subcol"
                    
                    >
      <template v-slot:body="props">
          <q-tr :props="props">
          <q-td key="nombre" :props="props">
            {{ props.row.nombre}}
          </q-td>
          <q-td key="opcion" :props="props">
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
  { name: 'tipo', align:"tipo", label:'Tipos',field: "tipo", sortable: true},
  { name: 'codigos', align:"left", label:'Codigo(s)',field: "codigos", sortable: true},
  { name: 'action', align:"center",label: 'Accion', field: 'action' },
  { name: 'nombre',required: true, align:"left",label: 'Nombre del Proyecto', field: 'nombre', sortable: true },
  { name: 'action1', align:"center",label: 'Detalle', field: 'action1'},
  { name: 'cuce',align:"Center", label: 'cuce', field: 'cuce', sortable: true },
  { name: 'link',align:"left", label: 'link de la reunion', field: 'link', sortable: true },
  { name: 'fecha', align:"left",label: 'Fecha', field: 'fecha', sortable: true },
  { name: 'hora', align:"center",label: 'hora', field: 'hora', sortable: true },
  { name: 'precio', align:"center",label: 'Precio', field: 'precio', sortable: true },
  { name: 'plazo', align:"center",label: 'plazo', field: 'plazo', sortable: true },
  { name: 'lotes',align:"Center", label: 'Lotes', field: 'lotes', sortable: true },
  { name: 'opcion', label: 'Opcion', field: 'opcion' }
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
   dialog_delsub: false,
   selected: [],
   filter:'',
   errores: null,
   consultores:[],
   props:[],
   departamentos: [],
  depa:{},
  programas:[],
  prog:{},
  tipos:[],
  tipo:{},
  codigo:{},
  codigos:[],
proyecto:{},
   subcol: [
        {
          name: "nombre",
          required: true,
          label: "Codigo de Proyecto",
          align: "left",
         // field: (row.codigos) => row.nombre,
        // field: row => row.name,
       // format: val => `${val}`,
         field:"nombre",
         sortable: true,
        },
        {
          name: "opcion",
          label: "opcion",
          align: "rigth",
         // field: (row) => row.codigo,
          field:"opcion",
         sortable: true,
        },
   ],

   data:[],
   dato:{},
   columns,
   dato2:{},
   dato3:{},
   options:{},
      };
  },
  created(){
    this.misdatos()
    this.cargardatos()
   
  },
  methods:{
     onReset() {
      this.dato.fecha=null;
      this.dato.hora =null;
      this.dato.link =null;
      this.dato.nombre =null;
      this.dato.precio =null;
      this.dato.plazo =null;
      this.dato.lotes =null;
      this.dato.cuce =null;
      this.depa=this.departamentos[0]
      this.prog=this.programas[0]
      this.tipo=this.tipos[0]
    },
    misdatos(){
    this.$q.loading.show();
       this.$api.get(process.env.API+"/proyectos").then((res)=>{
        console.log(res.data)
         this.data =res.data;
    this.$q.loading.hide();
       });

    },
    cargardatos(){
        this.departamentos=[];
        this.$q.loading.show();
       this.$api.get(process.env.API+"/departamentos").then((res)=>{
       res.data.forEach(depa => {
            this.departamentos.push({label:depa.nombre,value:depa.id});
        });
        
       });
      this.programas=[];
       this.$api.get(process.env.API+"/programas").then((res)=>{
       res.data.forEach(prog => {
            this.programas.push({label:prog.nombre,value:prog.id});
        });
        
       });
     this.tipos=[];
       this.$api.get(process.env.API+"/tipos").then((res)=>{
       res.data.forEach(tipo => {
            this.tipos.push({label:tipo.nombre,value:tipo.id});
        }); 
      //  console.log('ok')
        this.$q.loading.hide();
       });

        this.depa=this.departamentos[0]
      this.prog=this.programas[0]
      this.tipo=this.tipos[0]
    },
   editRow(item) {
      this.dato2 = item.row
 //console.log(this.depa);
     
    //this.depa={label:this.nombre, value:item.row.departamento_id}
    this.depa={}
      this.departamentos.forEach(tipo => {
           if(tipo.value===item.row.departamento_id)   
                this.depa={label:tipo.label,value:tipo.value};
        }); 
      //  console.log(this.depa);
    this.prog={}
      this.programas.forEach(tipo => {
           if(tipo.value===item.row.programa_id)   
                this.prog={label:tipo.label,value:tipo.value};
        }); 
    this.tipo={}
      this.tipos.forEach(tipo => {
           if(tipo.value===item.row.tipo_id)   
                this.tipo={label:tipo.label,value:tipo.value};
        });
      this.dialog_mod = true;
    },
    addRow(item) {
      this.dato2 = item.row;
      this.codigo={}
      this.dialog_add = true;
    },
    addRow1(item) {
      this.proyecto= item.row;
      this.$router.push({name:'detalle1',params:{title:'hola11111'}});
      console.log(this.proyecto);
    },
     verRow(item) {
      this.dato2 = item.row;
      this.dialog_list = true;
    },
    deletesub(item) {
      this.dato3 = item.row;
      this.dialog_delsub = true;
    },
    onDelsub() {
      this.$q.loading.show();
       this.$api.put(process.env.API + "/codigoproyectos/"+this.dato2.id,this.dato3).then((res) => {
                              this.$q.notify({
                          color: "green-4",
                          textColor: "white",
                          icon: "cloud_done",
                         mssage: "Eliminado correctamente",
        });
        this.dialog_delsub = false; 
        this.misdatos();
      });
    },
    onAdd() {
      this.$q.loading.show();
       this.$api.get(process.env.API + "/codigofound/"+this.codigo.nombre).then((res1) => {
        console.log(res1.data)
            if(res1.data.length===0) {
              this.$api.post(process.env.API + "/codigos/", this.codigo).then((res2) => {
                    console.log("adicionado correctamente")
                         console.log(res2.data) 
                     this.$api.put(process.env.API + "/codigoproyectos1/"+this.dato2.id,res2.data).then((res) => {
                              this.$q.notify({
                          color: "green-4",
                          textColor: "white",
                          icon: "cloud_done",
                          message: "Agregado - codigo correctamente",
                        });
                       this.dialog_add = false;
                        this.misdatos(); 
                         console.log("entro a nuevo")
                         console.log(res.data) 
                        });
                    });    
              
           }else{
                console.log("encontrado correctamente")
                         console.log(res1.data) 
                  this.$api.put(process.env.API + "/codigoproyectos1/"+this.dato2.id,res1.data[0]).then((res) => {
                              this.$q.notify({
                          color: "green-4",
                          textColor: "white",
                          icon: "cloud_done",
                          message: "Agregado - codigo correctamente",
                        });
                       this.dialog_add = false;
                        this.misdatos();  
                         console.log(res.data)
                        });


           }
       });
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
      this.$q.loading.show();
       
       this.dato.departamento_id=this.depa.value;
       this.dato.programa_id=this.prog.value;
       this.dato.tipo_id=this.tipo.value;
      console.log(this.dato)
      this.$api.post(process.env.API+"/proyectos/", this.dato).then((res) => {
       
         if(res.data.res===true)
          {
            this.$q.notify({ 
            color: "green-4",
            textColor: "white",
            icon: "cloud_done",
            message: "Creado Correctamente",
          });
          
          }else{
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
    //modificar 
     onMod() {
      this.errores =null;
       this.$q.loading.show();
      this.dato2.departamento_id=this.depa.value;
       this.dato2.programa_id=this.prog.value;
       this.dato2.tipo_id=this.tipo.value;
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
