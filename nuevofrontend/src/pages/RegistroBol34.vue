<template>
 <div class="q-pa-md">
    <div >
       <q-btn
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
      :rows-per-page-options="[20,50,100,200,0]"
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
        <q-tr :props="props">
          <q-td key="nro" :props="props">
            {{props.row.nro}}
          </q-td>
           <q-td key="codigo" :props="props">
            {{props.row.codigo}}
          </q-td>
           <q-td key="nombre" :props="props">
            {{props.row.nombre}}
          </q-td>
           <q-td key="cite" :props="props">
            {{props.row.cite}}
          </q-td>

           <q-td key="fecha" :props="props">
            {{props.row.fecha}}
          </q-td>

           <q-td key="archivo" :props="props">
            {{props.row.interno}}
          </q-td>
           <q-td key="monto" :props="props">
            {{props.row.total}}
          </q-td>
           <q-td key="municipio" :props="props">
            {{props.row.municipio}}
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



            <q-td  key="opcion" :props="props">
                      <q-btn
                        dense
                        round
                        flat
                        color="green"
                        @click="addRow2(props)"
                        icon="playlist_add"
                      ></q-btn>
                        <q-btn
                        dense
                        round
                        flat
                        color="green"
                        @click="verRow2(props)"
                        icon="list"
                      ></q-btn>
                        <q-btn
                        dense
                        round
                        flat
                        color="blue"
                        @click="verRow1(props)"
                        icon="groups"
                      ></q-btn>

                       <q-btn
                            dense
                            round
                            flat
                            color="yellow"
                            @click="editRow(props)"
                            icon="edit"
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
              v-model="dato.total"
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
              v-model="dato.interno"
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
          <div class="text-h6">Agregar Funcionario</div>
        </q-card-section>
        <q-card-section class="q-pt-xs">
           <q-form @submit="onAdd2" class="q-gutter-md">
            <q-table
                  :filter="filter2"
                  title="Lista de funcionarios"
                  :rows="funcionarios"
                  :columns="subcol2"
                  row-key="nombre"
                  :rows-per-page-options="[10, 15, 20, 0]"
                  separator="cell"
                  dense
                >
                  <template v-slot:body="props">
                    <q-tr :props="props">
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
  { name: 'nombre',required: true,align: "left", label: 'Nombre de la propuesta', field: 'nombre',sortable:true },
  { name: 'cite', align: "left",label: 'CITE', field: 'cite',sortable:true },
  { name: 'fecha', align: "center",label: 'Fecha', field: 'fecha',sortable:true },
  { name: 'archivo', label: 'H.R.', field: 'archivo',sortable:true },
  { name: 'monto', label: 'Monto', field: 'monto',sortable:true },
  { name: 'municipio', align: "left",label: 'Municipio', field: 'municipio',sortable:true},
  {
    name: "funcionarios",
    align: "left",
    label: "Funcionario(s)",
    field: "funcionarios",
    sortable: true,
  },
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
      dato:{},
      dato2:{},
      alert:false,
      dialog_del:false,
      dialog_mod:false,
      dialog_add2:false,
      dialog_list:false,
      dialog_del1:false,
      departamentos:[],
      departamento:{},
      municipios:[],
      municipio:{},
      funcionarios:[],
        options:{},
        subcol2,
        subcol1,
         funcionariosSelectos: [],

    };

    },
    created(){
      this.misDepartamentos()
    this.misMunicipios()
   this.misdatos()
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
       this.$api.get(process.env.API+"/registros").then((res)=>{
           this.data=res.data
         // console.log(res.data)
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
       console.log(res.data)
            res.data.forEach((it)=>{
              this.municipios.push({ label:(it.municipio).toUpperCase(),value:it.id})

            })
             this.$q.loading.hide();
       });
       },
      cargarUsers(){
      this.$api.get(process.env.API + "/userid/"+this.$store.state.login.user.ci).then((res) => {
       this.funcionarios = res.data;
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

        this.alert=true;
       },


       onSubmit(){
      //  console.log(typeof this.$store.state.login.user.ci)
        this.$q.loading.show();
    //   this.dato.departamento_id="2"
     // this.dato.departamento_id=this.departamentos[this.$store.state.login.user.status] //funciona
       // this.dato.codigo="bol34-0001"
       // this.dato.cite="cite11"
      this.dato.fecha =moment().format('YYYY-MM-DD');
      // console.log(new Date())
       this.dato.departamento_id=this.departamento.value;
       this.dato.municipio=this.municipio.label;
       this.dato.nombre=((this.dato.nombre).toUpperCase()).trim()



     // this.dato.departamento_id=this.$store.state.login.user.ci
      this.$api.post(process.env.API+"/registros/", this.dato).then((res) => {

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

        }).catch((e)=>{
          this.$q.loading.hide();
        });



       },
        onMod() {
        this.dato2.departamento_id=this.departamento.value;
       this.dato2.municipio=this.municipio.label;

      this.$q.loading.show();
      this.$api
        .put(process.env.API + "/registros/" + this.dato2.id, this.dato2)
        .then((res) => {
          if (res.data.res === true) {
            this.$q.notify({
              color: "green-4",
              textColor: "white",
              icon: "cloud_done",
              message: "Modificado correctamente",
            });
          }
          this.dialog_mod = false;
          this.misdatos();
          this.$q.loading.hide();
        });
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

       deleteRow(item) {
      this.dato = item.row;
      this.dialog_del = true;
    },
    onDel() {
      this.$q.loading.show();

      this.$api
        .delete(process.env.API + "/registros/" + this.dato.id)
        .then((res) => {
          if (res.data.res === true) {
            this.$q.notify({
              color: "green-4",
              textColor: "white",
              icon: "cloud_done",
              message: "Eliminado correctamente",
            });
          }
          this.dialog_del = false;
          this.misdatos();
        });
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
          if (res.data.res === true) {
            this.$q.notify({
              color: "green-4",
              textColor: "white",
              icon: "cloud_done",
              message: "desasociado correctamente",
            });
          }
          this.dialog_del1 = false;
          this.dialog_list=false;
          this.misdatos();
        });
    },
    onAdd2() {
        let ans={}
      this.funcionariosSelectos.forEach(it =>{
      this.$q.loading.show();
             ans=it
          //   this.$api.put(process.env.API+"/personavisitas/"+this.dato2.id,ans).then((res) => {
             this.$api.put(process.env.API+"/registrouser/"+this.dato2.id,ans).then((res) => {
                  if(res.data.res===true){
                  this.$q.notify({
                          color: "green-4",
                          textColor: "white",
                          icon: "cloud_done",
                          message: "Agregado Correctamente",
                        });
                      this.$q.loading.hide();
                        this.misdatos();
                        }else{
                            this.$q.notify({
                          color: "red-4",
                          textColor: "white",
                          icon: "cloud_done",
                          message: "Error al agregar",
                        });
                             this.$q.loading.hide();
                        }
                       });

      })
       this.dialog_add2 = false;
     },
      adicionarfuncionario(item) {
      this.funcionariosSelectos.push(item.row);
     // console.log(this.funcionariosSelectos);
    },


    }
}
</script>

<style>

</style>
