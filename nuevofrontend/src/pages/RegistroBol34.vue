<template>
 <div class="q-pa-md">
    <div >
       <q-btn   v-if="secre[0]==='SECRETARIA' || this.$store.state.login.user.tipo==='admin'"
      label="Nuevo Registro"
      color="red"
      icon="add_circle"
      @click="verNuevo"
      class="q-mb-xs"
    />
    </div>
  <!--          tabla PRINCIPAL -->
    <q-table
      :filter="filter"
      title="REGISTRO DE PROYECTOS BOL34"
      :rows="data"
      :columns="columns"
      row-key="nombre"
      :rows-per-page-options="[10,20,50,0]"
      separator="cell"
   >
       <template v-slot:top-right>
        <q-input outlined borderless dense debounce="300" v-model="filter" placeholder="Buscar">
          <template v-slot:append>
            <q-icon name="search" />
          </template>
        </q-input>
      </template>

     <template v-slot:body="props">
        <q-tr :props="props" >
          <q-td key="nro" :props="props">
            {{props.row.nro}}
          </q-td>
           <q-td key="codigo" :props="props">
            {{props.row.codigo}}
          </q-td>
           <q-td key="municipio" :props="props">
            {{props.row.municipio}}
          </q-td>
           <q-td key="nombre" :props="props">
            <div v-if="props.row.status==='PRIORIZADO'" style="color:blue; font-weight:700">
            {{props.row.nombre}}
            </div>
            <div v-if="props.row.status==='ENVIADO'" style="color:green; font-weight:700">
            {{props.row.nombre}}
            </div>
            <div  v-if="props.row.status==='RECIBIDO' || props.row.status===null">
               <q-btn v-if="secre[0]!=='SECRETARIA' || this.$store.state.login.user.tipo==='admin'"
                        dense
                        round
                        flat
                        color="blue"
                        @click="verRow1(props)"
                        icon="info"
               ></q-btn>{{props.row.nombre}}
            </div>
          </q-td>
           <q-td key="cite" :props="props">
            {{props.row.cite}}
          </q-td>

           <q-td key="archivo" :props="props">
            {{props.row.interno}}
          </q-td>
           <q-td key="monto" :props="props">
            {{props.row.adjunto}}
          </q-td>
           <q-td key="fecha" :props="props">
            {{props.row.fecha}}
          </q-td>
         <q-td key="funcionarios" :props="props">
              <ul>
              <span v-for="(persona,index) in props.row.users" :key="index">
                  <li >
                    {{persona.name}}
                </li>
              </span>
             </ul>
          </q-td>

           <q-td key="fecha1" :props="props">
            {{props.row.carta_fecha}}
          </q-td>
           <q-td key="estado" :props="props">
            {{props.row.status}}
          </q-td>
            <q-td  key="opcion" :props="props">
                      <q-btn v-if="secre[0]==='SECRETARIA' || this.$store.state.login.user.tipo==='admin'"
                        dense
                        round
                        flat
                        color="green"
                        @click="addRow2(props)"
                        icon="playlist_add"
                      ></q-btn>
                        <q-btn v-if="secre[0]==='SECRETARIA' || this.$store.state.login.user.tipo==='admin'"
                        dense
                        round
                        flat
                        color="green"
                        @click="verRow2(props)"
                        icon="list"
                      ></q-btn>
                        <q-btn v-if="secre[0]!=='SECRETARIA' || this.$store.state.login.user.tipo==='admin'"
                        dense
                        round
                        flat
                        color="blue"
                        @click="verRow1(props)"
                        icon="groups"
                      ></q-btn>

                       <q-btn v-if="secre[0]==='SECRETARIA' || this.$store.state.login.user.tipo==='admin'"
                            dense
                            round
                            flat
                            color="yellow"
                            @click="editRow(props)"
                            icon="edit"
                        ></q-btn>
                      <q-btn v-if="secre[0]==='SECRETARIA' || this.$store.state.login.user.tipo==='admin'"
                            dense
                            round
                            flat
                            color="green"
                            @click="sendeditRow(props)"
                            icon="send"
                        ></q-btn>
                      <q-btn v-if="secre[0]==='SECRETARIA' || this.$store.state.login.user.tipo==='admin'"
                            dense
                            round
                            flat
                            color="red"
                            @click="desarchivar(props)"
                            icon="lock_open"
                        />
                         <q-btn v-if="secre[0]==='SECRETARIA' || this.$store.state.login.user.tipo==='admin'"
                            dense
                            round
                            flat
                            color="orange"
                            @click="priorizado(props)"
                            icon="priority_high"
                        />
                          <q-btn v-if="$store.state.login.user.tipo==='admin'"
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
          <!--          ADICIONAR REGISTRO -->
   <q-dialog v-model="alert">
      <q-card style="max-width: 80%; width: 80%">

        <q-card-section class="bg-green-14 text-white">
          <div class="text-h6"><q-icon name="add_circle" /> Nuevo Registro</div>
        </q-card-section>
        <q-card-section class="q-pt-xs">
          <q-form @submit="onSubmit"  class="q-gutter-md">
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
                   lazy-rules
              :rules="[(val) => (val && val.length > 0) || 'Favor ingresa datos']"
                />
            <q-input
              outlined
              v-model="dato.cite"
              type="text"
              label="CITE carta VIPFE"
               hint="Ingresar CITE carta VIPFE"
               lazy-rules
              :rules="[(val) => (val && val.length > 0) || 'Favor ingresa datos']"
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
               type="text"
              label="Departamento"
                hint="Ingresar Departamento que corresponde"

            />
              <q-select
              outlined
              v-model="municipio"
              :options="municipios"
               type="text"
              label="Municipio"
                hint="Ingresar Municipio que corresponde"
            />
             <q-input
              outlined
              v-model="dato.adjunto"
              type="text"
              label="Ingresar adjunto copiar carta MPD "
              hint="Ingrese documnetos adjuntos EJEMPLO '1 CARPETA (FOJAS XX Y 1 CD)' "
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

      <!--          MODIFICAR REGISTRO  PRINCIPAL-->
    <q-dialog v-model="dialog_mod">
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
              v-model="dato2.interno"
              type="text"
              label="Hoja de ruta FPS"
               hint="Ingresar HOJA DE RUTA Del fps Nacional"
                lazy-rules
              :rules="[(val) => (val && val.length > 0) || 'Favor ingresa datos']"
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

            <div class="q-pa-md"  >
                  <span> Esta escrito correctamente el municipio ?</span>
                  <q-radio v-model="dato2.mosca" checked-icon="task_alt" unchecked-icon="panorama_fish_eye" val="SI" label="SI" />
                  <q-radio v-model="dato2.mosca" checked-icon="task_alt" unchecked-icon="panorama_fish_eye" val="NO" label="NO" />
             </div>
         <q-input  v-if="dato2.mosca==='NO'"
              outlined
              v-model="dato2.municipio"
              type="text"
              label="Ingresar Municipio  "
              hint="Ingrese municipio (caso excepcional) "
            />

              <q-input
              outlined
              v-model="dato2.adjunto"
              type="text"
              label="Ingresar adjunto copiar carta MPD "
              hint="Ingrese documnetos adjuntos EJEMPLO '1 CARPETA (FOJAS XX Y 1 CD)' "
            />
            </div>
             </div>
            <div>
              <q-btn label="Modificar" type="submit" color="positive" icon="add_circle" />
              <q-btn label="Cancelar" icon="delete" color="negative" v-close-popup />
            </div>
          </q-form>
        </q-card-section>
      </q-card>
    </q-dialog>

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



<!--Agregar funcionario -->
      <q-dialog v-model="dialog_add2">
      <q-card style="max-width: 80%; width: 80%">
        <q-card-section class="bg-green-14 text-white">
          <div class="text-h6">Asignar a Funcionario</div>
        </q-card-section>
        <q-card-section class="q-pt-xs">
           <q-form @submit="onAdd2" class="q-gutter-md">
            <q-table
                  :filter="filter2"
                  title="Lista de funcionarios"
                  :rows="funcionarios"
                  :columns="subcol2"
                  row-key="nombre"
                  :rows-per-page-options="[0]"
                  separator="cell"
                  dense
                >
                  <template v-slot:body="props">
                    <q-tr  :props="props">
                      <q-td key="email" :props="props">
                        {{ props.row.email }}
                      </q-td>
                      <q-td key="nombre" :props="props">
                        {{ props.row.name }}
                      </q-td>
                      <q-td key="opcion" :props="props">
                        <q-btn
                          dense
                          round
                          flat
                          color="red"
                          @click="adicionarfuncionario(props)"
                          icon="add_circle"
                        ></q-btn>
                      </q-td>
                    </q-tr>
                  </template>
                  <template v-slot:top-right>
                    <q-input
                      outlined
                      borderless
                      dense
                      debounce="300"
                      v-model="filter2"
                      placeholder="Buscar funcionario"
                    >
                      <template v-slot:append>
                        <q-icon name="search" />
                      </template>
                    </q-input>
                  </template>
                </q-table>
                  <div class="col-6">
                <ul v-for="(it, index) in funcionariosSelectos" :key="index">
                  <li >
                    {{ it.name }} {{it.email}}
                  </li>
                </ul>
              </div>
            <div>
              <q-btn label="Agregar" type="submit" color="positive" icon="add_circle" />
              <q-btn label="Cancelar" icon="delete" color="negative" v-close-popup />
            </div>
          </q-form>
        </q-card-section>
      </q-card>
    </q-dialog>

          <!-- VER LISTA Y ELIMINAR />-->
   <q-dialog v-model="dialog_list">
      <q-card style="max-width: 80%; width: 80%">
        <q-card-section class="bg-green-14 text-white">
          <div class="text-h6">DESASOCIAR </div>
        </q-card-section>
        <q-card-section class="q-pt-xs">
                <q-table
                    :rows="personas1"
                    :columns="subcol1"
                     row-key="nombre"
                    :rows-per-page-options="[0]"
                    separator="cell"
                    dense
                    >
      <template v-slot:body="props" >
          <q-tr :props="props">
           <q-td key="email" :props="props"  >
            {{ props.row.email}}
          </q-td>
          <q-td key="nombre" :props="props" >
            {{ props.row.name}}
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

     <q-dialog v-model="dialog_del1">
      <q-card>
        <q-card-section class="row items-center">
          <q-avatar icon="clear" color="red" text-color="white" />
          <span class="q-ml-sm">DESASOCIAR?</span>
        </q-card-section>

        <q-card-actions align="right">
          <q-btn flat label="Aceptar" color="deep-orange" @click="deletesub1" />
          <q-btn flat label="Cancelar" color="primary" v-close-popup />
        </q-card-actions>
      </q-card>
    </q-dialog>

    </div>
</template>

<script >  //vue 2
import moment, { now } from 'moment';

const columns = [
  { name: 'nro', align:"center", label: 'N°', field: 'nro', sortable: true },
  { name: 'codigo', align: "left",label: 'Codigo VIPFE', field: 'codigo',sortable:true },
  { name: 'municipio', align: "left",label: 'Municipio', field: 'municipio',sortable:true},
  { name: 'nombre',required: true,align: "left", label: 'Nombre de la propuesta', field: 'nombre',sortable:true },
  { name: 'cite', align: "left",label: 'CITE', field: 'cite',sortable:true },
  { name: 'archivo', label: 'Hoja de Ruta', field: 'archivo',sortable:true },
  { name: 'monto', label: 'Ajunto', field: 'monto',sortable:true },
  { name: 'fecha', align: "center",label: 'Recibido', field: 'fecha',sortable:true },
  { name: "funcionarios",align: "left",label: "Funcionario(s)",field: "funcionarios",sortable: true,},
  //{ name: "informe",align: "left",label: "Informe",field: "Informe",sortable: true,},
  { name: 'fecha1', align: "center",label: 'Enviado', field: 'fecha1',sortable:true },
  { name: "estado",align: "left",label: "Estado",field: "estado",sortable: true,},
  { name: 'opcion',align: "center", label: 'Opciones ', field: 'opcion', sortable: false }
  ];
const subcol1 = [
  {
    name: "email",
    label: "Email",
    align: "left",
    field: "email",
    sortable: true,
  },
  {
    name: "nombre",
    label: "Nombre completo",
     required: true,
    align: "left",
    field: "nombre",
    sortable: true,
  },
  {
    name: "opcion",
    label: "opcion",
    align: "center",
    field: "opcion",
  },
];
const subcol2 = [
  {
    name: "email",
    label: "Email",
    align: "left",
    field: "email",
    sortable: true,
  },
  {
    name: "nombre",
    label: "Nombre completo",
     required: true,
    align: "left",
    field: "nombre",
    sortable: true,
  },
  {
    name: "opcion",
    label: "opcion",
    align: "center",
    field: "opcion",
  },
];

export default {
  data() {
    return {
      columns,
      filter:'',filter2:'',
      data:[],
      data2:[],
      dato:{},
      secre:this.$store.state.login.user.name.split(" "),
      dato2:{},
      alert:false,
      dialog_del:false,
      dialog_mod:false,
      dialog_add2:false,
      dialog_list:false,
      dialog_del1:false,
      departamentos:[],
      categoria_municipal:"",
      departamento:{},
      municipios:[],
      totalmunicipios:[],
      municipio:{},
      funcionarios:[],
        options:{},
        subcol2,
        subcol1,
         funcionariosSelectos: [],

    };

    },
    created(){
      this.misdatos()
      this.misMunicipios()
      this.misDepartamentos()
   // this.misdatosDepa()
    this.cargarUsers()
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
        misdatos(){
         this.$q.loading.show();
           this.data=[]
           this.$api.get(process.env.API+"/registros").then((res)=>{
              console.log(res.data)
              res.data.forEach(it=>{
                       if(this.$store.state.login.user.status===it.departamento.nombre){
                                        //  this.data.push(it)
                                          if(it.users.length>0){
                                            for (let index = 0; index < it.users.length; index++) {

                                                 if(this.$store.state.login.user.id===it.users[index].id){
                                                           this.data.push(it)
                                                 }else{
                                                  if(this.secre[0]==="SECRETARIA" || this.$store.state.login.user.tipo==='admin'){
                                                         this.data.push(it)
                                                         break;
                                                         }
                                                 }

                                           }
                                          }else{
                                             if(this.secre[0]==="SECRETARIA" || this.$store.state.login.user.tipo==='admin' ){
                                                this.data.push(it)
                                             }
                                          }

                                       // console.log();
                                       //  console.log(it.users[0].id);
                       }
              })


          // this.data=res.data
         // console.log(this.data)
          this.$q.loading.hide();
       }).catch(e=>{
         console.log(e)
         this.$q.loading.hide();
       });
       },
        misdatosDepa(){
           if(this.$store.state.login.user.status==='CENTRAL'){
             this.misdatos()
           }else{
             this.data=this.$store.state.login.user.registros;
           }
       },

       misMunicipios(){
         this.$q.loading.show();
         this.municipios=[]
       this.$api.get(process.env.API+"/municipioid/"+this.$store.state.login.user.ci).then((res)=>{
      // console.log(res.data)
        this.totalmunicipios=res.data
            res.data.forEach((it)=>{
              this.municipios.push({ label:(it.municipio).toUpperCase(),value:it.id})
            })
             this.$q.loading.hide();
       });
       },
      cargarUsers(){
       this.funcionarios=[]
      this.$api.get(process.env.API + "/userid/"+this.$store.state.login.user.ci).then((res) => {
               res.data.forEach(it=>{
                    const secre=it.name.split(" ")
                    if(secre[0]!=='SECRETARIA' && it.tipo!=='admin'){
                        this.funcionarios.push(it)
                    }
               })
         // this.funcionarios = res.data;
       //  console.log(this.funcionarios);
       // console.log(res.data);
        this.$q.loading.hide();
      });
    },
       verNuevo(){

      let  maxi=-99;
      this.dato.nro=1
      this.data.forEach(it=>{
     //  console.log(it.num)
          if(it.nro > maxi){
            this.dato.nro=it.nro+1
            maxi=it.nro
          }
      })
      if(maxi<0){
        this.dato.nro=1
      }

      this.departamento={}
         this.departamentos.forEach(it =>{
             if(this.$store.state.login.user.status===it.label){
                this.departamento={label:it.label, value:it.value}
             }
         })
         this.municipio=this.municipios[0]

      //  console.log(this.departamento)
        // console.log(this.municipios);

      this.dato.nombre=""
      this.dato.codigo="BOL 34-000XX"
      this.dato.cite="MPD/VIPFE/DGPP-NE XXXX/2022"
      this.dato.interno ="E/CN/2022-0XXXX"
      this.dato.adjunto =" 1 Carpeta (fojas XX y CD)"
        this.alert=true;
       },

       onSubmit(){
      //
        this.$q.loading.show();
    //
      this.dato.fecha =moment().format('YYYY-MM-DD');
       this.dato.departamento_id=this.departamento.value;
       this.dato.municipio=this.municipio.label;
       this.dato.mosca='SI';
       this.dato.nombre=((this.dato.nombre).toUpperCase()).trim()
       this.dato.status="RECIBIDO"
         this.totalmunicipios.forEach(it => {
            if((it.municipio).toUpperCase()===this.dato.municipio){
              this.dato.autoridad =it.municipio_codigo
             // console.log(this.dato.autoridad);
            }
         })
     // this.dato.departamento_id=this.$store.state.login.user.ci
      this.$api.post(process.env.API+"/registros/", this.dato).then((res) => {
            this.$q.notify({
            color: "green-4",
            textColor: "white",
            icon: "cloud_done",
            message: "Creado Correctamente",
          });
          this.alert= false;
          this.misdatos();

        }).catch((e)=>{
          this.$q.loading.hide();
        });

       },
        onMod() {
       this.dato2.departamento_id=this.departamento.value;

        if(this.dato2.mosca==='SI'){
       this.dato2.municipio=this.municipio.label;
       this.dato2.nombre=((this.dato2.nombre).toUpperCase()).trim()
          this.totalmunicipios.forEach(it => {
            if((it.municipio).toUpperCase()===this.dato2.municipio){
              this.dato2.autoridad =it.municipio_codigo
             // console.log(this.dato.autoridad);
            }
         })
         }
      this.$q.loading.show();
      this.$api
        .put(process.env.API + "/registros/" + this.dato2.id, this.dato2)
        .then((res) => {
            this.$q.notify({
              color: "green-4",
              textColor: "white",
              icon: "cloud_done",
              message: "Modificado correctamente",
            });
          this.dialog_mod = false;
          this.misdatos();
          this.$q.loading.hide();
        }).catch(err=>console.log(err));
    },
      editRow(item) {
      this.dato2 = item.row;
         this.municipio={}
      this.municipios.forEach(it => {
           if(it.label===item.row.municipio){
                this.municipio={label:it.label,value:it.value}
           }
        });
      this.departamento={}
      this.departamentos.forEach(it => {
           if(it.label===item.row.departamento.nombre){
                this.departamento={label:it.label,value:it.value}
           }
        });
       this.dialog_mod = true;
    },
    priorizado(item) {
      this.dato2 = item.row;
        this.$q.dialog({
                  title: 'PROYECTO PRIORIZADO',
                  message: 'El proyecto fue priorizado por el MPD ?',
                  cancel: true,
                  persistent: true
                  // console.log('>>>> OK')
                }).onOk(() => {
                    this.$q.loading.show()
                       this.$api.put(process.env.API + "/registros/" + this.dato2.id, {status:"PRIORIZADO"} )
                        .then((res) => {
                            this.$q.notify({
                              color: "green-4",
                              textColor: "white",
                              icon: "cloud_done",
                              message: "Estado cambiado a PRIORIZADO",
                            });
                          this.misdatos();
                          this.$q.loading.hide()
                  }).catch(er=>console.log(er))
                }).onCancel(() => {
                  this.$q.loading.show()
                       this.$api.put(process.env.API + "/registros/" + this.dato2.id, {status:"ENVIADO"} )
                        .then((res) => {
                            this.$q.notify({
                              color: "green-4",
                              textColor: "white",
                              icon: "cloud_done",
                              message: "Estado cambiado a ENVIADO",
                            });
                          this.misdatos();
                          this.$q.loading.hide()
                  }).catch(er=>console.log(er))

                })
    },
      sendeditRow(item) {
      this.dato2 = item.row;
        this.$q.dialog({
                  title: 'ENVIO DE INFORME A LA OFICINA CENTRAL',
                  message: 'El informe se esta enviando a la oficina central, el tecnico no podra Modificarlo  esta de Acuerdo?',
                  cancel: true,
                  persistent: true
                  // console.log('>>>> OK')
                }).onOk(() => {
                    this.$q.loading.show()
                this.$api.put(process.env.API + "/registros/" + this.dato2.id, {status:"ENVIADO"} )
                        .then((res) => {
                            this.$q.notify({
                              color: "green-4",
                              textColor: "white",
                              icon: "cloud_done",
                              message: "ENVIADO correctamente",
                            });
                          this.misdatos();
                          this.$q.loading.hide()
                  }).catch(er=>console.log(er))
                }).onCancel(() => {
                    this.$q.loading.hide()
                })
    },
          desarchivar(item) {
      this.dato2 = item.row;
        this.$q.dialog({
                  title: 'HABILITAR PARA EDICION',
                  message: 'el Informe se esta HABILITANDO para su correccion o modificacion, esta seguro ?',
                  cancel: true,
                  persistent: true
                  // console.log('>>>> OK')
                }).onOk(() => {
                    this.$q.loading.show()
                this.$api.put(process.env.API + "/registros/" + this.dato2.id, {status:"RECIBIDO"} )
                        .then((res) => {
                            this.$q.notify({
                              color: "green-4",
                              textColor: "white",
                              icon: "cloud_done",
                              message: "HABILITADO correctamente",
                            });
                          this.$q.loading.hide()
                          this.misdatos();
                  }).catch(err=>console.log(err))
                }).onCancel(() => {
                    this.$q.loading.hide()
                })
    },

       deleteRow(item) {
      this.dato = item.row;
      this.dialog_del = true;
    },
    onDel() {
      this.$q.loading.show();
      this.$api.delete(process.env.API + "/registros/" + this.dato.id)
        .then((res) => {
            this.$q.notify({
              color: "green-4",
              textColor: "white",
              icon: "cloud_done",
              message: "Eliminado correctamente",
            });
          this.dialog_del = false;
          this.misdatos();
        }).catch(err=>console.log(err))
    },
      verRow1(item) {
      this.dato2 = item.row;
       this.$router.push({name: 'DetalleBol34.view', params: {id:this.dato2.id}})
        //this.$router.push("Licitaciones")

     /*
      if (this.dato2.tipo_id===2)
         {
            this.dialog_list1 = true;
         }else{
            this.dialog_list2 = true;
         }
        */
    },
     addRow2(item) {
      this.dato2 = item.row;
      this.funcionariosSelectos=[]
      this.filter2= ""
      this.dialog_add2 = true;
    },
     verRow2(item) {
      this.dato2=item.row;
      this.personas1=[]
      item.row.users.forEach(it=>{
       this.personas1.push(it)
      })
       this.dialog_list = true;

    },
       deletesub(item){
        this.dato3 =item.row;
       /// console.log(this.dato3);
        this.dialog_del1 = true;
    },
     deletesub1() {
      this.$q.loading.show();
      this.$api.put(process.env.API + "/registrouserdetach/" + this.dato2.id,this.dato3)
        .then((res) => {
            this.$q.notify({
              color: "green-4",
              textColor: "white",
              icon: "cloud_done",
              message: "desasociado correctamente",
            });
          this.dialog_del1 = false;
          this.dialog_list=false;
          this.misdatos();
        }).catch(err=>console.log(err));
    },
    onAdd2() {
        let ans={}
      this.funcionariosSelectos.forEach(it =>{
      this.$q.loading.show();
             ans=it
          //   this.$api.put(process.env.API+"/personavisitas/"+this.dato2.id,ans).then((res) => {
             this.$api.put(process.env.API+"/registrouser/"+this.dato2.id,ans).then((res) => {
                  this.$q.notify({
                          color: "green-4",
                          textColor: "white",
                          icon: "cloud_done",
                          message: "Agregado Correctamente",
                        });
                      this.$q.loading.hide();
                        this.misdatos();
                       }).catch(err=>console.log(err))

      })
       this.dialog_add2 = false;
     },
      adicionarfuncionario(item) {
           if(this.funcionariosSelectos.length===1){
             this.$q.notify({
                          color: "red-4",
                          textColor: "white",
                          icon: "cloud_done",
                          message: "No se puede asignar 2 fiscales a un proyecto",
                        });

           }else{
             this.funcionariosSelectos.push(item.row);
           }

     // console.log(this.funcionariosSelectos);
    },


    }
}
</script>

<style>

</style>
