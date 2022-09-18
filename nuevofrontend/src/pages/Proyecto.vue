<template>
   <div class="q-pa-md">
     <q-btn
      label="Nuevo proyecto para Licitación"
      color="green"
      icon="add_circle"
      @click="alert = true"
      class="q-mb-xs"
    />
     <q-btn
      label="Empresa"
      color="orange"
      icon="add_circle"
      @click= "this.$router.push('Empresa')"
      class="q-mb-xs"
    />
     <q-btn
      label="Consultor"
      color="red"
      icon="add_circle"
      @click= "this.$router.push('Consultor')"
      class="q-mb-xs"
    />
     <q-btn
      label="Sociedad"
      color="blue"
      icon="add_circle"
      @click= "this.$router.push('Sociedad')"
      class="q-mb-xs"
    />
      <!--          ADICIONAR REGISTRO -->
   <q-dialog v-model="alert">
      <q-card style="max-width: 80%; width: 80%">
        <q-card-section class="bg-green-14 text-white">
          <div class="text-h6"><q-icon name="add_circle" /> Nuevo proyecto</div>
        </q-card-section>
         <errores
         v-if="errores !== null"
          :errores="errores"
        ></errores>
        <q-card-section class="q-pt-xs">
          <q-form @submit="onSubmit" @reset="onReset" class="q-gutter-md">
                 <div class="row">
              <div class="col-6">
                 <q-select
             outlined
            v-model="depa"
            :options="departamentos"
            label="Departamentos"
            type="text"
            hint="Seleccionar Departamento"
             lazy-rules
              :rules="[(val) => val!='' && val!=null || 'Por favor ingresa datos']"
           />
            <q-select
             outlined
            v-model="tipo"
            :options="tipos"
            label="Categoria"
            type="text"
            hint="Seleccionar Categoria"
             lazy-rules
              :rules="[(val) => val!='' && val!=null || 'Por favor ingresa datos']"
           />
           <q-select
             outlined
            v-model="prog"
            :options="programas"
            label="Programas"
            type="text"
            hint="Seleccionar Programa"
             lazy-rules
              :rules="[(val) => val!='' && val!=null || 'Por favor ingresa datos']"
           />

            <q-input
              outlined
              v-model="dato.nombre"
              type="text"
              label="Nombre del proceso"
              hint="Ingresar el nombre del proceso"
              lazy-rules
              :rules="[(val) => (val && val.length > 0) || 'Favor ingresa datos']"
            />
            <q-input
              outlined
              v-model="dato.cuce"
              type="text"
              label="escriba el CUCE"
              hint="Ingresar el CUCE del proceso"

            />
             <q-input
              outlined
              v-model="dato.link"
              type="text"
              label="Enlace meet/zoom/otro"
              hint="Ingresar enlace para zoom"
            />

             </div>
             <div class="col-6">
             <q-input
                  outlined
                  type="date"
                  v-model="dato.fecha"
                  hint="Ingresar Fecha de Apertura"
                   lazy-rules
              :rules="[(val) => val!='' && val!=null || 'Por favor ingresa datos']"
                />
                <q-input
                  outlined
                  type="time"
                  v-model="dato.hora"
                  hint="Ingresar Hora de Apertura"
                   lazy-rules
              :rules="[(val) => val!='' && val!=null || 'Por favor ingresa datos']"
                />
            <q-input
              outlined
              v-model="dato.precio"
              type="number"
              step="0.01"
              label="precio Referencial"
              hint="Ingresar precio Referencial"

            />
            <q-input
              outlined
              v-model="dato.plazo"
              type="number"
              label="Plazo de Entrega"
              hint="Ingresar plazo de Entrega"
            />
             <q-input
              outlined
              v-model="dato.lotes"
              type="text"
              label="Numero de Lotes"
              hint="Ingresar numero de lotes"
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
  <!--          tabla PRINCIPOAL -->

    <q-table
      :filter="filter"
      title="PROYECTOS REGISTRADOS PARA LICITACION"
      :rows="data"
      :columns="columns"
      row-key="nombre"
      :rows-per-page-options="[10,50,100]"
      separator="cell"
      dense
   >
       <template v-slot:top-right>
        <q-input outlined dense debounce="300" v-model="filter" placeholder="Buscar">
          <template v-slot:append>
            <q-icon name="search" />
          </template>
        </q-input>
      </template>
    <!--
      <template v-slot:top-row>
        <q-btn
          color="primary"
          icon-right="archive"
          no-caps
          @click="exportTable"
        />
        </template>
        -->
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
          <q-td key="codigo" :props="props">
            {{props.row.codigo}}
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
           <q-td key="nombre" :props="props">
            {{props.row.nombre}}
          </q-td>
            <q-td key="action1" :props="props">
                      <q-btn
                        dense
                        round
                        flat
                        color="blue"
                        @click="addRow1(props)"
                        icon="playlist_add"
                      ></q-btn>
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
            <q-td key="funcionarios" :props="props">
              <ul>
              <span v-for="(it,index) in props.row.funcionarios" :key="index">
                  <li>
                   {{it.grado}} {{it.datosp}} {{it.ci}}
                </li>
              </span>
             </ul>
          </q-td>
         <q-td key="lotes" :props="props">
              <ul>
              <span v-for="(codigos,index) in props.row.lotes" :key="index">
                  <li>
                    {{codigos.nombre}} {{codigos.monto}}
                </li>
              </span>
             </ul>
          </q-td>



           <q-td key="comision" :props="props">
                      <q-btn
                        dense
                        round
                        flat
                        color="orange"
                        @click="addRow2(props)"
                        icon="playlist_add"
                      ></q-btn>
                        <q-btn
                        dense
                        round
                        flat
                        color="orange"
                        @click="verRow2(props)"
                        icon="list"
                      ></q-btn>


            </q-td>

          <q-td key="opcion" :props="props">
                       <q-btn
                        dense
                        round
                        flat
                        color="green"
                        @click="lotes(props)"
                        icon="difference"
                      ></q-btn>
                       <q-btn
                        dense
                        round
                        flat
                        color="green"
                        @click="lotes_view(props)"
                        icon="list"
                      ></q-btn>
                       <q-btn
                        dense
                        round
                        flat
                        color="blue"
                        @click="detalle(props)"
                        icon="settings"
                      ></q-btn>
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
   <!--          MODIFICAR REGISTRO -->
    <q-dialog v-model="dialog_mod">
      <q-card style="max-width: 80%; width: 80%">

        <q-card-section class="bg-green-14 text-white">
          <div class="text-h6"><q-icon name="edit"/> Modificar Registro</div>
        </q-card-section>
         <errores
         v-if="errores !== null"
          :errores="errores"
        ></errores>
        <q-card-section class="q-pt-xs">
          <q-form @submit="onMod" class="q-gutter-md">
                 <div class="row">
              <div class="col-6">
           <q-select
             outlined
             v-model="depa"
              label="Departamentos"
            :options="departamentos"
             lazy-rules
              :rules="[(val) => val!='' && val!=null || 'Por favor ingresa datos']"
           />
            <q-select
             outlined
            v-model="tipo"
            :options="tipos"
            label="Categoria"
            type="text"
            hint="Seleccionar Categoria"

             lazy-rules
              :rules="[(val) => val!='' && val!=null || 'Por favor ingresa datos']"
           />
           <q-select
             outlined
            v-model="prog"
            :options="programas"
            label="Programas"
            type="text"
            hint="Seleccionar Programa"
             lazy-rules
              :rules="[(val) => val!='' && val!=null || 'Por favor ingresa datos']"
           />
            <q-input
              outlined
              v-model="dato2.nombre"
              type="text"
              label="Nombre del proceso"
              hint="Ingresar el nombre del proceso"
              lazy-rules
              :rules="[(val) => (val && val.length > 0) || 'Favor ingresa datos']"
            />
            <q-input
              outlined
              v-model="dato2.cuce"
              type="text"
              label="escriba el CUCE"
              hint="Ingresar el CUCE del proceso"
            />
             <q-input
              outlined
              v-model="dato2.link"
              type="text"
              label="Enlace meet/zoom/otro"
              hint="Ingresar su Codigo"
            />
             </div>
             <div class="col-6">
             <q-input
                  outlined
                  type="date"
                  v-model="dato2.fecha"
                  hint="Ingresar Fecha de Apertura"
                   lazy-rules
              :rules="[(val) => val!='' && val!=null || 'Por favor ingresa datos']"
                />
                <q-input
                  outlined
                  type="time"
                  v-model="dato2.hora"
                  hint="Ingresar Hora de Apertura"
                   lazy-rules
              :rules="[(val) => val!='' && val!=null || 'Por favor ingresa datos']"
                />
            <q-input
              outlined
              v-model="dato2.precio"
              type="number"
              step="0.01"
              label="precio Referencial"
              hint="Ingresar precio Referencial"
            />
            <q-input
              outlined
              v-model="dato2.plazo"
              type="number"

              label="Plazo de Entrega"
              hint="Ingresar plazo de Entrega"
            />
             <q-input
              outlined
              v-model="dato2.lotes"
              type="text"
              label="Numero de Lotes"
              hint="Ingresar numero de lotes"

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


      <!--  adicionar codigo/>-->
      <q-dialog v-model="dialog_add">
      <q-card style="max-width: 80%; width: 50%">
        <q-card-section class="bg-green-14 text-white">
          <div class="text-h6">Agregar Codigo</div>
        </q-card-section>
        <q-card-section class="q-pt-xs">

          <q-form @submit="onAdd" class="q-gutter-md">
            <q-input
              outlined
              v-model="codigo.nombre"
              type="text"
              label="Codigo de proyecto"
              hint="Ingresar codigo de proyecto"
               lazy-rules
              :rules="[(val) => val!='' && val!=null || 'Por favor ingresa datos']"
            />

            <div>
              <q-btn label="Agregar" type="submit" color="positive" icon="add_circle" />
              <q-btn label="Cancelar" icon="delete" color="negative" v-close-popup />
            </div>
          </q-form>
        </q-card-section>
      </q-card>
    </q-dialog>


    <!--  adicionar lotes/>-->
      <q-dialog v-model="dialog_add_lotes">
      <q-card style="max-width: 80%; width: 50%">
        <q-card-section class="bg-green-14 text-white">
          <div class="text-h6">Agregar Lote</div>
        </q-card-section>
        <q-card-section class="q-pt-xs">

          <q-form @submit="onAdd_lote" class="q-gutter-md">
            <q-input
              outlined
              v-model="codigo.nro"
              type="text"
              label="Nro de Lote"
              hint="Ingresar Nº de lote "
               lazy-rules
              :rules="[(val) => val!='' && val!=null || 'Por favor ingresa datos']"
            />
            <q-input
              outlined
              v-model="codigo.nombre"
              type="text"
              label="Descripcion del lote"
              hint="Ingresar descripcion del lote"
               lazy-rules
              :rules="[(val) => val!='' && val!=null || 'Por favor ingresa datos']"
            />
             <q-input
              outlined
              v-model="codigo.monto"
              type="Number"
              step="0.01"
              label="Monto del lote"
              hint="Ingresar Monto del lote"
               lazy-rules
              :rules="[(val) => val!='' && val!=null || 'Por favor ingresa datos']"
            />

            <div>
              <q-btn label="Agregar" type="submit" color="positive" icon="add_circle" />
              <q-btn label="Cancelar" icon="delete" color="negative" v-close-popup />
            </div>
          </q-form>
        </q-card-section>
      </q-card>
    </q-dialog>
      <!-- empresas asociados  VER LISTA Y ELIMINAR />-->
   <q-dialog v-model="dialog_list">
      <q-card style="max-width: 80%; width: 40%">
        <q-card-section class="bg-green-14 text-white">
          <div class="text-h6">Codigos</div>
        </q-card-section>
        <q-card-section class="q-pt-xs">
                <q-table
                    :rows="dato2.codigos"
                    :columns="subcol"
                     :rows-per-page-options="[0]"
                      separator="cell"
                      dense
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
<!-- empresas asociados  eliminar codigo de proyecto />-->
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

     <!-- empresas asociados  adicionar consultor />-->
      <q-dialog v-model="dialog_add1">
      <q-card style="max-width: 80%; width: 50%">
        <q-card-section class="bg-green-14 text-white">
          <div class="text-h6">Agregar Consultor</div>
        </q-card-section>
        <q-card-section class="q-pt-xs">

          <q-form @submit="onAdd1" class="q-gutter-md">
            <q-input
              outlined
              v-model="codigo.ci"
              type="text"
              label="Cedula de Identidad"
              hint="Ingresar CI del consultor"
               lazy-rules
              :rules="[(val) => val!='' && val!=null || 'Por favor ingresa datos']"
            />

            <div>
              <q-btn label="Agregar" type="submit" color="positive" icon="add_circle" />
              <q-btn label="Cancelar" icon="delete" color="negative" v-close-popup />
            </div>
          </q-form>
        </q-card-section>
      </q-card>
    </q-dialog>
     <!-- Adicionar empresa y/o sociedad accidentañl/>-->
      <q-dialog v-model="dialog_add2">
      <q-card style="max-width: 80%; width: 50%">
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
          <q-form @submit="onAdd2" class="q-gutter-md">
            <q-input v-if="group=='op1'"
              outlined
              v-model="codigo.nit"
              type="text"
              label="N.I.T. de la empresa"
              hint="Ingresar NIT"
            />
            <q-input v-else
              outlined
              v-model="codigo.codigo"
              type="text"
              label="Codigo de la Sociedad Accidental"
              hint="Ingresar Codigo"
            />
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

       <!-- VER LISTA de PERSONAS Y ELIMINAR />-->
   <q-dialog v-model="dialog_list1">
      <q-card style="max-width: 80%; width: 80%">
        <q-card-section class="bg-green-14 text-white">
          <div class="text-h6">Lista de consultores presentados</div>
        </q-card-section>
        <q-card-section class="q-pt-xs">
                <q-table

                    :rows="dato2.personas"
                    :columns="subcol1"
                   :rows-per-page-options="[0]"
                    separator="cell"
                    dense
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
        <q-card-section v-if="group=='op1'" class="q-pt-xs">
                <q-table

                    :rows="dato2.empresas"
                    :columns="subcol2"
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
           <q-td key="monto" :props="props">
            {{ props.row.pivot.monto}}
          </q-td>
          <q-td key="opcion" :props="props">
                        <q-btn
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
          <q-card-section v-else class="q-pt-xs">
                <q-table

                    :rows="dato2.sociedads"
                    :columns="subcol3"
                    :rows-per-page-options="[0]"
                      separator="cell"
                      dense
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

     <!-- Adicionar COMISION CALIFICADORA/>-->
    <q-dialog v-model="dialog_add3">
      <q-card style="max-width: 80%; width: 50%">
        <q-card-section class="bg-green-14 text-white">
          <div class="text-h6">Agregar Comision calificadora </div>
        </q-card-section>
        <q-card-section class="q-pt-xs">
          <q-form @submit="onAdd3" class="q-gutter-md">
             <q-option-group
                v-model="opcion"
                :options="[{label:'Cedula de Identidad', value:'op1'}]"
                color="primary"
                inline
              />

            <q-input v-if='opcion==="op1"'
              outlined
              v-model="codigo.ci"
              type="text"
              label="C.I.   si lo tiene"
              hint="CI del profesional Tecnico"
            />
            <q-input v-else
              outlined
              v-model="codigo.datosp"
              type="text"
               mask="XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
              label="Nombre Completo Del profesional tecnico"
              hint="Ingresar Nombre Completo del Profesional Tecnico"
            />

            <div>
              <q-btn label="Agregar" type="submit" color="positive" icon="add_circle" />
              <q-btn label="Cancelar" icon="delete" color="negative" v-close-popup />
            </div>
          </q-form>
        </q-card-section>
      </q-card>
    </q-dialog>
       <!-- LISTA DE LA COMISION CALIFICADORA />-->
   <q-dialog v-model="dialog_list3">
      <q-card style="max-width: 80%; width: 50%">
        <q-card-section class="bg-green-14 text-white">
          <div class="text-h6">COMISION CALIFICADORA</div>
        </q-card-section>
        <q-card-section class="q-pt-xs">
                <q-table
                    :rows="dato2.funcionarios"
                    :columns="subcol"
                    :rows-per-page-options="[0]"
                      separator="cell"
                      dense
                    >
      <template v-slot:body="props">
          <q-tr :props="props">
          <q-td key="nombre" :props="props">
              {{ props.row.grado}} {{ props.row.datosp}}
          </q-td>
          <q-td key="opcion" :props="props">
                        <q-btn
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
    <!-- eliminar SOCIEDADES   />-->
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


     <!-- LISTA DE LOTES />-->
   <q-dialog v-model="dialog_list_lotes">
      <q-card style="max-width: 80%; width: 50%">
        <q-card-section class="bg-green-14 text-white">
          <div class="text-h6">lista de lotes</div>
        </q-card-section>
        <q-card-section class="q-pt-xs">
                <q-table
                    :rows="dato2.lotes"
                    :columns="subcol"
                    :rows-per-page-options="[0]"
                    separator="cell"
                    dense
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
                        @click="deletesub_lotes(props)"
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


  </div>
</template>

<script>
import errores from 'components/errores.vue'
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
  { name: 'programa',align:"center", label: 'Programa', field: 'programa', sortable: true },
  { name: 'tipo', align:"tipo", label:'Tipos',field: "tipo", sortable: true},
  { name: 'codigos', align:"left", label:'Codigo(s)',field: "codigos", sortable: true},
  { name: 'action', align:"center",label: 'Accion', field: 'action' },
  { name: 'nombre',required: true, align:"left",label: 'Nombre del Proyecto', field: 'nombre', sortable: true },
  { name: 'action1', align:"center",label: 'Detalle', field: 'action1'},
  { name: 'cuce',align:"Center", label: 'cuce', field: 'cuce', sortable: true },
  { name: 'link',align:"left", label: 'link de la reunion', field: 'link', sortable: true },
  { name: 'fecha', align:"left",label: 'Fecha', field: 'fecha', sortable: true },
  { name: 'hora', align:"center",label: 'hora', field: 'hora', sortable: true },
  { name: 'precio', align:"center",label: 'Precio', field: 'precio', sortable: true },
  { name: 'plazo', align:"center",label: 'plazo', field: 'plazo', sortable: true },
  { name: 'lotes',align:"Center", label: 'Lotes', field: 'lotes', sortable: true },
  { name: 'comision',align:"left", label: 'Comision', field: 'comision', sortable: true },
  { name: 'funcionarios',align:"left", label: 'Comision', field: 'funcionarios', sortable: true },
  { name: 'opcion', label: 'Opcion', field: 'opcion' }
   ]

export default {
   components: {
    errores
    },
  data() {
    return {
   alert:false,
   dialog_del:false,
   dialog_mod:false,
   dialog_add:false,
   dialog_add_lotes:false,
   dialog_list:false,
   dialog_delsub: false,
   dialog_add1:false,
   dialog_add2:false,
   dialog_list1:false,
   dialog_list2:false,
   dialog_list_lotes:false,
   dialog_delsub1:false,
   dialog_delsub2: false,
   dialog_delsub3: false,
   dialog_delsub4:false,
   dialog_add3:false,
   dialog_list3:false,
   selected: [],
   filter:'',
   errores: null,
   consultores:[],
   props:[],
   departamentos: [],
  depa:{},
  programas:[],
  prog:{},
  tipos:[],
  tipo:{},
  codigo:{},
  codigos:[],
proyecto:{},
   subcol: [
        {
          name: "nombre",
          required: true,
          label: "Nombre",
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

   data:[],
   dato:{},
   columns,
   dato2:{},
   dato3:{},
   options:{},
   opcion:'op1',
    opciones: [
        {
          label: 'Empresa',
          value: 'op1'
        },
        {
          label: 'Sociedad Accidental',
          value: 'op2'
        }
      ],
      group: 'op1',
      };
  },
  created(){
    this.misdatos();
    this.cargardatos();

  },
  methods:{
     onReset() {
      this.dato.fecha=null;
      this.dato.hora =null;
      this.dato.link =null;
      this.dato.nombre =null;
      this.dato.precio =null;
      this.dato.plazo =null;
      this.dato.lotes =null;
      this.dato.cuce =null;
      this.depa=this.departamentos[0]
      this.prog=this.programas[0]
      this.tipo=this.tipos[0]
    },
    misdatos(){
    this.$q.loading.show();
       this.$api.get(process.env.API+"/proyectos").then((res)=>{
       //console.log(res.data)
         this.data =res.data;
    this.$q.loading.hide();
       });

    },
    cargardatos(){
        this.departamentos=[];
        this.$q.loading.show();
       this.$api.get(process.env.API+"/departamentos").then((res)=>{
       res.data.forEach(depa => {
            this.departamentos.push({label:depa.nombre,value:depa.id});
        });
       });
      this.programas=[];
       this.$api.get(process.env.API+"/programas").then((res)=>{
       res.data.forEach(prog => {
            this.programas.push({label:prog.nombre,value:prog.id});
        });
       });
     this.tipos=[];
       this.$api.get(process.env.API+"/tipos").then((res)=>{
       res.data.forEach(tip => {
            this.tipos.push({label:tip.nombre,value:tip.id});
        });
         // console.log(this.tipos)
      //  console.log('ok')
        this.$q.loading.hide();
       });
        this.depa=this.departamentos[0]
      this.prog=this.programas[0]
      this.tipo=this.tipos[0]
    },
   editRow(item) {
      this.dato2 = item.row
 //console.log(this.depa);

    //this.depa={label:this.nombre, value:item.row.departamento_id}
    this.depa={}
      this.departamentos.forEach(tipo => {
           if(tipo.value===item.row.departamento_id)
                this.depa={label:tipo.label,value:tipo.value};
        });
      //  console.log(this.depa);
    this.prog={}
      this.programas.forEach(tipo => {
           if(tipo.value===item.row.programa_id)
                this.prog={label:tipo.label,value:tipo.value};
        });
    this.tipo={}
      this.tipos.forEach(tipo => {
           if(tipo.value===item.row.tipo_id)
                this.tipo={label:tipo.label,value:tipo.value};
        });
      this.dialog_mod = true;
    },
    addRow(item) {
      this.dato2 = item.row;
      this.codigo={}
      this.dialog_add = true;
    },
    addRow1(item) {
      this.dato2 = item.row;
       this.codigo={}
        if (this.dato2.tipo_id===2)
         {
                 this.dialog_add1 = true; //personas
         }else{
                 this.dialog_add2 = true; // empresas y sociedades
         }
    },
    addRow2(item) {
       this.dato2 = item.row;
       this.codigo={}
       this.dialog_add3 = true;
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
    deletesub_lotes(item) {
      this.dato3 = item.row;

      console.log(this.dato3)

       this.$q.dialog({
                  title: 'Eliminar ',
                  message: 'Esta seguro que desea Eliminar este Registro ?',
                  cancel: true,
                  persistent: true
                  // console.log('>>>> OK')
                }).onOk(() => {
                    this.$q.loading.show()
               //       this.$api.delete( process.env.API+"/lote/" + this.dato3.id).then((res) => {
                this.$api.delete(process.env.API + "/lote/" + this.dato3.id ).then((res) => {
                          if (res.data.res === true) {
                            this.$q.notify({
                              color: "green-4",
                              textColor: "white",
                              icon: "cloud_done",
                              message: "eliminado correctamente",
                            });
                          }
                          this.misdatos();
                          this.$q.loading.hide()
                           this.dialog_list_lotes = false;
                  })
                }).onCancel(() => {
                    this.$q.loading.hide()

                })
    },
    onDelsub() {
      this.$q.loading.show();
       this.$api.put(process.env.API + "/codigoproyectos/"+this.dato2.id,this.dato3).then((res) => {
                              this.$q.notify({
                          color: "green-4",
                          textColor: "white",
                          icon: "cloud_done",
                         message: "Eliminado correctamente",
        });
        this.dialog_delsub = false;
        this.dialog_list = false;
        this.misdatos();
      });
    },

    onAdd() {
      this.$q.loading.show();
       this.$api.get(process.env.API + "/codigofound/"+this.codigo.nombre).then((res1) => {
        //console.log(res1.data)
            if(res1.data.length===0) {
              this.$api.post(process.env.API + "/codigos/", this.codigo).then((res2) => {
                 //   console.log("adicionado correctamente")
                  //       console.log(res2.data)
                     this.$api.put(process.env.API + "/codigoproyectos1/"+this.dato2.id,res2.data).then((res) => {
                              this.$q.notify({
                          color: "green-4",
                          textColor: "white",
                          icon: "cloud_done",
                          message: "Agregado - codigo correctamente",
                        });
                       this.dialog_add = false;
                        this.misdatos();
                         //console.log("entro a nuevo")
                        // console.log(res.data)
                        });
                    });

           }else{
               // console.log("encontrado correctamente")
                   //      console.log(res1.data)
                  this.$api.put(process.env.API + "/codigoproyectos1/"+this.dato2.id,res1.data[0]).then((res) => {
                              this.$q.notify({
                          color: "green-4",
                          textColor: "white",
                          icon: "cloud_done",
                          message: "Agregado - codigo correctamente",
                        });
                       this.dialog_add = false;
                        this.misdatos();
                        // console.log(res.data)
                        });
           }
       });
     },
      onAdd1() {
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
                       this.dialog_add1 = false;
                 this.$q.loading.hide();
           }else{
                  this.$api.put(process.env.API + "/personaproyectos/"+this.dato2.id,res1.data[0]).then((res) => {
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
       });
     },
      onDelsub1() {
      this.$q.loading.show();
       this.$api.put(process.env.API + "/personaproyectosdetach/"+this.dato2.id,this.dato3).then((res) => {
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
       this.$api.put(process.env.API + "/empresaproyectosdetach/"+this.dato2.id,this.dato3).then((res) => {
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
       this.$api.put(process.env.API + "/sociedadproyectosdetach/"+this.dato2.id,this.dato3).then((res) => {
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
       this.$api.put(process.env.API + "/funcionarioproyectosdetach/"+this.dato2.id,this.dato3).then((res) => {
                              this.$q.notify({
                          color: "green-4",
                          textColor: "white",
                          icon: "cloud_done",
                           message: "Eliminado correctamente",
        });
        this.dialog_delsub4 = false;
        this.dialog_list3 = false;
        this.misdatos();
      });
    },
       onAdd2() {
      this.$q.loading.show();
      if (this.group==='op1'){
        //es empresa
       this.$api.get(process.env.API + "/empresanit/"+this.codigo.nit).then((res1) => {
      //  console.log(res1.data)
            if(res1.data.length===0) {
                      this.$q.notify({
                          color: "red-4",
                          textColor: "white",
                          icon: "cloud_done",
                          message: "Empresa no registrado,  registre porfavor",
                        });
                       this.dialog_add2 = false;
                 this.$q.loading.hide();
           }else{
             res1.data[0].monto =this.codigo.monto;
             this.$api.put(process.env.API+"/empresaproyectos/"+this.dato2.id,res1.data[0]).then((res) => {


                     this.$q.notify({
                          color: "green-4",
                          textColor: "white",
                          icon: "cloud_done",
                          message: "Agregado Correctamente",
                        });
                        // console.log('respuesta del join emporesa')
                       // console.log(res.data)
                       this.dialog_add2 = false;
                        this.misdatos();
                       });


           }
       });

       }else{
         //es sociedad accidental
           this.$api.get(process.env.API + "/sociedadcodigo/"+this.codigo.codigo).then((res1) => {
          // console.log(res1.data)
            if(res1.data.length===0) {
                      this.$q.notify({
                          color: "red-4",
                          textColor: "white",
                          icon: "cloud_done",
                          message: "Sociedad accidental No registrado,  registre porfavor",
                        });
                       this.dialog_add2 = false;
                 this.$q.loading.hide();
           }else{
               res1.data[0].monto =this.codigo.monto;
               console.log(res1.data[0]);
                  this.$api.put(process.env.API + "/sociedadproyectos/"+this.dato2.id,res1.data[0]).then((res) => {
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
       }
       },
       onAdd3() {
      this.$q.loading.show();
       if (this.opcion==='op1'){
        this.$api.get(process.env.API + "/consultorci/"+this.codigo.ci).then((res1) => {
         if(res1.data.length===0) {
           this.$q.notify({
                          color: "red-4",
                          textColor: "white",
                          icon: "cloud_done",
                          message: "ci no encontrado - registre porfavor",
                        });
                       this.dialog_add3 = false;
                       this.$q.loading.hide();
              }else{

          this.$api.put(process.env.API + "/funcionarioproyectos/"+this.dato2.id,res1.data[0]).then((res) => {
                              this.$q.notify({
                          color: "green-4",
                          textColor: "white",
                          icon: "cloud_done",
                          message: "Agregado - funcionario correctamente",
                        });
                       this.dialog_add3 = false;
                        this.misdatos();
                        });

              }
        });

       }else{

       }

     },

    deleteRow(item) {
      this.dato2 = item.row;
      this.dialog_del = true;
    },
     onDel() {
      this.$q.loading.show();
      this.$api.delete( process.env.API+"/proyectos/" + this.dato2.id).then((res) => {
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
     onSubmit() {
      this.errores =null;
      this.$q.loading.show();

       this.dato.departamento_id=this.depa.value;
       this.dato.programa_id=this.prog.value;
       this.dato.tipo_id=this.tipo.value;
   //   console.log(this.dato)
      this.$api.post(process.env.API+"/proyectos/", this.dato).then((res) => {

         if(res.data.res===true)
          {
            this.$q.notify({
            color: "green-4",
            textColor: "white",
            icon: "cloud_done",
            message: "Creado Correctamente",
          });

          }else{
            this.errores = res.data.errors;
          }
         this.alert= false;
          this.misdatos();
          this.onReset();
        }).catch((e)=>{
          this.$q.loading.hide();
          this.errores = e.response.data.errors;
        });
    },
    //modificar
     onMod() {
      this.errores =null;
       this.$q.loading.show();
      this.dato2.departamento_id=this.depa.value;
       this.dato2.programa_id=this.prog.value;
       this.dato2.tipo_id=this.tipo.value;
      this.$api.put(process.env.API+"/proyectos/"+this.dato2.id,this.dato2).then((res) => {
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
            this.errores = res.data.errors;
          }
         this.dialog_mod = false;
          this.misdatos();
        }).catch((e)=>{
          this.$q.loading.hide();
          this.errores = e.response.data.errors;
        });
    },
    exportTable () {
     const content = [columns.map(col => wrapCsvValue(col.label))].concat(
          this.data.map(row => columns.map(col => wrapCsvValue(
            typeof col.field === 'function'
              ? col.field(row)
              : row[ col.field === void 0 ? col.name : col.field ],
            col.format
          )).join(','))
        ).join('\r\n')

        const status = exportFile(
          'prroyectos.csv',
          "\ufeff"+content,
          'text/csv'
        )

        if (status !== true) {
          $q.notify({
            message: 'Browser denied file download...',
            color: 'negative',
            icon: 'warning'
          })
        }
  },
    detalle(item) {
      this.dato2 = item.row;
      this.$router.push({name: 'setting.view', params: {id:this.dato2.id}})
    },
    lotes(item) {
      this.dato2 = item.row;
      console.log(item.row);
       this.codigo={}
     let number=0
       if(item.row.lotes.length>0){
       for(let i=0;i<item.row.lotes.length;i++){
          if(item.row.lotes[i].nro>number){
               number=item.row.lotes[i].nro
          }
       }
        number++
       }else{
        number=1
       }

       this.codigo.proyecto_id=item.row.id
       this.codigo.nombre=item.row.nombre +" LOTE "+number;
       this.codigo.nro=number
      this.dialog_add_lotes=true;
    },

    onAdd_lote() {
      this.$q.loading.show();
       this.$api.post(process.env.API + "/lote/",this.codigo).then((res) => {
            console.log(res.data)
            this.$q.loading.hide();
             this.dialog_add_lotes=false;
               this.misdatos();
       });
     },
      lotes_view(item) {
      this.dato2 = item.row;
      this.dialog_list_lotes = true;
    }

  },
};
</script>
