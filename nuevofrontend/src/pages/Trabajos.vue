<template>
  <q-card>
    <div style="margin-top: 10px">
        <div class="cols-12" v-for="(row, index) in data" :key="index">
    <q-card >
      <q-card-section style="margin-top: 10px">
         <q-chip square color="green" text-color="white" >
         <div class="text-subtitle2"> {{row.car.tipo}} : {{row.car.placa}} - {{row.car.marca}} - Año: {{row.car.modelo}} </div>
         </q-chip>

         <q-separator/>
         <div class="text-subtitle2">Seguimiento: {{row.seguimiento}} </div>
         <div class="text-subtitle2">Fecha de Ingreso: {{row.fechaini}} </div>
          <div class="text-subtitle2">Asignado a: {{row.car.chofer}} </div>
         <q-separator/>
          <div class="text-subtitle2">Taller: {{row.taller.nombre}}</div>
         <q-separator/>
      </q-card-section>
      <q-separator />

      <q-card-actions align="right">
        <q-btn color="primary"  @click="verRow1(row)">cargar actividades</q-btn>
      </q-card-actions>
    </q-card>


        </div>
      </div>



  </q-card>


</template>

<script>
export default {

   data(){
       return{
          data:[],
         cantidad:0,
         dato:{},
         dato2:{},

       };
   },
   created(){
     this.misdatos();
   },
   methods:{
      misdatos(){
          this.$q.loading.show();
         this.$api.get(process.env.API+"/Solicituds").then((res)=>{
              // console.log(res.data)
               this.data =res.data;
               this.cantidad=res.data.length;
            //   console.log(this.cantidad)
          this.$q.loading.hide();
       });
       },
       verRow1(item) {
      this.dato2 = item;
       this.$router.push({name: 'actividades.view', params: {id:this.dato2.id}})
    },

   },
};
</script>

<style>

</style>
