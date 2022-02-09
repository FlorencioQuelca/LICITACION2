<template> 
   <div class="q-pa-md">
     <q-btn
      label="Nuevo Documento"
      color="red"
      icon="add_circle"
      @click="onaalert()"
      class="q-mb-xs"
     />
     <!--          ADICIONAR REGISTRO -->
   <q-dialog v-model="alert">
      <q-card style="max-width: 80%; width: 80%">
       
        <q-card-section class="bg-green-14 text-white">
          <div class="text-h6"><q-icon name="add_circle" /> Nuevo Documento</div>
        </q-card-section>
        <q-card-section class="q-pt-xs">
          <q-form @submit="onSubmit" @reset="onReset" class="q-gutter-md">
                 <div class="row">
              <div class="col-12">
            <q-select
             outlined
            v-model="categoria"
            :options="categorias"
            label="categoria de documento"
            type="text"
            hint="Seleccionar Tipo de Documento"
           />
            <q-input
              outlined
              v-model="dato.nombre"
              type="text"
              label="Nombre del documento"
              hint="Ingresar nombre de Documento"
              
            />
             <q-select
             outlined
            v-model="usuario"
            :options="usuarios"
            label="Funcionario Publico que sube el documento"
            type="text"
            hint="Seleccionar un Funcionario Publico"
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
  <!--          tabla PRINCIPOAL -->

    <q-table
      :filter="filter"
      title="Lista de Documentos Compartidos"
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
      
     <template v-slot:body="props"> 
        <q-tr :props="props">
           <q-td key="fecha" :props="props">
            {{props.row.fecha}}
          </q-td>
           <q-td key="hora" :props="props">
            {{props.row.hora}}
          </q-td>
             <q-td key="categoria" :props="props">
            {{props.row.categoria.nombre}}
          </q-td>
          <q-td key="nombre" :props="props">
            {{props.row.nombre}}
          </q-td>
        <q-td key="usuario" :props="props">
            {{props.row.user.name}}
          </q-td>     
           <q-td key="url" :props="props" >
               {{props.row.url}}
          </q-td>               
            <q-td key="opcion" :props="props">
                      <q-btn
                        dense
                        round
                        flat
                        color="green"
                        @click="addRow(props)"
                        icon="upload"
                      ></q-btn>
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
                        color="green"
                        @click="descargar(props)"
                        icon="download"
                      ></q-btn>
            </q-td>      
       </q-tr>
      </template>
    </q-table>
   

    
          <!-- VER LISTA de PERSONAS Y ELIMINAR />-->
   <q-dialog v-model="dialog_list1">
      <q-card style="max-width: 80%; width: 80%">
        <q-card-section class="bg-green-14 text-white">
          <div class="text-h6">Lista de consultores presentados</div>
        </q-card-section>
        <q-card-section class="q-pt-xs">
                <q-table
                    title="Lista de oferentes"
                    :rows="dato2.personas"
                    :columns="subcol1"
                    >
      <template v-slot:body="props">
          <q-tr :props="props">
          <q-td key="nombre" :props="props">
            {{ props.row.datosp}}
          </q-td>
          <q-td key="ci" :props="props">
            {{ props.row.ci}}
          </q-td>
           <q-td key="fecha" :props="props">
            {{ props.row.fechaNacimiento}}
          </q-td>
          <q-td key="opcion" :props="props">
                        <q-btn
                        dense
                        round
                        flat
                        color="red"
                        @click="deletesub1(props)"
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

       <!-- VER LISTAR de EMPRESAS y sociedades Y ELIMINAR />-->
   <q-dialog v-model="dialog_list2">
      <q-card style="max-width: 80%; width: 80%">
        <q-card-section class="bg-green-14 text-white">
          <div class="text-h6">Lista de empresas y/o Sociedades presentados</div>
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
                    title="Lista de oferentes"
                    :rows="dato2.empresas"
                    :columns="subcol2"
                    :rows-per-page-options="[5,10]"
                    >
      <template v-slot:body="props">
          <q-tr :props="props">
          <q-td key="nit" :props="props">
            {{ props.row.nit}}
          </q-td>
          <q-td key="nombre" :props="props">
            {{ props.row.nombreEmpresa}}
          </q-td>
           <q-td key="monto" :props="props">
            {{ props.row.pivot.monto}}
          </q-td>
          <q-td key="opcion" :props="props">
                        <q-btn
                        dense
                        round
                        flat
                        color="red"
                        @click="deletesub2(props)"
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
          <q-card-section v-else class="q-pt-xs">
                <q-table
                    title="Lista de oferentes"
                    :rows="dato2.sociedads"
                    :columns="subcol3"
                    :rows-per-page-options="[5,10]"
                    >
      <template v-slot:body="props">
          <q-tr :props="props">
          <q-td key="codigo" :props="props">
            {{ props.row.codigo}}
          </q-td>
          <q-td key="nombre" :props="props">
            {{ props.row.nombreEmpresa}}
          </q-td>
           <q-td key="monto" :props="props">
            {{ props.row.pivot.monto}}
          </q-td>
              <q-td key="asociados" :props="props">
              <ul>
              <span v-for="(asociados,index) in props.row.asociados" :key="index">
                  <li>
                    {{asociados.empresa.nit}}  ({{asociados.participacion}}) % - {{asociados.empresa.nombreEmpresa}}         
                </li>
              </span>
            </ul>
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

  <!-- empresas asociados  adicionar archivo pdf/>-->
      <q-dialog v-model="dialog_add">
      <q-card style="max-width: 80%; width: 50%">
        <q-card-section class="bg-green-14 text-white">
          <div class="text-h6">Agregar Archivo</div>
        </q-card-section>
        <q-card-section class="q-pt-xs">
      
          <q-form method="post" @submit="onAdd" class="q-gutter-md" enctype="multipart/form-data"  >
       <!--      
           <q-file filled bottom-slots v-model="model" label="Contrato" counter>
            <template v-slot:prepend>
             <q-icon name="cloud_upload" @click.stop />
             </template>
             <template v-slot:append>
             <q-icon name="close" @click.stop="model = null" class="cursor-pointer" />
             </template>

            <template v-slot:hint>
              tamaño del archivo
            </template>
              </q-file> -->
            <input type="file" 
                  accept="application/pdf"
                  required
                   @change="escogerArchivo"
             >
       
            <div>
              <q-btn label="Agregar" type="submit" color="positive" icon="add_circle" />
              <q-btn label="Cancelar" icon="delete" color="negative" v-close-popup />
            </div>
          </q-form>
        </q-card-section>
      </q-card>
    </q-dialog>
<!--          MODIFICAR REGISTRO -->
    <q-dialog v-model="dialog_mod">
      <q-card style="max-width: 80%; width: 80%">
        
        <q-card-section class="bg-green-14 text-white">
          <div class="text-h6"><q-icon name="edit"/> Modificar Registro</div>
        </q-card-section>
       
        <q-card-section class="q-pt-xs">
          <q-form @submit="onMod" class="q-gutter-md">
                <div class="row">
              <div class="col-12">
            <q-select
             outlined
            v-model="categoria"
            :options="categorias"
            label="categoria de documento"
            type="text"
            hint="Seleccionar Tipo de Documento"
           />
            <q-input
              outlined
              v-model="dato2.nombre"
              type="text"
              label="Nombre del documento"
              hint="Ingresar nombre de Documento"
              
            />
             <q-select
             outlined
            v-model="usuario"
            :options="usuarios"
            label="Funcionario Publico que sube el documento"
            type="text"
            hint="Seleccionar un Funcionario Publico"
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
const  columns= [
   { name: 'fecha', align:"left",label: 'Fecha', field: 'fecha', sortable: true },
  { name: 'hora', align:"center",label: 'hora', field: 'hora', sortable: true },
  { name: 'categoria',align:"center", label: 'Categoria', field: 'categoria', sortable: true },
  { name: 'nombre',required: true, align:"left",label: 'Nombre del Proyecto', field: 'nombre', sortable: true },
  { name: 'usuario', align:"center",label: 'Usuario', field: 'usuario', sortable: true },
  { name: 'url', align:"center",label: 'URL', field: 'url', sortable: true },
 
 { name: 'opcion', label: 'Opcion', field: 'opcion', sortable: false }
   ]

export default {
  
  data() {
    return {
    alert:false,
   dialog_mod:false,
   dialog_list:false,
   dialog_list1:false,
   dialog_list2:false,
   dialog_list3:false,
   dialog_add:false,
   selected: [],
   filter:'',
  props:[],
  model:null,
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
      dato2:{},
   categorias:[],
   categoria:{},
   usuarios:[],
   usuario:{},
   columns,
   file:null,
   
       };
  },
  created(){
    this.misdatos() 
    this.cargardatos()
  },
  
  methods:{
     editRow(item) {
      this.dato2 = item.row
      this.usuario={}
      this.usuarios.forEach(user => {
           if(user.value===item.row.user_id)   
                this.usuario={label:user.label,value:user.value};
        }); 
 
    this.categoria={}
      this.categorias.forEach(tipo => {
           if(tipo.value===item.row.categoria_id)   
                this.categoria={label:tipo.label,value:tipo.value};
        }); 
     this.dialog_mod = true;
    },
    onaalert() {
        this.dato.nombre = null;
       this.categoria=this.categorias[0]
        this.usuario=this.usuarios[0]
        this.alert=true;
     },
    onReset() {
        this.dato.nombre = null;
       this.categoria=this.categorias[0]
        this.usuario=this.usuarios[0]
     },
    escogerArchivo(event){
      this.file = event.target.files[0];
    },
    addRow(item) {
      this.dato2 = item.row;
       this.model=null,
      this.dialog_add = true;
    },
    cargardatos(){
        this.categorias=[];
        this.$q.loading.show();
       this.$api.get(process.env.API+"/categorias").then((res)=>{
       
       res.data.forEach(cat=> {
            this.categorias.push({label:cat.nombre,value:cat.id});
        });
        
       });
      this.usuarios=[];
       this.$api.get(process.env.API+"/users").then((res)=>{
       
       res.data.forEach(user => {
            this.usuarios.push({label:user.name,value:user.id});
        });
        
       });
        this.categoria=this.categorias[0]
        this.usuario=this.usuarios[0]
    
    },
    misdatos(){
    this.$q.loading.show();
       this.$api.get(process.env.API+"/contratos").then((res)=>{
    
         this.data =res.data;
    this.$q.loading.hide();
       });
    },
     verRow(item) {
      this.dato2 = item.row;
      this.dialog_list = true;
    },
   
    onAdd() {
      this.$q.loading.show();
      let archivo =new FormData();
      archivo.append('file',this.file);
      archivo.append('_method','PUT');
      
             this.$api.post(process.env.API + "/setPdf/"+this.dato2.id,archivo).then((res) => {
                              this.$q.notify({
                          color: "green-4",
                          textColor: "white",
                          icon: "cloud_done",
                          message: "Agregado - Archivo correctamente",
                        });
                       this.dialog_add = false;
                        this.misdatos();  
                        this.onReset();
                      //  console.log(res.data)
                        });
      
     },
     descargar(item) {
        this.dato2 = item.row;
      this.$q.loading.show();
             // console.log(this.dato2.id);
             this.$api.get(process.env.API + "/getPdf/"+this.dato2.id,{responseType: 'blob'}).then((response) => {
                  /*  var fileURL = window.URL.createObjectURL(new Blob([response.data]));
                     var fURL = document.createElement('a');
    
                     fURL.href = fileURL;
                     fURL.setAttribute('download', 'uno1.pdf');
                     document.body.appendChild(fURL);
     */
    let blob = new Blob([response.data], { type: 'application/pdf' })
      let link = document.createElement('a')
      link.href = window.URL.createObjectURL(blob)  
      link.download = this.dato2.nombre;
      document.body.appendChild(link);
      link.click()
                    
                      // this.dialog_add = false;
                       // this.misdatos();  
                           this.$q.loading.hide();
                        console.log(response.data)
                        });
                      
      
     },
      onSubmit() {
     
       this.dato.categoria =this.categoria.value
       this.dato.usuario =this.usuario.value
       
      this.$q.loading.show();
      this.$api.post(process.env.API+"/contratos", this.dato).then((res) => {
       
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
         
          }
         this.alert= false;
          this.misdatos();
        this.onReset();
        }).catch((e)=>{
          this.$q.loading.hide();
       
        });
    },
     onMod() {
   
       this.$q.loading.show();
       this.dato2.categoria_id=this.categoria.value;
       this.dato2.user_id=this.usuario.value;
   
      this.$api.put(process.env.API+"/contratos/"+this.dato2.id,this.dato2).then((res) => {
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
           
          }
         this.dialog_mod = false;
          this.misdatos();
        }).catch((e)=>{
          this.$q.loading.hide();
        
        });
    }, 
  },

};
</script>
