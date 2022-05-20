<template>
   <div class="q-pa-md">
     <q-btn
      label="Nuevo Documento"
      color="red"
      icon="add_circle"
      @click="onalert()"
      class="q-mb-xs"
     />
     <!--          ADICIONAR REGISTRO -->
   <q-dialog v-model="alert">
      <q-card style="max-width: 80%; width: 80%">
        <q-card-section class="bg-green-14 text-white">
          <div class="text-h6"><q-icon name="add_circle" /> Nuevo Contrato</div>
        </q-card-section>
        <q-card-section class="q-pt-xs">
          <q-form @submit="onSubmit" @reset="onReset" class="q-gutter-md">
                 <div class="row">
              <div class="col-6">
            <q-select
             filled
              v-model="proyecto"
             use-input
              hide-selected
              fill-input
              input-debounce="0"
            :options="proyectos"
            label="proyecto asociado"
            @filter="filtarProyectos"
             @popup-hide="seleccion"
           >
             <template v-slot:no-option>
          <q-item>
            <q-item-section class="text-grey">
              NO HAY RESULTADOS DE BUSQUEDA
            </q-item-section>
          </q-item>
        </template>
        </q-select>
            <q-input
              outlined
              v-model="dato.nombre"
              type="text"
              label="Nombre unico de el contrato"
              hint="Ingresar nombre unico de contrato"
                 lazy-rules
              :rules="[(val) => (val && val.length > 0) || 'Favor ingresa datos']"

            />
            <q-input
              outlined
              v-model="dato.numero"
              type="text"
              label="Numero de contrato"
              hint="Ingresar Numero de contrato Ej.(02-2022)"
                 lazy-rules
              :rules="[(val) => (val && val.length > 0) || 'Favor ingresa datos']"

            />
            <q-input
              outlined
              v-model="dato.seguimiento"
              type="text"
              label="Nombre del seguimiento ejemplo FPS/02/2020"
              hint="Ingresar EL SEGUIMIENTO"

            />
            <q-input
              outlined
              v-model="dato.montobs"
              type="number"
              step=0.001
              label="Monto del Contrato Bs"
              hint="Ingresar monto en Bs"
            />
             <q-input
              outlined
              v-model="dato.montosus"
              type="number"
              step=0.01
              label="Nombre en Dolares"
              hint="Ingresar nombre en sus"
            />
             </div>
              <div class="col-6">
                <q-input
                  outlined
                  v-model="dato.codigos"
                  type="text"
                  label="codigo(s) de los proyectos"
                  hint="Ingresar codigo o codigos de los proyectos"
                />
                 <q-input
                  outlined
                  type="date"
                  v-model="dato.fechaini"
                  hint="Ingresar Fecha de Inicio de contrato"
                />
                <q-input
                  outlined
                  type="date"
                  v-model="dato.fechafin"
                  hint="Ingresar Fecha de fin de contrato"
                />
                <q-input
                    outlined
                    v-model="dato.duracion"
                    type="number"
                    step="1"
                    label="duracion exacta"
                    hint="Ingresar la duracion del contrato"
                  />
                   <q-input
                    outlined
                    v-model="dato.plus"
                    type="number"
                    step="1"
                    label="Duracion plus"
                    hint="Ingresar +/- duracion"
                  />
              <q-option-group
                v-model="dato.status"
                :options="[{label:'CONTRATO VIGENTE', value:'VIGENTE'},{label:'CONTRATO FINALIZADO', value:'CADUCO'}]"
                color="secondary"
                inline
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
      title="Lista de Contratos firmados"
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
           <q-td key="nombre" :props="props">
            {{props.row.proyecto.nombre}}
          </q-td>
          <q-td key="numero" :props="props">
            {{props.row.numero}}
          </q-td>
           <q-td key="seguimiento" :props="props">
            {{props.row.seguimiento}}
          </q-td>
           <q-td key="archivos" :props="props">
              <ul>
              <span v-for="(codigos,index) in props.row.archivos" :key="index">
                  <li>
                    {{codigos.nombre}}
                </li>
              </span>
             </ul>
          </q-td>
            <q-td key="opcion1" :props="props">
                                  <q-btn
                                    dense
                                    round
                                    flat
                                    color="green"
                                    @click="addRow(props)"
                                    icon="playlist_add"
                                  ></q-btn>
            </q-td>
           <q-td key="fechaini" :props="props">
            {{props.row.fechaini}}
          </q-td>
           <q-td key="fechafin" :props="props">
            {{props.row.fechafin}}
          </q-td>
             <q-td key="duracion" :props="props">
            {{props.row.duracion}}
          </q-td>
            <q-td key="plus" :props="props" >
               {{props.row.plus}}
          </q-td>
        <q-td key="montobs" :props="props">
            {{props.row.montobs}}
          </q-td>
           <q-td key="montosus" :props="props">
            {{props.row.montosus}}
          </q-td>
          <q-td key="status" :props="props">
            {{props.row.status}}
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
          <div class="text-h6">Agregar  Archivo |  Usuario:  {{$store.state.login.user.name}}</div>
        </q-card-section>
        <q-card-section class="q-pt-xs">
               <q-select
             outlined
            v-model="categoria"
            :options="categorias"
            label="categoria de documento"
            type="text"
            hint="Seleccionar Tipo de Documento"
           />
            <q-uploader
              class="full-width"
              label="Subir archivo PDF"
              :factory="uploadFile"
            />
              <q-input
              outlined
              v-model="archivo.nombre"
              type="text"
              label="Nombre del documento"
              hint="Ingresar el nombre del Documento"
              lazy-rules
              :rules="[(val) => (val && val.length > 0) || 'Favor ingresa datos']"
            />

        </q-card-section>
          <q-card-actions class="bg-green-14 text-white">
          <q-btn class="full-width" flat label="subir al servidor" v-close-popup />
        </q-card-actions>

      </q-card>
    </q-dialog>
  <!--hola   este es un o que funciona -->
      <q-dialog >
      <q-card style="max-width: 80%; width: 50%">
        <q-card-section class="bg-green-14 text-white">
          <div class="text-h6">Agregar  Archivo |  Usuario:  {{$store.state.login.user.name}}</div>
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
               <q-select
             outlined
            v-model="categoria"
            :options="categorias"
            label="categoria de documento"
            type="text"
            hint="Seleccionar Tipo de Documento"
           />
            <input type="file"
                  accept="application/pdf"
                  required
                   @change="escogerArchivo"
             >
              <q-input
              outlined
              v-model="archivo.nombre"
              type="text"
              label="Nombre del documento"
              hint="Ingresar el nombre del Documento"
              lazy-rules
              :rules="[(val) => (val && val.length > 0) || 'Favor ingresa datos']"
            />
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
  { name: 'nombre',required: true, align:"left",label: 'Nombre del Proyecto', field: 'nombre', sortable: true },
  { name: 'numero', align:"left",label: 'Numero del contrato', field: 'numero', sortable: true },
  { name: 'seguimiento',align:"left", label: 'Seguimiento', field: 'seguimiento', sortable: true },
  { name: 'archivos', label: 'lista de contratos PDF', field: 'archivos', sortable: false },
  { name: 'opcion1', label: 'Opcion', field: 'opcion1', sortable: false },
  { name: 'fechaini', align:"left",label: 'Fecha de Inicio de contrato', field: 'fechaini', sortable: true },
  { name: 'fechafin', align:"left",label: 'Fecha de Fin de contrato', field: 'fechafin', sortable: true },
  { name: 'duracion',align:"left", label: 'Duracion contrato', field: 'duracion', sortable: true },
  { name: 'plus', align:"center",label: 'plus', field: 'url', sortable: true },
  { name: 'montobs',align:"left", label: 'Monto de Contrato Bs', field: 'montobs', sortable: true },
  { name: 'montosus',align:"left", label: 'Monto de Contrato SUS', field: 'montosus', sortable: true },
  { name: 'status',align:"left", label: 'Status', field: 'status', sortable: true },
  { name: 'observacion',align:"left", label: 'Observacion', field: 'observacion', sortable: true },
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
   archivo:{},
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
   proyectos:[],
   proyecto:{},
   columns,
   options:[],
   file:null,


       };
  },
  computed:{
    //nombre1: function () {
   //   return this.proyectos1[parseInt(this.proyecto.pos)].nombre;
   // }

  },
  created(){
    this.misdatos()
    this.cargardatos()
  },

  methods:{
    filtarProyectos (val, update, abort){
         update(() => {
          const needle = val.toLowerCase()
          this.proyectos= this.options.filter(v => v.label.toLowerCase().indexOf(needle) > -1)
        })
    },
    seleccion(){
      this.dato.nombre=this.proyectos1[parseInt(this.proyecto.pos)].nombre;
      this.dato.montobs=this.proyectos1[parseInt(this.proyecto.pos)].precio;
      this.dato.duracion=this.proyectos1[parseInt(this.proyecto.pos)].plazo;
          this.dato.codigos="";
          this.dato.codigos="";
      this.proyectos1[parseInt(this.proyecto.pos)].codigos.forEach(tipo => {

        this.dato.codigos =this.dato.codigos+tipo.nombre+ " - ";
        });
      this.dato.status="VIGENTE"
     // this.dato.fechaini=new Date('01/01/2022');
    //  this.dato.fechafin=this.dato.fechaini+this.dato.duracion;
       this.dato.numero ="01-2022"
       this.dato.plus =90
       this.dato.seguimiento="FPS/GDLP/"+ this.proyectos1[parseInt(this.proyecto.pos)].programa.nombre;



    },
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
    onalert() {
         this.categoria=this.categorias[0]
         this.usuario=this.usuarios[0]
         this.proyecto=this.proyectos[0]
        this.alert=true;
        //if(this.proyecto.value){
         //this.dato.nombre=this.proyectos1[parseInt(this.proyecto.pos)].nombre;
         //this.proyecto.value
        //}


     },
    onReset() {
        this.dato.nombre = null;
        this.proyectos = this.proyectos[0]
        this.categoria=this.categorias[0]
        this.usuario=this.usuarios[0]
     },
    escogerArchivo(event){
      this.file = event.target.files[0];
    },
    addRow(item) {
      this.dato2 = item.row;
       this.model=null,
      this.categoria=this.categorias[1];
      this.archivo.nombre="Contrato N° "+item.row.numero
      this.dialog_add = true;
    },
    cargardatos(){
        this.categorias=[];
        this.$q.loading.show();
         this.proyectos=[];
         this.$api.get(process.env.API+"/proyectos").then((res)=>{
           this.proyectos1=res.data;
            let num=0;
            res.data.forEach(pro=> {
            this.proyectos.push({label:pro.nombre,value:pro.id, pos:num});
            num=num+1;
             this.$q.loading.hide();
            });
              });
         this.options=this.proyectos;
         this.$q.loading.show();
         this.categorias=[];
         this.$api.get("/categorias").then((res)=>{
            res.data.forEach(cat=> {
            this.categorias.push({label:cat.nombre,value:cat.id});
            this.$q.loading.hide();
        });
        this.categoria=this.categorias[0]
          });
      ///  console.log(this.proyectos1)

        this.categoria=this.categorias[1]
        this.usuario=this.usuarios[0]
        this.proyecto=this.proyectos[0]

    },
    misdatos(){
    this.$q.loading.show();
       this.$api.get(process.env.API+"/contratos").then((res)=>{
        console.log(res.data);
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
      //this.archivo.user_id =this.$store.state.login.user.id;
     // this.archivo.categoria_id = this.categoria.value;

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
     uploadFile(files){
       this.$q.loading.show()
      const fileData= new FormData()
      fileData.append('archivo',files[0])
      fileData.append('contrato_id',this.dato2.id)
      fileData.append('nombre',this.archivo.nombre)
      fileData.append('categoria_id',this.categoria.value)
      fileData.append('user_id',this.$store.state.login.user.id)
      this.$api.post(process.env.API+'/upload',fileData)
      .then(res=>{
        console.log(res.data)
          this.dialog_add = false;
        this.misdatos()
      })

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

       this.dato.proyecto_id =this.proyecto.value
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
