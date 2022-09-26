<template>
 <div class="q-pa-md">
  <!--          tabla PRINCIPAL -->
    <q-table
      :filter="filter"
      title="REPORTE BOL34 "
      :rows="data"
      :columns="columns"
      row-key="nombre"
      :rows-per-page-options="[0]"
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
          <q-td key="nro" :props="props">
            {{props.row.nro}}
          </q-td>
           <q-td key="codigo" :props="props">
            {{props.row.codigo}}
          </q-td>
           <q-td key="departamento" :props="props">
            {{props.row.departamento.nombre}}
          </q-td>
           <q-td key="municipio" :props="props">
            {{props.row.municipio}}
          </q-td>
           <q-td key="categoria" :props="props">
              {{props.row.autoridad}}
          </q-td>

           <q-td key="nombre" :props="props">
            <q-btn v-if="this.$store.state.login.user.status==='CENTRAL'"
                        dense
                        round
                        flat
                        color="blue"
                        @click="verRow1(props)"
                        icon="info"
               ></q-btn>  {{props.row.nombre}}
          </q-td>
           <q-td key="cite" :props="props">
            {{props.row.cite}}
          </q-td>
           <q-td key="hojaderuta" :props="props">
            {{props.row.interno}}
          </q-td>
           <q-td key="adjunto" :props="props">
            {{props.row.adjunto}}
          </q-td>

         <q-td  v-if="props.row.users.length"
                key="funcionario" :props="props">
               {{props.row.users[0].name}}
         </q-td>
          <q-td   v-if="props.row.users.length===0"
                key="funcionario" :props="props">
               {{props.row.user}}
         </q-td>
           <q-td key="monto1" :props="props">
            {{props.row.monto1}}
          </q-td>
           <q-td key="monto1" :props="props">
            {{props.row.monto2}}
          </q-td>
           <q-td key="monto3" :props="props">
            {{props.row.total}}
          </q-td>
         <q-td key="inspeccion" :props="props">
               {{props.row.vinculo}}
         </q-td>
         <q-td key="fechainspeccion" :props="props">
               {{props.row.copia}}
         </q-td>
         <q-td key="fechaenvio" :props="props">
               {{props.row.carta_fecha}}
         </q-td>
         <q-td key="informe" :props="props">
               {{props.row.carta_cite}}
         </q-td>
         <q-td key="elegible" :props="props">
               {{props.row.cumple}}
         </q-td>
         <q-td key="estado" :props="props">
               {{props.row.status}}
         </q-td>
         <q-td key="tiempo" :props="props">
               {{props.row.duracion}} Dias
         </q-td>
         <q-td
                key="area" :props="props">
               {{props.row.monto3}} m2
         </q-td>

         <q-td  key="solicitante" :props="props">
               {{props.row.presentado_por}}
         </q-td>

         <q-td key="avance" :props="props">
               {{props.row.puntaje}} %
         </q-td>
       </q-tr>
      </template>

        <template v-slot:top-left>
           <q-toolbar flat>
              <q-toolbar-title>REGISTRO BOL 34</q-toolbar-title>

              <q-btn
                  color="primary"
                  icon-right="archive"
                  label="Descargar en excel"
                  no-caps
                  @click="exportTable"
                />
           </q-toolbar>

      </template>
    </q-table>
    </div>
</template>
<script >  //vue 2
import moment, { now } from 'moment';
 const total_days = (date1,date2)=> {
           let date_2;
          if(date1==null){
            return 0
          }
          if(date2==null){
            date_2=new Date(moment().format('YYYY-MM-DD'))
          }else{
            date_2=new Date(date2)
          }
        let date_1=new Date(date1)

        let day_as_milliseconds = 86400000;
        let diff_in_millisenconds = date_2 - date_1;
        let diff_in_days = diff_in_millisenconds / day_as_milliseconds;
        return diff_in_days;
    }
const columns = [
  { name: 'nro', align:"center", label: 'N°', field: 'nro', sortable: true },
  { name: 'codigo', align: "left",label: 'Codigo VIPFE', field: 'codigo',sortable:true },
  { name: 'departamento', align: "left",label: 'Departamento', field: 'departamento',sortable:true},
  { name: 'municipio', align: "left",label: 'Municipio', field: 'municipio',sortable:true},
  { name: 'categoria', align: "left",label: 'Categoria', field: 'categoria',sortable:true},
  { name: 'nombre',required: true,align: "left", label: 'Nombre de la propuesta', field: 'nombre',sortable:true },
  { name: 'cite', align: "left",label: 'CITE MPD/VIPFE', field: 'cite',sortable:true },
  { name: 'hojaderuta', label: 'N° Hoja de Ruta', field: 'hojaderuta',sortable:true },
  { name: 'adjunto', label: 'Adjunto', field: 'adjunto',sortable:true },
  //{ name: 'fecha', align: "center",label: 'Fecha', field: 'fecha',sortable:true },
  { name: "funcionario",align: "left",label: "Evaluado Por:",field: "funcionario",sortable: true},
  { name: 'monto1', align:"right",label: 'Infraestructura', field: 'monto1',sortable:true },
  { name: 'monto2', align:"right",label: 'Supervision', field: 'monto2',sortable:true },
  { name: 'monto3', align:"right",label: 'Monto Total', field: 'monto3',sortable:true },
  { name: 'inspeccion',align: "center", label: 'Inspeccionado ', field: 'inspeccion', sortable: false },
  { name: 'fechainspeccion',align: "center", label: 'Fecha de Inspeccion', field: 'fechainspeccion', sortable: false },
  { name: 'fechaenvio',align: "center", label: 'Fecha de Envio', field: 'fechaenvio', sortable: false },
  { name: 'informe',align: "center", label: 'Informe', field: 'informe', sortable: false },
  { name: 'elegible',align: "center", label: 'Elegible', field: 'elegible', sortable: false },
  { name: 'estado',align: "center", label: 'Estado', field: 'estado', sortable: false },
  { name: 'tiempo',align: "center", label: 'Tiempo', field: 'tiempo', sortable: false },
  { name: 'area',align: "center", label: 'Area (m2)', field: 'area', sortable: false },
  { name: 'solicitante',align: "center", label: ' U. Solicitante', field: 'solicitante', sortable: false },
  { name: 'avance',align: "center", label: '% Evaluacion ', field: 'avance', sortable: false }
  ];
  import exportFromJSON from 'export-from-json'
export default {
  data() {
    return {
      columns,
      filter:'',
      data:[],
    };
    },
    created(){
      this.misdatos()
  },
    methods: {
      verRow1(item) {
      this.dato2 = item.row;
       this.$router.push({name: 'DetalleBol34.view', params: {id:this.dato2.id}})
        //this.$router.push("Licitaciones")

     /*
      if (this.dato2.tipo_id===2)
         {
            this.dialog_list1 = true;
         }else{
            this.dialog_list2 = true;
         }
        */
    },

        misdatos(){
        // this.$q.loading.show();
         //   this.$api.get(process.env.API+"/registrodepa/"+this.$store.state.login.user.ci).then((res)=>{
       //    this.data=res.data

      //    this.$q.loading.hide();
        this.data=[]
       this.$api.get(process.env.API+"/registrados").then((res)=>{
           console.log(res.data);
            let puntaje=0
        res.data.forEach(it=>{

                             if(it.status==="ENVIADO"){
                                 it.puntaje=100.00
                              }else{
                                   puntaje=0
                                if(it.vinculo==="SI"){
                                   puntaje+=50
                                 }
                                if(it.puntaje1!="0.00"){
                                     puntaje+=10
                                 }
                                  if(it.puntaje2!='0.00'){
                                    puntaje+=10
                                 }
                                  if(it.puntaje3!='0.00'){
                                   puntaje+=10
                                 }
                                  if(it.puntaje4!='0.00'){
                                   puntaje+=10
                                 }

                                 if(it.ficha && it.ficha.ubicacion){
                                   puntaje+=10
                                 }

                                  it.puntaje=puntaje
                              }
                              let duracion=total_days(it.fecha,it.carta_fecha)
                              it.duracion=duracion

                       if(this.$store.state.login.user.status===it.departamento.nombre){
                            this.data.push(it)

                       }else{
                               if(this.$store.state.login.user.status==="CENTRAL"){
                                 this.data.push(it)
                               }

                       }
              })
          this.$q.loading.hide();
       });
       },
          exportTable () {
              const datos=[]
                 for(let i=0;i<this.data.length;i++){

                       if(this.data[i].users==null){
                         let user=" "
                         this.data[i].evaluador=user
                       }else{
                            if(this.data[i].users.length>0){
                              let user=this.data[i].users[0].name
                               this.data[i].evaluador=user
                            }else{
                                let user=" "
                               this.data[i].evaluador=user
                            }
                       }
                      let depa=""
                      if(this.data[i].departamento){
                       depa=this.data[i].departamento.nombre
                      }

                       let duracion=total_days(this.data[i].fecha,this.data[i].carta_fecha);
                        delete this.data[i].evaluacions
                      // this.data[i].departamento=this.$store.state.login.user.status
                       delete  this.data[i].ficha
                       delete  this.data[i].departamento_id


                        delete this.data[i].mosca
                        delete this.data[i].carta_ref
                        delete this.data[i].carta_de
                        delete this.data[i].carta_via
                        delete this.data[i].carta_a
                        delete this.data[i].observacion
                        delete this.data[i].url
                        delete this.data[i].firmado_por
                        delete this.data[i].comunidades
                        delete this.data[i].provincia
                        delete this.data[i].puntaje1
                        delete this.data[i].puntaje2
                        delete this.data[i].puntaje3
                        delete this.data[i].puntaje4
                        delete this.data[i].id
                        delete this.data[i].users
                     //}
                     let fecha_inspeccion=" "
                      if(this.data[i].vinculo==="SI"){
                        fecha_inspeccion=this.data[i].copia
                      }


                        this.data[i]={
                            nro:this.data[i].nro,
                            departament:depa,
                            municipio:this.data[i].municipio,
                            categoria:this.data[i].autoridad,
                            codigo_vipfe:this.data[i].codigo,
                            nombre:this.data[i].nombre,
                            cite_vipfe:this.data[i].cite,
                            cite_fps:this.data[i].interno,
                            fecha_reg:this.data[i].fecha,
                            infraestructura:this.data[i].monto1,
                            supervision:this.data[i].monto2,
                            total:this.data[i].total,
                            nro_informe:this.data[i].carta_cite,
                            fecha_informe:this.data[i].carta_fecha,
                            adjunto:this.data[i].adjunto,
                            inspeccion:this.data[i].vinculo,
                            fecha_inspeccion:fecha_inspeccion,
                            evaluador:this.data[i].evaluador,
                            aprobado:this.data[i].cumple,
                            status:this.data[i].status,
                            area:this.data[i].monto3,
                            solictante:this.data[i].presentado_por,
                            evaluacion:this.data[i].puntaje+" %",
                            duracionDias:duracion,

                          ...this.data[i]
                        }
                          delete this.data[i].cite
                          delete this.data[i].interno
                          delete this.data[i].fecha
                          delete this.data[i].autoridad
                          delete this.data[i].monto1
                          delete this.data[i].monto2
                          delete this.data[i].codigo
                          delete this.data[i].vinculo
                          delete this.data[i].copia
                          delete this.data[i].carta_fecha
                          delete this.data[i].carta_cite
                          delete this.data[i].cumple
                          delete this.data[i].puntaje
                          delete this.data[i].departamento
                          delete this.data[i].monto3
                          delete this.data[i].presentado_por

                         datos.push(this.data[i])
                 }
           //  const datos=this.data
             const fileName="REPORTE_BOL34_"+this.$store.state.login.user.status
             const extension=exportFromJSON.types.xls
            exportFromJSON({data:datos, fileName:fileName, exportType:extension})
            this.misdatos();

      },

    }
}
</script>
<style>
</style>
