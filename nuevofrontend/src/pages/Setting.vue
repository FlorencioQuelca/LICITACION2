<template>
  <div class="q-pa-md">
    <q-btn
      label="Atras"
      color="secondary"
      icon="arrow_back"
      @click="this.$router.push('/Proyecto')"
      class="q-mb-xs"
    />
    <q-card
      class="my-card text-white"
      style="
        background: radial-gradient(circle, #35a2ff 0%, #014a88 100%);
        padding: 0px;
      "
      square
      flat
      bordered
    >
      <q-card-section>
        <div class="row" style="padding: 0px">
          <div class="q-pa-md col-10" style="padding: 0px">
            <div class="row" style="padding: 0px; border: 0px; display: flex">
              <div
                class="q-pa-md col-6"
                style="
                  color: white;
                  text-align: right;
                  padding: 0px;
                  border: 0px;
                "
              >
                <span>DATOS GENERALES DEL PROYECTO </span>
              </div>
            </div>
            <q-table
              class="my-sticky-header-column-table"
              :rows="rows"
              :columns="columna"
               row-key="titulo"
              separator="cell"
              :rows-per-page-options="[0]"
              hide-bottom
              dense
            >
            </q-table>
          </div>

          <div
            class="q-pa-md col-2"
            style="
              display: flex;
              flex-direction: column;
              justify-content: center;
            "
          >
            <div class="row">
              <q-btn
                icon="add_circle"
                label="Empresas"
                stack
                glossy

                color="purple"
                style="width: 200px"
              />
            </div>
            <div class="row">
              <q-btn
                icon="add_circle"
                label="Sociedad Accidental"
                stack
                glossy

                color="purple"
                style="width: 200px; margin: 10px 0px 0px 0px"
              />
            </div>

            <div class="row">
              <q-btn
                icon="add_circle"
                label="Consultor"
                stack
                glossy

                color="purple"
                style="width: 200px; margin: 10px 0px 0px 0px"
              />
            </div>
          </div>
        </div>
      </q-card-section>
    </q-card>



    <q-card v-if="data.tipo_id === 1" dense>
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
      <q-card-section v-if="group === 'op1'" class="q-pt-xs">
        <q-table
          :rows="data.empresas"
          :columns="subcol2"
          separator="cell"
          dense
          :rows-per-page-options="[0]"
        >
          <template v-slot:body="props">
            <q-tr :props="props">
              <q-td key="nit" :props="props">
                {{ props.row.nit }}
              </q-td>
              <q-td key="nombre" :props="props">
                {{ props.row.nombreEmpresa }}
              </q-td>
              <q-td key="monto" :props="props">
                {{ props.row.pivot.monto }}
              </q-td>
            </q-tr>
          </template>
        </q-table>
      </q-card-section>

      <q-card-section v-else class="q-pt-xs">
        <q-table
          :rows="data.sociedads"
          :columns="subcol3"
          separator="cell"
          dense
          :rows-per-page-options="[0]"
        >
          <template v-slot:body="props">
            <q-tr :props="props">
              <q-td key="codigo" :props="props">
                {{ props.row.codigo }}
              </q-td>
              <q-td key="nombre" :props="props">
                {{ props.row.nombreEmpresa }}
              </q-td>
              <q-td key="monto" :props="props">
                {{ props.row.pivot.monto }}
              </q-td>
              <q-td key="empresas" :props="props">
                <ul>
                  <span
                    v-for="(empresas, index) in props.row.empresas"
                    :key="index"
                  >
                    <li>
                      {{ empresas.nit }} ({{ empresas.pivot.participacion }}) %
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
      <q-card v-if="data.tipo_id === 2" dense>
        <q-card-section class="bg-green-14 text-white" dense>
          <div class="text-h6" dense>Lista de consultores presentados</div>
        </q-card-section>
        <q-card-section class="q-pt-xs">
          <q-table
            :rows="data.personas"
            :columns="subcol1"
            separator="cell"
            dense
            :rows-per-page-options="[0]"
          >
            <template v-slot:body="props">
              <q-tr :props="props">
                <q-td key="ci" :props="props">
                  {{ props.row.ci }}
                </q-td>
                <q-td key="fechanac" :props="props">
                  {{ props.row.fechaNacimiento }}
                </q-td>
                <q-td key="paterno" :props="props">
                  {{ props.row.paterno }}
                </q-td>
                <q-td key="materno" :props="props">
                  {{ props.row.materno }}
                </q-td>
                <q-td key="nombres" :props="props">
                  {{ props.row.nombres }}
                </q-td>
                <q-td key="nombre" :props="props">
                  {{ props.row.datosp }}
                </q-td>
              </q-tr>
            </template>
          </q-table>
        </q-card-section>
      </q-card>
    </div>
  </div>
</template>

<script>
const columna = [
  {
    name: 'titulo',
    required: true,
    label: 'Titulo',
    align: 'right',
    field: 'titulo'
  },
  { name: 'descripcion',   align:'lefth', label: 'Descripcion', field: 'descripcion' },

];
export default {
  data: () => ({
    data: {},
    rows:[],
    programa: "",
    departamento: "",
    columna,
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
        field: "ci",
        sortable: true,
      },
      {
        name: "fechanac",
        label: "Fecha de Nacimiento",
        align: "center",
        field: "fechanac",
        sortable: true,
      },
      {
        name: "paterno",
        label: "Apellido Paterno",
        align: "left",
        field: "paterno",
        sortable: true,
      },
      {
        name: "materno",
        label: "Apellido Materno",
        align: "left",
        field: "materno",
        sortable: true,
      },
      {
        name: "nombres",
        label: "Nombres",
        align: "left",
        field: "nombres",
        sortable: true,
      },
      {
        name: "nombre",
        label: "Nombre Completo",
        align: "left",
        field: "nombre",
        sortable: true,
      },
    ],
    subcol2: [
      {
        name: "nit",
        required: true,
        label: "N.I.T.",
        align: "left",
        field: "nit",
        sortable: true,
      },
      {
        name: "nombre",
        label: "Nombre de la Empresa",
        align: "left",
        field: "nombre",
        sortable: true,
      },
      {
        name: "monto",
        label: "Monto Ofertado",
        align: "left",
        field: "monto",
        sortable: true,
      },
    ],
    subcol3: [
      {
        name: "codigo",
        required: true,
        label: "codigo",
        align: "left",
        field: "codigo",
        sortable: true,
      },
      {
        name: "nombre",
        label: "Nombre de la Sociedad",
        align: "left",
        field: "nombre",
        sortable: true,
      },
      {
        name: "monto",
        label: "Monto Ofertado",
        align: "left",
        field: "monto",
        sortable: true,
      },
      {
        name: "empresas",
        label: "asociados",
        align: "left",
        field: "asociados",
        sortable: true,
      },
    ],

    opciones: [
      {
        label: "Lista de Empresas",
        value: "op1",
      },
      {
        label: "Lista de Sociedad Accidental",
        value: "op2",
      },
    ],
    group: "op1",
  }),
  created() {},
  mounted() {
    this.misdatos();
  },
  methods: {
    misdatos() {
      this.$q.loading.show();
      this.rows=[]
      this.$api.get(process.env.API + "/proyectoid/" + this.$route.params.id).then((res) => {
          this.data = res.data[0];
           console.log(res.data)
           this.rows.push({titulo:"Nombre del Proyecto : ", descripcion: res.data[0].nombre})
           this.rows.push({titulo:"Departamento : ", descripcion: res.data[0].departamento.nombre})
           this.rows.push({titulo:"Cuce : ", descripcion: res.data[0].cuce})
           this.rows.push({titulo:"Programa : ", descripcion: res.data[0].programa.nombre})
           this.rows.push({titulo:"Monto toal [Bs] : ", descripcion: res.data[0].precio})
           this.rows.push({titulo:"Plazo [Dias]: ", descripcion: res.data[0].plazo})
           this.rows.push({titulo:"Plazo [Dias]: ", descripcion: res.data[0].plazo})
           this.rows.push({titulo:"Enlace de la Reunion ", descripcion: res.data[0].link})
           this.rows.push({titulo:"Hora de la Apertura ", descripcion: res.data[0].hora})
           this.rows.push({titulo:"Fecha de la Apertura ", descripcion: res.data[0].fecha})
           this.rows.push({titulo:"Nro de Convocatoria ", descripcion: res.data[0].convocatoria})
           this.rows.push({titulo:"Codigos de proyecto ", descripcion: res.data[0].fecha})
           this.rows.push({titulo:"Comision Evaluadora ", descripcion: res.data[0].fecha})
            if(res.data[0].lotes.length>0){
              this.rows.push({titulo:"Nº de lotes ", descripcion: res.data[0].lotes.length})
            }else{
              this.rows.push({titulo:"Nº de lotes ", descripcion: "PROCESO SIN LOTES"})
            }
          this.departamento = res.data[0].departamento.nombre;
          this.programa = res.data[0].programa.nombre;
          // console.log(res.data[0]);
          this.$q.loading.hide();
        });
    },
  },
};
</script>
