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

           <q-td key="comunidad" :props="props">
            {{props.row.comunidad}}
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
                  <li v-if="persona.pivot.tipo==='funcionario'">
                    {{persona.datosp}}
                </li>
              </span>
             </ul>
          </q-td>
          <q-td key="opcion2" :props="props">
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
                />
            <q-input
              outlined
              v-model="dato.cite"
              type="text"
              label="CITE carta VIPFE"
               hint="Ingresar CITE carta VIPFE"

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

    </div>
</template>

<script >  //vue 2
import moment, { now } from 'moment';

const columns = [

  { name: 'nro', align:"center", label: 'N°', field: 'nro', sortable: true },
  { name: 'codigo', label: 'Codigo VIPFE', field: 'codigo',sortable:true },
  { name: 'nombre',required: true, label: 'Nombre de la propuesta', field: 'nombre',sortable:true },
  { name: 'cite',required: true, label: 'CITE', field: 'cite',sortable:true },
  { name: 'fecha', label: 'Fecha', field: 'fecha',sortable:true },
  { name: 'comunidad', label: 'Comunidad', field: 'comunidad',sortable:true },
  { name: 'monto', label: 'Monto', field: 'monto',sortable:true },
  { name: 'municipio', label: 'Municipio', field: 'municipio',sortable:true},
{
    name: "funcionarios",
    align: "left",
    label: "Funcionario(s)",
    field: "funcionarios",
    sortable: true,
  },
   {
    name: "opcion2",
    label: "+ funcionario",
    align: "center",
    field: "action2",
    sortable: false,
  },
  { name: 'opcion', label: 'Opcion', field: 'opcion', sortable: false }

]

export default {
  data() {
    return {
      columns,
      filter:'',

      data:[],
      dato:{},
      dato2:{},
      alert:false,
      dialog_del:false,
      dialog_mod:false,
      departamentos:[],
      departamento:{},
      municipios:[],
      municipio:{},
        options:{},

    };

    },
    created(){
      this.misDepartamentos()
    this.misMunicipios()
    this.misdatos()
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
          console.log(res.data)
          this.$q.loading.hide();
       });
       },

       misMunicipios(){
         this.$q.loading.show();
         this.municipios=[]
       this.$api.get(process.env.API+"/municipioid/"+this.$store.state.login.user.ci).then((res)=>{
       // console.log(res.data)
            res.data.forEach((it)=>{
              this.municipios.push({ label:(it.municipio).toUpperCase(),value:it.id})

            })
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


    }
}
</script>

<style>

</style>
