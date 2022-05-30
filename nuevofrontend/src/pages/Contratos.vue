<template>
   <div class="q-pa-md">
    <div v-if="$store.state.login.user.tipo==='admin'">
     <q-btn
      label="Nuevo Contrato"
      color="red"
      icon="add_circle"
      @click="onalert()"
      class="q-mb-xs"
     />
    </div>
     <!--          ADICIONAR REGISTRO -->
   <q-dialog v-model="alert">
      <q-card style="max-width: 80%; width: 80%">
        <q-card-section class="bg-green-14 text-white">
          <div class="text-h6"><q-icon name="add_circle" /> Nuevo Contrato</div>
        </q-card-section>
        <q-card-section class="q-pt-xs">
          <q-form @submit="onSubmit" @reset="onReset" class="q-gutter-md">
                 <div class="row">
              <div class="col-6">
            <q-select
             filled
              v-model="proyecto"
             use-input
              hide-selected
              fill-input
              input-debounce="0"
            :options="proyectos"
            label="proyecto asociado"
            @filter="filtarProyectos"
             @popup-hide="seleccion"
           >
             <template v-slot:no-option>
          <q-item>
            <q-item-section class="text-grey">
              NO HAY RESULTADOS DE BUSQUEDA
            </q-item-section>
          </q-item>
        </template>
        </q-select>
            <q-input
              outlined
              v-model="dato.nombre"
              type="text"
              label="Nombre unico de el contrato"
              hint="Ingresar nombre unico de contrato"
                 lazy-rules
              :rules="[(val) => (val && val.length > 0) || 'Favor ingresa datos']"

            />
            <q-input
              outlined
              v-model="dato.numero"
              type="text"
              label="Numero de contrato"
              hint="Ingresar Numero de contrato Ej.(02-2022)"
                 lazy-rules
              :rules="[(val) => (val && val.length > 0) || 'Favor ingresa datos']"

            />
            <q-input
              outlined
              v-model="dato.seguimiento"
              type="text"
              label="Nombre del seguimiento ejemplo FPS/02/2020"
              hint="Ingresar EL SEGUIMIENTO"

            />
            <q-input
              outlined
              v-model="dato.montobs"
              type="number"
              step=0.001
              label="Monto del Contrato Bs"
              hint="Ingresar monto en Bs"
            />
             <q-input
              outlined
              v-model="dato.observacion"
              type="text"
              label="Observacion"
              hint="Ingresar alguna observacion"
            />
             </div>
              <div class="col-6">
                <q-input
                  outlined
                  v-model="dato.codigos"
                  type="text"
                  label="codigo(s) de los proyectos"
                  hint="Ingresar codigo o codigos de los proyectos"
                />
                 <q-input
                  outlined
                  type="date"
                  v-model="dato.fechaini"
                  hint="Ingresar Fecha de Inicio de contrato"
                />
                <q-input
                  outlined
                  type="date"
                  v-model="dato.fechafin"
                  hint="Ingresar Fecha de fin de contrato"
                />
                <q-input
                    outlined
                    v-model="dato.duracion"
                    type="number"
                    step="1"
                    label="duracion exacta"
                    hint="Ingresar la duracion del contrato"
                  />
                   <q-input
                    outlined
                    v-model="dato.plus"
                    type="number"
                    step="1"
                    label="Duracion plus"
                    hint="Ingresar +/- duracion"
                  />
              <q-option-group
                v-model="dato.status"
                :options="[{label:'CONTRATO VIGENTE', value:'VIGENTE'},{label:'CONTRATO FINALIZADO', value:'CADUCO'}]"
                color="secondary"
                inline
              />

              </div>

             </div>
            <div>
              <q-btn label="Crear contrato" type="submit" color="positive" icon="add_circle" />
              <q-btn label="Cancelar" icon="delete" color="negative" v-close-popup />
            </div>
          </q-form>
        </q-card-section>
      </q-card>
    </q-dialog>
  <!--          tabla PRINCIPOAL -->

    <q-table
      :filter="filter"
      title="Lista de Contratos firmados"
      :rows="data"
      :columns="columns"
      row-key="nombre"
      :rows-per-page-options="[50,100,200]"
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
          <q-td key="numero" :props="props">
            {{props.row.numero}}
          </q-td>
           <q-td key="nombre" :props="props">
            {{props.row.proyecto.nombre}}
          </q-td>


           <q-td key="archivos" :props="props">
              <ul>
              <span v-for="(codigos,index) in props.row.archivos" :key="index">
                  <li>

                    {{codigos.nombre}}  {{codigos.id}}
                        <q-btn
                            dense
                            round
                            flat
                            color="green"
                            @click="download(codigos)"
                            icon="download"
                          ></q-btn>
                </li>
              </span>
             </ul>
          </q-td>
            <q-td key="opcion1" :props="props">
                                  <q-btn v-if="$store.state.login.user.tipo==='admin'"
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
                                   <q-btn v-if="$store.state.login.user.tipo==='admin'"
                                    dense
                                    round
                                    flat
                                    color="red"
                                    @click="addRow1(props)"
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
           <q-td key="fechafin" :props="props">
            {{props.row.fechafin}}
          </q-td>
             <q-td key="duracion" :props="props">
            {{props.row.duracion}}
          </q-td>
            <q-td key="plus" :props="props" >
               {{props.row.plus}}
          </q-td>
        <q-td key="montobs" :props="props">
            {{props.row.montobs}}
          </q-td>
           <q-td key="montosus" :props="props">
            {{props.row.montosus}}
          </q-td>
          <q-td key="status" :props="props">
            {{props.row.status}}
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



          <!-- VER LISTA de PERSONAS Y ELIMINAR />-->
   <q-dialog v-model="dialog_list1">
      <q-card style="max-width: 80%; width: 50%">
        <q-card-section class="bg-green-14 text-white">
          <div class="text-h6">Lista de consultores Contratados</div>
        </q-card-section>
        <q-card-section class="q-pt-xs">
                <q-table
                    :rows="dato2.personas"
                    :columns="subcol1"
                    dense
                    :rows-per-page-options="[0]"
                    separator="cell"
                    >
      <template v-slot:body="props">
          <q-tr :props="props">
          <q-td key="nombre" :props="props">
            {{ props.row.datosp}}
          </q-td>
          <q-td key="ci" :props="props">
            {{ props.row.ci}}
          </q-td>
           <q-td key="fecha" :props="props">
            {{ props.row.fechaNacimiento}}
          </q-td>
          <q-td key="opcion" :props="props">
                        <q-btn  v-if="$store.state.login.user.tipo==='admin'"
                        dense
                        round
                        flat
                        color="red"
                        @click="deletesub1(props)"
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

       <!-- VER LISTAR de EMPRESAS y sociedades Y ELIMINAR />-->
   <q-dialog v-model="dialog_list2">
      <q-card style="max-width: 80%; width: 60%">
        <q-card-section class="bg-green-14 text-white">
          <div class="text-h6">Lista de empresas y/o Sociedades Contratados</div>
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

                    :rows="dato2.empresas"
                    :columns="subcol2a"
                    :rows-per-page-options="[0]"
                     separator="cell"
                     dense
                    >
      <template v-slot:body="props">
          <q-tr :props="props">
          <q-td key="nit" :props="props">
            {{ props.row.nit}}
          </q-td>
          <q-td key="nombre" :props="props">
            {{ props.row.nombreEmpresa}}
          </q-td>
          <q-td key="opcion" :props="props">
                        <q-btn v-if="$store.state.login.user.tipo==='admin'"
                        dense
                        round
                        flat
                        color="red"
                        @click="deletesub2(props)"
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
          <q-card-section v-if="group==='op2'"  class="q-pt-xs">
                <q-table

                    :rows="dato2.sociedads"
                    :columns="subcol3a"
                    :rows-per-page-options="[0]"
                    dense
                    separator="cell"
                    >
        <template v-slot:body="props">
          <q-tr :props="props">
          <q-td key="codigo" :props="props">
            {{ props.row.codigo}}
          </q-td>
          <q-td key="nombre" :props="props">
            {{ props.row.nombreEmpresa}}
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
          <q-td key="opcion" :props="props">
                        <q-btn v-if="$store.state.login.user.tipo==='admin'"
                        dense
                        round
                        flat
                        color="red"
                        @click="deletesub3(props)"
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

      <q-card-section v-if="group==='op3'" class="q-pt-xs">
                <q-table
                    :rows="dato2.personas"
                    :columns="subcol1a"
                    dense
                    :rows-per-page-options="[0]"
                    separator="cell"
                    >
      <template v-slot:body="props">
          <q-tr :props="props">
          <q-td key="nombre" :props="props">
            {{ props.row.datosp}}
          </q-td>
          <q-td key="ci" :props="props">
            {{ props.row.ci}}
          </q-td>
           <q-td key="categoria" :props="props">
            {{ props.row.pivot.categoria}}
          </q-td>
          <q-td key="opcion" :props="props">
                        <q-btn v-if="$store.state.login.user.tipo==='admin'"
                        dense
                        round
                        flat
                        color="red"
                        @click="deletesub4(props)"
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

  <!-- empresas asociados  adicionar archivo pdf/>-->
   <q-dialog v-model="dialog_add">
      <q-card style="max-width: 80%; width: 50%">
        <q-card-section class="bg-green-14 text-white">
          <div class="text-h6">Agregar  Archivo |  Usuario:  {{$store.state.login.user.name}}</div>
        </q-card-section>
        <q-card-section class="q-pt-xs">
               <q-select
             outlined
            v-model="categoria"
            :options="categorias"
            label="categoria de documento"
            type="text"
            hint="Seleccionar Tipo de Documento"
           />
            <q-uploader
              class="full-width"
              label="Subir archivo PDF"
              :factory="uploadFile"
            />
              <q-input
              outlined
              v-model="archivo.nombre"
              type="text"
              label="Nombre del documento"
              hint="Ingresar el nombre del Documento"
              lazy-rules
              :rules="[(val) => (val && val.length > 0) || 'Favor ingresa datos']"
            />

        </q-card-section>
          <q-card-actions class="bg-green-14 text-white">
          <q-btn class="full-width" flat label="subir al servidor" v-close-popup />
        </q-card-actions>

      </q-card>
    </q-dialog>
  <!--hola   este es un o que funciona -->
      <q-dialog >
      <q-card style="max-width: 80%; width: 50%">
        <q-card-section class="bg-green-14 text-white">
          <div class="text-h6">Agregar  Archivo |  Usuario:  {{$store.state.login.user.name}}</div>
        </q-card-section>
        <q-card-section class="q-pt-xs">

          <q-form method="post" @submit="onAdd" class="q-gutter-md" enctype="multipart/form-data"  >
       <!--
           <q-file filled bottom-slots v-model="model" label="Contrato" counter>
            <template v-slot:prepend>
             <q-icon name="cloud_upload" @click.stop />
             </template>
             <template v-slot:append>
             <q-icon name="close" @click.stop="model = null" class="cursor-pointer" />
             </template>

            <template v-slot:hint>
              tamaño del archivo
            </template>
              </q-file> -->
               <q-select
             outlined
            v-model="categoria"
            :options="categorias"
            label="categoria de documento"
            type="text"
            hint="Seleccionar Tipo de Documento"
           />
            <input type="file"
                  accept="application/pdf"
                  required
                   @change="escogerArchivo"
             >
              <q-input
              outlined
              v-model="archivo.nombre"
              type="text"
              label="Nombre del documento"
              hint="Ingresar el nombre del Documento"
              lazy-rules
              :rules="[(val) => (val && val.length > 0) || 'Favor ingresa datos']"
            />
            <div>
              <q-btn label="Agregar" type="submit" color="positive" icon="add_circle" />
              <q-btn label="Cancelar" icon="delete" color="negative" v-close-popup />
            </div>
          </q-form>
        </q-card-section>
      </q-card>
    </q-dialog>
<!--          MODIFICAR REGISTRO -->
    <q-dialog v-model="dialog_mod">
      <q-card style="max-width: 80%; width: 80%">

        <q-card-section class="bg-green-14 text-white">
          <div class="text-h6"><q-icon name="edit"/> Modificar Registro</div>
        </q-card-section>

        <q-card-section class="q-pt-xs">
          <q-form @submit="onMod" class="q-gutter-md">
                <div class="row">
              <div class="col-6">
            <q-select
             filled
              v-model="proyecto"
             use-input
              hide-selected
              fill-input
              input-debounce="0"
            :options="proyectos"
            label="proyecto asociado"
            @filter="filtarProyectos"
             @popup-hide="seleccion2"
           >
             <template v-slot:no-option>
          <q-item>
            <q-item-section class="text-grey">
              NO HAY RESULTADOS DE BUSQUEDA
            </q-item-section>
          </q-item>
        </template>
        </q-select>
            <q-input
              outlined
              v-model="dato2.nombre"
              type="text"
              label="Nombre unico de el contrato"
              hint="Ingresar nombre unico de contrato"
                 lazy-rules
              :rules="[(val) => (val && val.length > 0) || 'Favor ingresa datos']"

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
              v-model="dato2.montobs"
              type="number"
              step=0.001
              label="Monto del Contrato Bs"
              hint="Ingresar monto en Bs"
            />
             <q-input
              outlined
              v-model="dato2.observacion"
              type="text"
              label="Observacion"
              hint="Ingresar alguna observacion"
            />
             </div>
              <div class="col-6">
                <q-input
                  outlined
                  v-model="dato2.codigos"
                  type="text"
                  label="codigo(s) de los proyectos"
                  hint="Ingresar codigo o codigos de los proyectos"
                />
                 <q-input
                  outlined
                  type="date"
                  v-model="dato2.fechaini"
                  hint="Ingresar Fecha de Inicio de contrato"
                />
                <q-input
                  outlined
                  type="date"
                  v-model="dato2.fechafin"
                  hint="Ingresar Fecha de fin de contrato"
                />
                <q-input
                    outlined
                    v-model="dato2.duracion"
                    type="number"
                    step="1"
                    label="duracion exacta"
                    hint="Ingresar la duracion del contrato"
                  />
                   <q-input
                    outlined
                    v-model="dato2.plus"
                    type="number"
                    step="1"
                    label="Duracion plus"
                    hint="Ingresar +/- duracion"
                  />
              <q-option-group
                v-model="dato2.status"
                :options="[{label:'CONTRATO VIGENTE', value:'VIGENTE'},{label:'CONTRATO FINALIZADO', value:'CADUCO'}]"
                color="secondary"
                inline
              />
             </div>
             </div>
            <div>
              <q-btn label="Modificar Registro" type="submit" color="positive" icon="add_circle" />
              <q-btn label="Cancelar" icon="delete" color="negative" v-close-popup />
            </div>
          </q-form>

        </q-card-section>
      </q-card>
    </q-dialog>


     <!-- empresas asociados  adicionar consultor />-->
      <q-dialog v-model="dialog_add1">
      <q-card style="max-width: 80%; width: 60%">
        <q-card-section class="bg-green-14 text-white">
          <div class="text-h6">Lista de consultores presentados</div>
        </q-card-section>
        <q-table
                    :rows="personas"
                    :columns="subcol1"
                    :rows-per-page-options="[0]"
                    separator="cell"
                    dense
                    row-key="nombre"
                    >
                  <template v-slot:body="props">
                      <q-tr :props="props">
                      <q-td key="nombre" :props="props">
                        {{ props.row.datosp}}
                      </q-td>
                      <q-td key="ci" :props="props">
                        {{ props.row.ci}}
                      </q-td>
                      <q-td key="fecha" :props="props">
                        {{ props.row.fechaNacimiento}}
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
          </q-table>
            <q-tab-panel>
              <div class="text-h6" >CONSULTOR SELECCIONADO:: {  CI: {{persona.ci}} - {{persona.datosp}} }</div>
            </q-tab-panel>
        <q-card-section class="q-pt-xs">
          <q-form @submit="onAdd1" class="q-gutter-md">
            <div>
              <q-btn label="Agregar" type="submit" color="positive" icon="add_circle" />
              <q-btn label="Cancelar" icon="delete" color="negative" v-close-popup />
            </div>
          </q-form>
        </q-card-section>
      </q-card>
    </q-dialog>
     <!-- Adicionar empresa y/o sociedad accidental al contrato/>-->
      <q-dialog v-model="dialog_add2">
      <q-card style="max-width: 80%; width: 80%">
        <q-card-section class="bg-green-14 text-white">
          <div class="text-h6">Agregar Empresa/Sociedad Accidental/personal de la empresa</div>
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
          <q-table v-if="group=='op1'"

                    :rows="empresas"
                    :columns="subcol2"
                    :rows-per-page-options="[0]"
                    separator="cell"
                    dense
                    row-key="nombre"
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
          <q-td key="opcion" :props="props">
                        <q-btn
                        dense
                        round
                        flat
                        color="green"
                        @click="adicionarEmpresa(props)"
                        icon="add_circle"

                      ></q-btn>
          </q-td>
          </q-tr>
          </template>
          </q-table>

           <q-table  v-if="group=='op2'"

                    :rows="sociedads"
                    :columns="subcol3"
                    :rows-per-page-options="[0]"
                    dense
                    separator="cell"

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
          <q-td key="opcion" :props="props">
                        <q-btn
                        dense
                        round
                        flat
                        color="green"
                        @click="adicionarSociedad(props)"
                        icon="add_circle"
                      ></q-btn>
          </q-td>
          </q-tr>
          </template>
          </q-table>

           <q-tab-panels v-model="group" class="shadow-2 rounded-borders">
            <q-tab-panel name="op1">
              <div class="text-h6" colortext="red" >Empresa SELECCIONADA:: {  NIT: {{empresa.nit}} - {{empresa.nombreEmpresa}} }</div>
            </q-tab-panel>

        <q-tab-panel name="op2">
          <div class="text-h6">Sociedad SELECCIONADA:: {  NIT: {{sociedad.codigo}} - {{sociedad.nombreEmpresa}} }</div>
        </q-tab-panel>
         </q-tab-panels>

        <q-card-section class="q-pt-xs">
          <q-form @submit="onAdd2" class="q-gutter-md">
            <q-input v-if="group=='op3'"
              outlined
              v-model="codigo.ci"
              type="text"
              label="C.I. de  residente de obra"
              hint="Ingresar ci de la Persona"
            />
             <q-input v-if="group=='op3'"
              outlined
              v-model="codigo.categoria"
              type="texto"
              label="categoria o tipo"
              hint="Ingresar categoria o tipo"
            />
            <div>
              <q-btn label="Agregar" type="submit" color="positive" icon="add_circle" />
              <q-btn label="Cancelar" icon="delete" color="negative" v-close-popup />
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


          <!-- archivos subidos al contrato -->
   <q-dialog v-model="dialog_list">
      <q-card style="max-width: 80%; width: 40%">
        <q-card-section class="bg-green-14 text-white">
          <div class="text-h6">Archivos Asociados</div>
        </q-card-section>

        <q-card-section class="q-pt-xs">
                <q-table
                    :rows="dato2.archivos"
                    :columns="subcol"
                    >

      <template v-slot:body="props">
          <q-tr :props="props">
          <q-td key="nombre" :props="props">
            {{ props.row.nombre}}
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

    <!-- Eliminar archivos asociados />-->
     <q-dialog v-model="dialog_delsub">
      <q-card>
        <q-card-section class="row items-center">
          <q-avatar icon="clear" color="red" text-color="white" />
          <span class="q-ml-sm">Seguro de eliminar Registro.</span>
        </q-card-section>
        <q-card-actions align="right">
          <q-btn flat label="Eliminar" color="deep-orange" @click="onDelsub" />
          <q-btn flat label="Cancelar" color="primary" v-close-popup />
        </q-card-actions>
      </q-card>
    </q-dialog>
    <!-- eliminar PERSONAS asociados  />-->
     <q-dialog v-model="dialog_delsub1">
      <q-card>
        <q-card-section class="row items-center">
          <q-avatar icon="clear" color="red" text-color="white" />
          <span class="q-ml-sm">Seguro de eliminar Registro.</span>
        </q-card-section>
        <q-card-actions align="right">
          <q-btn flat label="Eliminar" color="deep-orange" @click="onDelsub1" />
          <q-btn flat label="Cancelar" color="primary" v-close-popup />
        </q-card-actions>
      </q-card>
    </q-dialog>
     <!-- eliminar EMPRESAS   />-->
     <q-dialog v-model="dialog_delsub2">
      <q-card>
        <q-card-section class="row items-center">
          <q-avatar icon="clear" color="red" text-color="white" />
          <span class="q-ml-sm">Seguro de eliminar Registro.</span>
        </q-card-section>
        <q-card-actions align="right">
          <q-btn flat label="Eliminar" color="deep-orange" @click="onDelsub2" />
          <q-btn flat label="Cancelar" color="primary" v-close-popup />
        </q-card-actions>
      </q-card>
    </q-dialog>
<!-- eliminar SOCIEDADES   />-->
     <q-dialog v-model="dialog_delsub3">
      <q-card>
        <q-card-section class="row items-center">
          <q-avatar icon="clear" color="red" text-color="white" />
          <span class="q-ml-sm">Seguro de eliminar Registro.</span>
        </q-card-section>
        <q-card-actions align="right">
          <q-btn flat label="Eliminar" color="deep-orange" @click="onDelsub3" />
          <q-btn flat label="Cancelar" color="primary" v-close-popup />
        </q-card-actions>
      </q-card>
    </q-dialog>
     <!-- eliminar personas naturales dependientes de empresas   />-->
     <q-dialog v-model="dialog_delsub4">
      <q-card>
        <q-card-section class="row items-center">
          <q-avatar icon="clear" color="red" text-color="white" />
          <span class="q-ml-sm">Seguro de eliminar Registro.</span>
        </q-card-section>
        <q-card-actions align="right">
          <q-btn flat label="Eliminar" color="deep-orange" @click="onDelsub4" />
          <q-btn flat label="Cancelar" color="primary" v-close-popup />
        </q-card-actions>
      </q-card>
    </q-dialog>



  </div>
</template>

<script>
const  columns= [
  { name: 'numero', align:"left",label: 'Numero del contrato', field: 'numero', sortable: true },
  { name: 'nombre',required: true, align:"left",label: 'Nombre del Proyecto', field: 'nombre', sortable: true },
  { name: 'archivos', label: 'lista de contratos PDF', field: 'archivos', sortable: false },
  { name: 'opcion1', label: 'Opcion', field: 'opcion1', sortable: false },
  { name: 'seguimiento',align:"left", label: 'Seguimiento', field: 'seguimiento', sortable: true },
  { name: 'fechaini', align:"left",label: 'Fecha de Inicio de contrato', field: 'fechaini', sortable: true },
  { name: 'fechafin', align:"left",label: 'Fecha de Fin de contrato', field: 'fechafin', sortable: true },
  { name: 'duracion',align:"left", label: 'Duracion contrato', field: 'duracion', sortable: true },
  { name: 'plus', align:"center",label: 'plus', field: 'url', sortable: true },
  { name: 'montobs',align:"left", label: 'Monto de Contrato Bs', field: 'montobs', sortable: true },
 // { name: 'montosus',align:"left", label: 'Monto de Contrato SUS', field: 'montosus', sortable: true },
  { name: 'status',align:"left", label: 'Status', field: 'status', sortable: true },
 // { name: 'observacion',align:"left", label: 'Observacion', field: 'observacion', sortable: true },
 { name: 'opcion', label: 'Opcion', field: 'opcion', sortable: false }
   ]

export default {

  data() {
    return {
    alert:false,
   dialog_mod:false,
   dialog_list:false,
   dialog_list1:false,
   dialog_list2:false,
   dialog_list3:false,
   dialog_add:false,
   dialog_add2:false,
   dialog_add1:false,
   dialog_del:false,
   dialog_delsub:false,
   dialog_delsub1:false,
   dialog_delsub2: false,
   dialog_delsub3: false,
   dialog_delsub4:false,
  // dialog_list3:false,
   archivo:{},
   filter:'',
  props:[],
  model:null,
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
           required:true,
       //  field:"nombre",
          field:row => row.datosp,
          format:val=>`${val}`,
        sortable: true,
        },
        {
          name: "ci",
          required: true,
          label: "C.I.",
          align: "left",
          field:"ci",
          sortable: true,
        }, {
          name: "fecha",
          required: true,
          label: "Fecha nac.",
          align: "left",
          field:"fecha",
          sortable: true,
        },
         {
          name: "opcion",
          label: "opcion",
          align: "rigth",
          field:"opcion",
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
        {
          name: "opcion",
          label: "opcion",
          align: "rigth",
          field:"opcion",
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
        {
          name: "opcion",
          label: "opcion",
          align: "rigth",
          field:"opcion",
         sortable: true,
        },
   ],
    subcol1a: [
        {
          name: "nombre",
          label: "Nombre completo",
          align: "center",
           required:true,
       //  field:"nombre",
          field:row => row.datosp,
          format:val=>`${val}`,
        sortable: true,
        },
        {
          name: "ci",
          label: "C.I.",
          align: "center",
          field:"ci",
          sortable: true,
        }, {
          name: "categoria",
          label: "Categioria",
          align: "center",
          field:"categoria",
          sortable: true,
        },
         {
          name: "opcion",
          label: "opcion",
          align: "center",
          field:"opcion",
        },
   ],
   subcol2a: [
        {
          name: "nit",
          required: true,
          label: "N.I.T.",
          align: "center",
          field:"nit",
          sortable: true,
        },
        {
          name: "nombre",
          label: "Nombre de la Empresa",
          align: "center",
         field:"nombre",
         sortable: true,
        },
        {
          name: "opcion",
          label: "opcion",
          align: "center",
          field:"opcion",
         sortable: true,
        },
   ],
    subcol3a: [
         {
          name: "codigo",
          required: true,
          label: "codigo",
          align: "center",
          field:"codigo",
          sortable: true,
        },
        {
          name: "nombre",
          label: "Nombre de la Sociedad",
          align: "center",
         field:"nombre",
         sortable: true,
        },
         {
          name: "empresas",
          label: "asociados",
          align: "center",
         field:"asociados",
         sortable: true,
        },
        {
          name: "opcion",
          label: "opcion",
          align: "center",
          field:"opcion",
         sortable: true,
        },
   ],

   data:[],
   dato:{},
   dato2:{},
   categorias:[],
   categoria:{},
   usuarios:[],
   usuario:{},
   proyectos:[],
   proyecto:{},
   personas:[],
   empresas:[],
   sociedads:[],
   empresa:{},
   persona:{},
   sociedad:{},
   columns,
   selected:[],
   options:[],
   file:null,
     opciones: [
        {
          label: 'Empresa',
          value: 'op1'
        },
        {
          label: 'Sociedad Accidental',
          value: 'op2'
        },
        {
          label: 'Persona Natural',
          value: 'op3'
        }

      ],
      group: 'op1',


       };
  },
  computed:{
    //nombre1: function () {
   //   return this.proyectos1[parseInt(this.proyecto.pos)].nombre;
   // }

  },
  created(){
    this.misdatos()
    this.cargardatos()
  },

  methods:{
    deleteRow(item) {
      this.dato2 = item.row;
      this.dialog_del = true;
    },
     deletesub(item) {
      this.dato3 = item.row;
      this.dialog_delsub = true;
    },
     deletesub1(item) {
      this.dato3 = item.row;
      this.dialog_delsub1 = true;
    },
    deletesub2(item) {
      this.dato3 = item.row;
      this.dialog_delsub2 = true;
    },
    deletesub3(item) {
      this.dato3 = item.row;
      this.dialog_delsub3 = true;
    },
    deletesub4(item) {
      this.dato3 = item.row;
      this.dialog_delsub4 = true;
    },
       onAdd2() {
      this.$q.loading.show();
      if (this.group==='op1'){ //es empresa
            if(this.empresa.id==-1) {
                      this.$q.notify({
                          color: "red-4",
                          textColor: "white",
                          icon: "cloud_done",
                          message: "Seleccione una empresa porfavor",
                        });
           }else{
             this.$api.put(process.env.API+"/empresacontratos/"+this.dato2.id,this.empresa).then((res) => {
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
          if(this.group=='op2') {//es sociedad accidental
            if(this.sociedad.id==-1) {
                      this.$q.notify({
                          color: "red-4",
                          textColor: "white",
                          icon: "cloud_done",
                          message: "seleccione una sociedad accidental",
                        });
           }else{
              this.$api.put(process.env.API + "/sociedadcontratos/"+this.dato2.id,this.sociedad).then((res) => {
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
       }else{ // es un dependiente de la empresa o sociedad ligado al contrato
        this.$q.loading.show();
       this.$api.get(process.env.API + "/consultorci/"+this.codigo.ci).then((res1) => {
      //  console.log(res1.data)
            if(res1.data.length===0) {
                      this.$q.notify({
                          color: "red-4",
                          textColor: "white",
                          icon: "cloud_done",
                          message: "consultor no registrado,  registre porfavor",
                        });
                       this.dialog_add2 = false;
                 this.$q.loading.hide();
           }else{
                  res1.data[0].categoria =this.codigo.categoria;
                  this.$api.put(process.env.API + "/dependientecontratos/"+this.dato2.id,res1.data[0]).then((res) => {
                              this.$q.notify({
                          color: "green-4",
                          textColor: "white",
                          icon: "cloud_done",
                          message: "Agregado Correctamente",
                        });
                       this.dialog_add2 = false;
                        this.misdatos();
                        // console.log(res.data)
                        });

                }
            });
         }  //fin dependeiente de empresa
       }
       },
     onAdd1() {
      if(this.persona.id==-1){
         this.$q.notify({
                          color: "red-4",
                          textColor: "white",
                          icon: "cloud_done",
                          message: "Proponente no seleccionado seleccione un Proponente",
                        });
      }else{
         this.$q.loading.show();
                    this.$api.put(process.env.API + "/personacontratos/"+this.dato2.id,this.persona).then((res) => {
                              this.$q.notify({
                          color: "green-4",
                          textColor: "white",
                          icon: "cloud_done",
                          message: "Agregado Correctamente",
                        });
                       this.dialog_add1 = false;
                        this.misdatos();
                        // console.log(res.data)
                        });
      }


     },
    verRow(item) {
      this.dato2 = item.row;
      this.dialog_list = true;
    },
     addRow1(item) {
      this.dato2 = item.row;
      this.codigo={}
     // console.log(this.dato2.proyecto);
        if (this.dato2.proyecto.tipo_id===2)
         {
                 this.dialog_add1 = true;/// personas
                 this.personas=this.dato2.proyecto.personas
                 this.persona={}
                 this.persona.id=-1
         }else{
                 this.dialog_add2 = true;  // empresas, sociedad y consultores
                 this.empresas=this.dato2.proyecto.empresas
                 this.sociedads=this.dato2.proyecto.sociedads
                 this.empresa={}
                 this.empresa.id=-1
                 this.sociedad={}
                 this.sociedad.id=-1

         }
    },
     verRow1(item) {
      this.dato2 = item.row;
       if (this.dato2.proyecto.tipo_id===2)
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
    filtarProyectos (val, update, abort){
         update(() => {
          const needle = val.toLowerCase()
          this.proyectos= this.options.filter(v => v.label.toLowerCase().indexOf(needle) > -1)
        })
    },
    seleccion(){
      this.dato.nombre=this.proyectos1[parseInt(this.proyecto.pos)].nombre;
      this.dato.montobs=this.proyectos1[parseInt(this.proyecto.pos)].precio;
      this.dato.duracion=this.proyectos1[parseInt(this.proyecto.pos)].plazo;
          this.dato.codigos="";
          this.dato.codigos="";
      this.proyectos1[parseInt(this.proyecto.pos)].codigos.forEach(tipo => {

        this.dato.codigos =this.dato.codigos+tipo.nombre+ " - ";
        });
      this.dato.status="VIGENTE"
     // this.dato.fechaini=new Date('01/01/2022');
    //  this.dato.fechafin=this.dato.fechaini+this.dato.duracion;
       this.dato.numero ="01-2022"
       this.dato.plus =90
       this.dato.seguimiento="FPS/GDLP/"+ this.proyectos1[parseInt(this.proyecto.pos)].programa.nombre;
    },
     seleccion2(){
      this.dato2.nombre=this.proyectos1[parseInt(this.proyecto.pos)].nombre;
      this.dato2.montobs=this.proyectos1[parseInt(this.proyecto.pos)].precio;
      this.dato2.duracion=this.proyectos1[parseInt(this.proyecto.pos)].plazo;
          this.dato.codigos="";

      this.proyectos1[parseInt(this.proyecto.pos)].codigos.forEach(tipo => {

        this.dato2.codigos =this.dato.codigos+tipo.nombre+ " - ";
        });
      this.dato2.status="VIGENTE"
     // this.dato.fechaini=new Date('01/01/2022');
    //  this.dato.fechafin=this.dato.fechaini+this.dato.duracion;
       this.dato2.numero ="01-2022"
       this.dato2.plus =90
       this.dato2.seguimiento="FPS/GDLP/"+ this.proyectos1[parseInt(this.proyecto.pos)].programa.nombre;

       if(!this.dato2.plus){
           this.dato2.plus=0;
       } if(!this.dato2.duracion){
           this.dato2.duracion=0;
       }
      //  let f=this.dato2.fechaini;
      //  let f=frm.fecha_sali.value;
        // pasaremos la fecha a formato mm/dd/yyyy
     //   f=f.split('/');
     //   f=f[2]+'/'+f[1]+'/'+f[0];
      // const hoy= new Date(f)
      // let dias=1000*60*60*24*(parseInt(this.dato2.duracion)+parseInt(this.dato2.plus));
      // let suma=hoy.getTime()+dias;
      // this.dato2.fechafin=new Date(suma);
      // console.log(this.dato2.fechafin);
    },
     editRow(item) {
      this.dato2 = item.row
      console.log(this.dato2);
      //this.proyecto=this.dato2.
     this.dialog_mod = true;
    },
    onalert() {
         this.categoria=this.categorias[0]
         this.usuario=this.usuarios[0]
         this.proyecto=this.proyectos[0]
          this.alert=true;
        //if(this.proyecto.value){
         //this.dato.nombre=this.proyectos1[parseInt(this.proyecto.pos)].nombre;
         //this.proyecto.value
        //}


     },
    onReset() {
        this.dato.nombre = null;
        this.proyectos = this.proyectos[0]
        this.categoria=this.categorias[0]
        this.usuario=this.usuarios[0]
     },
    escogerArchivo(event){
      this.file = event.target.files[0];
    },
    addRow(item) {
      this.dato2 = item.row;
       this.model=null,
      this.categoria=this.categorias[1];
      this.archivo.nombre="Contrato N° "+item.row.numero
      this.dialog_add = true;
    },
    cargardatos(){
        this.categorias=[];
        this.$q.loading.show();
         this.proyectos=[];
         this.$api.get(process.env.API+"/proyectos").then((res)=>{
           this.proyectos1=res.data;
            let num=0;
            res.data.forEach(pro=> {
            this.proyectos.push({label:pro.nombre,value:pro.id, pos:num});
            num=num+1;
             this.$q.loading.hide();
            });
              });
         this.options=this.proyectos;
         this.$q.loading.show();
         this.categorias=[];
         this.$api.get("/categorias").then((res)=>{
            res.data.forEach(cat=> {
            this.categorias.push({label:cat.nombre,value:cat.id});
            this.$q.loading.hide();
        });
        this.categoria=this.categorias[0]
          });
      ///  console.log(this.proyectos1)

        this.categoria=this.categorias[1]
        this.usuario=this.usuarios[0]
        this.proyecto=this.proyectos[0]

    },
    misdatos(){
    this.$q.loading.show();
       this.$api.get(process.env.API+"/contratos").then((res)=>{
        console.log(res.data);
         this.data =res.data;
    this.$q.loading.hide();
       });
    },
       onAdd() {
      this.$q.loading.show();
      //this.archivo.user_id =this.$store.state.login.user.id;
     // this.archivo.categoria_id = this.categoria.value;

      let archivo =new FormData();
      archivo.append('file',this.file);
      archivo.append('_method','PUT');

             this.$api.post(process.env.API + "/setPdf/"+this.dato2.id,archivo).then((res) => {
                              this.$q.notify({
                          color: "green-4",
                          textColor: "white",
                          icon: "cloud_done",
                          message: "Agregado - Archivo correctamente",
                        });
                       this.dialog_add = false;
                        this.misdatos();
                        this.onReset();
                      //  console.log(res.data)
                        });

     },
     uploadFile(files){
       this.$q.loading.show()
      const fileData= new FormData()
      fileData.append('archivo',files[0])
      fileData.append('contrato_id',this.dato2.id)
      fileData.append('nombre',this.archivo.nombre)
      fileData.append('categoria_id',this.categoria.value)
      fileData.append('user_id',this.$store.state.login.user.id)
      this.$api.post(process.env.API+'/upload',fileData)
      .then(res=>{
        console.log(res.data)
          this.dialog_add = false;
        this.misdatos()
      })

     },
     descargar(item) {
        this.dato2 = item.row;
      this.$q.loading.show();
             // console.log(this.dato2.id);
             this.$api.get(process.env.API + "/getPdf/"+this.dato2.id,{responseType: 'blob'}).then((response) => {
                  /*  var fileURL = window.URL.createObjectURL(new Blob([response.data]));
                     var fURL = document.createElement('a');

                     fURL.href = fileURL;
                     fURL.setAttribute('download', 'uno1.pdf');
                     document.body.appendChild(fURL);
     */
    let blob = new Blob([response.data], { type: 'application/pdf' })
      let link = document.createElement('a')
      link.href = window.URL.createObjectURL(blob)
      link.download = this.dato2.nombre;
      document.body.appendChild(link);
      link.click()

                      // this.dialog_add = false;
                       // this.misdatos();
                           this.$q.loading.hide();
                        console.log(response.data)
                        });
     },
     download(item) {
       console.log(item);
        this.$q.loading.show();
         this.$api.get(process.env.API + "/getContrato/"+item.id,{responseType: 'blob'}).then((response) => {
          console.log(response.data);

            let blob = new Blob([response.data], { type: 'application/pdf' })
            let link = document.createElement('a')
            link.href = window.URL.createObjectURL(blob)
            link.download = item.nombre;
            document.body.appendChild(link);
            link.click()
            this.$q.loading.hide();
            console.log(response.data)

        });

     },
      onSubmit() {

       if(!this.dato.plus){
           this.dato.plus=0;
       } if(!this.dato.duracion){
           this.dato.duracion=0;
       }

      // let dias=1000*60*60*24*(parseInt(this.dato.duracion)+parseInt(this.dato.plus));
     //  let suma=this.dato.fechaini.getTime()+dias;

      // this.dato.fechafin=new Date(suma);
      this.dato.proyecto_id =this.proyecto.value
      this.$q.loading.show();
      this.$api.post(process.env.API+"/contratos/", this.dato).then((res) => {

         if(res.data.res===true)
          {
            this.$q.notify({
            color: "green-4",
            textColor: "white",
            icon: "cloud_done",
            message: "Creado Correctamente",
          });

          }else{
            this.$q.loading.hide();
          }
          this.alert= false;
          this.misdatos();
          this.onReset();
        }).catch((e)=>{
          this.$q.loading.hide();

        });
    },
     onMod() {

       this.$q.loading.show();
       this.dato2.categoria_id=this.categoria.value;
       this.dato2.user_id=this.usuario.value;

      this.$api.put(process.env.API+"/contratos/"+this.dato2.id,this.dato2).then((res) => {
          if(res.data.res===true)
          {
            this.$q.notify({
            color: "green-4",
            textColor: "white",
            icon: "cloud_done",
            message: "Modificado correctamente",
          });
          }else{
            this.$q.loading.hide();

          }
         this.dialog_mod = false;
          this.misdatos();
        }).catch((e)=>{
          this.$q.loading.hide();

        });
    },
    adicionarPersona(item){
      this.persona=item.row;
    },
    adicionarEmpresa(item){
      this.empresa=item.row;
    },
    adicionarSociedad(item){
     this.sociedad=item.row;
    },
     onDel() {
      this.$q.loading.show();
      this.$api.delete( process.env.API+"/contratos/" + this.dato2.id).then((res) => {
        this.$q.notify({
         color: "green-4",
         textColor: "white",
         icon: "cloud_done",
         message: "Eliminado correctamente",
       });
        this.dialog_del = false;
        this.misdatos();
      });
    },
onDelsub() {
      this.$q.loading.show();
      console.log(this.dato3)
       this.$api.delete(process.env.API + "/archivos/"+this.dato3.id).then((res) => {
                              this.$q.notify({
                          color: "green-4",
                          textColor: "white",
                          icon: "cloud_done",
                         message: "Eliminado correctamente",
        });
        console.log(res.data);
        this.dialog_delsub = false;
        this.dialog_list = false;
        this.misdatos();
      });
    },
      onDelsub1() {
      this.$q.loading.show();
       this.$api.put(process.env.API + "/personacontratosdetach/"+this.dato2.id,this.dato3).then((res) => {
                              this.$q.notify({
                          color: "green-4",
                          textColor: "white",
                          icon: "cloud_done",
                           message: "Eliminado correctamente",
        });
        this.dialog_delsub1 = false;
        this.dialog_list1 = false;
        this.misdatos();
      });
    },
     onDelsub2() {
      this.$q.loading.show();
       this.$api.put(process.env.API + "/empresacontratosdetach/"+this.dato2.id,this.dato3).then((res) => {
                              this.$q.notify({
                          color: "green-4",
                          textColor: "white",
                          icon: "cloud_done",
                           message: "Eliminado correctamente",
        });
        this.dialog_delsub2 = false;
        this.dialog_list2 = false;
        this.misdatos();
      });
    },
     onDelsub3() {
      this.$q.loading.show();
       this.$api.put(process.env.API + "/sociedadcontratosdetach/"+this.dato2.id,this.dato3).then((res) => {
                              this.$q.notify({
                          color: "green-4",
                          textColor: "white",
                          icon: "cloud_done",
                           message: "Eliminado correctamente",
        });
        this.dialog_delsub3 = false;
        this.dialog_list2 = false;
        this.misdatos();
      });
    },
    onDelsub4() {
      this.$q.loading.show();
       this.$api.put(process.env.API + "/dependientecontratosdetach/"+this.dato2.id,this.dato3).then((res) => {
                              this.$q.notify({
                          color: "green-4",
                          textColor: "white",
                          icon: "cloud_done",
                           message: "Eliminado correctamente",
        });
        this.dialog_delsub4 = false;
        this.dialog_list2 = false;
        this.misdatos();
      });
    },
  },

};
</script>
