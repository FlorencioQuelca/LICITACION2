<template>
   <div class="q-pa-md">

  <div style="max-width: 300px" >
     <q-input filled v-model="date" mask="date" :rules="['date']">
      <template v-slot:append>
        <q-icon name="event" class="cursor-pointer">
          <q-popup-proxy cover transition-show="scale" transition-hide="scale">
            <q-date v-model="date">
              <div class="row items-center justify-end">
                <q-btn v-close-popup label="aceptar" @click="misdatos" color="primary" flat />
              </div>
            </q-date>
          </q-popup-proxy>
        </q-icon>
      </template>
    </q-input>
    </div>


    <q-card>

            <div class="q-pa-md">
               <q-btn
                color="black"
                flat
                class="q-mb-xs"
              >
              Fecha de reporte:  {{date2}}
               </q-btn>
          <q-btn
                label="imprimir reporte"
                color="red"
                icon="print"
                class="q-mb-xs"
                @click="imprimir"
                 />
            </div>


    </q-card>
 <!--          tabla  PRINCIPAL -->
    <q-table
      :filter="filter"
      :rows="data"
      :columns="columns"
      row-key="num"
      :rows-per-page-options="[0]"
      separator="cell"
      dense
    >
      <template v-slot:top-right>
        <q-input
          outlined
          borderless
          dense
          debounce="300"
          v-model="filter"
          placeholder="Buscar"
        >
          <template v-slot:append>
            <q-icon name="search" />
          </template>
        </q-input>
      </template>

      <template v-slot:body="props">
        <q-tr :props="props">
          <q-td key="num" :props="props">
            {{ props.row.num }}
          </q-td>
          <q-td key="nombre" :props="props">
              <ul >
              <span v-for="(persona,index) in props.row.personas" :key="index">
                  <li v-if="persona.pivot.tipo==='visita'">
                    {{persona.ci}} - {{persona.datosp}}
                </li>
              </span>
             </ul>
          </q-td>

          <q-td key="horain" :props="props">
            {{ props.row.horain }}
          </q-td>
          <q-td key="motivo" :props="props">
            {{ props.row.motivo }}
          </q-td>
           <q-td key="empresa" :props="props">
            {{ props.row.empresa }}
          </q-td>
           <q-td key="funcionarios" :props="props">
              <ul>
              <span v-for="(persona,index) in props.row.personas" :key="index">
                  <li v-if="persona.pivot.tipo==='funcionario'">
                    {{persona.datosp}}
                </li>
              </span>
             </ul>
          </q-td>

           <q-td key="horaout" :props="props">
            {{ props.row.horaout }}
          </q-td>
          <q-td key="observacion" :props="props">
            {{ props.row.observacion }} -  {{ props.row.mochil }}
          </q-td>
           <q-td key="registro" :props="props">
            {{ props.row.user.name}}
          </q-td>
        </q-tr>
      </template>
    </q-table>
  </div>
</template>

<script>
const columns = [
  {
    name: "num",
    required: true,
    align: "center",
    label: " Nº ",
    field: "num",
    sortable: true,
  },
  {
    name: "nombre",
    align: "left",
    label: "Nombre Completo",
    field: "nombre",
    sortable: true,
  },
  {
    name: "horain",
    align: "center",
    label: "Hora Ingreso",
    field: "horain",
    sortable: true,
  },
  {
    name: "motivo",
    align: "center",
    label: "MOTIVO VISITA",
    field: "motivo",
    sortable: true,
  },
  {
    name: "empresa",
    align: "center",
    label: "Empresa o Institucion",
    field: "empresa",
    sortable: true,
  },

  {
    name: "funcionarios",
    align: "center",
    label: "Visito a Funcionario(s)",
    field: "funcionarios",
    sortable: true,
  },

  {
    name: "horaout",
    align: "center",
    label: "hora Salida",
    field: "horaout",
    sortable: true,
  },
  {
    name: "observacion",
    align: "center",
    label: "Observacion",
    field: "observacion",
    sortable: true,
  },
{
    name: "registro",
    label: "Registrado Por:",
    align: "left",
    field: "registro",
    sortable: false,
  },
];

export default {
  name:"Visitas",
  data:() =>({
    date:'2022-07-27',
    date1:"2022-07-27",
    date2:"2022-07-27",
    filter:'',
    data:[],
    columns,
  }),
  created() {

   // this.date=Date.now();
     this.misdatos();
  //  console.log(this.date);
  },

  methods: {
    misdatos() {
     // this.date =new Date()
      console.log(new Date())
      //console.log(this.date)
      this.date1 = this.date.replace("/", "-","gi");
      this.date2 = this.date1.replace("/", "-","gi");
     // console.log(this.date2)
      this.$q.loading.show();
      this.$api.get(process.env.API + "/visitafecha/"+this.date2).then((res) => {
      console.log(res.data)
        this.data = res.data;
       this.$q.loading.hide();
      });


    },
    imprimir(){
       this.$q.notify({
              color: "green-4",
              textColor: "red",
              icon: "edit",
              message: "en construccion",
            });
    }
}
}
</script>
