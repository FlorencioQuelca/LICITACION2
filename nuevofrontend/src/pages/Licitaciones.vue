<template> 
   <div class="q-pa-md">
           
  <!--          tabla PRINCIPOAL -->

    <q-table
      :filter="filter"
      title="PROYECTOS REGISTRADOS PARA LICITACION"
      :rows="data"
      :columns="columns"
      row-key="nombre"
      :rows-per-page-options="[10,100]"
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
          <q-td key="departamento" :props="props">
            {{props.row.departamento.nombre}}
          </q-td>
          <q-td key="programa" :props="props">
            {{props.row.programa.nombre}}
          </q-td>
           <q-td key="tipo" :props="props">
            {{props.row.tipo.nombre}}
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
                        color="blue"
                        @click="verRow1(props)"
                        icon="list"
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
  
            <q-td key="funcionarios" :props="props">
              <ul>
              <span v-for="(funcionarios,index) in props.row.funcionarios" :key="index">
                  <li>
                    {{funcionarios.grado}} {{funcionarios.datosp}}        
                </li>
              </span>
             </ul>
          </q-td>
         
           </q-tr>
      </template>
    </q-table>
   

    
          <!-- VER LISTA de PERSONAS Y ELIMINAR />-->
   <q-dialog v-model="dialog_list1">
      <q-card style="max-width: 80%; width: 50%">
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
               <q-td key="empresas" :props="props">
              <ul>
              <span v-for="(empresas,index) in props.row.empresas" :key="index">
                  <li>
                    {{empresas.nit}}  ({{empresas.pivot.participacion}}) %         
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

  </div>
</template>

<script>

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
  { name: 'codigos', align:"left", label:'Codigo(s)',field: "codigos", sortable: true},
  { name: 'nombre',required: true, align:"left",label: 'Nombre del Proyecto', field: 'nombre', sortable: true },
  { name: 'action1', align:"center",label: 'Detalle', field: 'action1'},
  { name: 'cuce',align:"Center", label: 'cuce', field: 'cuce', sortable: true },
  { name: 'link',align:"left", label: 'link de la reunion', field: 'link', sortable: true },
  { name: 'fecha', align:"left",label: 'Fecha', field: 'fecha', sortable: true },
  { name: 'hora', align:"center",label: 'hora', field: 'hora', sortable: true },
  { name: 'precio', align:"center",label: 'Precio', field: 'precio', sortable: true },
  { name: 'plazo', align:"center",label: 'plazo', field: 'plazo', sortable: true },
  { name: 'lotes',align:"Center", label: 'Lotes', field: 'lotes', sortable: true },
  { name: 'funcionarios',align:"left", label: 'Comision Revisora', field: 'funcionarios', sortable: true },
 
   ]

export default {
   components: {
   
    },
  data() {
    return {
  
   dialog_list:false,
  
   dialog_list1:false,
   dialog_list2:false,
   dialog_list3:false,
   selected: [],
   filter:'',
   errores: null,
   props:[],
  depa:{},
  prog:{},
  tipos:[],
  tipo:{},
  codigo:{},
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
   subcol1: [
        {
          name: "nombre",
          label: "Nombre completo",
          align: "left",
      
         field:"nombre",
         sortable: true,
        },
        {
          name: "ci",
          required: true,
          label: "C.I.",
          align: "left",
          field:"ci",
          sortable: true,
        },
       
   ],
   subcol2: [
        {
          name: "nit",
          required: true,
          label: "N.I.T.",
          align: "left",
          field:"nit",
          sortable: true,
        },
        {
          name: "nombre",
          label: "Nombre de la Empresa",
          align: "left",
         field:"nombre",
         sortable: true,
        },
        {
          name: "monto",
          label: "Monto Ofertado",
          align: "left",
         field:"monto",
         sortable: true,
        },    
   ],
    subcol3: [
         {
          name: "codigo",
          required: true,
          label: "codigo",
          align: "left",
          field:"codigo",
          sortable: true,
        },
        {
          name: "nombre",
          label: "Nombre de la Sociedad",
          align: "left",
         field:"nombre",
         sortable: true,
        },    
          {
          name: "monto",
          label: "Monto Ofertado",
          align: "left",
         field:"monto",
         sortable: true,
        },    
         {
          name: "empresas",
          label: "asociados",
          align: "left",
         field:"asociados",
         sortable: true,
        },    
      
   ],
   data:[],
   dato:{},
   columns,
    opciones: [
        {
          label: 'Lista de Empresas',
          value: 'op1'
        },
        {
          label: 'Lista de Sociedad Accidental',
          value: 'op2'
        }
      ],
      group: 'op1',
      };
  },
  created(){
    this.misdatos() 
  },
  methods:{
    misdatos(){
    this.$q.loading.show();
       this.$api.get(process.env.API+"/proyectoslibre").then((res)=>{
         this.data =res.data;
    this.$q.loading.hide();
       });
    },
     verRow(item) {
      this.dato2 = item.row;
      this.dialog_list = true;
    },
    verRow1(item) {
      this.dato2 = item.row;
       if (this.dato2.tipo_id===2)
         {
                  this.dialog_list1 = true;
         }else{
                 this.dialog_list2 = true;
         }  
    },
    verRow2(item) {
      this.dato2 = item.row;
      this.dialog_list3 = true;
    },
  },

};
</script>
