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


    <q-table
      title="Lista de Proyectos Bol - 34"
      dense
      :rows="rows"
      :columns="columns"
      row-key="name"
      separator="cell"
    />
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
                  type="number"
                  v-model="dato.monto1"
                    label="Monro de Infraestructura"
                  hint="Ingresar monto Infraestructura"
                />
            <q-input
              outlined
              v-model="dato.monto2"
              type="number"
              label="Monto de supervision"
               hint="Ingresar monto de supervision"

            />
             </div>
             <div class="col-6">


            <q-select
              outlined
              v-model="dato.departamento"
              :options="departamentos"
               disable
              label="Departamento"
                hint="Ingresar Departamento que corresponde"

            />
              <q-select
              outlined
              v-model="dato.municipio"
              :options="municipios"
                option-value="id"
                option-label="label"
              label="Municipio"

                hint="Ingresar Municipio que corresponde"
            />
             <q-input
              outlined
              v-model="dato.observacion"
              type="text"
              label="Observacion"
              hint="Ingresar alguna Observacion "
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

    </div>
</template>

<script >  //vue 2
const columns = [
  {
    name: 'name',
    required: true,
    label: 'Dessert (100g serving)',
    align: 'left',
    field: row => row.name,
    format: val => `${val}`,
    sortable: true
  },
  { name: 'nro', label: 'N°', field: 'nro', sortable: true },
  { name: 'nombre', label: 'Nombre de la propuesta', field: 'nombre',sortable:true },
  { name: 'comunidad', label: 'Comunidad', field: 'comunidad',sortable:true },
  { name: 'tipologia', label: 'Tipologia', field: 'tipologia',sortable:true },
  { name: 'departamento', label: 'Departamento', field: 'departamento',sortable:true },
  { name: 'municipio', label: 'Municipio', field: 'municipio',sortable:true},
  { name: 'usuario', label: 'Usuario', field: 'usuario',sortable:true }

]
const rows = [
  {
    name: 'Frozen Yogurt',
    calories: 159,
    fat: 6.0,
    carbs: 24,
    protein: 4.0,
    sodium: 87,
    calcium: '14%',
    iron: '1%'
  },
  {
    name: 'Ice cream sandwich',
    calories: 237,
    fat: 9.0,
    carbs: 37,
    protein: 4.3,
    sodium: 129,
    calcium: '8%',
    iron: '1%'
  },
  {
    name: 'Eclair',
    calories: 262,
    fat: 16.0,
    carbs: 23,
    protein: 6.0,
    sodium: 337,
    calcium: '6%',
    iron: '7%'
  },
  {
    name: 'Cupcake',
    calories: 305,
    fat: 3.7,
    carbs: 67,
    protein: 4.3,
    sodium: 413,
    calcium: '3%',
    iron: '8%'
  },
  {
    name: 'Gingerbread',
    calories: 356,
    fat: 16.0,
    carbs: 49,
    protein: 3.9,
    sodium: 327,
    calcium: '7%',
    iron: '16%'
  },
  {
    name: 'Jelly bean',
    calories: 375,
    fat: 0.0,
    carbs: 94,
    protein: 0.0,
    sodium: 50,
    calcium: '0%',
    iron: '0%'
  },
  {
    name: 'Lollipop',
    calories: 392,
    fat: 0.2,
    carbs: 98,
    protein: 0,
    sodium: 38,
    calcium: '0%',
    iron: '2%'
  },
  {
    name: 'Honeycomb',
    calories: 408,
    fat: 3.2,
    carbs: 87,
    protein: 6.5,
    sodium: 562,
    calcium: '0%',
    iron: '45%'
  },
  {
    name: 'Donut',
    calories: 452,
    fat: 25.0,
    carbs: 51,
    protein: 4.9,
    sodium: 326,
    calcium: '2%',
    iron: '22%'
  },
  {
    name: 'KitKat',
    calories: 518,
    fat: 26.0,
    carbs: 65,
    protein: 7,
    sodium: 54,
    calcium: '12%',
    iron: '6%'
  }
]

export default {
  data() {
    return {
      columns,
      rows,
      data:[],
      dato:{},
      alert:false,
      departamentos:[],
      municipios:[],

    };

    },
    created(){
      this.misDepartamentos()
    this.misMunicipios()
  },
    methods: {
        misDepartamentos(){
         this.$q.loading.show();
       this.$api.get(process.env.API+"/departamentos").then((res)=>{
          //console.log(res.data)
            res.data.forEach((it)=>{
              this.departamentos.push({label:it.nombre, id:it.id})
              if(this.$store.state.login.user.status==it.nombre){
                this.dato.departamento=it.nombre
              }

            })
          this.$q.loading.hide();
       });
       },

       misMunicipios(){
         this.$q.loading.show();
       this.$api.get(process.env.API+"/municipioid/"+this.$store.state.login.user.ci).then((res)=>{
        console.log(res.data)
            res.data.forEach((it)=>{
              this.municipios.push({label:(it.municipio).toUpperCase(), id:it.id, codigo:it.municipio_codigo})
             this.$q.loading.hide();
            })
       });
       },
       verNuevo(){
        this.alert=true;
        console.log(this.$store.state.login.user)
        this.misMunicipios();
       },
       onSubmit(){

       }


    }
}
</script>

<style>

</style>
