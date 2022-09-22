<template>
  <div class="q-pa-md" style="padding:10px">
    <div style="display:flex; justify-content:space-between">
    <q-btn    v-if="this.$store.state.login.user.status==='CENTRAL'"
      label=" ATRAS"
      color="secondary"
      icon="account_tree"
      @click="this.$router.push('/ReporteBol34')"
      class="q-mb-xs"
    />
    <q-btn v-if="this.$store.state.login.user.status!=='CENTRAL'"
      label=" ATRAS"
      color="secondary"
      icon="account_tree"
      @click="this.$router.push('/RegistroBol34')"
      class="q-mb-xs"
    />
     <q-btn v-if="false"
      label="Imprimir INFORME"
      color="red"
      icon="print"
      class="q-mb-xs"
      @click="imprimir"
    />
       <q-btn
      label="Imprimir EVALUCION TECNICA"
      color="red"
      icon="print"
      class="q-mb-xs"
      @click="imprimirEvaluacion"
    />
    <q-btn
      label="Imprimir FICHA TECNICA"
      color="green"
      icon="print"
      class="q-mb-xs"
        @click="imprimirFicha"
    />
    </div>
    <q-card
    class="my-card text-white"
    style="background: radial-gradient(circle, #35a2ff 0%, #014a88 100%); padding:0px"
    square
    flat bordered
    >
         <q-card-section >
          <div class="row" style="padding:0px">
              <div class="q-pa-md  col-8" style="padding:0px">
                <div  class="row"  style="padding:0px; border:0px; display:flex;" >
                      <div class=" q-pa-md  col-6" style="color:white; text-align:right; padding:0px; border:0px ">
                          <span>DATOS GENERALES DEL PROYECTO  </span>
                      </div>
                      <div class=" q-pa-md  col-6" style="display:flex; justify-content:flex-end">
                        <q-btn  v-if="false"
                        label="Comunidades/Distritos"
                        color="red"
                        icon="add"
                        class="q-mb-xs"
                      />
                      <q-btn v-if="false"
                        label="EDITAR"
                        color="green"
                        icon="edit"
                        class="q-mb-xs"
                      />
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

              <div class=" q-pa-md  col-4"  style=" display: flex; flex-direction:column;  justify-content:center">
                 <div class="row" >
                      <div class="col" >
                       <q-btn icon="looks_one" label="Datos Generales" stack glossy @click="view_form1" color="purple" style="width:200px" />
                        </div>
                        <div class="col">
                         <q-linear-progress size="50px" :value="progress1" color="accent" class="q-mt-sm">
                        <div class="absolute-full flex flex-center">
                          <q-badge color="white" text-color="accent" :label="progressLabel1" />
                        </div>
                        </q-linear-progress>
                     </div>
                   </div>
                   <div class="row">
                      <div class="col">
                       <q-btn icon="looks_two" label="Criterios de Eligibilidad" stack glossy @click="view_form2" color="purple" style="width:200px; margin:10px 0px 0px 0px"/>
                        </div>
                        <div class="col">
                         <q-linear-progress size="50px" :value="progress2" color="accent" class="q-mt-sm" style="margin:20px 0px 0px 0px">
                        <div class="absolute-full flex flex-center">
                          <q-badge color="white" text-color="accent" :label="progressLabel2" />
                        </div>
                        </q-linear-progress>
                     </div>
                   </div>

                   <div class="row">
                      <div class="col">
                       <q-btn icon="looks_3" label="Requisitos Del proyecto" stack glossy @click="view_form3" color="purple" style="width:200px; margin:10px 0px 0px 0px" />
                        </div>
                        <div class="col">
                         <q-linear-progress size="50px" :value="progress3" color="accent" class="q-mt-sm" style="margin:20px 0px 0px 0px">
                        <div class="absolute-full flex flex-center">
                          <q-badge color="white" text-color="accent" :label="progressLabel3" />
                        </div>
                        </q-linear-progress>
                     </div>
                   </div>

                      <div class="row">
                      <div class="col">
                       <q-btn icon="looks_4" label="INGENIERIA DEL PROYECTO" stack glossy @click="view_form4" color="purple" style="width:200px; margin:10px 0px 0px 0px" />
                        </div>
                        <div class="col">
                         <q-linear-progress size="50px" :value="progress4" color="accent" class="q-mt-sm" style="margin:20px 0px 0px 0px">
                        <div class="absolute-full flex flex-center">
                          <q-badge color="white" text-color="accent" :label="progressLabel4" />
                        </div>
                        </q-linear-progress>
                     </div>
                   </div>

                  <div class="row" v-if="false">
                      <div class="col">
                       <q-btn icon="looks_5" label="VARIACION POSITIVA O NEGATIVA" stack glossy @click="view_form5" color="purple" style="width:200px; margin:10px 0px 0px 0px" />
                        </div>
                        <div class="col">
                         <q-linear-progress size="50px" :value="progress5" color="accent" class="q-mt-sm" style="margin:20px 0px 0px 0px">
                        <div class="absolute-full flex flex-center">
                          <q-badge color="white" text-color="accent" :label="progressLabel5" />
                        </div>
                        </q-linear-progress>
                     </div>
                   </div>
                  <div class="row">
                      <div class="col">
                       <q-btn icon="looks_5" label="RESULTADOS DE EVALUACION" stack glossy @click="view_form6" color="purple" style="width:200px; margin:10px 0px 0px 0px" />
                        </div>
                        <div class="col">
                         <q-linear-progress size="50px" :value="progress6" color="accent" class="q-mt-sm" style="margin:20px 0px 0px 0px">
                        <div class="absolute-full flex flex-center">
                          <q-badge color="white" text-color="accent" :label="progressLabel6" />
                        </div>
                        </q-linear-progress>
                     </div>
                   </div>
                     <div class="row">
                      <div class="col">
                       <q-btn icon="brightness_7" label="EVALUACION EN CAMPO" stack glossy @click="view_form7" color="purple" style="width:200px; margin:10px 0px 0px 0px" />
                        </div>
                        <div class="col">
                         <q-linear-progress size="50px" :value="progress7" color="accent" class="q-mt-sm" style="margin:20px 0px 0px 0px">
                        <div class="absolute-full flex flex-center">
                          <q-badge color="white" text-color="accent" :label="progressLabel7" />
                        </div>
                        </q-linear-progress>
                     </div>
                   </div>

                     <div class="row">
                      <div class="col">
                       <q-btn icon="summarize" label="FICHA TECNICA" stack glossy @click="view_form8" color="purple" style="width:200px; margin:10px 0px 0px 0px" />
                        </div>
                        <div class="col">
                         <q-linear-progress size="50px" :value="progress8" color="accent" class="q-mt-sm" style="margin:20px 0px 0px 0px">
                        <div class="absolute-full flex flex-center">
                          <q-badge color="white" text-color="accent" :label="progressLabel8" />
                        </div>
                        </q-linear-progress>
                     </div>
                   </div>



               </div>
          </div>


        </q-card-section>
    </q-card>

      <!--          formulario 1   -->
    <q-dialog v-model="dialog_form1">
      <q-card style="max-width: 80%; width: 80%">
        <q-card-section class="bg-green-14 text-white">
          <div class="text-h6"><q-icon name="edit" /> DATOS GENERALES de PROYECTO</div>
        </q-card-section>

        <q-card-section class="q-pt-xs">
          <q-form @submit="onMod1" class="q-gutter-md">
           <div class="row">
              <div class="col-6">

             <q-input
              outlined
              v-model="dato.nombre"
              type="text"
              label="Nombre del proyecto"
              hint="Ingresar Nombre del Proyecto"
              lazy-rules
              :rules="[(val) => (val && val.length > 0) || 'Favor ingresa datos']"
            />
             <q-input
                  outlined
                  type="text"
                  v-model="dato.codigo"
                    label="Codigo del proyecto "
                  hint="Codigo del Proyecto VIPFE"
                />
            <q-input
              outlined
              v-model="dato.cite"
              type="text"
              label="CITE carta VIPFE"
               hint="Ingresar CITE carta VIPFE"
            />
             <q-input
              outlined
              v-model="dato.interno"
              type="text"
              label="Hoja de ruta FPS"
              hint="Ingresar HOJA DE RUTA Del fps Nacional"
              lazy-rules
              :rules="[(val) => (val && val.length > 0) || 'Favor ingresa datos']"
            />

             </div>
             <div class="col-6">


            <q-select
              outlined
              v-model="departamento"
              :options="departamentos"
               disable
              label="Departamento"
              type="text"
                hint="Ingresar Departamento que corresponde"

            />
              <q-select
              outlined
              v-model="municipio"
              :options="municipios"
              label="Municipio"
              type="text"
                hint="Ingresar Municipio que corresponde"
            />
             <q-input
              outlined
              v-model="dato.monto1"
              type="number"
               step="0.01"
              label="Monto de la  Infraestructura"
              hint="Ingrese  un numero "
            />
            <q-input
              outlined
              v-model="dato.monto2"
              type="number"
               step="0.01"
              label="Monto de la Supervision"
              hint="Ingrese un numero "
            />
            <q-input
              outlined
              v-model="dato.total"
              type="number"
               step="0.01"
              label="Monto Total del Proyecto"
              hint="Ingrese el numero "
            />
            </div>
             </div>
            <div>
              <q-btn label="GUARDAR" type="submit" color="positive" icon="add_circle" />
              <q-btn label="SALIR" icon="delete" color="negative" v-close-popup />
            </div>
          </q-form>
        </q-card-section>
      </q-card>
    </q-dialog>

      <!--          formulario 6   -->
    <q-dialog v-model="dialog_form6">
      <q-card style="max-width: 80%; width: 80%">
        <q-card-section class="bg-green-14 text-white">
          <div class="text-h6"><q-icon name="edit" /> {{titulo}}</div>
        </q-card-section>

        <q-card-section class="q-pt-xs">
          <q-form @submit="onMod6" class="q-gutter-md">
               <q-input
              outlined
              v-model="dato.monto3"
              type="Number"
              step="0.01"
               label="AREA DE ENLOSETADO"
              hint="Ingresar Area de Enlosetado (M2)"
            />
                            <q-select
                              outlined
                              v-model="dato.presentado_por"
                              :options="['G.A.M.', 'G.A.I.O.C.', 'J.V.','O.S.']"
                              label="Priorizado por:"
                              stack-label

                              />
            <div class="q-gutter-sm" >
            <span> El proyecto tiene los siguientes items</span>
                  <q-checkbox keep-color v-model="cordones" label="CORDONES DE ACERA" color="teal" />
                  <q-checkbox keep-color v-model="alcantarillado" label="ALCANTARILLADO SANITARIO" color="orange" />
                  <q-checkbox keep-color v-model="medidas" label="MEDIDAS DE BIOSEGURADAD (COVID)" color="red" />
                  <q-checkbox keep-color v-model="colocado" label="COLOCADO DE PLANTINES" color="cyan" />

                  <q-checkbox keep-color v-model="acera" label="ACERA DE CEMENTO" color="teal" />
                  <q-checkbox keep-color v-model="gradas" label="GRADAS H°C°" color="orange" />
                  <q-checkbox keep-color v-model="baranda" label="BARRAS DE FG" color="red" />
                  <q-checkbox keep-color v-model="muros" label="MUROS DE CONTENSION" color="cyan" />

                  <q-checkbox keep-color v-model="enladrillado" label="RETIRO DE ENLADRILLADO" color="teal" />
                  <q-checkbox keep-color v-model="empedrado" label="RETIRO DE EMPEDRADO" color="orange" />
                  <q-checkbox keep-color v-model="enlosetado" label="RETIRO DE ENLOSETADO" color="red" />
                  <q-checkbox keep-color v-model="otro" label="OTRO" color="cyan" />
                  <q-input  v-if="otro==true"
                  outlined
                  type="text"
                  v-model="otrosi"
                   label="otro item"
                  hint="item importante del proyecto"
                />
          </div>
                <div class="q-gutter-sm">
               <span color='red' > El proyecto Cumple con la Evaluacion ?</span>
              <q-radio v-model="dato.cumple" checked-icon="task_alt" unchecked-icon="panorama_fish_eye" val="SI" label="SI" />
              <q-radio v-model="dato.cumple" checked-icon="task_alt" unchecked-icon="panorama_fish_eye" val="NO" label="NO" />
             </div>
                <q-input
                  outlined
                  type="textarea"
                  v-model="dato.observacion"
                 label="RECOMENDACIONES"
                  hint="Describa sus recomendaciones"
                />
                  <q-input
                  outlined
                  type="date"
                  v-model="dato.carta_fecha"
                  hint="Ingresar Fecha de envio"
                />


            <div>
              <q-btn label="GUARDAR" type="submit" color="positive" icon="add_circle" />
              <q-btn label="SALIR" icon="delete" color="negative" v-close-popup />
            </div>
          </q-form>
        </q-card-section>
      </q-card>
    </q-dialog>

 <!--          formularios 2,3,4 de evaluacion   -->
    <q-dialog v-model="dialog_form2345" persistent>
      <q-card style="max-width: 80%; width: 80%">
        <q-card-section class="bg-green-14 text-white">
          <div style="display: flex; justify-content:space-between ">
          <div class="text-h6"><q-icon name="edit" /> {{titulo}}</div>
          <q-btn label="SALIR" @click="refrescar" color="blue" icon="close" />
          </div>
        </q-card-section>

        <q-card-section class="q-pt-xs">
               <div class="row" v-for="item in evaluaciones" :key="item.id"  style="margin:0;padding:0 ">
                     <div class="col-6"  v-if="item.tipo===op">
                          <q-card-section style="background-color:#F2F3F4">
                          <div class="text-subtitle2">{{item.nombre}} : {{item.descripcion}}</div>
                        </q-card-section>
                     </div>
                     <div class="col-1" v-if="item.tipo===op"   >
                      <div class="q-gutter-sm" dense>
                            <q-radio  v-if="item.tipo==='VARIACION'" dense v-model="item.valor" val="SI" label="SI" />
                            <q-radio  v-if="item.tipo==='VARIACION'" dense v-model="item.valor" val="NO" label="NO" />
                            <q-radio  v-if="item.tipo==='REQUISITO'" dense v-model="item.valor" val="Presenta." label="Presenta" />
                            <q-radio  v-if="item.tipo==='REQUISITO'" dense v-model="item.valor" val="Debe ser presentado." label="No Presenta" />
                            <q-radio v-if="item.tipo==='CRITERIO'" dense v-model="item.valor" val="SI" label="Cumple" />
                            <q-radio v-if="item.tipo==='CRITERIO'" dense v-model="item.valor" val="NO" label="No Cumple" />
                            <q-radio v-if="item.tipo==='INGENIERIA'" dense v-model="item.valor" val="SI" label="Presenta" />
                            <q-radio v-if="item.tipo==='INGENIERIA'" dense v-model="item.valor" val="NO" label="No presenta" />
                      </div>
                     </div>
                     <div class="col-4"  v-if="item.tipo===op">
                      <q-input  v-if="item.tipo!=='REQUISITO'"
                        outlined
                        v-model="item.descripcion1"
                        type="textarea"
                        label="Observacion"
                        hint="Ingrese la observacion"
                      />
                      <q-input  v-if="item.nombre==='R-2'"
                        outlined
                        v-model="item.descripcion1"
                        type="textarea"
                        label="Observacion"
                        hint="Ingrese la observacion"
                      />
                     </div>
                        <div class="col-1"  v-if="item.tipo===op">
                          <q-btn v-if="item.puntaje==='1.00'"
                        dense
                        round
                        flat
                        color="green"
                        @click="guardar(item)"
                        icon="save"
                      ></q-btn>
                          <q-btn v-else
                        dense
                        round
                        flat
                        color="blue"
                        @click="editar(item)"
                        icon="save"
                      ></q-btn>
                        </div>
               </div>
        </q-card-section>
        <q-card-section class="bg-green-14 text-white">
          <div class="text-h6"> No olvide llenar cada uno de los DATOS del Proyecto </div>
        </q-card-section>
      </q-card>
    </q-dialog>
    <!--          formularios 2,3,4 de evaluacion   -->
    <q-dialog v-model="dialog_form2345_corregido" persistent>
      <q-card style="max-width: 80%; width: 90%">
        <q-card-section class="bg-green-14 text-white">
          <div style="display: flex; justify-content:space-between ">
          <div class="text-h6"><q-icon name="edit" /> {{titulo}}</div>
          <q-btn label="SALIR" @click="refrescar" color="blue" icon="close" />
          </div>
        </q-card-section>

        <q-card-section class="q-pt-xs">
               <div class="row" v-for="item in evaluaciones" :key="item.id"  style="margin:0;padding:0 ">
                     <div class="col-5"  v-if="item.tipo===op">
                          <q-card-section style="background-color:#F2F3F4">
                          <div class="text-subtitle2">{{item.nombre}} : {{item.descripcion}}</div>
                        </q-card-section>
                     </div>
                     <div class="col-2" v-if="item.tipo===op &&item.tipo==='CRITERIO'"  >
                      <div class="q-gutter-sm" dense>

                            <q-radio  v-if="item.tipo==='REQUISITO'" dense v-model="item.valor" val="SI" label="Presenta" />
                            <q-radio  v-if="item.tipo==='REQUISITO'" dense v-model="item.valor" val="NO" label="No Presenta" />
                            <q-radio  v-if="item.tipo==='REQUISITO'" dense v-model="item.valor" val="No corresponde." label="No corresponde (Categoria A)" />
                            <q-radio v-if="item.tipo==='CRITERIO'" dense v-model="item.valor" val="SI" label="Cumple" />
                            <q-radio v-if="item.tipo==='CRITERIO'" dense v-model="item.valor" val="NO" label="No Cumple" />

                            <q-radio v-if="item.tipo==='INGENIERIA'" dense v-model="item.valor" val="SI" label="Presenta" />
                            <q-radio v-if="item.tipo==='INGENIERIA'" dense v-model="item.valor" val="NO" label="No presenta" />
                            <q-radio v-if="item.tipo==='INGENIERIA'" dense v-model="item.valor" val="Debe ser Complementado" label="Debe ser complementado" />
                      </div>
                     </div>

                      <div class="col-6" v-if="item.tipo===op  && item.tipo!=='CRITERIO'"  >
                      <div class="q-gutter-sm" dense>

                            <q-radio  v-if="item.tipo==='REQUISITO'" dense v-model="item.valor" val="SI" label="Presenta" />
                            <q-radio  v-if="item.tipo==='REQUISITO'" dense v-model="item.valor" val="NO" label="No Presenta" />
                            <q-radio  v-if="item.tipo==='REQUISITO'" dense v-model="item.valor" val="No corresponde." label="No corresponde (Categoria A)" />
                            <q-radio v-if="item.tipo==='CRITERIO'" dense v-model="item.valor" val="SI" label="Cumple" />
                            <q-radio v-if="item.tipo==='CRITERIO'" dense v-model="item.valor" val="NO" label="No Cumple" />

                            <q-radio v-if="item.tipo==='INGENIERIA'" dense v-model="item.valor" val="SI" label="Presenta" />
                            <q-radio v-if="item.tipo==='INGENIERIA'" dense v-model="item.valor" val="NO" label="No presenta" />
                            <q-radio v-if="item.tipo==='INGENIERIA'" dense v-model="item.valor" val="Debe ser Complementado" label="Debe ser complementado" />
                      </div>
                     </div>



                     <div class="col-4"  v-if="item.tipo===op && item.tipo==='CRITERIO' ">
                      <q-input  v-if="item.nombre!=='C-1'"
                        outlined
                        v-model="item.descripcion1"
                        type="textarea"
                        label="Observacion"
                        hint="Ingrese la observacion"
                      />
                      <q-input  v-if="item.nombre==='C-1' "
                        outlined
                        v-model="item.descripcion1"
                        type="Number"
                        step="1"
                        label="familias"
                        hint="Ingrese Numero de Familias beneficiarias"
                      />
                     </div>
                        <div class="col-1"  v-if="item.tipo===op">
                          <q-btn v-if="item.puntaje==='1.00'"
                        dense
                        round
                        flat
                        color="green"
                        @click="guardar(item)"
                        icon="save"
                      ></q-btn>
                          <q-btn v-else
                        dense
                        round
                        flat
                        color="blue"
                        @click="editar(item)"
                        icon="save"
                      ></q-btn>
                        </div>
               </div>
        </q-card-section>
        <q-card-section class="bg-green-14 text-white">
          <div class="text-h6"> No olvide llenar cada uno de los DATOS del Proyecto </div>
        </q-card-section>
      </q-card>
    </q-dialog>


     <!--          formulario 7  -->
    <q-dialog v-model="dialog_form7">
      <q-card style="max-width: 80%; width: 80%">
        <q-card-section class="bg-green-14 text-white">
          <div class="text-h6"><q-icon name="edit" /> {{titulo}}</div>
        </q-card-section>

        <q-card-section class="q-pt-xs">
          <q-form @submit="onMod7" class="q-gutter-md">
               <div class="q-gutter-sm">
               <span> Realizo la Inspeccion ?</span>
              <q-radio v-model="dato.vinculo" checked-icon="task_alt" unchecked-icon="panorama_fish_eye" val="SI" label="SI" />
              <q-radio v-model="dato.vinculo" checked-icon="task_alt" unchecked-icon="panorama_fish_eye" val="NO" label="NO" />
             </div>
            <q-input v-if="dato.vinculo==='SI'"
              outlined
              v-model="fecha_inspeccion"
              type="date"
              label="Describir la fecha de inspeccion"
              hint="Ingresar observaciones"
            />
            <div>
              <q-btn label="GUARDAR" type="submit" color="positive" icon="add_circle" />
              <q-btn label="SALIR" icon="delete" color="negative" v-close-popup />
            </div>
          </q-form>
        </q-card-section>
      </q-card>
    </q-dialog>
     <!--          formulario 8  -->
    <q-dialog v-model="dialog_form8">
      <q-card style="max-width: 100%; width: 100%">
        <q-card-section class="bg-green-14 text-white">
          <div class="text-h6"><q-icon name="edit" /> {{titulo}}</div>
        </q-card-section>

        <q-card-section class="q-pt-xs">
          <q-form @submit="onMod8" class="q-gutter-md">

             <div class="row" >
                <div class="col-4">
                  <q-input
                    outlined
                    dense
                    v-model="dato2.ubicacion"
                    type="text"
                    label="UBICACION"
                    hint="Ingresar Ubicacion"
                  />
                  <q-input
                    outlined
                    dense
                    v-model="dato2.zona"
                    type="text"
                    label="ZONA"
                    hint="Ingresar Zona"
                  />
                  <q-input
                    outlined
                    dense
                    v-model="dato2.circunscripcion"
                    type="Number"
                    label="Circunscripcion"
                    hint="Ingresar circunscripcion"
                  />
                  <q-input
                    outlined
                    dense
                    v-model="dato2.distrito"
                    type="text"
                    label="Distritos"
                    hint="Ingresar Distrito"
                  />
                  <q-input
                    outlined
                    dense
                    v-model="dato2.direccion"
                    type="text"
                    label="DIreccion/Ubicacion General"
                    hint="Ingresar Direccion/Ubicacion General"
                  />
                  <q-input
                    outlined
                    dense
                    v-model="dato2.latitud"
                    type="text"
                    label="Coordenadas LATUTUD"
                  />
                  <q-input
                    outlined
                    dense
                    v-model="dato2.longitud"
                    type="text"
                    label="Coordenadas LONGITUD"
                  />

                  <div class="q-pa-md">
                        <span> Proyecto fue Priorizado por la GAM/GAIOC/JUNTAS VECINAL/ORGANIZACION SOCIAL ?</span>
                        <q-radio v-model="dato2.priorizado" checked-icon="task_alt" unchecked-icon="panorama_fish_eye" val="SI" label="SI" />
                        <q-radio v-model="dato2.priorizado" checked-icon="task_alt" unchecked-icon="panorama_fish_eye" val="NO" label="NO" />
                      </div>
                     <q-select  v-if="dato2.priorizado=='SI'"
                     outlined
                     v-model="dato2.observacion4"
                     :options="['G.A.M.', 'G.A.I.O.C.', 'J.V.','O.S.']"
                     label="Priorizado por:"
                     stack-label
                     dense
                    />
                  <q-uploader
                        class="full-width"
                        label="Subir FOTOGRAFIA Nº1 (IZQUIERDA) (Max 4mb) "
                        accept=".jpg,png,jpeg,image/*"
                        :factory="uploadFile1"
                        max-files="1"
                        max-total-size="4096"

                      />

                </div>
                <div class="col-4">

                  <div class="q-pa-md">
                        <span> Cuenta con Planimetria Aprobada?  mencione una de las opciones :</span>
                        <q-radio v-model="dato2.planimetria" checked-icon="task_alt" unchecked-icon="panorama_fish_eye" val="SI" label="Documento Oficial GAM" />
                        <q-radio v-model="dato2.planimetria" checked-icon="task_alt" unchecked-icon="panorama_fish_eye" val="NO" label="Documento en tramite" />
                      </div>
                       <q-input
                    outlined
                    dense
                    v-model="dato2.observacion5a"
                    type="text"
                    label="Observacion"
                    hint="Ingresar alguna Observacion"
                  />
                   <div class="row" style="padding:1px">
                    <div class="col-3">
                       <q-input
                       dense
                    outlined
                    v-model="dato2.agua"
                   type="Number"
                    step="0.01"
                    label="% Agua Potable"
                  />
                    </div>
                    <div class="col-3">
                       <q-input
                    outlined
                    dense
                    v-model="dato2.alcantarillado"
                   type="Number"
                    step="0.01"
                    label="% Alcantarillado"
                  />
                    </div>
                      <div class="col-3">
                       <q-input
                    outlined
                    dense
                    v-model="dato2.energia"
                    type="Number"
                    step="0.01"
                    label="% Energia Electrica"
                  />
                    </div>
                    <div class="col-3">
                       <q-input
                    outlined
                    dense
                    v-model="dato2.gasnatural"
                   type="Number"
                    step="0.01"
                    label="% Gas Natural"
                  />
                    </div>
                    </div>
                     <q-input
                    outlined
                    dense
                    v-model="dato2.observacion5b"
                    type="text"
                    label="Observacion"
                    hint="Ingresar alguna Observacion"
                  />
                     <div class="row">
                    <div class="col-4">
                       <q-input
                    outlined
                    dense
                    v-model="dato2.tierra"
                    type="Number"
                    step="0.01"
                    label="% Tierra"
                   />
                    </div>
                    <div class="col-4">
                       <q-input
                    outlined
                    dense
                    v-model="dato2.empedrado"
                    type="Number"
                    step="0.01"
                    label="% Empedrado"
                  />
                    </div>
                      <div class="col-4">
                       <q-input
                    outlined
                    dense
                    v-model="dato2.otro"
                   type="Number"
                    step="0.01"
                    label="% Otro"
                  />
                    </div>
                    </div>
                     <q-input
                    outlined
                    dense
                    v-model="dato2.observacion5c"
                    type="text"
                    label="Observacion"
                    hint="Ingresar alguna Observacion"
                  />
                  <div class="row">
                    <div class="col-4">
                       <q-input
                    outlined
                    dense
                    v-model="dato2.ejecutado"
                   type="Number"
                    step="0.01"
                    label="% Ejecutado"
                  />
                    </div>
                    <div class="col-4">
                       <q-input
                    outlined
                    dense
                    v-model="dato2.porejecutar"
                  type="Number"
                    step="0.01"
                    label="% Ejecutar"
                    />
                    </div>
                      <div class="col-4">
                       <q-input
                    outlined
                    dense
                    v-model="dato2.longitudporejecutar"
                  type="Number"
                    step="0.01"
                    label="% Longitud por Ejecutar"
                  />
                    </div>
                    </div>
                     <q-input
                    outlined
                    dense
                    v-model="dato2.observacion5d"
                    type="text"
                    label="Observacion"
                    hint="Ingresar alguna Observacion"
                  />
                   <q-uploader
                        class="full-width"
                        label="Subir FOTOGRAFIA Nº2 (DERECHA) (Max 4mb) "
                         accept=".jpg,png,jpeg,image/*"
                        :factory="uploadFile2"
                        max-files="1"
                        max-total-size="4096"
                      />


                </div>
                <div class="col-4">
                 <div class="row">
                    <div class="col-4">
                       <q-input
                    outlined
                    dense
                    v-model="dato2.longituddecimal"
                   type="Number"
                    step="0.01"
                    label="Longitud"
                    hint="Longitud"
                  />
                    </div>
                    <div class="col-4">
                       <q-input
                    outlined
                    dense
                    v-model="dato2.ancho"
                   type="Number"
                    step="0.01"
                    label="ANCHO"
                    hint="Ancho Av/Calle"
                  />
                    </div>
                      <div class="col-4">
                       <q-input
                    outlined
                    dense
                    v-model="dato2.area"
                    type="Number"
                    step="0.01"
                    label="AREA"
                    hint="Area Total"
                  />
                    </div>
                    </div>
                     <q-input
                    outlined
                    dense
                    v-model="dato2.observacion6"
                    type="text"
                    label="Observacion"
                    hint="Ingresar alguna Observacion"
                  />


                   <div class="q-pa-md">
                        <span>  CONCLUSIONES: Usted recomienda Rechazar o Aprobar el proyecto ?</span>
                        <q-radio v-model="dato2.aprobado" checked-icon="task_alt" unchecked-icon="panorama_fish_eye" val="SI" label="APROBAR" />
                        <q-radio v-model="dato2.aprobado" checked-icon="task_alt" unchecked-icon="panorama_fish_eye" val="NO" label="RECHAZAR" />
                        <q-radio v-model="dato2.aprobado" checked-icon="task_alt" unchecked-icon="panorama_fish_eye" val="PENDIENTE" label="PENDIENTE" />
                      </div>
                      <div class="q-pa-md"  v-if="dato2.aprobado=='PENDIENTE'">
                        <span>  CONCLUSIONES: Usted Recomienda inpeccionar nuevamente el Proyecto ?</span>
                        <q-radio v-model="dato2.inspeccionado" checked-icon="task_alt" unchecked-icon="panorama_fish_eye" val="SI" label="SI" />
                        <q-radio v-model="dato2.inspeccionado" checked-icon="task_alt" unchecked-icon="panorama_fish_eye" val="NO" label="NO" />
                      </div>
                            <q-input  v-if="dato2.inspeccionado==='SI' && dato2.aprobado==='PENDIENTE'"
                          outlined
                          dense
                          v-model="dato2.dias"
                          type="Number"
                          label="dias"
                          hint="Ingresar en cuantos dias"
                        />

                       <q-uploader
                        class="full-width"
                        label="Subir FOTOGRAFIA (PLANO DE UBICACION)  (Max 4mb)"
                         accept=".jpg,png,jpeg,image/*"
                        :factory="uploadFile3"
                        max-files="1"
                        max-total-size="4096"
                      />
                </div>
             </div>



            <div>
              <q-btn label="GUARDAR" type="submit" color="positive" icon="add_circle" />
              <q-btn label="SALIR" icon="delete" color="negative" v-close-popup />
            </div>
          </q-form>
        </q-card-section>
      </q-card>
    </q-dialog>

  </div>
</template>

<script>
import {jsPDF} from "jspdf";
import { Dialog } from 'quasar';
import moment, { now } from 'moment';
import { useQuasar } from 'quasar'
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

const items=['cordones','alcantarillado', 'medidas', 'colocado', 'acera', 'gradas', 'baranda', 'muros', 'enladrillado', 'empedrado','enlosetado'];

export default {


 data: () => ({
    id: 145,
    data: {},
    dato2:{},
    dato:{},
    datocopia:{},
    columna,
    rows:[],
    progress1:0.2,
    progress2:0.0,
    progress3:0.2,
    progress4:0.0,
    progress5:0.0,
    progress6:0.2,
    progress7:0.0,
    progress8:0.0,
    progressLabel1:'20.0 %',
    progressLabel2:'0.0 %',
    progressLabel3:'20.0 %',
    progressLabel4:'0.0 %',
    progressLabel5:'0.0 %',
    progressLabel6:'20.0 %',
    progressLabel7:'0.0 %',
    progressLabel8:'0.0 %',
   // progressLabel2:(progress2*100).toFixed(2)+'%'
    dialog_form1:false,
    dialog_form2345:false,
    dialog_form2345_corregido:false,
    dialog_form6:false,
    dialog_form7:false,
    dialog_form8:false,
    fecha_inspeccion:moment().format('YYYY-MM-DD'),
     departamentos:[],
      departamento:{},
      municipios:[],
      municipio:{},
      criterios:[],
      criterio:{},
      requisitos:[],
      requisito:{},
      ingenierias:[],
      ingenieria:{},
      evaluaciones:[],
      totalmunicipios:[],
      resultado:{},
      titulo:"",
      op:"",
      confirm:false,

      cordones:false,
      alcantarillado:false,
      medidas:false,
      colocado:false,
      acera:false,
      gradas:false,
      baranda:false,
      muros:false,
      enladrillado:false,
      empedrado:false,
      enlosetado:false,
      otro:false,
      otrosi:'',


  }),
  created() {},
  mounted() {
    this.misdatos();
    this.misDepartamentos();
    this.misMunicipios();
     this.mis_evaluaciones();

     // this.barrido();

  },
  methods: {
    misDepartamentos(){
         this.$q.loading.show();
         this.departamentos=[]
       this.$api.get(process.env.API+"/departamentos").then((res)=>{
          //console.log(res.data)
            res.data.forEach((it)=>{
              this.departamentos.push({label:it.nombre, value:it.id})
            })
          this.$q.loading.hide();
       });
       },
       barrido(){

       },
       misMunicipios(){
         this.$q.loading.show();
         this.municipios=[]
       this.$api.get(process.env.API+"/municipioid/"+this.$store.state.login.user.ci).then((res)=>{
      this.totalmunicipios=res.data
            res.data.forEach((it)=>{
              this.municipios.push({ label:(it.municipio).toUpperCase(),value:it.id})

            })
             this.$q.loading.hide();
       });
       },
        mis_evaluaciones(){
         this.$q.loading.show();

       this.$api.get(process.env.API+"/evaluacions").then((res)=>{
       //  console.log(res.data);
          this.evaluaciones=res.data
          this.$q.loading.hide();
       });
       },
    misdatos() {
      this.$q.loading.show();
      this.rows=[]
      this.$api.get(process.env.API + "/registroid/" + this.$route.params.id)
        .then((res) => {
          this.dato=res.data[0]
         //this.datocopia=this.dato.evaluacions
          console.log(this.dato);
          this.rows.push({titulo:"Nombre del Proyecto : ", descripcion: res.data[0].nombre})
          this.rows.push({titulo:"Departamento : ", descripcion: res.data[0].departamento.nombre})
          this.rows.push({titulo:"Municipio : ", descripcion: res.data[0].municipio})
         //this.rows.push({titulo:"Comunidades  o Distritos: ", descripcion: res.data[0].comunidades})
          this.rows.push({titulo:"Cite VIFFE : ", descripcion: res.data[0].cite})
          this.rows.push({titulo:"H.R. FPS: ", descripcion: res.data[0].interno})
          this.rows.push({titulo:"Codigo : ", descripcion: res.data[0].codigo})
          this.rows.push({titulo:"Proyecto Contempla: ", descripcion: res.data[0].adjunto})
          this.rows.push({titulo:"Categoria Municpal : ", descripcion: res.data[0].autoridad})
          this.rows.push({titulo:"Infraestructura : ", descripcion: res.data[0].monto1})
          this.rows.push({titulo:"Supervision : ", descripcion: res.data[0].monto2})
          this.rows.push({titulo:"Total : ", descripcion: res.data[0].total})
        //  this.rows.push({titulo:"Fecha de Ingreso (registro) : ", descripcion: res.data[0].fecha})
          //this.rows.push({titulo:"Puntaje de Evaluacion : ", descripcion: res.data[0].total})
          this.rows.push({titulo:"Proyecto Cumple/ Es elegible ? : ", descripcion: res.data[0].cumple})
          this.rows.push({titulo:"Se realizo la Inspecion de campo ? : ", descripcion: res.data[0].vinculo})
            if(res.data[0].vinculo==='SI'){
              this.rows.push({titulo:"fecha de inspeccion : ", descripcion: res.data[0].copia})
            }
          this.rows.push({titulo:"Cite Informe : ", descripcion: res.data[0].carta_cite})
          this.rows.push({titulo:"Fecha de Envio de Informe : ", descripcion: res.data[0].carta_fecha})
          this.rows.push({titulo:"Estado del Proyecto : ", descripcion: res.data[0].status})
             if(res.data[0].ficha){
               this.rows.push({titulo:"Cuenta con Planimetria Aprobada? ", descripcion: res.data[0].ficha.planimetria})
               this.rows.push({titulo:"Ubicacion : ", descripcion: res.data[0].ficha.ubicacion})
               this.rows.push({titulo:"Circunscripcion : ", descripcion: res.data[0].ficha.circunscripcion})
               this.rows.push({titulo:"Latitud : ", descripcion: res.data[0].ficha.latitud})
               this.rows.push({titulo:"Longitud : ", descripcion: res.data[0].ficha.longitud})
               this.rows.push({titulo:"Reporte Fotografico (izquierda) : ", descripcion: res.data[0].ficha.foto1})
               this.rows.push({titulo:"Reporte Fotografico (derecha) : ", descripcion: res.data[0].ficha.foto2})
               this.rows.push({titulo:"Mapa de Inspeccion  (fotografia): ", descripcion: res.data[0].ficha.foto3})
             }
             let cr=0
            let ing=0
            let req=0
            let var1=0
         res.data[0].evaluacions.forEach(it=>{
             if(it.nombre==="C-1"){cr++}
             if(it.nombre==="C-2"){cr++}
             if(it.nombre==="C-3"){cr++}
             if(it.nombre==="R-1"){req++}
             if(it.nombre==="R-2"){req++}
             if(it.nombre==="R-3"){req++}
             if(it.nombre==="R-4"){req++}
             if(it.nombre==="R-5"){req++}
             if(it.nombre==="R-6"){req++}
             if(it.nombre==="R-7"){req++}
             if(it.nombre==="I-1"){ing++}
             if(it.nombre==="I-2"){ing++}
             if(it.nombre==="I-3"){ing++}
             if(it.nombre==="I-4"){ing++}
             if(it.nombre==="I-5"){ing++}
             if(it.nombre==="I-6"){ing++}
             if(it.nombre==="I-7"){ing++}
             if(it.nombre==="I-8"){ing++}
             if(it.nombre==="I-9"){ing++}
             if(it.nombre==="I-10"){ing++}
             if(it.nombre==="V-1"){var1++}
         });
         this.progress2=cr/3
         this.progressLabel2=(this.progress2*100).toFixed(2)+"%"
         this.progress3=req/7
         this.progressLabel3=(this.progress3*100).toFixed(2)+"%"
         this.progress4=ing/10
         this.progressLabel4=(this.progress4*100).toFixed(2)+"%"
         this.progress5=var1/1
         this.progressLabel5=(this.progress5*100).toFixed(2)+"%"


         if(this.dato.vinculo!=="NO" && this.dato.vinculo!=null){
           this.progress7=1
            this.progressLabel7=(this.progress7*100).toFixed(2)+"%"
          }else{
               this.progress7=0.0
                this.progressLabel7=(this.progress7*100).toFixed(2)+"%"
          }

        if (this.dato.total!='0.00' && this.dato.monto1!='0.00') {
               this.progress1=1
               this.progressLabel1=(this.progress1*100).toFixed(2)+"%"
         }else{
            this.progress1=0.5
            this.progressLabel1=(this.progress1*100).toFixed(2)+"%"
         }
       if(this.dato.status!=="RECIBIDO" && this.dato.status!=null){
            this.progress6=1
           this.progressLabel6=(this.progress6*100).toFixed(2)+"%"
        }else {
              this.progress6=0.6
              this.progressLabel6=(this.progress6*100).toFixed(2)+"%"
        }
         if(this.dato.ficha!=null){
              if(this.dato.ficha.aprobado!=null && this.dato.ficha.foto1!=null && this.dato.ficha.foto2!=null&& this.dato.ficha.foto3!=null){
                          this.progress8=1
                        this.progressLabel8=(this.progress8*100).toFixed(2)+"%"
                      }else  if(this.dato.ficha.aprobado!=null){
                            this.progress8=0.7
                            this.progressLabel8=(this.progress8*100).toFixed(2)+"%"
                      }else if(this.dato.ficha.distrito!=null){
                        this.progress8=0.6
                            this.progressLabel8=(this.progress8*100).toFixed(2)+"%"
                      }else{
                        this.progress8=0.5
                            this.progressLabel8=(this.progress8*100).toFixed(2)+"%"
                      }
         }else{
            this.progress8=0
            this.progressLabel8=(this.progress8*100).toFixed(2)+"%"
         }

         this.$q.loading.hide();
          });

    },
    misdatos2() {
      this.$q.loading.show();
      this.$api.get(process.env.API + "/registroid/" + this.$route.params.id).then((res) => {
          this.dato=res.data[0]
             this.$q.loading.hide();
         });


    },
    view_form1(){
         this.municipio={}
      this.municipios.forEach(it => {
           if(it.label===this.dato.municipio){
                this.municipio={label:it.label,value:it.value}
           }
        });
      this.departamento={}
      this.departamentos.forEach(it => {
           if(it.label===this.dato.departamento.nombre){
                this.departamento={label:it.label,value:it.value}
           }
        });
         if((this.dato.status==="RECIBIDO" || this.dato.status==null)  && this.$store.state.login.user.status!=="CENTRAL" ){
           this.dialog_form1=true;
         }else{
           this.$q.notify({
              color: "red",
              textColor: "white",
              icon: "cloud_done",
              message: "El informe ha sido enviado NO puede ser modificado  o  pida a secretaria y/o administrador que lo habiliten",
            });
         }
    },
    view_form2(){
              this.titulo="CRITERIOS DE ELEGIBILIDAD"
              this.op="CRITERIO"

                 this.dato.evaluacions.forEach(it => {
                         if(it.nombre==="C-1"){
                           this.evaluaciones[0].descripcion1=it.pivot.descripcion
                           this.evaluaciones[0].valor=it.pivot.presenta
                           this.evaluaciones[0].puntaje=it.pivot.puntaje
                         }
                          if(it.nombre==="C-2"){
                           this.evaluaciones[1].descripcion1=it.pivot.descripcion
                           this.evaluaciones[1].valor=it.pivot.presenta
                           this.evaluaciones[1].puntaje=it.pivot.puntaje
                         }
                          if(it.nombre==="C-3"){
                           this.evaluaciones[2].descripcion1=it.pivot.descripcion
                           this.evaluaciones[2].valor=it.pivot.presenta
                           this.evaluaciones[2].puntaje=it.pivot.puntaje
                         }
                 })
       if((this.dato.status==="RECIBIDO" || this.dato.status==null) && this.$store.state.login.user.status!=="CENTRAL"){
           this.dialog_form2345_corregido=true;
         }else{
           this.$q.notify({
              color: "red",
              textColor: "white",
              icon: "cloud_done",
              message: "El informe ha sido enviado NO puede ser modificadoo o pida a secretaria y/o administrador que lo habiliten",
            });
         }

    },
     view_form3(){
          this.titulo="REQUISITOS DEL PROYECTO"
          this.op="REQUISITO"
           this.dato.evaluacions.forEach(it => {
                         if(it.nombre==="R-1"){
                           this.evaluaciones[3].descripcion1=it.pivot.descripcion
                           this.evaluaciones[3].valor=it.pivot.presenta
                           this.evaluaciones[3].puntaje=it.pivot.puntaje

                         }

                          if(it.nombre==="R-2"){
                           this.evaluaciones[4].descripcion1=it.pivot.descripcion
                           this.evaluaciones[4].valor=it.pivot.presenta
                           this.evaluaciones[4].puntaje=it.pivot.puntaje
                         }
                          if(it.nombre==="R-3"){
                           this.evaluaciones[5].descripcion1=it.pivot.descripcion
                           this.evaluaciones[5].valor=it.pivot.presenta
                           this.evaluaciones[5].puntaje=it.pivot.puntaje
                         }
                          if(it.nombre==="R-4"){
                           this.evaluaciones[6].descripcion1=it.pivot.descripcion
                           this.evaluaciones[6].valor=it.pivot.presenta
                           this.evaluaciones[6].puntaje=it.pivot.puntaje
                         }
                          if(it.nombre==="R-5"){
                           this.evaluaciones[7].descripcion1=it.pivot.descripcion
                           this.evaluaciones[7].valor=it.pivot.presenta
                           this.evaluaciones[7].puntaje=it.pivot.puntaje
                         }
                          if(it.nombre==="R-6"){
                           this.evaluaciones[8].descripcion1=it.pivot.descripcion
                           this.evaluaciones[8].valor=it.pivot.presenta
                           this.evaluaciones[8].puntaje=it.pivot.puntaje
                         }
                          if(it.nombre==="R-7"){
                           this.evaluaciones[9].descripcion1=it.pivot.descripcion
                           this.evaluaciones[9].valor=it.pivot.presenta
                           this.evaluaciones[9].puntaje=it.pivot.puntaje
                         }

                 })
        if((this.dato.status==="RECIBIDO" || this.dato.status==null) && this.$store.state.login.user.status!=="CENTRAL"){
           this.dialog_form2345_corregido=true;
         }else{
           this.$q.notify({
              color: "red",
              textColor: "white",
              icon: "cloud_done",
              message: "El informe ha sido enviado NO puede ser modificadoo o pida a secretaria y/o administrador que lo habiliten",
            });
         }
    },
    view_form4(){
            this.titulo="INGENIERIA DEL PROYECTO"
            this.op="INGENIERIA"
              this.dato.evaluacions.forEach(it => {
                         if(it.nombre==="I-1"){
                           this.evaluaciones[10].descripcion1=it.pivot.descripcion
                           this.evaluaciones[10].valor=it.pivot.presenta
                           this.evaluaciones[10].puntaje=it.pivot.puntaje
                         }

                          if(it.nombre==="I-2"){
                           this.evaluaciones[11].descripcion1=it.pivot.descripcion
                           this.evaluaciones[11].valor=it.pivot.presenta
                           this.evaluaciones[11].puntaje=it.pivot.puntaje
                         }
                          if(it.nombre==="I-3"){
                           this.evaluaciones[12].descripcion1=it.pivot.descripcion
                           this.evaluaciones[12].valor=it.pivot.presenta
                           this.evaluaciones[12].puntaje=it.pivot.puntaje
                         }
                         if(it.nombre==="I-4"){
                           this.evaluaciones[13].descripcion1=it.pivot.descripcion
                           this.evaluaciones[13].valor=it.pivot.presenta
                           this.evaluaciones[12].puntaje=it.pivot.puntaje
                         }

                          if(it.nombre==="I-5"){
                           this.evaluaciones[14].descripcion1=it.pivot.descripcion
                           this.evaluaciones[14].valor=it.pivot.presenta
                           this.evaluaciones[14].puntaje=it.pivot.puntaje
                         }
                          if(it.nombre==="I-6"){
                           this.evaluaciones[15].descripcion1=it.pivot.descripcion
                           this.evaluaciones[15].valor=it.pivot.presenta
                           this.evaluaciones[15].puntaje=it.pivot.puntaje
                         }
                         if(it.nombre==="I-7"){
                           this.evaluaciones[16].descripcion1=it.pivot.descripcion
                           this.evaluaciones[16].valor=it.pivot.presenta
                           this.evaluaciones[16].puntaje=it.pivot.puntaje
                         }

                          if(it.nombre==="I-8"){
                           this.evaluaciones[17].descripcion1=it.pivot.descripcion
                           this.evaluaciones[17].valor=it.pivot.presenta
                           this.evaluaciones[17].puntaje=it.pivot.puntaje
                         }
                          if(it.nombre==="I-9"){
                           this.evaluaciones[18].descripcion1=it.pivot.descripcion
                           this.evaluaciones[18].valor=it.pivot.presenta
                           this.evaluaciones[18].puntaje=it.pivot.puntaje
                         }
                          if(it.nombre==="I-10"){
                           this.evaluaciones[19].descripcion1=it.pivot.descripcion
                           this.evaluaciones[19].valor=it.pivot.presenta
                           this.evaluaciones[19].puntaje=it.pivot.puntaje
                         }
                 })
        if((this.dato.status==="RECIBIDO" || this.dato.status==null) && this.$store.state.login.user.status!=="CENTRAL"){
            this.dialog_form2345_corregido=true;
         }else{
           this.$q.notify({
              color: "red",
              textColor: "white",
              icon: "cloud_done",
              message: "El informe ha sido enviado NO puede ser modificadoo o pida a secretaria y/o administrador que lo habiliten",
            });
         }
    },
    view_form5(){
      this.titulo="VARIACION POSITIVA O NEGATIVA "
       this.op="VARIACION"
        this.dato.evaluacions.forEach(it => {
                         if(it.nombre==="V-1"){
                           this.evaluaciones[20].descripcion1=it.pivot.descripcion
                           this.evaluaciones[20].valor=it.pivot.presenta
                           this.evaluaciones[20].puntaje=it.pivot.puntaje
                         }
        })
if((this.dato.status==="RECIBIDO" || this.dato.status==null) && this.$store.state.login.user.status!=="CENTRAL"){
           this.dialog_form2345=true;
         }else{
           this.$q.notify({
              color: "red",
              textColor: "white",
              icon: "cloud_done",
              message: "El informe ha sido enviado NO puede ser modificadoo o pida a secretaria y/o administrador que lo habiliten",
            });
         }
    },

      onMod1() {
       this.dato.departamento_id=this.departamento.value;
       this.dato.municipio=this.municipio.label;
       this.dato.nombre=((this.dato.nombre).toUpperCase()).trim()
        this.totalmunicipios.forEach(it => {
            if((it.municipio).toUpperCase()===this.dato.municipio){
              this.dato.autoridad =it.municipio_codigo
            }
         })
        if (this.dato.total>0 && this.dato.monto1>0) {
              this.dato.puntaje2=10
              this.progress1=1
              this.progressLabel1=(this.progress1*100).toFixed(2)+"%"
        }else{
           this.progress1=0.5
           this.progressLabel1=(this.progress1*100).toFixed(2)+"%"
        }
      this.$q.loading.show();
      this.$api
        .put(process.env.API + "/registros/" + this.dato.id, this.dato)
        .then((res) => {
          if (res.data.res === true) {
            this.$q.notify({
              color: "green-4",
              textColor: "white",
              icon: "cloud_done",
              message: "Modificado correctamente",
            });
          }
          this.dialog_form1 = false;
          this.misdatos();
          this.$q.loading.hide();
        });
    },
     onMod6() {
        if(this.dato.status==='ENVIADO'){
          this.dato.puntaje4=10
           this.progress6=1
           this.progressLabel6=(this.progress6*100).toFixed(2)+"%"
        }else{
              this.progress6=0.6
              this.progressLabel6=(this.progress6*100).toFixed(2)+"%"

        }
         let ans=""
         if(this.cordones){
                ans+='cordones-'
         }
         if(this.alcantarillado){
                ans+='alcantarillado-'
         }
         if(this.medidas){
                ans+='medidas-'
         }
         if(this.colocado){
                ans+='colocado-'
         }
         if(this.acera){
                ans+='acera-'
         }
         if(this.gradas){
                ans+='gradas-'
         }
         if(this.baranda){
                ans+='baranda-'
         }
         if(this.muros){
                ans+='muros-'
         }
         if(this.enladrillado){
                ans+='enladrillado-'
         }
         if(this.empedrado){
                ans+='empedrado-'
         }
         if(this.enlosetado){
                ans+='enlosetado-'
         }
         if(this.otro){
                ans+='otro-'
               this.dato.comunidades=this.otrosi
         }
       this.dato.firmado_por=ans

      this.$q.loading.show();
      this.$api
        .put(process.env.API + "/registros/" + this.dato.id, this.dato)
        .then((res) => {
          if (res.data.res === true) {
            this.$q.notify({
              color: "green-4",
              textColor: "white",
              icon: "cloud_done",
              message: "Modificado correctamente",
            });
          }
          this.dialog_form6 = false;
          this.misdatos();
          this.$q.loading.hide();
        });
    },
    onMod7() {
      this.$q.loading.show();
         if(this.dato.vinculo=="SI"){
          // console.log("correcto")
              this.dato.puntaje1=50.00
              this.dato.copia=this.fecha_inspeccion
           this.progress7=1
            this.progressLabel7=(this.progress7*100).toFixed(2)+"%"
         }else{
            this.progress7=0
            this.progressLabel7=(this.progress7*100).toFixed(2)+"%"
         }
      this.$api
        .put(process.env.API + "/registros/" + this.dato.id, this.dato)
        .then((res) => {
          if (res.data.res === true) {
            this.$q.notify({
              color: "green-4",
              textColor: "white",
              icon: "cloud_done",
              message: "Modificado correctamente",
            });
          }
          this.dialog_form7 = false;
          this.misdatos();
          this.$q.loading.hide();
        });
    },
    guardar(item){

         if(item.tipo==="CRITERIO"){
                 if(item.valor==null){
                this.$q.notify({
                            color: "red-4",
                            textColor: "white",
                            icon: "cloud_done",
                            message: "debe seleccionar CUMPLE O 'NO CUMPLE'",
                          });
                }else{

               this.resultado.presenta=item.valor;
                    if(item.nombre=='C-1'){
                      this.resultado.descripcion= String(item.descripcion1)
                    }else{
                      this.resultado.descripcion=item.descripcion1
                    }
              this.resultado.id=item.id
              this.resultado.tipo=item.tipo;
              this.resultado.nombre=item.nombre;
              this.resultado.puntaje=2
              item.puntaje="2.00"
              this.$api.put(process.env.API + "/registroevaluacion/"+this.dato.id,this.resultado).then((res) => {
                          this.$q.notify({
                                  color: "green-4",
                                  textColor: "white",
                                  icon: "cloud_done",
                                  message: "Guardado Correctamente",
                                });
                            //   this.misdatos();
                                });
            }



         }else{
      if(item.valor==null){
                this.$q.notify({
                            color: "red-4",
                            textColor: "white",
                            icon: "cloud_done",
                            message: "debe seleccionar una opcion 'PRESENTA ' O 'NO PRESENTA'",
                          });

      }else {
        this.resultado.presenta=item.valor;
        this.resultado.descripcion='';
        this.resultado.id=item.id
        this.resultado.tipo=item.tipo;
        this.resultado.nombre=item.nombre;
        this.resultado.puntaje=2
        item.puntaje="2.00"
        this.$api.put(process.env.API + "/registroevaluacion/"+this.dato.id,this.resultado).then((res) => {
                    this.$q.notify({
                            color: "green-4",
                            textColor: "white",
                            icon: "cloud_done",
                            message: "Guardado Correctamente",
                          });
                       //   this.misdatos();
                          });
      }
         }
    },
      editar(item){
         this.dato.evaluacions.forEach(it => {
                if(it.nombre===item.nombre){
                    this.resultado.nombre=item.nombre;
                    item.puntaje="3.00"
                    this.resultado.evaluacion_id=item.id
                    this.resultado.registro_id=it.pivot.registro_id
                    this.resultado.puntaje="3.00"

                     if(item.nombre=='C-1'){
                      this.resultado.descripcion= String(item.descripcion1)
                    }else{
                       if(item.nombre==='C-2' || item.nombre==='C-3' ){
                         this.resultado.descripcion=item.descripcion1
                       }
                    }
                    //this.resultado.descripcion=item.descripcion1
                    this.resultado.presenta=item.valor
                    this.resultado.tipo=it.tipo;

                      this.$api.put(process.env.API+"/registroevaluacion1/"+it.pivot.id,this.resultado).then((res) => {
                          this.$q.notify({
                          color: "green-4",
                          textColor: "white",
                          icon: "cloud_done",
                          message: "Modificado correctamente",
                        });
                         // this.misdatos();

                        });
                }
         })
      },
      refrescar(){
        this.misdatos();
         let cr=0
            let ing=0
            let req=0
            let var1=0
         this.dato.evaluacions.forEach(it=>{
             if(it.nombre==="C-1"){cr++}
             if(it.nombre==="C-2"){cr++}
             if(it.nombre==="C-3"){cr++}
             if(it.nombre==="R-1"){req++}
             if(it.nombre==="R-2"){req++}
             if(it.nombre==="R-4"){req++}
             if(it.nombre==="R-5"){req++}
             if(it.nombre==="R-5"){req++}
             if(it.nombre==="R-6"){req++}
             if(it.nombre==="R-7"){req++}
             if(it.nombre==="I-1"){ing++}
             if(it.nombre==="I-2"){ing++}
             if(it.nombre==="I-3"){ing++}
             if(it.nombre==="I-4"){ing++}
             if(it.nombre==="I-5"){ing++}
             if(it.nombre==="I-6"){ing++}
             if(it.nombre==="I-7"){ing++}
             if(it.nombre==="I-8"){ing++}
             if(it.nombre==="I-9"){ing++}
             if(it.nombre==="I-10"){ing++}
             if(it.nombre==="V-1"){var1++}
         })
         this.progress2=cr/3
         this.progressLabel2=(this.progress2*100).toFixed(2)+"%"
         this.progress3=req/7
         this.progressLabel3=(this.progress3*100).toFixed(2)+"%"
         this.progress4=ing/10
         this.progressLabel4=(this.progress4*100).toFixed(2)+"%"
         this.progress5=var1/1
         this.progressLabel5=(this.progress5*100).toFixed(2)+"%"

        this.dato.puntaje3=Number(this.dato.puntaje3)+1
        this.$api.put(process.env.API + "/registros/" + this.dato.id, this.dato)
        .then((res) => {});
        this.dialog_form2345_corregido=false;


       },
      imprimir(){

        let text1="En atencíon a nota CITE: "+this.dato.cite+", mediante la cual se solicita realizar la verificacíon y avaluación de requisitos exigidos del proyecto "+this.dato.nombre+" correspondiente al municipio de "+this.cambiarminiscula(this.dato.municipio)+" del departamento de "+this.cambiarminiscula(this.dato.departamento.nombre)+", mediante el Programa Nacional de Emergencia para la Generación de Empleo BOL34/2021; al respecto, tengo a bien informar el resultado de la evaluación y verificación del contenido del proyecto presentado.";
        let text2="Según lo establecido en el Reglamento Operativo del Programa Nacional de Emergencia para la Generación de Empleo BOL-34/2021 se menciona:";
        let text3="•    Punto 1.2. Objetivos del Programa – componente I: Infraestructura y Supervisión de Obras, mediante el cual se financiará la ejecución de Obras de Infraestructura urbana – rural y la Supervisión de las obras de las siguientes tipologías: (i) Vial (enlosetado de vías vehiculares y peatonales) …"
        let text4="•    Punto 2.3 Funciones y Responsabilidades de los Actores – inciso a.  – Ministerio de Planificación del Desarrollo (MPD); punto vi. Prioriza la ejecución de proyectos; comunicando al FPS mediante nota de atención, y envía copia de la misma a FONPLATA para su conocimiento.  y vii. Garantiza la gestión de los recursos para la ejecución de los Proyectos."
        let text5="De la revisión a la documentación concerniente a la solicitud de enlosetado y según el Reglamento Operativo del Programa Nacional de Emergencia para la Generación de Empleo BOL-34/2021. El proyecto "+this.dato.nombre+" del departamento de "+this.cambiarminiscula(this.dato.departamento.nombre)+" es elegible de acuerdo a la tipología de proyectos establecida en el ROP del Programa punto 2.4 (cuadro N°3- Proyectos Elegibles), en este sentido el mismo se desarrolla de acuerdo al siguiente detalle:"
        let c1="Debe beneficiar a la mayor cantidad de familias/juntas vecinales involucradas."
        let c2="Proyecto que atienda a infraestructuras públicas de salud, educación y/o que se complementen con otras intervenciones realizadas con anterioridad."
        let c3="El proyecto no debe encontrarse en áreas y/o zonas de riesgos naturales y geológicos que puedan comprometer a la infraestructura."
        let r1="Solicitud de financiamiento del proyecto por las Juntas Vecinales y/o GAMs y/o GAIOCs u otras organizaciones sociales debidamente constituidas y reconocidas en el ordenamiento vigente (Personería Jurídica para J.V. y/o OTBs)"
        let r2="Monto máximo por proyecto a ser financiado no podrá ser mayor a Bs 3.000.000.- (Tres Millones 00/100 bolivianos.)"
        let r3="Certificación escrita de existencia de servicios (agua potable, alcantarillado sanitario, etc) por las empresas proveedoras o administradoras de estos servicios. A excepción de los Municipios con categoría “A” "
        let r4="Acta de Consenso Social de las Organizaciones Sociales o Juntas Vecinales, para la ejecución del proyecto (De acuerdo a Usos y Costumbres)."
        let r5="Acta de compromiso para la ejecución de cordones de acera por los beneficiarios y/o municipio."
        let r6="Planimetría Aprobada por el GAM correspondiente de los lugares de intervención que permita la ejecución del proyecto donde se muestre ancho de vía y si corresponde ubicación de áreas verdes. A excepción de los municipios de categoría A."
        let r7="Acta de Compromiso para firmar el Convenio CTF /CFP por las Juntas Vecinales y/o GAMs y/o GAIOCs u otras organizaciones sociales."
        let i1="Resumen Ejecutivo (Antecedentes, Justificación, Objetivos, Costo de Inversión, Ubicación Geográfica y tiempo de ejecución)"
        let i2="Diagnóstico del proyecto /Estudio Socioeconómico (Considerando el alcance del proyecto, el mismo deberá contener un diagnóstico de situación actual, área de influencia del proyecto; características físicas, condiciones socioeconómicas de los beneficiarios)"
        let i3="Localización (Croquis de Ubicación)"
        let i4="Presupuesto General"
        let i5="Precios Unitarios (Verificación de precios de los materiales acorde al lugar de intervención)"
        let i6="Cómputos Métricos"
        let i7="Cronograma de Ejecución."
        let i8="Planos Constructivos (planos de planta, detalles constructivos de las obras de arte, perfil longitudinal y transversal )"
        let i9="Especificaciones Técnicas."
        let i10="Informe Fotográfico (Que muestre las actividades a ser implementadas)"
        let c11=""
        let c11presenta=""
        let c22=""
        let c22presenta=""
        let c33=""
        let c33presenta=""
        let r11=""
        let r22=""
        let r33=""
        let r44=""
        let r55=""
        let r66=""
        let r77=""
        let i11=""
        let i22=""
        let i33=""
        let i44=""
        let i55=""
        let i66=""
        let i77=""
        let i88=""
        let i99=""
        let i100=""
        this.dato.evaluacions.forEach(it =>{
                if(it.nombre==="C-1"){
                  c11=it.pivot.descripcion
                     if(it.pivot.presenta==="SI"){
                       c11presenta="Cumple"
                     }else{
                       c11presenta="No Cumple"
                     }
                }
                if(it.nombre==="C-2"){
                  c22=it.pivot.descripcion
                   if(it.pivot.presenta==="SI"){
                       c22presenta="Cumple"
                     }else{
                       c22presenta="No Cumple"
                     }
                }
                if(it.nombre==="C-3"){
                  c33=it.pivot.descripcion
                   if(it.pivot.presenta==="SI"){
                       c33presenta="Cumple"
                     }else{
                       c33presenta="No Cumple"
                     }
                }
                if(it.nombre==="R-1"){
                  r11=it.pivot.descripcion
                }
                if(it.nombre==="R-2"){
                  r22=it.pivot.descripcion
                }
                if(it.nombre==="R-3"){
                  r33=it.pivot.descripcion
                }
                if(it.nombre==="R-4"){
                  r44=it.pivot.descripcion
                }
                if(it.nombre==="R-5"){
                  r55=it.pivot.descripcion
                }
                if(it.nombre==="R-6"){
                  r66=it.pivot.descripcion
                }
                if(it.nombre==="R-7"){
                  r77=it.pivot.descripcion
                }

                if(it.nombre==="I-1"){
                  i11=it.pivot.descripcion
                }
                if(it.nombre==="I-2"){
                  i22=it.pivot.descripcion
                }
                if(it.nombre==="I-3"){
                  i33=it.pivot.descripcion
                }
                if(it.nombre==="I-4"){
                  i44=it.pivot.descripcion
                }
                if(it.nombre==="I-5"){
                  i55=it.pivot.descripcion
                }
                if(it.nombre==="I-6"){
                  i66=it.pivot.descripcion
                }
                if(it.nombre==="I-7"){
                  i77=it.pivot.descripcion
                }
                if(it.nombre==="I-8"){
                  i88=it.pivot.descripcion
                }
                if(it.nombre==="I-9"){
                  i99=it.pivot.descripcion
                }
                if(it.nombre==="I-10"){
                  i100=it.pivot.descripcion
                }
        })
        let con1="De la revisión de la documentación concerniente a la solicitud de enlosetado del proyecto "+this.dato.nombre+" del Departamento de "+this.cambiarminiscula(this.dato.departamento.nombre)+" y según el Reglamento Operativo del Programa Nacional de Emergencia para la Generación de Empleo BOL-34/2021 se concluye:"
        let con2="De la solicitud del proyecto presentado por el GAM "+this.dato.nombre+" del municipio de "+this.cambiarminiscula(this.dato.municipio)+" del departamento de "+this.cambiarminiscula(this.dato.departamento.nombre)+" es elegible de acuerdo a la tipología de proyectos establecida en el ROP del Programa punto 2.4 (cuadro N°3- Proyectos Elegibles)"
        let con3=""
        let rec1=""
        if(this.dato.cumple==="SI"){
          con3="El proyecto "+this.dato.nombre+" del departamento de "+this.cambiarminiscula(this.dato.departamento.nombre)+" CUMPLE con los criterios de elegibilidad y requisitos establecidos en el marco del ROP del programa BOL34/2021 desarrollados en el presente informe."
          rec1="De la verificación y evaluación realizada, se determina que el proyecto "+this.dato.nombre+" correspondiente al municipio de "+this.cambiarminiscula(this.dato.municipio)+" del Departamento de "+this.cambiarminiscula(this.dato.departamento.nombre)+" presentado CUMPLE con los requisitos establecidos para su ejecución en el marco del ROP del programa BOL34/2021."
        }else{
          con3="El proyecto "+this.dato.nombre+" del departamento de "+this.cambiarminiscula(this.dato.departamento.nombre)+" NO CUMPLE con los criterios de elegibilidad y requisitos establecidos en el marco del ROP del programa BOL34/2021 desarrollados en el presente informe."
          rec1="De la verificación y evaluación realizada, se determina que el proyecto "+this.dato.nombre+" correspondiente al municipio de "+this.cambiarminiscula(this.dato.municipio)+" del Departamento de "+this.cambiarminiscula(this.dato.departamento.nombre)+" NO CUMPLE con los requisitos establecidos en el marco del ROP del programa BOL34/2021."
        }
         let gerentedepartamental="Rosmery Julia Santalla Acarapi"
        let jefetecnico="Rosmery Julia Santalla Acarapi"
        let piso1='La Paz - Bolivia Oficina Departamental La Paz Av. Camacho esq. C. Colón Edif. Krsul Piso 8'
        let piso2='Of. 810 Telf. 2125454 - 2125482 Fax. 2110623'
        let piso3='Web: www.fps.gob.bo – '+this.cambiarminiscula(this.$store.state.login.user.status)+' - Bolivia'
        let xpiso1=60
        let xpiso2=80
        let xpiso3=85
        switch(this.$store.state.login.user.ci){
          case "1":
               gerentedepartamental="Ing. Jose Luis Carvajal Mendoza"
               jefetecnico="Ing. Esteban Cayo Correa"
               piso1='Oficina Central: Calle Belisario Salinas, esq. Presbítero Medina Nº354 Z/Sopocachi'
               piso2='Telf. 2-412474 - 411995    Fax. 2-413124    Casilla 10713'
               piso3='Web: www.fps.gob.bo – La Paz - Bolivia'
               xpiso1=65
               xpiso2=80
               xpiso3=88
               break;
          case "2":
               gerentedepartamental="Ing. Rosmery Julia Santalla Acarapi"
               jefetecnico="Ing. Rosmery Julia Santalla Acarapi"
               piso1='La Paz - Bolivia Oficina Departamental La Paz Av. Camacho esq. C. Colón Edif. Krsul Piso 8'
               piso2='Of. 810 Telf. 2125454 - 2125482 Fax. 2110623'
               piso3='Web: www.fps.gob.bo – '+this.cambiarminiscula(this.$store.state.login.user.status)+' - Bolivia'
               xpiso1=60
               xpiso2=86
               xpiso3=85
                break;
          case "3":
               gerentedepartamental="Ing. Miguel Angel Balboa Hinojosa"
               jefetecnico="Ing. Silvia Mariela Ramirez Rios"
               piso1='Oficina Departamental Cochabamba: Av. Eudoro Galindo, Nº2310 esq. C/Flor de Naranjos'
               piso2='Telf. (591-4) 4797421 – 4797422 - 4787423   Fax. (591-4)4797420'
               piso3='Web: www.fps.gob.bo – Cochabamba - Bolivia'
               xpiso1=66
               xpiso2=80
               xpiso3=88

               break;
          case "4":
               gerentedepartamental="Ing. Moises Ciprian Choque"
               jefetecnico="Ing. Roger Juaquin Copa Condori"
               piso1='Oficina Central: Calle Belisario Salinas, esq. Presbítero Medina Nº354 Z/Sopocachi'
               piso2='Telf. 2-412474 - 411995    Fax. 2-413124    Casilla 10713'
               piso3='Web: www.fps.gob.bo – La Paz - Bolivia'
               xpiso1=65
               xpiso2=80
               xpiso3=88
               break;
          case "5":
               gerentedepartamental="Ing. Mario Mamani Humacacho"
               jefetecnico="Ing. Wilder Cruz Alcaraz"
               piso1='Oficina Departamental Potosí: Calle Tomas Manchego S/N entre Enrique Peñaranda y Jaime Escalante'
               piso2='Telf. 6247345 – 6247344   Fax. 6-622455'
               piso3='Web: www.fps.gob.bo – Potosí - Bolivia'
               xpiso1=32
               xpiso2=75
               xpiso3=76
               break;
          case "6":
               gerentedepartamental="Ing. Edzon Alvaro Plata Prado"
               jefetecnico="Ing. Cesilia Vanessa Flores Amador"
               piso1='Oficina Central: Calle Belisario Salinas, esq. Presbítero Medina Nº354 Z/Sopocachi'
               piso2='Telf. 2-412474 - 411995    Fax. 2-413124    Casilla 10713'
               piso3='Web: www.fps.gob.bo – La Paz - Bolivia'
               xpiso1=65
               xpiso2=80
               xpiso3=88
               break;
          case "7":
               gerentedepartamental="Ing. Dargel Camacho Justiniano"
               jefetecnico="Ing. Jose Miguel Sanchez Andia"
               piso1='Of. Dptal. Santa Cruz: Edif. Casanova entre Calle Prolongación Beni y Aroma N.º 20 Zona/Primer Anillo'
               piso2='Telf. 3-3555095      Fax. 3-3555095 int -102'
               piso3='Web: www.fps.gob.bo – Santa Cruz - Bolivia'
               xpiso1=32
               xpiso2=76
               xpiso3=75
                break;
          case "8":
               gerentedepartamental="Ing. Jorge Luis Tellez Gutierrez"
               jefetecnico="Ing. Carlos Oscar Rivero Villavicencio"
               piso1='Oficina Departamental Beni: Av. Comunidad Europea, entre C/ Nataniel Garcia y Raúl Monje Z/El Carmen'
               piso2='Telf. 72846584 - 72846587    Fax. 3-462476'
               piso3='Web: www.fps.gob.bo – Beni - Bolivia'
               xpiso1=32
               xpiso2=80
               xpiso3=85
           break;
          case "9":
               gerentedepartamental="Ing. Oscar Julio Teran Ayala"
               jefetecnico="Ing. Erick David Mollinedo Romero"
               piso1='Oficina Central: Calle Belisario Salinas, esq. Presbítero Medina Nº354 Z/Sopocachi'
               piso2='Telf. 2-412474 - 411995    Fax. 2-413124    Casilla 10713'
               piso3='Web: www.fps.gob.bo – La Paz - Bolivia'
               xpiso1=65
               xpiso2=80
               xpiso3=88
               break;
          default:
               gerentedepartamental="Ing. solo departamentales"
               jefetecnico="Ing. solo departamentales"
               piso1='Oficina Central: Calle Belisario Salinas, esq. Presbítero Medina Nº354 Z/Sopocachi'
               piso2='Telf. 2-412474 - 411995    Fax. 2-413124    Casilla 10713'
               piso3='Web: www.fps.gob.bo – La Paz - Bolivia'
               xpiso1=65
               xpiso2=80
               xpiso3=88
               break;
         }

        let rec2="Por lo expuesto anteriormente se recomienda a Dirección General Ejecutiva del FPS poner a consideración del Ministerio de Planificación del Desarrollo (MPD) el presente informe de acuerdo al resultado de la verificación y evaluación del proyecto presentado del Departamento de "+this.cambiarminiscula(this.dato.departamento.nombre)+"."
        let rec3="Es todo cuanto podemos informar para los fines consiguientes."
        let gerentenacional="Ing. Sergio Janco Vargas"
        let mosca= this.mosca(gerentenacional)+"/"+this.mosca(gerentedepartamental)+"/"+this.mosca(this.$store.state.login.user.name)
         if(this.mosca(gerentedepartamental)===this.mosca(jefetecnico)){
            mosca= this.mosca(gerentenacional)+"/"+this.mosca(gerentedepartamental)+"/"+this.mosca(this.$store.state.login.user.name)
         }else{
           mosca= this.mosca(gerentenacional)+"/"+this.mosca(gerentedepartamental)+"/"+this.mosca(jefetecnico)+"/"+this.mosca(this.$store.state.login.user.name)
         }
        let copia="C.c. Archivo Programa Bol-34/2021"
        let adjunto="Se adjunta : "+this.dato.adjunto
        let vinculo ="VINCULO H.R. Nº "+this.dato.interno
        let informe=this.dato.carta_cite+"."
        let referencia="RESPUESTA A LA SOLICITUD DE EVALUACION Y VERIFICACION DE CONTENIDO PROYECTO "+this.dato.nombre
        let profesional=this.cambiarminiscula(this.$store.state.login.user.name)

          let doc = new jsPDF('portrait' ,null, 'letter');
          let logofps = new Image();
           logofps.src = 'logofps.png';
          let chacanapiso = new Image();
           chacanapiso.src = 'chacanapiso.png';
          let chacana = new Image();
           chacana.src = 'chacana.png';
            doc.addImage(chacana, 'PNG', 25, 10, 20, 20);
            doc.addImage(logofps, 'PNG', 175, 10, 28, 20);
            doc.addImage(chacanapiso, 'PNG', 0, 184, 215, 96);
             doc.setFont('times')
             doc.setFontSize(10, 'normal')
             doc.text('ESTADO PLURINACIONAL DE BOLIVIA', 75, 20)
             doc.setFontSize(10, 'normal')
             doc.text('FONDO NACIONAL DE INVERSION PRODUCTIVA Y SOCIAL', 63, 25)
             doc.line(80,30,135,30)
             doc.setFontSize(12, 'normal')
             doc.text(informe, 78,45)
             doc.text(gerentenacional, 65,55)
             doc.text(gerentedepartamental, 65,68)
             doc.text(jefetecnico, 65,80)
             doc.text(profesional, 65,93)
             //PIE DE PAGINA
             doc.setFontSize(8, 'normal')
            doc.text(piso1,xpiso1, 262)
            doc.text("Página 1 de 4",190, 262)
            doc.text(piso2,xpiso2 ,266)
            doc.setFontSize(9).setFont(undefined, 'bold');
            doc.text(piso3,xpiso3, 270).setFontSize(12).setFont(undefined, 'bold');

             doc.setFontSize(12,"bold")
             doc.text('INFORME', 100,40)
             doc.text("GERENTE DE PROGRAMAS Y PROYECTOS", 65,60)
             doc.text("GERENTE DEPARTAMENTAL DE FPS LA PAZ", 65,73)
             doc.text("JEFE DE UNIDAD TECNICA LA PAZ", 65,85)
             doc.text("PROFESIONAL TECNICO FPS", 65,98)
             doc.text("A:", 35,55)
             doc.text("Vía:", 35,68)
             doc.text("DE:", 35,93)
             doc.text("REF:", 35,105)

             doc.text(referencia, 65,105,{maxWidth: 125,align: "justify"})
             doc.text("FECHA:", 35,133)
            let fecha_informe=this.dato.carta_fecha==null ?  moment().format('YYYY-MM-DD') : this.dato.carta_fecha
            let departamento=this.$store.state.login.user.status
             const fechaDeCarta= this.fechalarga(fecha_informe,departamento)
             doc.text(fechaDeCarta, 65,133)
             doc.line(30,135,190,135)

             doc.text("1. ANTECEDENTES", 35,142).setFontSize(12).setFont(undefined, 'normal');
             doc.text(text1, 30,148,{maxWidth: 160,align: "justify"}).setFontSize(12).setFont(undefined, 'bold');

             doc.text("2. DESARROLLO", 35,187).setFontSize(12).setFont(undefined, 'normal');
             doc.text(text2, 30,193,{maxWidth: 160,align: "justify"}).setFontSize(12).setFont(undefined, 'italic');
             doc.text(text3, 40,205,{maxWidth: 150,align: "justify"})
             doc.text(text4, 40,225,{maxWidth: 150,align: "justify"}).setFontSize(12).setFont(undefined, 'normal');
   //hoja 2
            doc.addPage();
            doc.addImage(chacana, 'PNG', 25, 10, 20, 20);
            doc.addImage(logofps, 'PNG', 175, 10, 28, 20);
            doc.addImage(chacanapiso, 'PNG', 0, 184, 215, 96);
            doc.setFont('times')
            doc.setFontSize(10, 'normal')
            doc.text('ESTADO PLURINACIONAL DE BOLIVIA', 75, 20)
            doc.setFontSize(10, 'normal')
            doc.text('FONDO NACIONAL DE INVERSION PRODUCTIVA Y SOCIAL', 63, 25)
            doc.line(80,30,135,30)
            doc.setFontSize(8, 'normal')
            doc.text(piso1,xpiso1, 262)
            doc.text("Página 2 de 4",190, 262)
            doc.text(piso2,xpiso2, 266)
            doc.setFontSize(9).setFont(undefined, 'bold')
            doc.text(piso3,xpiso3, 270).setFontSize(9).setFont(undefined, 'normal')
            doc.setFontSize(12, 'bold')
              doc.text(text5, 30,40,{maxWidth: 160,align: "justify"})
                   //CUDARO  1 HOJA 2
             // doc.rect(30,75, 160,70)///70 corregir segun aldo de los datos
              doc.rect(30,75, 160,9, 'DF')

              doc.rect(30,75, 80,30) // corregir 25
              doc.rect(30,75, 80,55)  //corregir 40
              doc.rect(30,75, 80,80)  //corregir 70

              doc.rect(110,75, 20,30)
              doc.rect(110,75, 20,55)
              doc.rect(110,75, 20,80)

              doc.rect(130,75, 60,30)
              doc.rect(130,75, 60,55)
              doc.rect(130,75, 60,80)
             doc.setFontSize(10, 'bold').setFontSize(10).setFont(undefined, 'bold').setTextColor('#FFFFFF');
             doc.text('         CRITERIOS DE ELIGIBILIDAD                       Cumple/                    OBSERVACIONES', 35, 79)
             doc.text('No Cumple', 112, 83).setFontSize(10).setFont(undefined, 'normal').setTextColor('#000000');;
             doc.text(c1, 32,90,{maxWidth: 75,align: "justify"})
             doc.text(c2, 32,110,{maxWidth: 75,align: "justify"})
             doc.text(c3, 32,135,{maxWidth: 75,align: "justify"}).setFontSize(10).setFont(undefined, 'bold');

             doc.text(c11presenta, 112,92,{maxWidth: 15,align: "justify"})
             doc.text(c22presenta, 112,112,{maxWidth: 15,align: "justify"})
             doc.text(c33presenta, 112,137,{maxWidth: 15,align: "justify"}).setFontSize(10).setFont(undefined, 'normal');

             doc.text(c11, 131,87,{maxWidth: 58,align: "justify"})
             doc.text(c22, 131,108,{maxWidth: 58,align: "justify"})
             doc.text(c33, 131,133,{maxWidth: 58,align: "justify"})

             //CUADRO 2 HOJA 2
              doc.rect(30,157, 160,5,'DF')
              doc.rect(30,157, 80,30) // corregir 25
              doc.rect(30,157, 80,70)  //corregir 40
              doc.rect(30,157, 80,95)  //corregir 70
              doc.rect(110,157, 80,30)
              doc.rect(110,157, 80,70)
              doc.rect(110,157, 80,95)
            doc.setFontSize(10, 'bold').setFontSize(10).setFont(undefined, 'bold').setTextColor('#FFFFFF');;
            doc.text('         REQUISITOS DEL PROYECTO                                                OBSERVACION', 35, 161).setFontSize(10).setFont(undefined, 'normal').setTextColor('#000000');
            doc.text(r1, 32,167,{maxWidth: 75,align: "justify"})
            doc.text(r2, 32,195,{maxWidth: 75,align: "justify"}).setFontSize(10).setFont(undefined, 'italic');
            doc.text("(De acuerdo a la convocatoria MPD)", 32,208,{maxWidth: 75,align: "justify"})
            doc.text("(según ROP numeral 2.5. punto vii).", 32,248,{maxWidth: 75,align: "justify"}).setFontSize(10).setFont(undefined, 'normal');
            doc.text(r3, 32,231,{maxWidth: 77,align: "justify"})

            doc.text(r11, 112,167,{maxWidth: 77,align: "justify"})
            let infraestructura="Infraestructura Bs. "+this.dato.monto1
            let supervision ="Supervision Bs. "+this.dato.monto2
            let total = "Total, Proyecto Bs. "+this.dato.total

            doc.text("Presupuesto y Estructura de Financiamiento", 112,190,{maxWidth: 75,align: "left"})
            doc.text(infraestructura, 125,195,{maxWidth: 75,align: "justify"})
            doc.text(supervision, 125,200,{maxWidth: 75,align: "justify"})
            doc.text(total, 125,205,{maxWidth: 75,align: "justify"})
            doc.text(r22+".", 111,210,{maxWidth: 77,align: "justify"})

            doc.text(r33, 112,231,{maxWidth: 77,align: "justify"})
   //hoja 3
            doc.addPage();
            doc.addImage(chacana, 'PNG', 25, 10, 20, 20);
            doc.addImage(logofps, 'PNG', 175, 10, 28, 20);
            doc.addImage(chacanapiso, 'PNG', 0, 184, 215, 96);
            doc.setFont('times')
            doc.setFontSize(10, 'normal')
            doc.text('ESTADO PLURINACIONAL DE BOLIVIA', 75, 20)
            doc.setFontSize(10, 'normal')
            doc.text('FONDO NACIONAL DE INVERSION PRODUCTIVA Y SOCIAL', 63, 25)
            doc.line(80,30,135,30)
            doc.setFontSize(8, 'normal')
            doc.text(piso1,xpiso1, 262)
            doc.text("Página 3 de 4",190, 262)
            doc.text(piso2,xpiso2, 266)
            doc.setFontSize(9).setFont(undefined, 'bold');
            doc.text(piso3,xpiso3, 270).setFontSize(9).setFont(undefined, 'normal')
             //CUADRO 1 HOJA 3
              doc.rect(30,35, 80,12) // corregir 25
              doc.rect(30,35, 80,33)  //corregir 40
              doc.rect(30,35, 80,57)  //corregir 70
              doc.rect(30,35, 80,70)  //corregir 70

              doc.rect(110,35, 80,12)
              doc.rect(110,35, 80,33)
              doc.rect(110,35, 80,57)
              doc.rect(110,35, 80,70)
              doc.setFontSize(10, 'bold')
              doc.text(r4, 32,38,{maxWidth: 75,align: "justify"})
              doc.text(r5, 32,50,{maxWidth: 75,align: "justify"})
              doc.text(r6, 32,71,{maxWidth: 75,align: "justify"}).setFontSize(10).setFont(undefined, 'italic');
              doc.text("Los cordones de acera deberán estar concluidos previamente al inicio del proceso de contratación del proyecto. (según ROP numeral 2.5. punto v).", 32,58,{maxWidth: 75,align: "justify"})
              doc.text("(según ROP numeral 2.5. punto iv).", 32,91,{maxWidth: 90,align: "justify"}).setFontSize(10).setFont(undefined, 'normal');
              doc.text(r7, 32,95,{maxWidth: 75,align: "justify"})

              doc.text(r44, 112,38,{maxWidth: 77,align: "justify"})
              doc.text(r55, 112,50,{maxWidth: 77,align: "justify"})
              doc.text(r66, 112,71,{maxWidth: 77,align: "justify"})
              doc.text(r77, 112,95,{maxWidth: 77,align: "justify"})

                    //CUADRO 2 HOJA 3
              doc.rect(30,108, 160,5,'DF')  //corregir 40

              doc.rect(30,108, 80,17) // corregir
              doc.rect(30,108, 80,38)  //corregir 70
              doc.rect(30,108, 80,45)
              doc.rect(30,108, 80,80)
              doc.rect(30,108, 80,95)
              doc.rect(30,108, 80,110)
              doc.rect(30,108, 80,115)
              doc.rect(30,108, 80,130)
              doc.rect(30,108, 80,135)
              doc.rect(30,108, 80,145)

              doc.rect(110,108, 80,17)
              doc.rect(110,108, 80,38)
              doc.rect(110,108, 80,45)
              doc.rect(110,108, 80,80)
              doc.rect(110,108, 80,95)
              doc.rect(110,108, 80,110)
              doc.rect(110,108, 80,115)
              doc.rect(110,108, 80,130)
              doc.rect(110,108, 80,135)
              doc.rect(110,108, 80,145)
            doc.setFontSize(10, 'bold').setFontSize(10).setFont(undefined, 'bold').setTextColor('#FFFFFF');
              doc.text('         INGENIERIA DEL PROYECTO(*)                                           OBSERVACION', 40, 112).setFontSize(10).setFont(undefined, 'normal').setTextColor('#000000');;;
             doc.text(i1, 32,116,{maxWidth: 77,align: "justify"})
             doc.text(i2, 32,128,{maxWidth: 77,align: "justify"})
             doc.text(i3, 32,150,{maxWidth: 77,align: "justify"})
             doc.text(i4, 32,157,{maxWidth: 77,align: "justify"})
             doc.text(i5, 32,192,{maxWidth: 77,align: "justify"})
             doc.text(i6, 32,208,{maxWidth: 77,align: "justify"})
             doc.text(i7, 32,221,{maxWidth: 77,align: "justify"})
             doc.text(i8, 32,228,{maxWidth: 77,align: "justify"})
             doc.text(i9, 32,242,{maxWidth: 77,align: "justify"})
             doc.text(i10,32,247,{maxWidth: 77,align: "justify"})

             doc.text(i11, 112,116,{maxWidth: 77,align: "justify"})
             doc.text(i22, 112,128,{maxWidth: 77,align: "justify"})
             doc.text(i33, 112,149,{maxWidth: 77,align: "justify"})
             doc.text(i44, 112,157,{maxWidth: 77,align: "justify"})
             doc.text(i55, 112,192,{maxWidth: 77,align: "justify"})
             doc.text(i66, 112,207,{maxWidth: 77,align: "justify"})
             doc.text(i77, 112,221,{maxWidth: 77,align: "justify"})
             doc.text(i88, 112,226,{maxWidth: 77,align: "justify"})
             doc.text(i99, 112,242,{maxWidth: 77,align: "justify"})
             doc.text(i100,112,247,{maxWidth: 77,align: "justify"})
                    //hoja 4
            doc.addPage();
            doc.addImage(chacana, 'PNG', 25, 10, 20, 20);
            doc.addImage(logofps, 'PNG', 175, 10, 28, 20);
            doc.addImage(chacanapiso, 'PNG', 0, 184, 215, 96);
            doc.setFont('times')
            doc.setFontSize(10, 'normal')
            doc.text('ESTADO PLURINACIONAL DE BOLIVIA', 75, 20)
            doc.setFontSize(10, 'normal')
            doc.text('FONDO NACIONAL DE INVERSION PRODUCTIVA Y SOCIAL', 63, 25)
            doc.line(80,30,135,30)
            doc.setFontSize(8, 'normal')
            doc.text(piso1,xpiso1, 262)
            doc.text("Página 4 de 4",190, 262)
            doc.text(piso2,xpiso2, 266)
            doc.setFontSize(9).setFont(undefined, 'bold')
            doc.text(piso3,xpiso3, 270)
            doc.setFontSize(12, 'bold').setFontSize(12).setFont(undefined, 'bold');

             doc.text("3. CONCLUSIONES", 35,38).setFontSize(12).setFont(undefined, 'normal');
             doc.text(con1, 30,45,{maxWidth: 160,align: "justify"})
             doc.text(con2, 40,70,{maxWidth: 150,align: "justify"})
             doc.text("1. ", 35,70,{maxWidth: 150,align: "justify"})
             doc.text("2. ", 35,97,{maxWidth: 150,align: "justify"})

          //  let con3result=con3.split('**')
            let xx=40.0
            let yy=97.0
          //   let fontSize=12
          //  console.log(con3result)
            doc.text(con3, xx,yy,{maxWidth: 150,align: "justify"}).setFontSize(12).setFont(undefined, 'bold');
           //  console.log(doc.getStringUnitWidth(con3result[0],{maxWidth: 150,align: "justify"}));
            // xx=xx+doc.getStringUnitWidth(con3result[0])*12/20
           //  yy=yy+10;
            // doc.text(con3result[1], xx,yy,{maxWidth: 150,align: "justify"}).setFontSize(12).setFont(undefined, 'bold');
            // xx+=doc.getStringUnitWidth(con3result[1])*12/20;
            // yy=yy+10;
           // doc.text(con3result[2], xx,yy,{maxWidth: 150,align: "justify"})

            //console.log(doc.getStringUnitWidth(con3))
             doc.text("4. RECOMENDACIONES", 35,123).setFontSize(12).setFont(undefined, 'normal');
             doc.text(rec1, 30,130,{maxWidth: 160,align: "justify"})
            //CASO EXCEPCIONAL
             doc.text(rec2, 30,159,{maxWidth: 160,align: "justify"})
            // doc.text(rec2, 30,155,{maxWidth: 160,align: "justify"})
             doc.text(rec3, 30,180,{maxWidth: 160,align: "justify"}).setFontSize(8).setFont(undefined, 'normal');
               doc.text(mosca, 30,220)
               doc.text(copia, 30,224)
               doc.text(adjunto, 30,228)
               doc.text(vinculo, 30,232)
             doc.text('fqm', 210, 278) //milimetros
            // doc.text('*', 214, 280) //milimetros
             let descargarnombre=""
               if(this.dato.cumple==="SI"){
                      descargarnombre=this.dato.codigo+"_CUMPLE"+".pdf"
               }else{
                     descargarnombre=this.dato.codigo+"_NO_CUMPLE"+".pdf"
               }
           // doc.save(descargarnombre);
           window.open(doc.output('bloburl',{filename:descargarnombre}), '_blank');
      },
      isBoldOpen (arrayLength, valueBefore = false) {
    const isEven = arrayLength % 2 === 0;
    const result = valueBefore !== isEven;
    return result;
},
      mosca(cadena){
          let text=cadena.split(" ")
          let ans=""
          for(let i=1;i<text.length;i++){
               ans+=text[i][0]
          }
          return ans
      },
      fechalarga(fecha, depa1){
         let fecha1=fecha.split("-")
         let depa=depa1.split(" ")
         let ans=""
          for(let i=0;i<depa.length;i++){
               ans+=depa[i][0]
               ans+=(depa[i].slice(1,depa[i].length)).toLowerCase()
               ans+=" "
          }
         let meses={
            1:"enero",
            2:"febrero",
            3:"marzo",
            4:"abril",
            5:"mayo",
            6:"junio",
            7:"julio",
            8:"agosto",
            9:"septiembre",
            10:"octubre",
            11:"noviembre",
            12:"diciembre",
         }
         let answer=ans.trim()+", "+Number(fecha1[2])+" de "+meses[Number(fecha1[1])]+" de "+fecha1[0]
    return answer
      },
      cambiarminiscula(depa1){
         let depa=depa1.split(" ")
         let ans=""
          for(let i=0;i<depa.length;i++){
               ans+=depa[i][0]
               ans+=(depa[i].slice(1,depa[i].length)).toLowerCase()
               ans+=" "
          }
         let answer=ans.trim()
        return answer
      },
        view_form6(){


            this.titulo="RESULTADOS DE EVALUACION"
          if(this.dato.carta_cite==null){
            this.dato.carta_cite="INF/FPS/GDXX Nº 0XXX/2022"
          }
          if(this.dato.cumple==null){
              this.dato.cumple="NO"
          }
          if(this.dato.carta_fecha==null){
            this.dato.carta_fecha =moment().format('YYYY-MM-DD');
          }
          if(this.dato.adjunto==null){
            this.dato.adjunto=" 1 Carpeta (fojas XXX y 1 CD)"
          }
           // ITEMS =FIRMADO_POR
           if(this.dato.firmado_por==null){

                    this.cordones=false
                    this.alcantarillado=false
                    this.medidas=false
                    this.colocado=false
                    this.acera=false
                    this.gradas=false
                    this.baranda=false
                    this.muros=false
                    this.enladrillado=false
                    this.empedrado=false
                    this.enlosetado=false
                    this.otro=false
           }else{
                 if(this.dato.firmado_por){
                   const items1=this.dato.firmado_por.split('-')
                 }

                 for(let i=0;i<items1.length;i++){

                    if(items1[i]==='cordones'){
                            this.cordones=true
                    }
                    if(items1[i]==='alcantarillado'){
                            this.alcantarillado=true
                    }
                    if(items1[i]==='medidas'){
                            this.medidas=true
                    }

                    if(items1[i]==='colocado'){
                            this.colocado=true
                    }

                    if(items1[i]==='acera'){
                            this.acera =true
                    }

                    if(items1[i]==='gradas'){
                            this.gradas=true
                    }

                    if(items1[i]==='baranda'){
                            this.baranda=true
                    }

                    if(items1[i]==='muros'){
                            this.muros=true
                    }

                    if(items1[i]==='enladrillado'){
                            this.enladrillado=true
                    }

                    if(items1[i]==='empedrado'){
                            this.empedrado=true
                    }
                    if(items1[i]==='enlosetado'){
                            this.enlosetado=true
                    }
                    if(items1[i]==='otro'){
                        this.otro=true
                        this.otrosi=this.dato.comunidades
                    }

                 }

           }

         if((this.dato.status==="RECIBIDO" || this.dato.status==null) && this.$store.state.login.user.status!=="CENTRAL"){
           this.dialog_form6=true;
         }else{
           this.$q.notify({
              color: "red",
              textColor: "white",
              icon: "cloud_done",
              message: "El informe ha sido enviado NO puede ser modificadoo o pida a secretaria y/o administrador que lo habiliten",
            });
         }
    },
    view_form7(){
      this.titulo="EVALUACION EN CAMPO"
        if(this.dato.vinculo==null){
          this.dato.vinculo="NO"
        }
        if(this.dato.copia==null){
          this.fecha_inspeccion=moment().format('YYYY-MM-DD');
        }

          if( this.$store.state.login.user.status!=="CENTRAL"){
           this.dialog_form7=true;
         }else{
           this.$q.notify({
              color: "red",
              textColor: "white",
              icon: "cloud_done",
              message: "No puede acceder a este sitio",
            });
         }
    },
    view_form8(){
      this.titulo="FICHA TECNICA DE INSPECCION DE CAMPO"

        if(this.dato.ficha==null){ // esta vacio
         this.dato2={}
             this.dato2.registro_id = this.dato.id
             this.$q.loading.show();
              this.$api.post(process.env.API+"/ficha/", this.dato2).then((res) => {
                  this.misdatos2();
                     this.$q.loading.hide();

                }).catch((e)=>{
                  this.$q.loading.hide();
                });
           //      console.log("creado correctamente");
        if( this.$store.state.login.user.status!=="CENTRAL"){
           this.dialog_form8=true;
         }else{
           this.$q.notify({
              color: "red",
              textColor: "white",
              icon: "cloud_done",
              message: "No puede acceder a este sitio",
            });
         }

        }else{   // es con contenido

         if( this.$store.state.login.user.status!=="CENTRAL"){
            this.dato2=this.dato.ficha
           this.dialog_form8=true;
         }else{
           this.$q.notify({
              color: "red",
              textColor: "white",
              icon: "cloud_done",
              message: "No puede acceder a este sitio",
            });
         }

            //  this.dialog_form8=true;
        }
    },
    onMod8() {
         if(this.dato.ficha.foto1!=null && this.dato.ficha.foto2!=null&& this.dato.ficha.foto3!=null){
           this.progress8=1
            this.progressLabel8=(this.progress8*100).toFixed(2)+"%"
         }else {
            this.progress8=0.7
            this.progressLabel8=(this.progress8*100).toFixed(2)+"%"
         }

           this.$q.loading.show();
               this.$api.put(process.env.API+"/ficha/"+this.dato.ficha.id, this.dato2).then((res) => {
                if(res.data.res===true){
                    this.$q.notify({
                    color: "green-4",
                    textColor: "white",
                    icon: "cloud_done",
                    message: "Modificado Correctamente",
                  });
                  }else{
                    this.$q.loading.hide();
                  }
                  this.alert= false;
                  this.misdatos();

                }).catch((e)=>{
                  this.$q.loading.hide();
                });
               this.dialog_form8=false;
    },
    uploadFile1(files){
          if(this.dato.ficha.foto1==null){
            this.$q.loading.show()
            const fileData= new FormData()
            fileData.append('photo',files[0])
            fileData.append('ficha_id',this.dato.ficha.id)
            fileData.append('nombre',"foto1")
             let codigo=this.dato.codigo.split('-')
             fileData.append('codigo',codigo[1])
            fileData.append('departamento',this.$store.state.login.user.ci)
            this.$api.post(process.env.API+'/uploadPhoto',fileData).then(res=>{

               //console.log(res.data)
               this.$q.loading.hide()
               this.$q.notify({
                    color: "green-4",
                    textColor: "white",
                    icon: "cloud_done",
                    message: "Insertado Correctamente",
                  });

             this.misdatos()
            })
          }else{
                 this.$q.dialog({
                  title: 'Existe una fotografia cargada!!!',
                  message: 'Desea Reemplazar la foto anterior?',
                  cancel: true,
                  persistent: true
                  // console.log('>>>> OK')
                }).onOk(() => {
                    this.$q.loading.show()
                    const fileData= new FormData()
                    fileData.append('photo',files[0])
                    fileData.append('ficha_id',this.dato.ficha.id)
                    fileData.append('nombre',"foto1")
                    let codigo=this.dato.codigo.split('-')
                    fileData.append('codigo',codigo[1])

                    fileData.append('departamento',this.$store.state.login.user.ci)
                    this.$api.post(process.env.API+'/uploadPhoto',fileData).then(res=>{
                //    console.log(res.data)
                    this.$q.loading.hide()
                      this.$q.notify({
                    color: "green-4",
                    textColor: "white",
                    icon: "cloud_done",
                    message: "Reemplazado Correctamente",
                  });
                  this.misdatos()
                  })
                }).onCancel(() => {

                })
          }
    },
    uploadFile2(files){
          if(this.dato.ficha.foto2==null){
            this.$q.loading.show()
            const fileData= new FormData()
            fileData.append('photo',files[0])
            fileData.append('ficha_id',this.dato.ficha.id)
            fileData.append('nombre',"foto2")
            let codigo=this.dato.codigo.split('-')
            fileData.append('codigo',codigo[1])
            fileData.append('departamento',this.$store.state.login.user.ci)
            this.$api.post(process.env.API+'/uploadPhoto',fileData).then(res=>{
              // console.log(res.data)
               this.$q.loading.hide()
               this.$q.notify({
                    color: "green-4",
                    textColor: "white",
                    icon: "cloud_done",
                    message: "Insertado Correctamente",
                  });

             this.misdatos()
            })
          }else{
                 this.$q.dialog({
                  title: 'Existe una fotografia cargada!!!',
                  message: 'Desea Reemplazar la foto anterior?',
                  cancel: true,
                  persistent: true
                  // console.log('>>>> OK')
                }).onOk(() => {
                    this.$q.loading.show()
                    const fileData= new FormData()
                    fileData.append('photo',files[0])
                    fileData.append('ficha_id',this.dato.ficha.id)
                    fileData.append('nombre',"foto2")
                    let codigo=this.dato.codigo.split('-')
                    fileData.append('codigo',codigo[1])
                    fileData.append('departamento',this.$store.state.login.user.ci)
                    this.$api.post(process.env.API+'/uploadPhoto',fileData).then(res=>{
              //      console.log(res.data)
                    this.$q.loading.hide()
                      this.$q.notify({
                    color: "green-4",
                    textColor: "white",
                    icon: "cloud_done",
                    message: "Reemplazado Correctamente",
                  });
                  this.misdatos()
                  })
                }).onCancel(() => {

                })
          }
    },
    uploadFile3(files){
          if(this.dato.ficha.foto3==null){
            this.$q.loading.show()
            const fileData= new FormData()
            fileData.append('photo',files[0])
            fileData.append('ficha_id',this.dato.ficha.id)
            fileData.append('nombre',"foto3")
            let codigo=this.dato.codigo.split('-')
                    fileData.append('codigo',codigo[1])
            fileData.append('departamento',this.$store.state.login.user.ci)
            this.$api.post(process.env.API+'/uploadPhoto',fileData).then(res=>{
             //  console.log(res.data)
               this.$q.loading.hide()
               this.$q.notify({
                    color: "green-4",
                    textColor: "white",
                    icon: "cloud_done",
                    message: "Insertado Correctamente",
                  });

             this.misdatos()
            })
          }else{
                 this.$q.dialog({
                  title: 'Existe una fotografia cargada!!!',
                  message: 'Desea Reemplazar la foto anterior?',
                  cancel: true,
                  persistent: true
                  // console.log('>>>> OK')
                }).onOk(() => {
                    this.$q.loading.show()
                    const fileData= new FormData()
                    fileData.append('photo',files[0])
                    fileData.append('ficha_id',this.dato.ficha.id)
                    fileData.append('nombre',"foto3")
                    let codigo=this.dato.codigo.split('-')
                    fileData.append('codigo',codigo[1])
                    fileData.append('departamento',this.$store.state.login.user.ci)
                    this.$api.post(process.env.API+'/uploadPhoto',fileData).then(res=>{
                   // console.log(res.data)
                    this.$q.loading.hide()
                      this.$q.notify({
                    color: "green-4",
                    textColor: "white",
                    icon: "cloud_done",
                    message: "Reemplazado Correctamente",
                  });
                  this.misdatos()
                  })
                }).onCancel(() => {

                })
          }
    },
    imprimirFicha(){
       if(this.dato.ficha==null){
                  this.$q.notify({
                    color: "red",
                    textColor: "white",
                    icon: "cloud_done",
                    message: "Cargue datos requeridos en la ficha tecnica ",
                  });
             return
       }


        let doc = new jsPDF('portrait' ,null, 'letter');
          let logofps = new Image();
           logofps.src = 'logofps.png';
          let escudo = new Image();
           escudo.src = 'escudo.png';
          let mpd = new Image();
           mpd.src = 'mpd.png';
             doc.addImage(mpd, 'PNG', 25, 22, 20, 20);
             doc.addImage(logofps, 'PNG', 170, 21, 25, 20);
             doc.addImage(escudo, 'PNG', 95, 21, 20, 15);
             doc.setFont('times')
             doc.rect(20,20, 180,235)
             doc.rect(20,45, 50,45)
             doc.rect(155,60, 45,5)
             doc.rect(20,20, 180,25)
             doc.rect(20,20, 180,30)
             doc.rect(20,20, 180,35)
             doc.rect(20,20, 180,40)
             doc.rect(20,20, 180,45)
             doc.rect(20,20, 180,50)
             doc.rect(20,20, 180,55)
             doc.rect(20,20, 180,60)
             doc.rect(20,20, 180,65)
             doc.rect(20,20, 180,70)
             doc.rect(20,20, 180,75)
             doc.rect(20,20, 180,85)
             doc.rect(20,20, 180,90)
             doc.rect(20,20, 180,95)
             doc.rect(20,20, 180,105)
             doc.rect(20,20, 180,110)
             doc.rect(20,20, 180,120)
             doc.rect(20,20, 180,125)
             doc.rect(20,20, 180,135)
             doc.rect(20,20, 180,145)
             doc.rect(20,20, 180,150)
             doc.rect(20,20, 180,150)
             doc.rect(20,20, 180,160)
             doc.rect(20,20, 180,161)
             doc.rect(75,95, 125,10)
             doc.rect(75,95, 125,5)
              doc.rect(75,95, 20,10)
             doc.rect(75,95, 40,10)
             doc.rect(75,115, 125,10)
             doc.rect(75,115, 125,5)
              doc.rect(75,115, 20,10)
             doc.rect(75,115, 40,10)
             doc.rect(75,130, 125,10)
             doc.rect(75,130, 125,5)
             doc.rect(75,130, 20,10)
             doc.rect(75,130, 40,10)
             doc.rect(75,130, 60,10)
             doc.rect(75,130, 80,10)
             doc.rect(75,145, 125,10)
             doc.rect(75,145, 125,5)
             doc.rect(75,145, 20,10)
             doc.rect(75,145, 40,10)
             doc.rect(75,145, 60,10)
             doc.rect(75,155, 125,10)
             doc.rect(75,155, 125,5)
             doc.rect(75,155, 20,10)
             doc.rect(75,155, 40,10)
             doc.rect(75,155, 60,10)
             doc.rect(75,170, 125,10)
             doc.rect(75,170, 125,5)
             doc.rect(75,170, 20,10)
             doc.rect(75,170, 40,10)
             doc.rect(75,170, 60,10)
            //  doc.rect(25,190, 170,60)
             doc.setFontSize(8,"bold").setFont(undefined, 'bold');
             doc.text("1. PROGRAMA", 21,49,{maxWidth: 75,align: "justify"})
             doc.text("2. NOMBRE DEL PROYECTO", 21,54,{maxWidth: 75,align: "justify"})
             doc.text("3. UBICACIÓN", 21,59,{maxWidth: 75,align: "justify"}).setFont(undefined, 'normal');
             doc.text("MUNICIPIO:", 21,64,{maxWidth: 75,align: "justify"})
             doc.text("ZONA:", 21,69,{maxWidth: 75,align: "justify"})
             doc.text("CIRCUNSCRIPCION:", 21,74,{maxWidth: 75,align: "justify"})
             doc.text("DISTRITO:", 21,79,{maxWidth: 75,align: "justify"})
             doc.text("DIRECCION/UBICACION GENERAL:", 21,84,{maxWidth: 75,align: "justify"})
             doc.text("CORRDENADAS GEOGRAFICAS:", 21,89,{maxWidth: 75,align: "justify"}).setFont(undefined, 'bold');
             doc.text("4. PROYECTO PRIORIZADO POR LAS GAM/GAIOC/JUNTAS VECINALES U ORGANIZACIONES SOCIALES", 21,94,{maxWidth: 150,align: "justify"})
             doc.text("5. CRITERIOS DE ELEGIBILIDAD Y COBERTURA (DESEABLE)", 21,109,{maxWidth: 150,align: "justify"})
             doc.text("5.1 PLANIMETRIA", 21,114,{maxWidth: 150,align: "justify"})
             doc.text("5.2 SERVICIOS BASICOS", 21,129,{maxWidth: 150,align: "justify"})
             doc.text("5.3 ACTIVIDADES Y VOLUMENES PRELIMINARES", 21,144,{maxWidth: 150,align: "justify"})
             doc.text("6.  DIMENSIONAMIENTO DE PROYECTO", 21,169,{maxWidth: 150,align: "justify"})
             doc.text("7. REPORTE FOTOGRAFICO", 21,184,{maxWidth: 150,align: "justify"})
             doc.setFontSize(8,"bold").setFont(undefined, 'normal');
             doc.text("Programa nacional de Emergencia para la Generacion de Empleo", 72,49,{maxWidth: 100,align: "justify"})
             doc.text("CATEGORIA:", 157,64,{maxWidth: 100,align: "justify"})
             doc.text("(marcar con una X)", 21,121,{maxWidth: 100,align: "justify"})
             doc.text("DOCUMENTO ES ?", 50,121,{maxWidth: 100,align: "justify"})
             doc.text("Tipo de servicio", 21,136,{maxWidth: 100,align: "justify"})
             doc.text("Cordones de Acera:", 21,153,{maxWidth: 100,align: "justify"})
             doc.text("Dimensiones y/o Area del enlosetado (M2)", 21,176,{maxWidth: 100,align: "justify"})

                // doc.text('*', 214, 280) //milimetros
             doc.setFontSize(6,"normal").setFont(undefined, 'normal');
             doc.text(this.dato.nombre, 71,52,{maxWidth: 126,align: "justify"})
             doc.setFontSize(9,"normal").setFont(undefined, 'normal');
             doc.text(this.dato.ficha.ubicacion+".", 71,58,{maxWidth: 126,align: "justify"})
             doc.text(this.dato.municipio, 71,63,{maxWidth: 126,align: "justify"})
             doc.text("' "+this.dato.autoridad+" '", 184,64,{maxWidth: 126,align: "justify"})
             doc.text(this.dato.ficha.zona+".", 71,68,{maxWidth: 126,align: "justify"})
             doc.text(this.dato.ficha.circunscripcion+".", 71,73,{maxWidth: 126,align: "justify"})
             doc.text(this.dato.ficha.distrito+".", 71,78,{maxWidth: 126,align: "justify"})
             doc.text(this.dato.ficha.direccion+".", 71,83,{maxWidth: 126,align: "justify"})
             doc.text("Latitud: "+this.dato.ficha.latitud, 71,88,{maxWidth: 126,align: "justify"})
             doc.text("Longitud: "+this.dato.ficha.longitud, 135,88,{maxWidth: 126,align: "justify"})
                doc.setFontSize(7,"normal").setFont(undefined, 'normal');
             doc.text("        SI                         NO                                           Observacion", 80,98,{maxWidth: 126,align: "justify"})
             doc.text("   OFICIAL GAM        EN TRAMITE                                  Observacion", 75,118,{maxWidth: 126,align: "justify"})
             doc.text("% A. Potable       % Alcantarillado     % Energia Electr.      % Gas Natural          Observacion", 79,134,{maxWidth: 126,align: "justify"})
             doc.text("Tierra (%)          Empedrado (%)            Otro(%)                   Observacion", 80,149,{maxWidth: 126,align: "justify"})
             doc.text("Ejecutado(%)      Por Ejecutar(%)    Long. por Ejecutar        Observacion", 80,159,{maxWidth: 126,align: "justify"})
             doc.text("      Longitud                  Ancho                          Area                   Observacion", 76,174,{maxWidth: 126,align: "justify"})
              if(this.dato.ficha.priorizado==="SI"){
                doc.text( "X", 86,104,{maxWidth: 20,align: "center"})
              }else{
                doc.text( "X", 105,104,{maxWidth: 20,align: "center"})
              }
              doc.text( this.dato.ficha.observacion4+".", 120,104,{maxWidth: 70,align: "justify"})

              if(this.dato.ficha.planimetria==="SI"){
                doc.text( "X", 86,124,{maxWidth: 20,align: "center"})
              }else{
                doc.text( "X", 105,124,{maxWidth: 20,align: "center"})
              }
              doc.text( this.dato.ficha.observacion5a+".", 120,124,{maxWidth: 70,align: "justify"})

              doc.text( this.dato.ficha.agua+" %", 85,139,{maxWidth: 20,align: "center"})
              doc.text( this.dato.ficha.alcantarillado+" %", 105,139,{maxWidth: 20,align: "center"})
              doc.text( this.dato.ficha.electricidad+" %", 125,139,{maxWidth: 20,align: "center"})
              doc.text( this.dato.ficha.gasnatural+" %", 145,139,{maxWidth: 20,align: "center"})
              doc.text( this.dato.ficha.observacion5b+".", 160,139,{maxWidth: 70,align: "justify"})
              doc.text( this.dato.ficha.tierra+" %", 85,154,{maxWidth: 20,align: "center"})
              doc.text( this.dato.ficha.empedrado+" %", 105,154,{maxWidth: 20,align: "center"})
              doc.text( this.dato.ficha.otro+" %", 125,154,{maxWidth: 20,align: "center"})
              doc.text( this.dato.ficha.observacion5c+".", 140,154,{maxWidth: 70,align: "justify"})
              doc.text( this.dato.ficha.ejecutado+" %", 85,164,{maxWidth: 20,align: "center"})
              doc.text( this.dato.ficha.porejecutar+" %", 105,164,{maxWidth: 20,align: "center"})
              doc.text( this.dato.ficha.longitudporejecutar+" m", 125,164,{maxWidth: 20,align: "center"})
              doc.text( this.dato.ficha.observacion5d+".", 140,164,{maxWidth: 70,align: "justify"})
              doc.text( this.dato.ficha.longituddecimal+" m", 85,179,{maxWidth: 20,align: "center"})
              doc.text( this.dato.ficha.ancho+" m", 105,179,{maxWidth: 20,align: "center"})
              doc.text( this.dato.ficha.area+" m2", 125,179,{maxWidth: 25,align: "center"})
              doc.text( this.dato.ficha.observacion6+".", 140,179,{maxWidth: 70,align: "justify"})

             doc.setFontSize(8, 'normal')
             doc.text("Página 1 de 2",180, 262)
             doc.text('ESTADO PLURINACIONAL DE BOLIVIA', 80, 39)
             doc.setFont(undefined, 'bold');
             doc.setFontSize(12,"bold")
             doc.text('FICHA TECNICA DE INSPECCION DE CAMPO',65,44)
                     let fotografia1=this.dato.ficha.foto1
                     let fotografia2=this.dato.ficha.foto2
                     let fotografia3=this.dato.ficha.foto3
                     if(this.dato.ficha.foto1==null){
                        fotografia1=''
                     }
                     if(this.dato.ficha.foto2==null){
                        fotografia2=''
                     }
                     if(this.dato.ficha.foto3==null){
                        fotografia3=''
                     }
             this.$api.post('base64ficha',{imagen1:fotografia1,imagen2:fotografia2,imagen3:fotografia3}).then(res=>{
                //console.log(res.data)
                this.$q.loading.hide()
                if (res.data[0]!=null){
                   let  imgData1 =res.data[0]
                      doc.rect(25,190, 170,60)
                   doc.addImage(imgData1, "jpeg", 23, 185, 85, 67, null, "FAST");
                }
                if(res.data[1]!=null){
                   let  imgData2 =res.data[1]
                   doc.addImage(imgData2, "jpeg", 112, 185, 85, 67, null, "FAST");
                }

             //PAGINA 2
              doc.addPage();
              doc.rect(20,20, 180,235)
              doc.rect(25,30, 170,100)
               this.$q.loading.show()
               doc.setFontSize(8,"bold").setFont(undefined, 'bold');
              doc.text("8. PLANO DE UBICACIÓN", 21,25,{maxWidth: 150,align: "justify"})
              doc.text("9. CONCLUSIONES Y RECOMENDACIONES DE LA INSPECCION TECNICA (marcar con una X)", 21,178,{maxWidth: 150,align: "justify"})
              doc.rect(20,180, 180,5)
              doc.rect(140,180, 60,5)
              doc.rect(20,180, 180,10)
              doc.rect(140,180, 60,10)
              doc.rect(20,180, 180,15)
              doc.rect(140,180, 60,15)
              doc.setFontSize(8,"bold").setFont(undefined, 'normal');
             doc.text("SE RECOMIENDA RECHAZAR EL PROYECTO", 21,183,{maxWidth: 100,align: "justify"})
             doc.text("SE RECOMIENDA INSPECCIONAR NUEVAMENTE EL PROYECTO : ", 21,188,{maxWidth: 100,align: "justify"})
             doc.text("SE RECOMIENDA APROBAR EL PROYECTO", 21,193,{maxWidth: 100,align: "justify"})
                doc.setFontSize(10,"bold").setFont(undefined, 'bold');
              if(this.dato.ficha.aprobado==="SI"){
                doc.text("SI", 145,193,{maxWidth: 100,align: "justify"})
                doc.text("NO", 145,183,{maxWidth: 100,align: "justify"})
              } else if(this.dato.ficha.aprobado==="NO"){
                doc.text("SI", 145,183,{maxWidth: 100,align: "justify"})
                doc.text("NO", 145,193,{maxWidth: 100,align: "justify"})
              }else{
                doc.text("NO", 145,183,{maxWidth: 100,align: "justify"})
                doc.text("NO", 145,193,{maxWidth: 100,align: "justify"})
              }
               if(this.dato.ficha.inspeccionado==="SI"){
                 doc.text("SI en : "+this.dato.ficha.dias+" dias ", 145,188,{maxWidth: 100,align: "justify"})
              }else{
                doc.text("NO ", 145,188,{maxWidth: 100,align: "justify"})
              }
              doc.line(90,220, 130,220,'F')
             // doc.line(80,30,135,30)
              doc.setFontSize(8,"bold").setFont(undefined, 'normal');
              doc.text("Página 2 de 2",180, 262)
              let fecha_informe=this.dato.ficha.fecha==null ?  moment().format('YYYY-MM-DD') : this.dato.ficha.fecha
              let departamento=this.$store.state.login.user.status
              const fechaDeCarta= this.fechalarga(fecha_informe,departamento)
              doc.text("Fecha : "+fechaDeCarta,30, 252)
              doc.text("Nombre y Firma del Técnico", 93,225,{maxWidth: 150,align: "justify"}).setFontSize(8,"bold").setFont(undefined, 'bold');
              doc.text("EVALUADOR", 103,230,{maxWidth: 150,align: "justify"})
               //doc.save(descargarnombre);
                if(res.data[2]!=null){
                   let  imgData3 =res.data[2]
                   doc.addImage(imgData3, "jpeg", 25, 30, 170, 120, null, "FAST");
                }

             window.open(doc.output('bloburl',{filename:"FICHA.pdf"}), '_blank');
             this.$q.loading.hide()
             })



    },
     imprimirEvaluacion(){
          let doc = new jsPDF('portrait' ,null, 'letter');
          let logofps = new Image();
          logofps.src = 'logofps.png';
          let escudo = new Image();
          escudo.src = 'escudo.png';
          let mpd = new Image();
          mpd.src = 'mpd.png';
             doc.addImage(mpd, 'PNG', 25, 12, 20, 20);
             doc.addImage(logofps, 'PNG', 170, 11, 25, 20);
             doc.addImage(escudo, 'PNG', 95, 11, 20, 15);
             doc.setFont('times')
             doc.rect(15,10, 185,255)
            // doc.rect(20,45, 50,45)
             doc.rect(170,45, 30,5)
             doc.rect(120,45, 50,5)
             // parte -1
             doc.rect(15,35, 185,5)
             doc.rect(15,35, 185,10)
             doc.rect(15,35, 185,15)
             doc.rect(15,35, 185,20)

             doc.rect(65,35, 135,20)


             //parte 0
             doc.rect(15,55, 185,10)
             doc.rect(15,55, 185,20)
             doc.rect(95,55, 105,5)
             doc.rect(95,55, 105,15)
             doc.rect(95,55, 105,20)

             doc.rect(120,55, 80,5)
             doc.rect(120,55, 80,15)

             doc.rect(145,55, 55,5)
             doc.rect(145,55, 55,15)

             doc.rect(170,55, 30,10)

             doc.rect(120,70, 25,5)
             doc.rect(145,70, 55,5)


             doc.setFontSize(6,"bold").setFont(undefined, 'normal');
             doc.text("PROYECTO PRIORIZADO POR LA GAM/GAIOC/JUNTAS VECINALES U ORGANIZACIONES SOCIALES ", 16,60,{maxWidth: 75,align: "justify"})
             doc.text("MONTO DEL PROYECTO  (Bs) ", 16,70,{maxWidth: 85,align: "justify"})
             doc.text("GAM", 105,58)
             doc.text("GAIOC", 128,58)
             doc.text("JUNTA VECINAL", 149,58)
             doc.text("ORGANIZACION SOCIAL", 173,58)
             doc.text("INFRAESTRUCTURA", 98,68)
             doc.text("SUPERVISION", 125,68)
             doc.text("TOTAL", 167,68)

               if(this.dato.presentado_por==='G.A.M.'){
                 doc.text("X", 107,63)
               }else if(this.dato.presentado_por==='G.A.I.O.C.'){
                 doc.text("X", 132,63)
               }else if(this.dato.presentado_por==='J.V.'){
                 doc.text("X", 157,63)
               }else{
                 doc.text("X", 184,63)
               }

             doc.text(this.dato.monto1+' Bs.', 108,73,{maxWidth: 25,align: "center"})
             doc.text(this.dato.monto2+' Bs.', 134,73,{maxWidth: 25,align: "center"})
             doc.text(this.dato.total+' Bs.', 190,73,{maxWidth: 25,align: "center"})


         //    doc.text("X", 107,103)
           //  doc.text("X", 133,103)
           //  doc.text("dasdasdasdasdasd", 146,103)



             //parte 1
             doc.rect(15,75, 185,5,'F')
             doc.rect(15,75, 185,10)
             doc.rect(15,75, 185,20)

             doc.rect(15,75, 185,30)

             doc.rect(95,80, 105,5)
             doc.rect(95,85, 105,5)
             doc.rect(95,85, 105,10)
             doc.rect(120,85, 80,5)
             doc.rect(120,85, 80,10)
             doc.rect(145,85, 55,5)
             doc.rect(145,85, 55,10)


             doc.rect(95,95, 105,5)
             doc.rect(95,95, 105,10)
             doc.rect(120,95, 80,5)
             doc.rect(120,95, 80,10)
             doc.rect(145,95, 55,5)
             doc.rect(145,95, 55,10)

             doc.setFontSize(8, 'bold').setFontSize(10).setFont(undefined, 'bold').setTextColor('#FFFFFF');
             doc.text('CRITERIOS DE ELEGIBILIDAD (DESEABLE ) (marcar con una X)', 16, 79).setFontSize(10).setFont(undefined, 'normal').setTextColor('#000000');
             doc.setFontSize(6,"bold").setFont(undefined, 'normal');
             doc.text("N° DE FAMILIAS BENEFICIARIAS", 16,84)
             doc.text("PROYECTO QUE ATIENDE A UNA INFRAESTRUCTURA PUBLICA", 16,90)
             doc.text("EL PROYECTO NO DEBE ENCONTRARSE EN ÁREAS Y/O ZONAS DE RIESGOS NATURALES Y GEOLÓGICOS", 16,100,{maxWidth: 75,align: "justify"})
             doc.text("CUMPLE", 103,88)
             doc.text("NO CUMPLE", 126,88)
             doc.text("OBSERVACION (centro de salud/ centro educativo)", 149,88)
             doc.text("CUMPLE", 103,98)
             doc.text("NO CUMPLE", 126,98)
             doc.text("OBSERVACIONES", 149,98)



              if(this.dato.evaluacions){


                 this.dato.evaluacions.forEach(it =>{
                  if(it.nombre==="C-1"){
                      doc.text(it.pivot.descripcion+' FAMILIAS', 100,83)
                  }
                   if(it.nombre==="C-2"){
                   if(it.pivot.presenta==="SI"){
                        doc.text("X", 107,93)
                     }else{
                       doc.text("X", 133,93)
                     }
                        doc.text(it.pivot.descripcion+'.', 146,93)
                }
                if(it.nombre==="C-3"){
                   if(it.pivot.presenta==="SI"){
                      doc.text("X", 107,103)
                     }else{
                         doc.text("X", 133,103)
                     }
                  doc.text(it.pivot.descripcion+'.', 146,103)
                }

                if(it.nombre==="R-1"){
                      if(it.pivot.presenta==="SI"){
                        doc.text("X", 137,116)
                     }else if(it.pivot.presenta==='NO'){
                         doc.text("X", 162,116)
                     }else{
                            doc.text("X", 187,116)
                     }
                }
                if(it.nombre==="R-2"){

                }


                if(it.nombre==="R-3"){
                     if(it.pivot.presenta==="SI"){
                         doc.text("X", 137,120)
                     }else if(it.pivot.presenta==='NO'){
                          doc.text("X", 162,120)
                     }else{
                            doc.text("X", 187,120)
                     }
                }
                if(it.nombre==="R-4"){
                   if(it.pivot.presenta==="SI"){
                         doc.text("X", 137,124)
                     }else if(it.pivot.presenta=='NO'){
                            doc.text("X", 162,124)
                     }else{
                             doc.text("X", 187,124)
                     }

                }
                if(it.nombre==="R-5"){
                   if(it.pivot.presenta==="SI"){
                          doc.text("X", 137,128)
                     }else if(it.pivot.presenta=='NO'){
                            doc.text("X", 162,128)
                     }else{
                             doc.text("X", 187,128)
                     }
                }

                if(it.nombre==="R-6"){
                   if(it.pivot.presenta==="SI"){
                          doc.text("X", 137,132)
                     }else if(it.pivot.presenta=='NO'){
                             doc.text("X", 162,132)
                     }else{
                           doc.text("X", 187,132)
                     }
                }
                if(it.nombre==="R-7"){
                   if(it.pivot.presenta==="SI"){
                              doc.text("X", 137,136)
                     }else if(it.pivot.presenta=='NO'){
                             doc.text("X", 162,136)
                     }else{
                            doc.text("X", 187,136)
                     }
                }

                if(it.nombre==="I-1"){
                  if(it.pivot.presenta==="SI"){
                                  doc.text("X", 137,148)
                     }else if(it.pivot.presenta=='NO'){
                             doc.text("X", 162,148)
                     }else{
                           doc.text("X", 187,148)
                     }
                }
                if(it.nombre==="I-2"){
                 if(it.pivot.presenta==="SI"){
                              doc.text("X", 137,152)
                     }else if(it.pivot.presenta==='NO'){
                               doc.text("X", 162,152)
                     }else{
                              doc.text("X", 187,152)
                     }
                }
                if(it.nombre==="I-3"){
                      if(it.pivot.presenta==="SI"){
                                  doc.text("X", 137,156)
                          }else if(it.pivot.presenta==='NO'){
                                  doc.text("X", 162,156)
                          }else{
                                  doc.text("X", 187,156)
                          }
                }


                if(it.nombre==="I-4"){
                     if(it.pivot.presenta==="SI"){
                             doc.text("X", 137,160)
                     }else if(it.pivot.presenta==='NO'){
                             doc.text("X", 162,160)
                     }else{
                          doc.text("X", 187,160)
                     }
                }
                if(it.nombre==="I-5"){
                 if(it.pivot.presenta==="SI"){
                               doc.text("X", 137,164)
                     }else if(it.pivot.presenta==='NO'){
                            doc.text("X", 162,164)
                     }else{
                               doc.text("X", 187,164)
                     }
                }
                if(it.nombre==="I-6"){
                 if(it.pivot.presenta==="SI"){
                             doc.text("X", 137,168)
                     }else if(it.pivot.presenta=='NO'){
                             doc.text("X", 162,168)
                     }else{
                            doc.text("X", 187,168)
                     }
                }
                if(it.nombre==="I-7"){
                 if(it.pivot.presenta==="SI"){
                                doc.text("X", 137,173)
                     }else if(it.pivot.presenta=='NO'){
                             doc.text("X", 162,173)
                     }else{
                            doc.text("X", 187,173)
                     }
                }
                if(it.nombre==="I-8"){
                 if(it.pivot.presenta==="SI"){
                         doc.text("X", 137,178)
                     }else if(it.pivot.presenta=='NO'){
                           doc.text("X", 162,178)
                     }else{
                       doc.text("X", 187,178)
                     }
                }
                if(it.nombre==="I-9"){
                if(it.pivot.presenta==="SI"){
                                doc.text("X", 137,182)
                     }else if(it.pivot.presenta=='NO'){
                            doc.text("X", 162,182)
                     }else{
                            doc.text("X", 187,182)
                     }
                }
                if(it.nombre==="I-10"){
                 if(it.pivot.presenta==="SI"){
                             doc.text("X", 137,186)
                     }else if(it.pivot.presenta=='NO'){
                               doc.text("X", 162,186)
                     }else{
                               doc.text("X", 187,186)
                     }
                }


             })
          }

                //parte 2
             doc.rect(15,105,185,8,'DF')
             doc.rect(15,105,185,12)
             doc.rect(15,105,185,16)
             doc.rect(15,105,185,20)
             doc.rect(15,105,185,24)
             doc.rect(15,105,185,28)
             doc.rect(15,105,185,32)



             doc.rect(175,105,25,32)
             doc.rect(150,105,25,32)
             doc.rect(125,105,25,32)

             doc.setFontSize(8, 'bold').setFontSize(10).setFont(undefined, 'bold').setTextColor('#FFFFFF');
             doc.text('REQUISITOS DEL PROYECTO (marcar con una X):', 16, 110)
              doc.setFontSize(6, 'bold').setFontSize(6).setFont(undefined, 'bold').setTextColor('#FFFFFF');
             doc.text('PRESENTA ', 132, 109)
             doc.text('NO PRESENTA ', 155, 109)
             doc.text('NO CORRESPONDE ', 178, 109)
             doc.text('(CATEGORIA A)', 180, 112).setFontSize(10).setFont(undefined, 'normal').setTextColor('#000000').setFontSize(10).setFont(undefined, 'normal').setTextColor('#000000');;
              doc.setFontSize(6,"bold").setFont(undefined, 'normal');
             doc.text("NOTA DE SOLICITUD DE FINANCIAMIENTO POR GAM/GAIOC/J.V.O.S.", 16,116)
             doc.text("CERTIFICACION DE EXISTENCIA DE SERVICIOS BASICOS (ALCANTARILLADO SANITARIO, AGUA POTABLE).", 16,120)
             doc.text("ACTA DE CONSENSO SOCIAL", 16,124)
             doc.text("ACTA DE COMPROMISO PARA LA EJECUCÍON DE CORDONES DE ACERA", 16,128)
             doc.text("PLANIMETRIA APROBADA", 16,132)
             doc.text("ACTA DE COMPROMISO PARA FIRMA DE CONVENIO CTF/CFP", 16,136)



             //parte 3
             doc.rect(15,137,185,8,'FD')
             doc.rect(15,137,185,12)
             doc.rect(15,137,185,16)
             doc.rect(15,137,185,20)
             doc.rect(15,137,185,24)
             doc.rect(15,137,185,28)
             doc.rect(15,137,185,32)
             doc.rect(15,137,185,38)
             doc.rect(15,137,185,42)
             doc.rect(15,137,185,46)
             doc.rect(15,137,185,50)


             doc.rect(175,145,25,42)
             doc.rect(150,145,25,42)
             doc.rect(125,145,25,42)



             doc.setFontSize(8, 'bold').setFontSize(10).setFont(undefined, 'bold').setTextColor('#FFFFFF');
             doc.text('INGENIERIA DEL PROYECTO (marcar con una X)', 16, 142)
             doc.setFontSize(6, 'bold').setFontSize(6).setFont(undefined, 'bold').setTextColor('#FFFFFF');
             doc.text('PRESENTA ', 132, 142)
             doc.text('NO PRESENTA ', 155, 142)
             doc.text('DEBE SER ', 182, 140)
             doc.text('COMPLEMENTADO', 178, 144).setFontSize(10).setFont(undefined, 'normal').setTextColor('#000000').setFontSize(10).setFont(undefined, 'normal').setTextColor('#000000')
             doc.setFontSize(6,"bold").setFont(undefined, 'normal');
             doc.text("RESUMEN EJECUTIVO", 16,148)
             doc.text("DIAGNOSTICO DEL PROYECTO/ESTUDIO SOCIOECONOMICO", 16,152)
             doc.text("LOCALIZACION (CROQUIS DE UBICACION)", 16,156)
             doc.text("PRECIOS UNITARIOS", 16,160)
             doc.text("COMPUTOS METRICOS", 16,164)
             doc.text("CRONOGRAMA DE EJECUCION", 16,168)
             doc.text("PLANOS DE CONSTRUCCION (PLANOS DE PLANTA, DETALLES CONSTRUCTIVOS DE LAS OBRAS DE ARTE, PERFIL LONGITUDINAL Y TRANSVERSAL", 16,172,{maxWidth: 95,align: "justify"})
             doc.text("ESPECIFICACIONES TECNICAS", 16,178)
             doc.text("REPORTE FOTOGRAFICO", 16,182)
             doc.text("PRESUPUESTO GENERAL", 16,186)




                   //parte 4
             doc.rect(15,187,185,5,'FD')
             doc.rect(15,187,185,9)
             doc.rect(15,187,185,13)
             doc.rect(15,187,185,17)
             doc.rect(15,187,185,21)

             doc.rect(70,192,20,16)
             doc.rect(125,192,20,16)
             doc.rect(180,192,20,16)

             doc.setFontSize(8, 'bold').setFontSize(10).setFont(undefined, 'bold').setTextColor('#FFFFFF')
             doc.text('SE OBSERVARON LOS SIGUIENTES ITEMS', 16, 191).setFontSize(10).setFont(undefined, 'normal').setTextColor('#000000')
             doc.setFontSize(6,"bold").setFont(undefined, 'normal');
             doc.text('CORDONES DE ACERA', 16, 195)
             doc.text('ALCANTARILLADO SANITARIO', 16, 199)
             doc.text('MEDIDAS DE BIOSEGURIDAD', 16, 203)
             doc.text('COLOCADO DE PLANTINES', 16, 207)

             doc.text('ACERA DE CEMENTO', 96, 195)
             doc.text('GRADAS DE H°C°', 96, 199)
             doc.text('BARANDA DE FG', 96, 203)
             doc.text('MUROS DE CONTENSION', 96, 207)


             doc.text('RETIRO DE ENLADRILLADO', 146, 195)
             doc.text('RETIRO EMPEDRADO', 146, 199)
             doc.text('RETIRO ENLOSETADO', 146, 203)
                  if(this.dato.firmado_por){
            let items2=this.dato.firmado_por.split("-")
                 console.log(items2)
                 for(let i=0; i<items2.length-1; i++){
                      if(items[i]=='cordones'){
                            doc.text('X', 80, 195)
                      }
                      if(items[i]=='acera'){
                            doc.text('X', 135, 195)
                      }
                      if(items[i]=='enladrillado'){
                             doc.text('X', 190, 195)
                      }
                      if(items[i]=='alcantarillado'){
                            doc.text('X', 80, 199)
                      }
                      if(items[i]=='gradas'){
                           doc.text('X', 135, 199)
                      }
                      if(items[i]=='empedrado'){
                          doc.text('X', 190, 199)
                      }
                      if(items[i]=='medidas'){
                           doc.text('X', 80, 203)
                      }
                      if(items[i]=='baranda'){
                          doc.text('X', 135,203)
                      }
                      if(items[i]=='enlosetado'){
                         doc.text('X', 190, 203)
                      }
                      if(items[i]=='colocado'){
                          doc.text('X', 80, 207)
                      }
                      if(items[i]=='muros'){
                         doc.text('X', 135, 207)
                      }
                      if(items[i]=='otro'){
                         doc.text(this.dato.comunidades+'dfsdf:', 146, 207)
                         doc.text('X', 190, 207)
                      }

                 }
                  }

                   //parte 5
             doc.rect(15,208,185,5,'FD')
             doc.rect(15,208,185,9)
             doc.rect(15,208,185,13)

             doc.rect(180,208,20,16)


             doc.setFontSize(8, 'bold').setFontSize(10).setFont(undefined, 'bold').setTextColor('#FFFFFF')
             doc.text('CONCLUSIONES DE LA INSPECCION TECNICA', 16, 212).setFontSize(10).setFont(undefined, 'normal').setTextColor('#000000')
             doc.setFontSize(6,"bold").setFont(undefined, 'normal');
             doc.text('EL PROYECTO CUMPLE  CON LOS CRITERIOS Y REQUISITOS DEL PROGRAMA', 16, 216)
             doc.text('EL PROYECTO  NO CUMPLE  CON LOS CRITERIOS Y REQUISITOS DEL PROGRAMA', 16, 220)

                       if(this.dato.cumple==='SI'){
                                  doc.text('X', 190, 216)
                       }else{
                                 doc.text('X', 190, 220)
                       }





          //parte 6
             doc.rect(15,221,185,5,'FD')
             doc.rect(15,221,185,13)
             doc.setFontSize(8, 'bold').setFontSize(10).setFont(undefined, 'bold').setTextColor('#FFFFFF')
             doc.text('RECOMENDACIONES', 16, 225).setFontSize(10).setFont(undefined, 'normal').setTextColor('#000000')
              doc.setFontSize(6,"bold").setFont(undefined, 'normal');
             doc.text(this.dato.observacion+'.', 16, 229,{maxWidth: 160,align: "justify"})

             doc.setFontSize(6,"bold").setFont(undefined, 'normal');
            //  doc.rect(25,190, 170,60)
             doc.setFontSize(8,"bold").setFont(undefined, 'normal');
             doc.text("NOMBRE DEL PROYECTO", 16,39,{maxWidth: 75,align: "justify"})
             doc.text("DEPARTAMENTO :", 16,44,{maxWidth: 75,align: "justify"})
             doc.text("MUNICIPIO :", 16,49,{maxWidth: 75,align: "justify"}).setFont(undefined, 'normal');
             doc.text("AREA DE ENLOSETADO (M2)", 16,54,{maxWidth: 75,align: "justify"})
             doc.text("CATEGORIA DEL MUNICIPIO:", 125,49)

                // doc.text('*', 214, 280) //milimetros
             doc.setFontSize(9,"normal").setFont(undefined, 'normal');
             doc.text(this.dato.nombre, 71,39,{maxWidth: 126,align: "justify"})
             doc.setFontSize(9,"normal").setFont(undefined, 'normal');

             doc.text(this.dato.departamento.nombre+'.', 71,44,{maxWidth: 126,align: "justify"})
             doc.text(this.dato.municipio+'.', 71,49,{maxWidth: 126,align: "justify"})
             doc.text(this.dato.monto3+' m2', 71,54,{maxWidth: 126,align: "justify"})

             doc.text("' "+this.dato.autoridad+" '", 184,49,{maxWidth: 126,align: "justify"})

             doc.setFontSize(8, 'normal')
             doc.text(" ...........................................................                                               ...........................                                              .........................  ",25, 258)
             doc.text("Sello y Firma                                                                 Sello y Firmna                                                  Sello y Firma  ",40, 261)
             doc.text("GERENTE DEPARTAMENTAL FPS                                            JEFE TECNICO                                               EVALUADOR  ",25, 264)
             let fecha_informe=this.dato.carta_fecha==null ?  moment().format('YYYY-MM-DD') : this.dato.carta_fecha
             doc.text("Fecha: "+fecha_informe,16, 268)
             doc.text("Página 1 de 1",184, 268)
             doc.text('ESTADO PLURINACIONAL DE BOLIVIA', 80, 29)
             doc.setFont(undefined, 'bold');
             doc.setFontSize(12,"bold")
             doc.text('EVALUACION TECNICA BOL - 34',73,34)





             window.open(doc.output('bloburl',{filename:"FICHA.pdf"}), '_blank');





    }

  }
};
</script>
