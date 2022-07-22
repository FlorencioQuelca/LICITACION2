<template>
   <div class="q-pa-md">

  <div style="max-width: 300px" dense>
     <q-input filled v-model="date" mask="date" :rules="['date']">
      <template v-slot:append>
        <q-icon name="event" class="cursor-pointer">
          <q-popup-proxy cover transition-show="scale" transition-hide="scale">
            <q-date v-model="date">
              <div class="row items-center justify-end">
                <q-btn v-close-popup label="aceptar" color="primary" flat />
              </div>
            </q-date>
          </q-popup-proxy>
        </q-icon>
      </template>
    </q-input>
    </div>

    <!--          tabla  PRINCIPAL -->
    <q-table
      :filter="filter"
      title="LISTA DE VISITAS  de:  "
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
           <q-td key="opcion1" :props="props">
                      <q-btn
                        dense
                        round
                        flat
                        color="green"
                        @click="addRow1(props)"
                        icon="playlist_add"
                      ></q-btn>
                        <q-btn
                        dense
                        round
                        flat
                        color="green"
                        @click="verRow1(props)"
                        icon="list"
                      ></q-btn>
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

           <q-td key="horaout" :props="props">
            {{ props.row.horaout }}
             <q-btn
              dense
              round
              flat
              color="green"
              @click="editRow1(props)"
              icon="logout"
            />
          </q-td>
          <q-td key="observacion" :props="props">
            {{ props.row.observacion }} -  {{ props.row.mochil }}
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
            <!--
            <q-btn
              dense
              round
              flat
              color="red"
              @click="deleteRow(props)"
              icon="delete"
            ></q-btn>
            -->
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
    name: "opcion1",
    label: "+ Visita",
    align: "center",
    field: "action1",
    sortable: false,
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
    name: "opcion",
    label: "Opcion",
    align: "center",
    field: "action",
    sortable: false,
  },
];

export default {
  name:"Visitas",
  data:() =>({
    date:'2022/07/22',
    filter:'',
    data:[],
    columns,
  })
}
</script>
