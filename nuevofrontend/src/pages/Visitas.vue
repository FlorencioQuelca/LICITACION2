<template>
  <div class="q-pa-md">
    <q-btn
      label=" REGISTRAR NUEVA VISITA"
      color="red"
      icon="add_circle"
      @click="nuevo"
      class="q-mb-xs"
    />
     <q-btn
      label=" REGISTRAR NUEVA PERSONA"
      color="green"
      icon="face"
      @click="nuevaPersona"
      class="q-mb-xs"
    />
   <q-btn
      label=""
      flat
      class="q-mb-xs"
    />
    {{timenow}}


    <!--          tabla  PRINCIPAL -->
    <q-table
      :filter="filter"
      title="LISTA DE VISITAS  HOY "
      :rows="data"
      :columns="columns"
      row-key="num"
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

    <!--          ADICIONAR NUEVO INFORME  -->
    <q-dialog v-model="alert">
      <q-card style="max-width: 95%; width: 95%">
        <q-card-section class="bg-green-14 text-white">
          <div class="text-h6">
            <q-icon name="add_circle" /> Registrar Nueva Visita
          </div>
        </q-card-section>
        <q-card-section class="q-pt-xs">
          <q-form @submit="onSubmit" class="q-gutter-md">

            <!--
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
                      debounce="300"
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
                  title="Lista de funcionarios"
                  :rows="funcionarios"
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
                          @click="adicionarfuncionario(props)"
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
                <ul v-for="(it, index) in personasSelectos" :key="index">
                  <li>
                    {{ it.ci }} {{it.datosp}}
                  </li>
                </ul>
              </div>
              <div class="col-6">
                <ul v-for="(it, index) in funcionariosSelectos" :key="index">
                  <li>
                    {{ it.ci }} {{it.datosp}}
                  </li>
                </ul>
              </div>
            </div>
-->
            <div class="row">
              <div class="col-6">
                <q-select
                  outlined
                  v-model="dato.motivo"
                  :options="motivos"
                  label="Motivo de visita"
                  type="text"
                  hint="Seleccione o Escriba El Motivo de la visita"
                />
              </div>
              <div class="col-6">

                <q-select
                  outlined
                  v-model="dato.empresa"
                  :options="instituciones"
                  label="Institucion o Empresa"
                  type="text"
                  hint="Seleccionar Institucion y/o Empresa"
                />

                <q-checkbox
                  keep-color
                  v-model="dato.status"
                  label="Mochila u activos"
                  color="teal"
                />
                <q-input
                  v-if="dato.status == true"
                  outlined
                  type="text"
                  v-model="dato.mochila"
                  hint="Ingresar descripcion de el activo que Ingresa"
                />
              </div>
            </div>
            <div>
              <q-btn
                label="Crear"
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
                <q-select
                  outlined
                  v-model="dato2.motivo"
                  :options="motivos"
                  label="Motivo de visita"
                  type="text"
                  hint="Seleccione o Escriba El Motivo de la visita"
                />
              </div>
              <div class="col-6">

                <q-select
                  outlined
                  v-model="dato2.empresa"
                  :options="instituciones"
                  label="Institucion o Empresa"
                  type="text"
                  hint="Seleccionar Institucion y/o Empresa"
                />
                <q-input
                  outlined
                  type="text"
                  v-model="dato2.mochila"
                   label="Activo Ingresado"
                  hint="Ingresar descripcion de el activo que Ingresa"
                />
              </div>
            </div>
             <q-input
                  outlined
                  type="text"
                  label="Registre alguna observacion de la visita"
                  v-model="dato2.observacion"
                  hint="Observacion"
                />
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

     <!--          ELIMINAR REGISTRO -->
    <q-dialog v-model="dialog_mod1">
      <q-card>
        <q-card-section class="row items-center">
          <q-avatar icon="clear" color="green" text-color="white" />
          <span class="q-ml-sm">Registrar Salida y Devolver Documento</span>
        </q-card-section>

        <q-card-actions align="right">
          <q-btn flat label="Aceptar" color="deep-orange" @click="onout" />
          <q-btn flat label="Cancelar" color="primary" v-close-popup />
        </q-card-actions>
      </q-card>
    </q-dialog>
     <!-- empresas asociados  adicionar  personas a la tabla de visitas/>-->
      <q-dialog v-model="dialog_add1">
      <q-card style="max-width: 80%; width: 80%">
        <q-card-section class="bg-green-14 text-white">
          <div class="text-h6">Agregar Persona</div>
        </q-card-section>
        <q-card-section class="q-pt-xs">
           <q-form @submit="onAdd1" class="q-gutter-md">
            <q-table
                  :filter="filter1"
                  title="Lista de personas registradas"
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
                      debounce="300"
                      v-model="filter1"
                      placeholder="Buscar Persona"
                    >
                      <template v-slot:append>
                        <q-icon name="search" />
                      </template>
                    </q-input>
                  </template>
                </q-table>
                  <div class="col-6">
                <ul v-for="(it, index) in personasSelectos" :key="index">
                  <li style="color=red">
                    {{ it.ci }} {{it.datosp}}
                  </li>
                </ul>
              </div>
            <div>
              <q-btn label="Agregar" type="submit" color="positive" icon="add_circle" />
              <q-btn label="Cancelar" icon="delete" color="negative" v-close-popup />
            </div>
          </q-form>
        </q-card-section>
      </q-card>
    </q-dialog>

<!-- empresas asociados  adicionar  funcionarios a la tabla de visitas/>-->
      <q-dialog v-model="dialog_add2">
      <q-card style="max-width: 80%; width: 80%">
        <q-card-section class="bg-green-14 text-white">
          <div class="text-h6">Agregar Funcionario</div>
        </q-card-section>
        <q-card-section class="q-pt-xs">
           <q-form @submit="onAdd2" class="q-gutter-md">
            <q-table
                  :filter="filter2"
                  title="Lista de funcionarios"
                  :rows="funcionarios"
                  :columns="subcol2"
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
                          color="red"
                          @click="adicionarfuncionario(props)"
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
                  <div class="col-6">
                <ul v-for="(it, index) in funcionariosSelectos" :key="index">
                  <li >
                    {{ it.ci }} {{it.datosp}}
                  </li>
                </ul>
              </div>
            <div>
              <q-btn label="Agregar" type="submit" color="positive" icon="add_circle" />
              <q-btn label="Cancelar" icon="delete" color="negative" v-close-popup />
            </div>
          </q-form>
        </q-card-section>
      </q-card>
    </q-dialog>

          <!-- VER LISTA Y ELIMINAR />-->
   <q-dialog v-model="dialog_list">
      <q-card style="max-width: 80%; width: 40%">
        <q-card-section class="bg-green-14 text-white">
          <div class="text-h6">DESASOCIAR </div>
        </q-card-section>
        <q-card-section class="q-pt-xs">
                <q-table
                    :rows="personas1"
                    :columns="subcol1"
                     :rows-per-page-options="[0]"
                      separator="cell"
                      dense
                    >
      <template v-slot:body="props" >
          <q-tr :props="props">
           <q-td key="ci" :props="props"  >
            {{ props.row.pivot.tipo}}
          </q-td>
          <q-td key="nombre" :props="props" >
            {{ props.row.datosp}}
          </q-td>
          <q-td key="opcion" :props="props">
                        <q-btn

                        dense
                        round
                        flat
                        color="red"
                        @click="deletesub(props)"
                        icon="delete"
                      ></q-btn>
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

     <q-dialog v-model="dialog_del1">
      <q-card>
        <q-card-section class="row items-center">
          <q-avatar icon="clear" color="red" text-color="white" />
          <span class="q-ml-sm">DESASOCIAR?</span>
        </q-card-section>

        <q-card-actions align="right">
          <q-btn flat label="Aceptar" color="deep-orange" @click="deletesub1" />
          <q-btn flat label="Cancelar" color="primary" v-close-popup />
        </q-card-actions>
      </q-card>
    </q-dialog>
       <!--          ADICIONAR REGISTRO PERSONA -->
   <q-dialog v-model="alert123">
      <q-card style="max-width: 80%; width: 80%">

        <q-card-section class="bg-green-14 text-white">
          <div class="text-h6"><q-icon name="add_circle" /> Nueva Persona</div>
        </q-card-section>
        <q-card-section class="q-pt-xs">
          <q-form @submit="onSubmitPersona"  class="q-gutter-md">
                 <div class="row">
              <div class="col-6">
            <q-input
              outlined
              v-model="dato1.ci"
              type="text"
              label="C.I."
              mask="####XXXXXXXXXXX"
              hint="Ingresar Cedula de Identidad"
              lazy-rules
              :rules="[(val) => (val && val.length > 0) || 'Favor ingresa datos']"
            />

            <q-input
              outlined
              v-model="dato1.paterno"
              type="text"
              label="Apellido Paterno"
              hint="Ingresar Apellido Paterno"

            />
            <q-input
              outlined
              v-model="dato1.materno"
              type="text"
              label="Apellido Materno"
              hint="Ingresar Apellido Materno"


            />
             <q-input
              outlined
              v-model="dato1.nombres"
              type="text"
              label="Nombres"
              hint="Ingresar Nombres"
              lazy-rules
              :rules="[(val) => (val && val.length > 0) || 'Favor ingresa datos']"
            />
             </div>
             <div class="col-6">
                 <q-select
             outlined
            v-model="dato1.genero"
            :options="generos"
            label="Genero"
            type="text"
            hint="Seleccionar Genero"
            />
             <q-input
                  outlined
                  type="date"
                  v-model="dato1.fechaNacimiento"
                  hint="Ingresar Fecha de Nacimiento"
                />

             <q-input
              outlined
              v-model="dato1.observacion"
              type="text"
              label="Observacion"
              hint="Ingresar alguna Observacion de la Persona"
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

<script>
import { date } from 'quasar';
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
const subcol1 = [
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
const subcol2 = [
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
import moment from 'moment';
export default {
  data() {
    return {
      alert: false,
      alert123:false,
      dialog_mod: false,
      dialog_mod1:false,
      dialog_add1:false,
      dialog_add2:false,
      dialog_del: false,
      dialog_del1:false,
      dialog_list:false,
      funcionarios1:[],
      personas1:[],
      data: [],
    //  timenow:moment(now()).format('MMMM Do YYYY, h:mm:ss a'),
      dato:{},
      dato1:{},
      dato2:{},
      dato3:{},
      filter: "",
      filter1: "",
      filter2: "",
      columns,
      personas: [],
      personasSelectos: [],
      funcionarios: [],
      funcionariosSelectos: [],
      subcol1,
      subcol2,
      motivos: ["CONSULTA", "VISITA", "SEGUIMIENTO DE TRAMITE","PERSONAL","SEGUIMIENTO", "FIRMA DE CONTRATO","REUNION", "COORDINACION","APERTURA DE SOBRES"],
      instituciones: ["EMPRESA ","SUPERVISION","COMUNIDAD", "MINISTERIO", "PROVINCIA","FPS CENTRAL","PERSONAL"],
       generos:[
      'HOMBRE',
      'MUJER'
       ],
    };
  },
  created() {
    this.misdatos();
    this.cargardatos1();
    this.cargardatos2();
    this.timenow=new Date();
  },
  methods: {
    misdatos() {
      this.$q.loading.show();

      this.$api.get(process.env.API + "/visitas").then((res) => {
       console.log(res.data)
        this.data = res.data;
        this.$q.loading.hide();
      });
    },
    cargardatos1() {
      this.$api.get(process.env.API + "/visitantes").then((res) => {
        this.personas = res.data;
        //  console.log(this.personas);
        this.$q.loading.hide();
      });
    },
    cargardatos2(){
      this.$api.get(process.env.API + "/funcionarios").then((res) => {
        this.funcionarios = res.data;
        // console.log(this.funcionarios);
        this.$q.loading.hide();
      });
    },
    onSubmit() { /// trabajando aqui
      this.$q.loading.show();
      this.dato.user_id =this.$store.state.login.user.id
      this.dato.departamento_id = 2
     // this.dato.horain=moment().format('MMMM Do YYYY, h:mm:ss a');
     // console.log(this.dato.horain)

      this.$api
        .post(process.env.API + "/visitas", this.dato)
        .then((res) => {
          if (res.data.res === true) {
               if(this.personasSelectos.length>0){
                console.log("hay datos")
               }


            this.$q.notify({
              color: "green-4",
              textColor: "white",
              icon: "cloud_done",
              message: "Creado Correctamente",
            });
          }else{
            this.$q.notify({
              color: "red-4",
              textColor: "white",
              icon: "cloud_done",
              message: "Error al crear registro",
            });



            }

    //creado
        // console.log(this.data)

            this.$q.loading.hide();
          this.alert = false;
          this.misdatos();

        })
        .catch((e) => {
          this.$q.loading.hide();
        });
    },

    editRow(item) {
      this.dato2 = item.row;
       this.dialog_mod = true;
    },
    deleteRow(item) {
      this.dato2 = item.row;
      this.dialog_del = true;
    },
    onDel() {
      this.$q.loading.show();
       this.dato.user_id =this.$store.state.login.user.id
      this.dato.departamento_id = 2
      this.$api
        .delete(process.env.API + "/visitas/" + this.dato2.id)
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
    onMod() {
      this.$q.loading.show();
      this.$api
        .put(process.env.API + "/visitas/" + this.dato2.id, this.dato2)
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
    onout() {
      this.$q.loading.show();
      this.$api
        .put(process.env.API + "/registrarSalida/" + this.dato2.id)
        .then((res) => {
          console.log(res.data)
          if (res.data.res === true) {
            this.$q.notify({
              color: "green-4",
              textColor: "white",
              icon: "cloud_done",
              message: "Modificado correctamente",
            });
          }
          this.dialog_mod1= false;
          this.misdatos();
          this.$q.loading.hide();
        });
    },

    nuevo() {
      this.personasSelectos = []
      this.funcionariosSelectos = []
      this.dato = {};
      let  maxi=-99;
      this.dato.num=1
      this.data.forEach(it=>{
     //  console.log(it.num)
          if(it.num > maxi){
            this.dato.num=it.num+1
            maxi=it.num
          }
      })
      if(maxi<0){
        this.dato.num=1
      }
  //    console.log(this.dato.num)
       this.alert = true;

    },
    adicionarPersona(item) {
      this.personasSelectos.push(item.row);
      console.log(this.personasSelectos);
    },
    adicionarfuncionario(item) {
      this.funcionariosSelectos.push(item.row);
      console.log(this.funcionariosSelectos);
    },
    editRow1(item) {
      this.dato2 = item.row;
       this.dialog_mod1 = true;
    },

    addRow1(item) {
      this.dato2 = item.row;
      this.dialog_add1 = true;
      this.personasSelectos=[];
        this.filter1= ""
    },
    addRow2(item) {
      this.dato2 = item.row;
      this.funcionariosSelectos=[]
      this.filter2= ""
         this.dialog_add2 = true;
    },
    onAdd1() {
        let ans={}
      this.personasSelectos.forEach(it =>{
      this.$q.loading.show();
             ans=it
                    ans.tipo="visita"
             this.$api.put(process.env.API+"/personavisitas/"+this.dato2.id,ans).then((res) => {
                  if(res.data.res===true){
                  this.$q.notify({
                          color: "green-4",
                          textColor: "white",
                          icon: "cloud_done",
                          message: "Agregado Correctamente",
                        });
                      this.$q.loading.hide();
                        this.misdatos();
                        }else{
                            this.$q.notify({
                          color: "red-4",
                          textColor: "white",
                          icon: "cloud_done",
                          message: "Error al agregar",
                        });
                             this.$q.loading.hide();
                        }
                       });

      })
       this.dialog_add1 = false;
     },
      onAdd2() {
        let ans={}
      this.funcionariosSelectos.forEach(it =>{
      this.$q.loading.show();
             ans=it
                    ans.tipo="funcionario"
             this.$api.put(process.env.API+"/personavisitas/"+this.dato2.id,ans).then((res) => {
                  if(res.data.res===true){
                  this.$q.notify({
                          color: "green-4",
                          textColor: "white",
                          icon: "cloud_done",
                          message: "Agregado Correctamente",
                        });
                      this.$q.loading.hide();
                        this.misdatos();
                        }else{
                            this.$q.notify({
                          color: "red-4",
                          textColor: "white",
                          icon: "cloud_done",
                          message: "Error al agregar",
                        });
                             this.$q.loading.hide();
                        }
                       });

      })
       this.dialog_add2 = false;
     },
      verRow1(item) {
      this.dato2=item.row;
      console.log(this.dato2)
      this.personas1=[]
      item.row.personas.forEach(it=>{
        if(it.pivot.tipo==="visita"){
       this.personas1.push(it)
        }
      })
       this.dialog_list = true;
    },
     verRow2(item) {
      this.dato2=item.row;
      this.personas1=[]
      item.row.personas.forEach(it=>{
        if(it.pivot.tipo==="funcionario"){
       this.personas1.push(it)
        }
      })
       this.dialog_list = true;

    },
    deletesub(item){
        this.dato3 =item.row;
        console.log(this.dato3);
        this.dialog_del1 = true;
    },
     deletesub1() {
      this.$q.loading.show();
      this.$api.put(process.env.API + "/personavisitadetach/" + this.dato2.id,this.dato3)
        .then((res) => {
          if (res.data.res === true) {
            this.$q.notify({
              color: "green-4",
              textColor: "white",
              icon: "cloud_done",
              message: "desasociado correctamente",
            });
          }
          this.dialog_del1 = false;
          this.dialog_list=false;
          this.misdatos();
        });
    },
    nuevaPersona(){
      this.dato1={}
      this.alert123=true;

    },
     onSubmitPersona() {
       this.dato1.datosp =(this.dato1.nombres).trim().toUpperCase()+" "+(this.dato1.paterno).trim().toUpperCase()+" "+(this.dato1.materno).trim().toUpperCase();
       this.dato1.status="NATURAL";
      this.$q.loading.show();
      this.$api.post(process.env.API+"/consultor/", this.dato1).then((res) => {

         if(res.data.res===true)
          {
            this.$q.notify({
            color: "green-4",
            textColor: "white",
            icon: "cloud_done",
            message: "Creado Correctamente",
          });

          }else{
              this.$q.notify({
            color: "red-4",
            textColor: "white",
            icon: "cloud_done",
            message: "Error al crear verifique la existencia de la persona",
          });
            this.$q.loading.hide();
          }
         this.alert123= false;
          this.misdatos();
          this.cargardatos1();
        }).catch((e)=>{
          this.$q.loading.hide();
        });
    },

  },
};
</script>

<style></style>
