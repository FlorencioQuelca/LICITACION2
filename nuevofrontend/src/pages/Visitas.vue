<template>
  <div class="q-pa-md">
    <q-btn
      label=" REGISTRAR NUEVA VISITA"
      color="red"
      icon="add_circle"
      @click="alert = true"
      class="q-mb-xs"
    />

    <!--          tabla  PRINCIPAL -->
    <q-table
      :filter="filter"
      title="LISTA DE VISITAS  HOY "
      :rows="data"
      :columns="columns"
      row-key="seguimiento"
      :rows-per-page-options="[10, 20, 50, 100, 0]"
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
          <q-td key="seguimiento" :props="props">
            {{ props.row.seguimiento }}
          </q-td>

          <q-td key="fechaini" :props="props">
            {{ props.row.fechaini }}
          </q-td>
          <q-td key="fechafin" :props="props">
            {{ props.row.fechafin }}
          </q-td>

          <q-td key="car" :props="props">
            {{ props.row.car.placa }} - {{ props.row.car.tipo }}
            {{ props.row.car.marca }} modelo:{{ props.row.car.modelo }}
          </q-td>
          <q-td key="taller" :props="props">
            {{ props.row.taller.nombre }} de:
            {{ props.row.taller.representante }}
          </q-td>
          <q-td key="status" :props="props">
            {{ props.row.status }}
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

    <!--          ADICIONAR NUEVO INFORME  -->
    <q-dialog v-model="alert">
      <q-card style="max-width: 95%; width: 95%">
        <q-card-section class="bg-green-14 text-white">
          <div class="text-h6">
            <q-icon name="add_circle" /> Registrar Nueva Visita
          </div>
        </q-card-section>
        <q-card-section class="q-pt-xs">
          <q-form @submit="onSubmit" @reset="onReset" class="q-gutter-md">
            <div class="row">
              <div class="col-6">
                <q-table
                  :filter="filter1"
                  title="Lista de Personas"
                  :rows="personas"
                  :columns="subcol1"
                  row-key="ci"
                  :rows-per-page-options="[5, 10, 20, 0]"
                  separator="cell"
                  dense
                >

                  <template v-slot:body="props">
                    <q-tr :props="props">

                      <q-td key="ci" :props="props">
                        {{ props.row.ci }}
                      </q-td>
                       <q-td key="nombre" :props="props">
                        {{ props.row.datosp }}
                      </q-td>
                      <q-td key="opcion" :props="props">
                        <q-btn
                          dense
                          round
                          flat
                          color="green"
                          @click="adicionarPersona(props)"
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
                      debounce="100"
                      v-model="filter1"
                      placeholder="Buscar Visitantes"
                    >
                      <template v-slot:append>
                        <q-icon name="search" />
                      </template>
                    </q-input>
                  </template>
                </q-table>

              </div>
              <div class="col-6">
                <q-table
                  :filter="filter2"
                  title="Lista de funcionarios publicos"
                  :rows="personas"
                  :columns="subcol2"
                  row-key="nombre"
                  :rows-per-page-options="[5, 10, 20, 0]"
                  separator="cell"
                  dense
                >

                  <template v-slot:body="props">
                    <q-tr :props="props">
                      <q-td key="ci" :props="props">
                        {{ props.row.ci }}
                      </q-td>
                        <q-td key="nombre" :props="props">
                        {{ props.row.datosp }}
                      </q-td>
                      <q-td key="opcion" :props="props">
                        <q-btn
                          dense
                          round
                          flat
                          color="green"
                          @click="adicionarPersona(props)"
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


              </div>
            </div>
             <div class="row">
              <div class="col-6">
                  <q-select
                  outlined
                  v-model="car"
                  :options="motivos"
                  label="Motivo de visita"
                  type="text"
                  hint="Seleccione o Escriba El Motivo de la visita"
                />

              </div>
              <div class="col-6">
                 <q-select
                  outlined
                  v-model="taller"
                  :options="instituciones"
                  label="Taller"
                  type="text"
                  hint="Seleccionar el taller de envio"
                />
             </div>
             </div>
            <div>
              <q-btn
                label="Crear Visista"
                type="submit"
                color="positive"
                icon="add_circle"
              />
              <q-btn
                label="Cancelar"
                icon="delete"
                color="negative"
                v-close-popup
              />
            </div>
          </q-form>
        </q-card-section>
      </q-card>
    </q-dialog>
    <!--          MODIFICAR REGISTRO -->
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
                  v-model="dato2.seguimiento"
                  type="text"
                  label="Nro Serguimiento (Ej. 01-2022)"
                  hint="Ingresar Numero de seguimiento"
                  lazy-rules
                  :rules="[
                    (val) => (val && val.length > 0) || 'Favor ingresa datos',
                  ]"
                />
                <q-input
                  outlined
                  type="date"
                  v-model="dato2.fechaini"
                  hint="Ingresar Fecha de Inicio"
                />
                <q-input
                  outlined
                  type="date"
                  v-model="dato2.fechafin"
                  hint="Ingresar Fecha de finzalizacion"
                />
              </div>
              <div class="col-6">
                <q-select
                  outlined
                  v-model="car"
                  :options="cars"
                  label="Movilidad"
                  type="text"
                  hint="Seleccionar Un Automovil"
                />
                <q-select
                  outlined
                  v-model="taller"
                  :options="tallers"
                  label="Taller"
                  type="text"
                  hint="Seleccionar el taller de envio"
                />
                <q-option-group
                  v-model="dato2.status"
                  label="Status"
                  :options="[
                    { label: 'Vigente', value: 'activo' },
                    { label: 'Caduco', value: 'inactivo' },
                  ]"
                  color="primary"
                  inline
                />
              </div>
            </div>
            <div>
              <q-btn
                label="Modificar Registro"
                type="submit"
                color="positive"
                icon="add_circle"
              />
              <q-btn
                label="Cancelar"
                icon="delete"
                color="negative"
                v-close-popup
              />
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
  { name: "ci", align: "center", label: "C. I.", field: "ci", sortable: true },
  {
    name: "nombre",
    align: "center",
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
    name: "funcionario",
    align: "center",
    label: "Funcionario(s)",
    field: "funcionario",
    sortable: true,
  },
  {
    name: "horaout",
    align: "center",
    label: "hora Salida",
    field: "horaout",
    sortable: true,
  },
  { name: "opcion", label: "Opcion", align: "center",field: "action", sortable: false },
];
 const subcol1 =[

        {
          name: "ci",
          required: true,
          label: "C.I.",
          align: "left",
          field: "ci",
          sortable: true,
        },
          {
          name: "nombre",
          label: "Nombre completo",
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
     const subcol2=[

        {
          name: "ci",
          required: true,
          label: "C.I.",
          align: "left",
          field: "ci",
          sortable: true,
        },
          {
          name: "nombre",
          label: "Nombre completo",
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
      alert: false,
      dialog_mod: false,
      dialog_del: false,
      data: [],
      dato: {},
      dato2: {},
      filter: '',
      filter1: '',
      filter2: '',
      columns,
      tallers: [],
      cars: [],
      car: {},
      taller: {},
      personas: [],
      funcionarios:[],
      subcol1,
      subcol2,
      motivos: [
        "CONSULTA",
        "VISITA PERSONAL",
        "REUNION",
      ],
      instituciones: [
        "EMPRESA ",
        "COMUNIDAD ",
        "MINISTERIO",
        "ALCALDE DE",
      ],


    };
  },
  created() {
    this.misdatos();
    this.cargardatos();
  },
  methods: {
    misdatos() {
      this.$q.loading.show();

      this.$api.get(process.env.API + "/visitas").then((res) => {
        // console.log(res.data)
        this.data = res.data;
        this.$q.loading.hide();
      });
    },
    cargardatos() {
         this.$api.get(process.env.API + "/consultor").then((res) => {
        this.personas = res.data;
        this.$q.loading.hide();
      });

    },
    onSubmit() {
      this.$q.loading.show();
      this.dato.car_id = this.car.value;
      this.dato.taller_id = this.taller.value;
      // console.log(this.dato);
      this.$api
        .post(process.env.API + "/Solicituds/", this.dato)
        .then((res) => {
          if (res.data.res === true) {
            this.$q.notify({
              color: "green-4",
              textColor: "white",
              icon: "cloud_done",
              message: "Creado Correctamente",
            });
          }
          this.$q.loading.hide();

          this.alert = false;
          this.misdatos();
          this.onReset();
        })
        .catch((e) => {
          this.$q.loading.hide();
        });
    },
    onReset() {
      this.dato.fechaini = null;
      this.dato.fechafin = null;
      this.dato.seguimiento = null;
      this.dato.status = "activo";
    },
    editRow(item) {
      this.dato2 = item.row;
      this.car = {};
      this.cars.forEach((tipo) => {
        if (tipo.value === item.row.car_id)
          this.car = { label: tipo.label, value: tipo.value };
      });
      this.taller = {};
      this.tallers.forEach((tipo) => {
        if (tipo.value === item.row.taller_id)
          this.taller = { label: tipo.label, value: tipo.value };
      });

      this.dialog_mod = true;
    },
    deleteRow(item) {
      this.dato2 = item.row;
      this.dialog_del = true;
    },
    onDel() {
      this.$q.loading.show();
      // console.log(this.dato2.id);
      this.$api
        .delete(process.env.API + "/Solicituds/" + this.dato2.id)
        .then((res) => {
          if (res.data.res === true) {
            //  console.log(res.data);
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
    onMod() {
      this.$q.loading.show();
      this.dato2.car_id = this.car.value;
      this.dato2.taller_id = this.taller.value;
      this.$api
        .put(process.env.API + "/Solicituds/" + this.dato2.id, this.dato2)
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
  },
};
</script>

<style></style>
