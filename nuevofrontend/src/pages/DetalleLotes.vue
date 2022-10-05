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

              <div class="row">
              <q-btn
                icon="join_inner"
                label="asignar"
                stack
                glossy
                color="purple"
                @click="ver_join"
                style="width: 200px; margin: 10px 0px 0px 0px"
              />
            </div>
             <div class="row">
              <q-btn
                icon="add_circle"
                label="ASIGNAR CONTRATO"
                stack
                glossy
                color="purple"
                @click="asignar_contrato"
                style="width: 200px; margin: 10px 0px 0px 0px"
              />
            </div>

          </div>
        </div>
      </q-card-section>

    </q-card>

    <q-card v-if="data.tipo_id === 1 && data.lotes.length===0" dense>
      <q-card-section class="bg-green-14 text-white"  style="padding: 2px 2px 2px 25px">
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
          :columns="subcol2a"
          separator="cell"
          dense
          :rows-per-page-options="[0]"
        >
          <template v-slot:body="props">
            <q-tr :props="props">
              <q-td key="nit" :props="props">
                {{ props.row.nit }}
              </q-td>
             <q-td key="nombreEmpresa" :props="props">
                {{ props.row.nombreEmpresa }}
              </q-td>
              <q-td key="nombreLegal" :props="props">
                {{ props.row.nombreLegal }}
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
          :columns="subcol3a"
          separator="cell"
          dense
          :rows-per-page-options="[0]"
        >
          <template v-slot:body="props">
            <q-tr :props="props">
              <q-td key="codigo" :props="props">
                {{ props.row.codigo }}
              </q-td>
              <q-td key="nombreEmpresa" :props="props">
                {{ props.row.nombreEmpresa }}
              </q-td>
              <q-td key="nombreLegal" :props="props">
                {{ props.row.nombreLegal }}
              </q-td>
              <q-td key="asociados" :props="props">
                   <ul>
                          <span v-for="(empresas,index) in props.row.empresas" :key="index">
                              <li >
                                {{empresas.nit}}  ({{empresas.pivot.participacion}}) %  {{empresas.nombreLegal}}
                            </li>
                          </span>
                        </ul>
                      </q-td>

              <q-td key="monto" :props="props">
                {{ props.row.pivot.monto }}
              </q-td>

            </q-tr>
          </template>
        </q-table>
      </q-card-section>
    </q-card>


  <div  v-for="(lote,index) in data.lotes" :key="index" dense>
    <q-card v-if="data.tipo_id === 1 && data.lotes.length>0"  dense>
      <q-card-section class="bg-green-14 text-white"  style="padding: 2px 2px 2px 25px">
        <div class="text-h6">{{lote.nombre}}</div>
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
          :rows="lote.empresas"
          :columns="subcol2a"
          separator="cell"
          dense
          :rows-per-page-options="[0]"
        >
          <template v-slot:body="props">
            <q-tr :props="props">
              <q-td key="nit" :props="props">
                {{ props.row.nit }}
              </q-td>
             <q-td key="nombreEmpresa" :props="props">
                {{ props.row.nombreEmpresa }}
              </q-td>
              <q-td key="nombreLegal" :props="props">
                {{ props.row.nombreLegal }}
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
          :rows="lote.sociedads"
          :columns="subcol3a"
          separator="cell"
          dense
          :rows-per-page-options="[0]"
        >
          <template v-slot:body="props">
            <q-tr :props="props">
              <q-td key="codigo" :props="props">
                {{ props.row.codigo }}
              </q-td>
              <q-td key="nombreEmpresa" :props="props">
                {{ props.row.nombreEmpresa }}
              </q-td>
              <q-td key="nombreLegal" :props="props">
                {{ props.row.nombreLegal }}
              </q-td>
              <q-td key="asociados" :props="props">
                   <ul>
                          <span v-for="(empresas,index) in props.row.empresas" :key="index">
                              <li >
                                {{empresas.nit}}  ({{empresas.pivot.participacion}}) %  {{empresas.nombreLegal}}
                            </li>
                          </span>
                        </ul>
                      </q-td>

              <q-td key="monto" :props="props">
                {{ props.row.pivot.monto }}
              </q-td>

            </q-tr>
          </template>
        </q-table>
      </q-card-section>
    </q-card>
  </div>

      <q-card v-if="data.tipo_id === 2 && data.lotes.length===0" dense>
        <q-card-section class="bg-green-14 text-white" style="padding: 2px 2px 2px 25px">
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

       <div   v-for="(lote,index) in data.lotes" :key="index">
       <q-card v-if="data.tipo_id === 2 && data.lotes.length>0">
        <q-card-section class="bg-green-14 text-white"  style="padding: 2px 2px 2px 25px">
          <div class="text-h6" > {{lote.nombre}} TOTAL: {{lote.personas.length}}</div>
        </q-card-section>
        <q-card-section class="q-pt-xs">
          <q-table
            :rows="lote.personas"
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

    <q-table
      title="LISTA DE CONTRATOS FIRMADOS"
      :rows="dato.contratos"
      :columns="columnas_contratos"
      row-key="nombre"
      :rows-per-page-options="[0]"
      separator="cell"
   >
     <template v-slot:body="props">
        <q-tr :props="props">
          <q-td key="numero" :props="props">
            {{props.row.numero}}
          </q-td>
           <q-td key="nombre" :props="props">
            {{props.row.nombre}}
          </q-td>
          <q-td key="opcion1" :props="props">
                                  <q-btn
                                    dense
                                    round
                                    flat
                                    color="green"
                                    @click="addRow(props)"
                                    icon="playlist_add"
                                  ></q-btn>
                                  <q-btn
                                    dense
                                    round
                                    flat
                                    color="green"
                                    @click="verRow(props)"
                                    icon="list"
                                  ></q-btn>
                                   <q-btn
                                    dense
                                    round
                                    flat
                                    color="red"
                                    @click="addRow_detail(props)"
                                    icon="playlist_add"
                                  ></q-btn>
                                 <q-btn
                                  dense
                                  round
                                  flat
                                  color="red"
                                  @click="verRow1(props)"
                                  icon="list"
                                ></q-btn>
            </q-td>
              <q-td key="seguimiento" :props="props">
            {{props.row.seguimiento}}
          </q-td>
           <q-td key="fechaini" :props="props">
            {{props.row.fechaini}}
          </q-td>

             <q-td key="montobs" :props="props">
            {{props.row.montobs}}
          </q-td>

            <q-td v-if="$store.state.login.user.tipo==='admin'" key="opcion" :props="props">
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


<div   v-for="(contrato,index) in data.contratos" :key="index">
     <q-card >
      <q-card-section class="bg-green-14 text-white"  >
        <div class="text-h6">{{contrato.nombre}}</div>
      </q-card-section>
        <div class="row">
                <q-item>
                <q-item-section >
                <q-item-label >CONSULTORES</q-item-label>
                  </q-item-section>
               </q-item>
                       <ul>
                          <span v-for="(persona,index) in contrato.personas" :key="index">
                              <li >
                                {{persona.ci}}   {{persona.datosp}} ({{persona.pivot.categoria}})
                            </li>
                          </span>
                        </ul>
        </div>
          <div class="row">
                <q-item>
                <q-item-section >
                <q-item-label >EMPRESAS</q-item-label>
                  </q-item-section>
               </q-item>
                       <ul>
                          <span v-for="(it,index) in contrato.empresas" :key="index">
                              <li >
                                {{it.nit}}   {{it.nombreLegal}} ({{it.pivot.categoria}})
                            </li>
                          </span>

                        </ul>
        </div>
          <div class="row">
                <q-item>
                <q-item-section >
                <q-item-label >SOCIEDADES</q-item-label>
                  </q-item-section>
               </q-item>
                       <ul>
                          <span v-for="(it,index) in contrato.sociedads" :key="index">
                              <li >
                                {{it.nit}}   {{it.nombreLegal}} ({{it.pivot.categoria}})
                            </li>
                          </span>
                        </ul>
        </div>



    </q-card>


</div>


      <!--  adicionar consultor />-->
      <q-dialog v-model="dialog_add1">
      <q-card style="max-width: 80%; width: 90%">
        <q-card-section class="bg-green-14 text-white">
          <div class="text-h6">Agregar Persona</div>
        </q-card-section>
        <q-card-section class="q-pt-xs">
           <q-form @submit="onSendConsultor" class="q-gutter-md">
            <q-table
                  :filter="filter1"
                  title="Lista de personas registradas"
                  :rows="consultores"
                  :columns="subcol1"
                  row-key="ci"
                  :rows-per-page-options="[5, 10, 20]"
                  separator="cell"
                  dense
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
                      <q-td key="opcion" :props="props">
                        <q-btn
                          dense
                          round
                          flat
                          color="green"
                          @click="agregarConsultor(props)"
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
                <ul v-for="(it, index) in consultoresSelectos" :key="index">
                  <li v-if="dato.lotes.length>0">
                      CI:{{it.ci}} Nombre Completo {{it.datosp}} Lote: {{it.lote.label}}
                    </li>
                    <li v-else>
                      Ci:{{it.ci}} Nombre Completo {{it.datosp}}
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

    <!-- Adicionar empresa y/o sociedad accidental/>-->
      <q-dialog v-model="dialog_add2">
      <q-card style="max-width: 100%; width: 100%">
        <q-card-section class="bg-green-14 text-white">
          <div class="text-h6">Agregar Empresa/Sociedad Accidental</div>
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
        <q-card-section class="q-pt-xs">
          <q-form @submit="onSendEmpresaSociedad" class="q-gutter-md">

              <q-card-section v-if="group === 'op1'" class="q-pt-xs">
             <q-table
                  :filter="filter2"
                  title="Lista de Empresas registradas"
                  :rows="empresas"
                  :columns="subcol2"
                  row-key="nit"
                  :rows-per-page-options="[5, 10, 20]"
                  separator="cell"
                  dense
                >
                  <template v-slot:body="props">
                    <q-tr :props="props">
                      <q-td key="nit" :props="props">
                        {{ props.row.nit }}
                      </q-td>
                        <q-td key="nombreEmpresa" :props="props">
            {{props.row.nombreEmpresa}}
          </q-td>

          <q-td key="nombreLegal" :props="props">
            {{props.row.nombreLegal}}
          </q-td>

            <q-td key="fono1" :props="props">
            {{props.row.fono1}}
          </q-td>

          <q-td key="email" :props="props">
            {{props.row.email}}
          </q-td>
          <q-td key="direccion" :props="props">
            {{props.row.direccion}}
          </q-td>

                      <q-td key="opcion" :props="props">
                        <q-btn
                          dense
                          round
                          flat
                          color="green"
                          @click="agregarEmpresa(props)"
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
                      placeholder="Buscar Empresa"
                    >
                      <template v-slot:append>
                        <q-icon name="search" />
                      </template>
                    </q-input>
                  </template>
                </q-table>

               <div class="col-6">
                  <ul v-for="(it, index) in empresasSelectos" :key="index">
                    <li v-if="dato.lotes.length>0">
                      NIT:{{ it.nit }} Empresa: {{it.nombreEmpresa}} Lote: {{it.lote.label}} Monto ofertado: {{it.monto}}
                    </li>
                    <li v-else>
                      NIT: {{ it.nit }} Empresa: {{it.nombreEmpresa}}  Monto Ofertado: {{it.monto}}
                    </li>
                  </ul>
              </div>
              </q-card-section>

              <q-card-section v-if="group === 'op2'" class="q-pt-xs">
                  <q-table
                  :filter="filter3"
                  title="Lista de Sociedades Accidentales"
                  :rows="sociedades"
                  :columns="subcol3"
                  row-key="nombre"
                  :rows-per-page-options="[5, 10, 20]"
                  separator="cell"
                  dense
                >
                  <template v-slot:body="props">
                    <q-tr :props="props">
                      <q-td key="codigo" :props="props">
                        {{ props.row.codigo }}
                      </q-td>

                      <q-td key="nombreEmpresa" :props="props">
                        {{ props.row.nombreEmpresa }}
                      </q-td>
                   <q-td key="nombreLegal" :props="props">
                    {{props.row.nombreLegal}}
                  </q-td>

                   <q-td key="asociados" :props="props">
                          <ul>
                          <span v-for="(empresas,index) in props.row.empresas" :key="index">
                              <li>
                                {{empresas.nit}}  ({{empresas.pivot.participacion}}) %
                            </li>
                          </span>
                        </ul>
                      </q-td>
                       <q-td v-if="$store.state.login.user.tipo==='admin'" key="opcion" :props="props">
                   <q-btn
                        dense
                        round
                        flat
                        color="green"
                        @click="addRow(props)"
                        icon="playlist_add"
                      ></q-btn>
                        <q-btn
                        dense
                        round
                        flat
                        color="green"
                        @click="verRow(props)"
                        icon="list"
                      ></q-btn>
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

                      <q-td key="opcion" :props="props">
                        <q-btn
                          dense
                          round
                          flat
                          color="green"
                          @click="agregarSociedad(props)"
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
                      v-model="filter3"
                      placeholder="Buscar Sociedaad"
                    >
                      <template v-slot:append>
                        <q-icon name="search" />
                      </template>
                    </q-input>
                  </template>
                </q-table>

               <div class="col-6">
                <ul v-for="(it, index) in sociedadesSelectos" :key="index">
                 <li v-if="dato.lotes.length>0">
                      Codigo:{{ it.codigo }} Sociedad: {{it.nombreEmpresa}} Lote: {{it.lote.label}} Monto ofertado: {{it.monto}}
                    </li>
                    <li v-else>
                      Codigo: {{ it.codigo }} Sociedad: {{it.nombreEmpresa}}  Monto Ofertado: {{it.monto}}
                    </li>
                </ul>
              </div>
              </q-card-section>


            <div>
              <q-btn label="Agregar" type="submit" color="positive" icon="add_circle" />
              <q-btn label="Cancelar" icon="delete" color="negative" v-close-popup />
            </div>
          </q-form>
        </q-card-section>
      </q-card>
    </q-dialog>

<!-- Adicionar empresa con monto ofertado-->
      <q-dialog v-model="dialog_add_empresa">
      <q-card style="max-width: 80%; width: 60%">
        <q-card-section class="bg-green-14 text-white">
          <div class="text-h6">Agregar Empresa</div>
        </q-card-section>
        <q-card-section class="q-pt-xs">
          <q-form @submit="onAdd_empresa" class="q-gutter-md">
             <q-select  v-if="dato.lotes.length>0"
                outlined
                v-model="lote"
               :options="lotes"
               label="Lotes"
               >
             </q-select>
             <q-input
              outlined
              v-model="codigo.monto"
              type="number"
              step="0.01"
              label="Monto Ofertante"
              hint="Ingresar Monto ofertante"
            />
            <div>
              <q-btn label="Agregar" type="submit" color="positive" icon="add_circle" />
              <q-btn label="Cancelar" icon="delete" color="negative" v-close-popup />
            </div>
          </q-form>
        </q-card-section>
      </q-card>
    </q-dialog>


    <!-- Adicionar sociedad accidental con monto ofertado-->
      <q-dialog v-model="dialog_add_sociedad">
      <q-card style="max-width: 80%; width: 60%">
        <q-card-section class="bg-green-14 text-white">
          <div class="text-h6">Agregar Sociedad </div>
        </q-card-section>
        <q-card-section class="q-pt-xs">
          <q-form @submit="onAdd_sociedad" class="q-gutter-md">
             <q-select  v-if="dato.lotes.length>0"
                outlined
                v-model="lote"
               :options="lotes"
               label="Lotes"
               >
             </q-select>
             <q-input
              outlined
              v-model="codigo.monto"
              type="number"
              step="0.01"
              label="Monto Ofertante"
              hint="Ingresar Monto ofertante"
            />
            <div>
              <q-btn label="Agregar" type="submit" color="positive" icon="add_circle" />
              <q-btn label="Cancelar" icon="delete" color="negative" v-close-popup />
            </div>
          </q-form>
        </q-card-section>
      </q-card>
    </q-dialog>



    <!-- Adicionar consultor -->
      <q-dialog v-model="dialog_add_consultor">
      <q-card style="max-width: 80%; width: 60%">
        <q-card-section class="bg-green-14 text-white">
          <div class="text-h6">Agregar Consultor</div>
        </q-card-section>
        <q-card-section class="q-pt-xs">
          <q-form @submit="onAdd_consultor" class="q-gutter-md">
             <q-select  v-if="dato.lotes.length>0"
                outlined
                v-model="lote"
               :options="lotes"
               label="Lotes"
               >
             </q-select>
            <div>
              <q-btn label="Agregar" type="submit" color="positive" icon="add_circle" />
              <q-btn label="Cancelar" icon="delete" color="negative" v-close-popup />
            </div>
          </q-form>
        </q-card-section>
      </q-card>
    </q-dialog>
     <!--          ADICIONAR contrato -->
   <q-dialog v-model="form_add_contrato">
      <q-card style="max-width: 80%; width: 80%">
        <q-card-section class="bg-green-14 text-white">
          <div class="text-h6"><q-icon name="add_circle" /> Nuevo Contrato: {{dato.nombre}}</div>
        </q-card-section>
        <q-card-section class="q-pt-xs">
          <q-form @submit="onCreateContrato"  class="q-gutter-md">
            <q-select  v-if="dato.lotes.length>0"
               outlined
              :options="data_lotes"
              v-model="loteElegido"
              label="proyecto asociado"
           >
            </q-select>
             <q-input v-else
              outlined
              v-model="dato.nombre"
              type="text"
              label="Nombre del proyecto"
              hint="Ingresar nombre del proyecto"
            />
               <q-input
              outlined
              v-model="dato2.numero"
              type="text"
              label="Numero de contrato"
              hint="Ingresar Numero de contrato Ej.(02-2022)"
                 lazy-rules
              :rules="[(val) => (val && val.length > 0) || 'Favor ingresa datos']"
            />
           <q-input
              outlined
              v-model="dato2.seguimiento"
              type="text"
              label="Nombre del seguimiento ejemplo FPS/02/2020"
              hint="Ingresar EL SEGUIMIENTO"

            />
             <q-input
                  outlined
                  type="date"
                  v-model="dato2.fechaini"
                  hint="Ingresar Fecha de Inicio de contrato"
                />

            <div>
              <q-btn label="Crear contrato" type="submit" color="positive" icon="add_circle" />
              <q-btn label="Cancelar" icon="delete" color="negative" v-close-popup />
            </div>
          </q-form>
        </q-card-section>
      </q-card>
    </q-dialog>



  </div>
</template>

<script>
const columna = [
  {
    name: 'titulo',
    required: true,
    label: 'Titulo',
    align: 'right',
    field: 'titulo',

  },
  { name: 'descripcion',   align:'lefth', label: 'Descripcion', field: 'descripcion' },

];
export default {
  data: () => ({
    data: {},
    dato: {},
    dato2:{},
    rows:[],
    programa: "",
    departamento: "",
    columna,
    dialog_add1:false,
    dialog_add2:false,
    dialog_add_empresa:false,
    dialog_add_consultor:false,
    dialog_add_sociedad:false,
    form_add_contrato:false,
    data_lotes:[],
    loteElegido:{},

    codigo:{},
    codigos:[],
    lotes:[],
    lote:{},
    consultores:[],
    consultoresSelectos:[],
    empresas:[],
    empresasSelectos:[],
    sociedades:[],
    sociedadesSelectos:[],
    filter1:'',
    filter2:'',
    filter3:'',
    subcol: [{
        name: "nombre",required: true,label: "Codigo de Proyecto",align: "left",// field: (row.codigos) => row.nombre,// field: row => row.name, // format: val => `${val}`,
        field: "nombre",sortable: true,
      },
      {  name: "opcion",label: "opcion",align: "rigth",// field: (row) => row.codigo,
         field: "opcion",sortable: true,
      },
    ],
    subcol1: [
    {name: "ci",required: true,label: "C.I.",align: "center",field: "ci",sortable: true,},
    {name: "fechanac",label: "Fecha de Nacimiento",align: "center",field: "fechanac",sortable: true,},
    {name: "paterno",label: "Apellido Paterno",align: "left",field: "paterno",sortable: true,},
    {name: "materno",label: "Apellido Materno",align: "left",field: "materno",sortable: true,},
    {name: "nombres",label: "Nombres",align: "left",field: "nombres",sortable: true,},
    {name: "nombre",label: "Nombre Completo",align: "left",field: "nombre",sortable: true,},
    {name: "opcion",label: "opcion",align: "left",field: "opcion",sortable: true,},
    ],
    subcol2: [
  {name: "nit", required: true,label: "N.I.T.", align: "left",field: "nit", sortable: true,},
  { name: 'nombreEmpresa',align:"left", label: 'Nombre Empresa', field: 'nombreEmpresa',sortable: true },
  { name: 'nombreLegal', align:"left",label: 'Representante Legal.', field: 'nombreLegal', sortable: true },
  { name: 'fono1', align:"center",label: 'Celular', field: 'fono1', sortable: true },
  //{ name: 'fono2', align:"center",label: 'Telefono', field: 'fono2', sortable: true },
  { name: 'email',align:"left", label: 'Correo', field: 'email', sortable: true },
  { name: 'direccion', align:"left",label: 'Direccion', field: 'direccion', sortable: true },
  { name: "opcion",label: "opcion",align: "left",field: "opcion",sortable: true, },
    ],
  subcol3: [
  {name: "codigo",required: true,label: "codigo",align: "left",field: "codigo",sortable: true,},
  { name: 'nombreEmpresa',align:"left", label: 'Nombre Empresa', field: 'nombreEmpresa',sortable: true },
  { name: 'nombreLegal', align:"left",label: 'Representante Legal.', field: 'nombreLegal', sortable: true },
  { name: "asociados",label: "asociados",align: "left",field: "asociados",sortable: true,},
  { name: 'opcion',align:"center",label: 'Accion', field: 'opcion', sortable: false },
  { name: 'fono1', align:"center",label: 'Celular', field: 'fono1', sortable: true },
  { name: 'fono2', align:"center",label: 'Telefono', field: 'fono2', sortable: true },
  { name: 'email',align:"left", label: 'Correo', field: 'email', sortable: true },
  { name: 'direccion', align:"left",label: 'Direccion', field: 'direccion', sortable: true },
  { name: "opcion",label: "opcion",align: "left",field: "opcion",sortable: true,},
    ],
    subcol2a: [
  {name: "nit", required: true,label: "N.I.T.", align: "left",field: "nit", sortable: true,},
  { name: 'nombreEmpresa',align:"left", label: 'Nombre Empresa', field: 'nombreEmpresa',sortable: true },
  { name: 'nombreLegal', align:"left",label: 'Representante Legal.', field: 'nombreLegal', sortable: true },
  { name: 'monto', align:"center",label: 'Oferta', field: 'monto', sortable: true },
    ],
  subcol3a: [
  {name: "codigo",required: true,label: "codigo",align: "left",field: "codigo",sortable: true,},
  { name: 'nombreEmpresa',align:"left", label: 'Nombre Empresa', field: 'nombreEmpresa',sortable: true },
  { name: 'nombreLegal', align:"left",label: 'Representante Legal.', field: 'nombreLegal', sortable: true },
  { name: "asociados",label: "asociados",align: "left",field: "asociados",sortable: true,},
  { name: 'monto', align:"center",label: 'Oferta', field: 'monto', sortable: true },
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

   columnas_contratos: [
  { name: 'numero', align:"left",label: 'Numero del contrato', field: 'numero', sortable: true },
  { name: 'nombre',required: true, align:"left",label: 'Nombre del Proyecto', field: 'nombre', sortable: true },

  { name: 'opcion1', label: 'Opcion', field: 'opcion1', sortable: false },
  { name: 'seguimiento',align:"left", label: 'Seguimiento', field: 'seguimiento', sortable: true },
  { name: 'fechaini', align:"left",label: 'Fecha de Inicio de contrato', field: 'fechaini', sortable: true },
  { name: 'montobs',align:"left", label: 'Monto de Contrato Bs', field: 'montobs', sortable: true },
 // { name: 'observacion',align:"left", label: 'Observacion', field: 'observacion', sortable: true },
  { name: 'opcion', label: 'Opcion', field: 'opcion', sortable: false }
   ]

  }),
  created() {},
  mounted() {
    this.misdatos();
    this.cargarConsultores();
    this.cargarEmpresas();
    this.cargarSociedades();
  },
  methods: {
    misdatos() {
      this.$q.loading.show();
      this.rows=[]
      this.$api.get(process.env.API + "/proyectoid/" + this.$route.params.id).then((res) => {
          this.data = res.data[0];
          this.dato = res.data[0];
         console.log(res.data)
           this.rows.push({titulo:"Departamento : ", descripcion: res.data[0].departamento.nombre})
           this.rows.push({titulo:"Nombre del Proyecto : ", descripcion: res.data[0].nombre})
           this.rows.push({titulo:"Cuce : ", descripcion: res.data[0].cuce})
           this.rows.push({titulo:"Programa : ", descripcion: res.data[0].programa.nombre})
           this.rows.push({titulo:"Monto toal [Bs] : ", descripcion: res.data[0].precio})
           this.rows.push({titulo:"Plazo [Dias]: ", descripcion: res.data[0].plazo})
         //  this.rows.push({titulo:"Plazo [Dias]: ", descripcion: res.data[0].plazo})
           this.rows.push({titulo:"Enlace de la Reunion ", descripcion: res.data[0].link})
           this.rows.push({titulo:"Hora de la Apertura ", descripcion: res.data[0].hora})
           this.rows.push({titulo:"Fecha de la Apertura ", descripcion: res.data[0].fecha})
        //   this.rows.push({titulo:"Nro de Convocatoria ", descripcion: res.data[0].convocatoria})
           this.rows.push({titulo:"Codigos de proyecto ", descripcion: res.data[0].fecha})
           this.rows.push({titulo:"Comision Evaluadora ", descripcion: res.data[0].fecha})
             this.lotes=[]
           if(res.data[0].lotes.length>0){
               const lotes1=res.data[0].lotes
              lotes1.forEach((it)=> {
                  this.lotes.push({label:it.nombre,value:it.id});
              })
                this.lote=this.lotes[0]
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
      cargarConsultores() {
      this.$api.get(process.env.API + "/consultor").then((res) => {
        this.consultores = res.data;
        // console.log(this.personas);
        this.$q.loading.hide();
      });
      },
      cargarEmpresas() {
      this.$api.get(process.env.API + "/empresa").then((res) => {
        this.empresas = res.data;
       //  console.log(res.data);
        this.$q.loading.hide();
      });
      },
      cargarSociedades() {
      this.$api.get(process.env.API + "/sociedad").then((res) => {
        this.sociedades = res.data;
         // console.log(res.data);
        this.$q.loading.hide();
      });
    },
    ver_join(){

     if (this.$store.state.login.user.tipo==='admin'){
      this.codigo={}
        if (this.dato.tipo_id===2)
         {
                  this.consultoresSelectos=[]
                 this.dialog_add1 = true; //personas
         }else{
                this.group='op1',
                this.empresasSelectos=[]
                this.sociedadesSelectos=[]
                this.dialog_add2 = true; // empresas y sociedades
         }

     }else{
       this.$q.notify({
                          color: "red-4",
                          textColor: "white",
                          icon: "cloud_done",
                          message: "Usted no tiene Permiso para acceder a este sitio",
                        });

     }


    },
    agregarConsultor(item){
      this.codigo={}
            if(this.lotes.length){
                    this.dialog_add_consultor = true;
                    this.codigo=item.row
            }else{
               if(this.consultoresSelectos.length===1){
                    this.$q.notify({
                          color: "red-4",
                          textColor: "white",
                          icon: "cloud_done",
                          message: "Solo puede seleccionar un Registro",
                        });
                }else{
                    this.codigo=item.row
                    this.consultoresSelectos.push(item.row);
                }
           }
    },
    agregarEmpresa(item){
        this.codigo={}
        this.dialog_add_empresa = true;
        this.codigo=item.row
    },
    agregarSociedad(item){
        this.codigo={}
        this.dialog_add_sociedad = true;
        this.codigo=item.row
    },
    onAdd_empresa(){
         if(this.lotes.length){
           this.codigo.lote=this.lote
         }
          if(this.empresasSelectos.length===1){
        this.$q.notify({
                          color: "red-4",
                          textColor: "white",
                          icon: "cloud_done",
                          message: "Solo puede seleccionar un Registro",
                        });
          }else{
        this.empresasSelectos.push(this.codigo);
        this.dialog_add_empresa = false;
          }
   },
    onAdd_sociedad(){
         if(this.lotes.length){
            this.codigo.lote=this.lote
         }
          if(this.sociedadesSelectos.length===1){
        this.$q.notify({
                          color: "red-4",
                          textColor: "white",
                          icon: "cloud_done",
                          message: "Solo puede seleccionar un Registro",
                        });
          }else{
        this.sociedadesSelectos.push(this.codigo);
        this.dialog_add_sociedad = false;
          }
    },
    onAdd_consultor(){
      if(this.consultoresSelectos.length===1){
        this.$q.notify({
                          color: "red-4",
                          textColor: "white",
                          icon: "cloud_done",
                          message: "Solo puede seleccionar un Registro",
                        });
          }else{

            this.codigo.lote=this.lote
            this.consultoresSelectos.push(this.codigo)
            this.dialog_add_consultor = false;
          }
    },
    onSendEmpresaSociedad(){
       if (this.group==='op1'){
                if(this.empresasSelectos.length){
                                   if(this.lotes.length>0){
                                      this.$api.put(process.env.API+"/empresalotes/"+this.codigo.lote.value,{id:this.codigo.id, monto:this.codigo.monto}).then((res) => {
                                      this.$q.notify({
                                            color: "green-4",
                                            textColor: "white",
                                            icon: "cloud_done",
                                            message: "Agregado Correctamente",
                                          });
                                         this.dialog_add2=false;
                                          this.misdatos();
                                        });

                                   }else{

                                     this.$api.put(process.env.API+"/empresaproyectos/"+this.dato.id,{id:this.codigo.id, monto:this.codigo.monto}).then((res) => {
                                      this.$q.notify({
                                            color: "green-4",
                                            textColor: "white",
                                            icon: "cloud_done",
                                            message: "Agregado Correctamente",
                                          });
                                         this.dialog_add2=false;
                                          this.misdatos();
                                        });
                                   }
                  }else{
                              this.$q.notify({
                                      color: "red-4",
                                      textColor: "white",
                                      icon: "cloud_done",
                                      message: "debe  Seleccionar Una Empresa",
                                    });

                }
      }else{
                console.log('ES SOCIEDAD');
                if(this.sociedadesSelectos.length){
                                    if(this.lotes.length>0){
                                           this.$api.put(process.env.API+"/sociedadlotes/"+this.codigo.lote.value,{id:this.codigo.id,monto:this.codigo.monto}).then((res) => {
                                            this.$q.notify({
                                            color: "green-4",
                                            textColor: "white",
                                            icon: "cloud_done",
                                            message: "Agregado Correctamente",
                                            });
                                            this.dialog_add2 = false;
                                            this.misdatos();
                                          });

                                   }else{

                                     this.$api.put(process.env.API+"/sociedadproyectos/"+this.dato.id,{id:this.codigo.id,monto:this.codigo.monto}).then((res) => {
                                            this.$q.notify({
                                            color: "green-4",
                                            textColor: "white",
                                            icon: "cloud_done",
                                            message: "Agregado Correctamente",
                                            });
                                            this.dialog_add2 = false;
                                            this.misdatos();
                                          });
                                   }

                }else{
                              this.$q.notify({
                                      color: "red-4",
                                      textColor: "white",
                                      icon: "cloud_done",
                                      message: "debe Seleccionar Una Sociedad Accidental",
                                    });

                }
         }


    },
    onSendConsultor(){
        if(this.consultoresSelectos.length){
                                if(this.lotes.length>0){
                                  this.$q.loading.show()
                                      console.log('asd',this.codigo)
                                    this.$api.put(process.env.API+"/personalotes/"+this.codigo.lote.value, {id:this.codigo.id}).then((res) => {
                                      console.log(res.data);
                                            this.$q.notify({
                                              color: "green-4",
                                        textColor: "white",
                                        icon: "cloud_done",
                                        message: "Agregado Correctamente",
                                         });
                                       this.dialog_add_consultor = false;
                                           this.dialog_add1=false;
                                        this.$q.loading.hide();
                                         this.misdatos();
                                      }).catch( (it)=>{
                                        this.$q.loading.hide();
                                        console.log(it)
                                      });

                                   }else{
                                    // console.log(this.$route.params.id)
                                   // console.log('this.dato.id',this.dato.id)
                                      //  console.log('asd',this.codigo)
                                    this.$q.loading.show();
                                      this.$api.put(process.env.API+"/personaproyectos/"+this.dato.id, {id:this.codigo.id}).then((res) => {
                                        this.$q.notify({
                                        color: "green-4",
                                        textColor: "white",
                                        icon: "cloud_done",
                                        message: "Agregado Correctamente",
                                         });
                                       this.dialog_add_consultor = false;
                                       this.dialog_add1=false;
                                         this.misdatos();
                                      });
                                       this.$q.loading.hide();

                                   }


                }else{
                              this.$q.notify({
                                      color: "red-4",
                                      textColor: "white",
                                      icon: "cloud_done",
                                      message: "debe Seleccionar un Consultor",
                                    });

                }
    }
    ,
    asignar_contrato(){

       if(this.dato.lotes.length>0){
        this.data_lotes=[]
         this.dato.lotes.forEach(it =>{
          this.data_lotes.push({label:it.nombre ,value:it.id})
         })
         this.loteElegido=this.data_lotes[0];
         this.form_add_contrato=true
       }else{

         this.form_add_contrato=true
       }

    },
    onCreateContrato(){
       if(this.dato.lotes.length>0){
        this.dato2.nombre=this.loteElegido.label
        this.dato2.codigos=this.loteElegido.id
       }else{
         this.dato2.nombre=this.dato.nombre
         this.dato2.codigos=this.dato.id
       }
      this.dato2.proyecto_id =this.dato.id
      this.$q.loading.show();
      this.$api.post(process.env.API+"/contratos/", this.dato2).then((res) => {

         if(res.data.res===true)
          {
            this.$q.notify({
            color: "green-4",
            textColor: "white",
            icon: "cloud_done",
            message: "Contrato Creado Correctamente",
          });

          }else{
            this.$q.loading.hide();
          }
           this.form_add_contrato=false
          this.misdatos();
        }).catch((e)=>{
          this.$q.loading.hide();
          console.log(e)
        });


    },
     addRow_detail(item) {
      this.dato2 = item.row;
      this.codigo={}
      console.log(this.dato2);
        if (this.dato.tipo_id===2)
         {
                 this.dialog_add1 = true;/// personas
                 this.personas=this.dato.personas
                 this.persona={}
                 this.persona.id=-1
         }else{
                 this.dialog_add2 = true;  // empresas, sociedad y consultores
                 this.empresas=this.dato.empresas
                 this.sociedads=this.dato.sociedads
                 this.empresa={}
                 this.empresa.id=-1
                 this.sociedad={}
                 this.sociedad.id=-1

         }
    },
  },
};
</script>
