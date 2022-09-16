<template>
 <div class="q-pa-md">
  <!--          tabla PRINCIPAL -->
    <q-table
      :filter="filter"
      title="REPORTE BOL34 "
      :rows="data"
      :columns="columns"
      row-key="nombre"
      :rows-per-page-options="[0]"
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
           <q-td key="municipio" :props="props">
            {{props.row.municipio}}
          </q-td>
           <q-td key="categoria" :props="props">
              {{props.row.autoridad}}
          </q-td>
           <q-td key="nombre" :props="props">
            {{props.row.nombre}}
          </q-td>
           <q-td key="cite" :props="props">
            {{props.row.cite}}
          </q-td>
           <q-td key="hojaderuta" :props="props">
            {{props.row.interno}}
          </q-td>
           <q-td key="adjunto" :props="props">
            {{props.row.adjunto}}
          </q-td>

         <q-td  v-if="props.row.users.length"
                key="funcionario" :props="props">
               {{props.row.users[0].name}}
         </q-td>
           <q-td key="monto1" :props="props">
            {{props.row.monto1}}
          </q-td>
           <q-td key="monto1" :props="props">
            {{props.row.monto2}}
          </q-td>
           <q-td key="monto3" :props="props">
            {{props.row.total}}
          </q-td>
         <q-td key="inspeccion" :props="props">
               {{props.row.vinculo}}
         </q-td>
         <q-td key="fechainspeccion" :props="props">
               {{props.row.copia}}
         </q-td>
         <q-td key="fechaenvio" :props="props">
               {{props.row.carta_fecha}}
         </q-td>
         <q-td key="informe" :props="props">
               {{props.row.carta_cite}}
         </q-td>
         <q-td key="elegible" :props="props">
               {{props.row.cumple}}
         </q-td>
         <q-td key="estado" :props="props">
               {{props.row.status}}
         </q-td>
         <q-td key="avance" :props="props">
               {{props.row.puntaje1}} %
         </q-td>
       </q-tr>
      </template>

        <template v-slot:top-left>
           <q-toolbar flat>
              <q-toolbar-title>REGISTRO BOL 34</q-toolbar-title>
              <q-divider  class='mx-4' inset vertical></q-divider>
              <q-spacer></q-spacer>
              <q-btn
                  color="primary"
                  icon-right="archive"
                  label="Descargar en excel"
                  no-caps
                  @click="exportTable"
                />
           </q-toolbar>

      </template>
    </q-table>
    </div>
</template>
<script >  //vue 2


const columns = [
  { name: 'nro', align:"center", label: 'N°', field: 'nro', sortable: true },
  { name: 'codigo', align: "left",label: 'Codigo VIPFE', field: 'codigo',sortable:true },
  { name: 'municipio', align: "left",label: 'Municipio', field: 'municipio',sortable:true},
  { name: 'categoria', align: "left",label: 'Categoria', field: 'categoria',sortable:true},
  { name: 'nombre',required: true,align: "left", label: 'Nombre de la propuesta', field: 'nombre',sortable:true },
  { name: 'cite', align: "left",label: 'CITE MPD/VIPFE', field: 'cite',sortable:true },
  { name: 'hojaderuta', label: 'N° Hoja de Ruta', field: 'hojaderuta',sortable:true },
  { name: 'adjunto', label: 'Adjunto', field: 'adjunto',sortable:true },
  //{ name: 'fecha', align: "center",label: 'Fecha', field: 'fecha',sortable:true },
  { name: "funcionario",align: "left",label: "Evaluado Por:",field: "funcionario",sortable: true},
  { name: 'monto1', align:"right",label: 'Infraestructura', field: 'monto1',sortable:true },
  { name: 'monto2', align:"right",label: 'Supervision', field: 'monto2',sortable:true },
  { name: 'monto3', align:"right",label: 'Monto Total', field: 'monto3',sortable:true },
  { name: 'inspeccion',align: "center", label: 'Inspeccionado ', field: 'inspeccion', sortable: false },
  { name: 'fechainspeccion',align: "center", label: 'Fecha de Inspeccion', field: 'fechainspeccion', sortable: false },
  { name: 'fechaenvio',align: "center", label: 'Fecha de Envio', field: 'fechaenvio', sortable: false },
  { name: 'informe',align: "center", label: 'Informe', field: 'informe', sortable: false },
  { name: 'elegible',align: "center", label: 'Elegible', field: 'elegible', sortable: false },
  { name: 'estado',align: "center", label: 'Estado', field: 'estado', sortable: false },
  { name: 'avance',align: "center", label: '% Evaluacion ', field: 'avance', sortable: false }
  ];
  import exportFromJSON from 'export-from-json'
export default {
  data() {
    return {
      columns,
      filter:'',
      data:[],
    };
    },
    created(){
      this.misdatos()
  },
    methods: {
        misdatos(){
        // this.$q.loading.show();
         //   this.$api.get(process.env.API+"/registrodepa/"+this.$store.state.login.user.ci).then((res)=>{
       //    this.data=res.data

      //    this.$q.loading.hide();
        this.data=[]
       this.$api.get(process.env.API+"/registrados").then((res)=>{
        res.data.forEach(it=>{
                       if(this.$store.state.login.user.status===it.departamento.nombre){
                        this.data.push(it)
                       }
              })
          this.$q.loading.hide();
       });
       },
          exportTable () {
            console.log(this.data)
             const datos=this.data
             const fileName="BOL34"
             const extension=exportFromJSON.types.xls
            exportFromJSON({datos, fileName,extension})

      }
    }
}
</script>
<style>
</style>
