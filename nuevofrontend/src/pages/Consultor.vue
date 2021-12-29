<template> 
   <div class="q-pa-md">
     <q-btn
      label="Nuevo consultor"
      color="positive"
      icon="add_circle"
      @click="alert = true"
      class="q-mb-xs"
    />
      <!--          ADICIONAR REGISTRO -->
   <q-dialog v-model="alert">
      <q-card style="max-width: 80%; width: 50%">
        <q-card-section class="bg-green-14 text-white">
          <div class="text-h6">Nuevo Consultor</div>
        </q-card-section>
        <q-card-section class="q-pt-xs">
          <q-form @submit.prevent="onSubmit" @reset="onReset" class="q-gutter-md">
            <q-input
              filled
              v-model="dato.ci"
              type="number"
              label="Numero ci"
              hint="Ingresar ci"
              lazy-rules
              :rules="[(val) => (val && val.length > 0) || 'Por favor ingresa datos']"
            />

            <q-input
              filled
              v-model="dato.nombres"
              type="text"
              label="Nombre nombre"
              hint="Ingresar Nombre item"
              lazy-rules
              :rules="[(val) => (val && val.length > 0) || 'Por favor ingresa datos']"
            />
             <q-input
              filled
              v-model="dato.paterno"
              type="text"
              label="Apellido Paterno"
              hint="Ingresar Nombre item"
              lazy-rules
              :rules="[(val) => (val && val.length > 0) || 'Por favor ingresa datos']"
            />
             <q-input
              filled
              v-model="dato.fono1"
              type="text"
              label="Nombre nombre"
              hint="Ingresar Nombre item"
              lazy-rules
              :rules="[(val) => (val && val.length > 0) || 'Por favor ingresa datos']"
            />
 <q-input
              filled
              v-model="dato.email"
              type="text"
              label="Nombre nombre"
              hint="Ingresar Nombre item"
              lazy-rules
              :rules="[(val) => (val && val.length > 0) || 'Por favor ingresa datos']"
            />
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
      title="CONSULTORES"
      :rows="data"
      :columns="columns"
      row-key="ci"
      :filter="filter"
      :grid="$q.screen.xs"
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
    <q-dialog >
      <q-card>
        <q-card-section class="row ">
          <q-form class="col-12" @submit.prevent="onaddunid">

              <div >
                <q-select v-model="uni3"  :options="unidades" label="Selecionar unidad" required />
              </div>
            <q-card-actions align="right">
              <q-btn icon="send" label="Agregar" color="deep-orange" type="submit" />
              <q-btn icon="delete"  label="Cancelar" color="negative" v-close-popup />
            </q-card-actions>
          </q-form>
        </q-card-section>

      </q-card>
    </q-dialog>
   <!--          ADICIONAR REGISTRO -->
    <q-dialog v-model="dialog_add">
      <q-card style="max-width: 80%; width: 50%">
        <q-card-section class="bg-green-14 text-white">
          <div class="text-h6">Agregar Subitem</div>
        </q-card-section>
        <q-card-section class="q-pt-xs">
          <q-form @submit="onAdd" class="q-gutter-md">
            <q-input
              filled
              v-model="dato2.subnombre"
              type="text"
              label="Nombre del SubItem"
              hint="Ingresar nombre"
              lazy-rules
              :rules="[(val) => (val && val.length > 0) || 'Por favor ingresa datos']"
            />

            <q-input
              filled
              v-model="dato2.submonto"
              type="number"
              step="0.01"
              label="Monto"
              hint="Ingresar monto"
              lazy-rules
              :rules="[(val) => (val>=0 && val.length > 0) || 'Por favor ingresa datos']"
            />


            <div>
              <q-btn label="Agregar" type="submit" color="positive" icon="add_circle" />
              <q-btn label="Cancelar" icon="delete" color="negative" v-close-popup />
            </div>
          </q-form>
        </q-card-section>
      </q-card>
    </q-dialog>
 
  </div>
</template>

<script>

export default {
   
  data() {
    return {
   alert:false,
   dialog_del:false,
   dialog_mod:false,
   dialog_add:false,


   selected: [],
   filter:'',
   consultores:[],
   props:[],
   
   columns: [
  { name: 'ci', align:"left", label:'C.I.',field:"ci", sortable: true},
  { name: 'grado', align:"left",label: 'Grado', field: 'grado', sortable: true },
  { name: 'nombrecompleto',align:"left", label: 'Nombre Completo', field: 'datosp', sortable: true },
  { name: 'fechanacimiento', align:"left",label: 'Fecha Nac.', field: 'fechanacimiento', sortable: true },
  { name: 'genero', align:"center",label: 'Genero', field: 'genero', sortable: true },
  { name: 'fono1', align:"center",label: 'Celular', field: 'fono1', sortable: true },
  { name: 'fono2', align:"center",label: 'Telefono', field: 'fono2', sortable: true },
  { name: 'email',align:"Center", label: 'Correo', field: 'email', sortable: true },
  { name: 'direccion', align:"center",label: 'Direccion', field: 'direccion', sortable: true },
  { name: 'nit',align:"center", label: 'nit', field: 'nit', sortable: true },
  { name: 'opcion', label: 'Opcion', field: 'action', sortable: false }
   ],
   
   data:[],
   dato2:{},
   dato:{}
    };
  },
  created(){
    this.misdatos()
  },
  methods:{
    misdatos(){
    this.$q.loading.show();
       this.$api.get("/consultor").then((res)=>{
         //console.log(res.data)
         this.data =res.data;
    this.$q.loading.hide();
       });
    },
    editRow(item) {
      this.dato2 = item.row
     // this.dato2.unid_id = item.row.unid
      // console.log(this.dato2)
      this.dialog_mod = true;
    },
    deleteRow(item) {
      this.dato2 = item.row;
      this.dialog_del = true;
    },
     onDel() {
      this.$q.loading.show();
      this.$api.delete( "/consultor/" + this.dato2.id).then((res) => {
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
    onReset() {
      this.dato.nombres = null;
        this.dato.paterno = null;
          this.dato.ci = 57750797;
      this.dato.ci = null;
    },
     onSubmit() {
      this.$q.loading.show();
      this.$api.post( "/consultor/", this.dato).then((res) => {
       this.$q.notify({
        color: "green-4",
       textColor: "white",
       icon: "cloud_done",
       message: "Creado correctamente",
       });
        this.alert = false;
        this.misdatos();
      });
    },
    
     

  }
};
</script>
