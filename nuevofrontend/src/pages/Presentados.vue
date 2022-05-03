<template>
  <div class="q-pa-md">
    <q-btn
      label="Licitaciones"
      color="secondary"
      icon="account_tree"
      @click="this.$router.push('/Licitaciones')"
      class="q-mb-xs"
    />   
    
    <q-card >
         <q-card-section>
          <div class="row no-wrap items-center">
            <div class="col text-h6 ellipsis">
              {{data.nombre}}
            </div>
          </div>
          <div class="row">
              <div class="col-6">
           <q-list>
            <q-item >
                <q-item-section>
                <q-item-label>  {{departamento}}</q-item-label>
                <q-item-label caption>Departamento</q-item-label>
              </q-item-section>
            </q-item>
            <q-item >
                <q-item-section>
                <q-item-label>{{data.cuce}}</q-item-label>
                <q-item-label caption>CUCE</q-item-label>
              </q-item-section>
            </q-item>
            <q-item >
                <q-item-section>
                <q-item-label>{{programa}}</q-item-label>
                <q-item-label caption>Programa</q-item-label>
              </q-item-section>
            </q-item>
            <q-item >
                <q-item-section>
                <q-item-label>{{data.precio}} Bs</q-item-label>
                <q-item-label caption>Monto referencial</q-item-label>
              </q-item-section>
            </q-item>
            <q-item >
              <q-item-section>
              <ul>
              <span v-for="(codigos,index) in data.codigos" :key="index">
                     <li>
                    {{codigos.nombre}}  
                     </li>     
              </span>
             </ul>
             <q-item-label caption>Codigo de Proyecto</q-item-label>
              </q-item-section>
                 </q-item >
        </q-list>
             
          </div>
         
              <div class="col-6">
           <q-list>
            <q-item >
                <q-item-section>
                <q-item-label>{{data.link}}</q-item-label>
                <q-item-label caption>Enlace de la reunion</q-item-label>
              </q-item-section>
            </q-item>
            
             <q-item >
                <q-item-section>
                <q-item-label>{{data.plazo}}</q-item-label>
                <q-item-label caption>plazo</q-item-label>
              </q-item-section>
            </q-item>
            <q-item >
                <q-item-section>
                <q-item-label>{{data.fecha}}</q-item-label>
                <q-item-label caption>fecha de la apertura</q-item-label>
              </q-item-section>
            </q-item>
            <q-item >
                <q-item-section>
                <q-item-label>{{data.hora}}</q-item-label>
                <q-item-label caption>Hora de la Apertura</q-item-label>
              </q-item-section>
            </q-item>
           <q-item >
              <q-item-section>
               
              <ul>
              <span v-for="(codigos,id) in data.funcionarios" :key="id">
                  <li>
                    Ing. {{codigos.datosp}}   
                  </li>   
              </span>
              
             </ul>
              <q-item-label caption>Funcionario(s): Comision Calificadora</q-item-label>
              </q-item-section>
            </q-item >
           </q-list>
           </div>
          </div>

        
      </q-card-section>

     
    </q-card>
     <q-separator />

      <q-card  v-if="data.tipo_id===1">
        <q-card-section class="bg-green-14 text-white">
          <div class="text-h6">Lista oficial de Oferentes Presentados</div>
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
                    
                    :rows="data.empresas"
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
            
        </q-card-section>

        <q-card-section v-else class="q-pt-xs">
                <q-table
                   
                    :rows="data.sociedads"
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
             
        </q-card-section>
        
      </q-card>

    <div>

       <q-card  v-if="data.tipo_id===2">
        <q-card-section class="bg-green-14 text-white">
          <div class="text-h6">Lista de consultores presentados</div>
        </q-card-section>
        <q-card-section class="q-pt-xs">
                <q-table
                    :rows="data.personas"
                    :columns="subcol1"
                    >
      <template v-slot:body="props">
          <q-tr :props="props">
            <q-td key="ci" :props="props">
            {{ props.row.ci}}
          </q-td>
          <q-td key="fechanac" :props="props">
            {{ props.row.fechaNacimiento}}
          </q-td>
                <q-td key="paterno" :props="props">
            {{ props.row.paterno}}
          </q-td>
              <q-td key="materno" :props="props">
            {{ props.row.materno}}
          </q-td>
              <q-td key="nombres" :props="props">
            {{ props.row.nombres}}
          </q-td>
          <q-td key="nombre" :props="props">
            {{ props.row.datosp}}
          </q-td>
          
           </q-tr>
          </template>
          </q-table>
        </q-card-section>
         
      </q-card>


      
    </div>
 <q-footer bordered class="bg-white text-primary">
        <q-tabs no-caps active-color="primary" indicator-color="transparent" class="text-grey">
         <h6>
          Copyright © 2022 FPS - LAPAZ               
         </h6>
          <div class="text-purple q-gutter-md" style="font-size: 2em">
           <q-icon round color="primary" name="facebook" ></q-icon>
          </div>
           <a href="https://www.facebook.com/fpslapaz" target="_blanck"> Ir a la pagina</a>
        
        </q-tabs>
      </q-footer>
    
  </div>
</template>

<script>
export default {
  data: () => ({
    id: 145,
    data: {},
    programa:"",
    departamento:"",

    subcol: [
      {
        name: "nombre",
        required: true,
        label: "Codigo de Proyecto",
        align: "left",
        // field: (row.codigos) => row.nombre,
        // field: row => row.name,
        // format: val => `${val}`,
        field: "nombre",
        sortable: true,
      },
      {
        name: "opcion",
        label: "opcion",
        align: "rigth",
        // field: (row) => row.codigo,
        field: "opcion",
        sortable: true,
      },
    ],
    subcol1: [
     {
          name: "ci",
          required: true,
          label: "C.I.",
          align: "center",
          field:"ci",
          sortable: true,
        },
         {
          name: "fechanac",
          label: "Fecha de Nacimiento",
          align: "center",
         field:"fechanac",
         sortable: true,
        },
        {
          name: "paterno",
          label: "Apellido Paterno",
          align: "left",
         field:"paterno",
         sortable: true,
        },
         {
          name: "materno",
          label: "Apellido Materno",
          align: "left",
         field:"materno",
         sortable: true,
        },
         {
          name: "nombres",
          label: "Nombres",
          align: "left",
         field:"nombres",
         sortable: true,
        },
        {
          name: "nombre",
          label: "Nombre Completo",
          align: "left",
         field:"nombre",
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
      
   ]  ,

    opciones: [
        {
          label: 'Lista de Empresas',
          value: 'op1'
        },
        {
          label: 'Lista de Sociedad Accidental',
          value: 'op2'
        },
        
      ],
      group: 'op1',
     
   
  }),
  created() {},
  mounted() {
    this.misdatos();
  },
  methods: {
    misdatos() {
      this.$q.loading.show();
      this.$api
        .get(process.env.API + "/proyectoid/" + this.$route.params.id)
        .then((res) => {
          this.data = res.data[0];
        /*
        res.data[0].departamento.foreach(tip => {
               this.departamento.push({label:tip.nombre,value:tip.id});
        }); 
        res.data[0].programa.foreach(tip => {
               this.programa.push({label:tip.nombre,value:tip.id});
        });
        */
        this.departamento=res.data[0].departamento.nombre;
        this.programa=res.data[0].programa.nombre;
         // console.log(res.data[0]);
          this.$q.loading.hide();
        });
    },
  },
};
</script>
