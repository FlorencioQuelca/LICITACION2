<template>
	<div id="app1">
		<h6>Calendario de Apertura de Sobres</h6>
		<calendar-view
			:show-date="showDate"
      :items="attributes"
      :showTimes='true'
			class="theme-default holiday-us-traditional holiday-us-official">
			<template #header="{ headerProps }">
				<calendar-view-header
					:header-props="headerProps"
					@input="setShowDate"

           />


			</template>

		</calendar-view>
	</div>
</template>
<script>
	import { CalendarView, CalendarViewHeader} from "vue-simple-calendar"
//console.log(CalendarViewHeader)

 // import '../../'
	import "../../node_modules/vue-simple-calendar/dist/style.css"
	// The next two lines are optional themes
	import "../../node_modules/vue-simple-calendar/dist/css/default.css"
  //import "../../node_modules/vue-simple-calendar/dist/css/holidays-us.css"

	export default {
		data() {
			return {
        showDate: new Date(2022,9,15),
          data:[],
            masks: {
        weekdays: 'WWWW',
      },

       attributes:[],
        selectedDate: '',
         date: new Date(),

        }
		},
		components: {
			CalendarView,
			CalendarViewHeader,
		},
     created() {},
  mounted() {
    this.misdatos();

  },
		methods: {
			setShowDate(d) {
				this.showDate = d;
			},
      misdatos() {
      this.$q.loading.show();
      this.$api.get(process.env.API+"/proyectoslibre").then((res)=>{
         this.data =res.data
           this.attributes=[]

              res.data.forEach(it =>{
                let anio=it.fecha.split('-')
               let hora1=it.hora.split(':')
                let fecha1= new Date(anio[0], anio[1]-1, anio[2],hora1[0],hora1[1],hora1[2])
                let fecha2= new Date(anio[0], anio[1]-1, anio[2],hora1[0],hora1[1],hora1[2]+10)

            this.attributes.push({id:it.id,startDate:fecha1,title:it.nombre,url:it.link})

           })
           console.log(this.attributes)

         this.$q.loading.hide();
       });
    },
		}
	}
</script>
<style>
	#app1 {
		font-family: 'Avenir', Helvetica, Arial, sans-serif;
		color: #2c3e50;
		height: 67vh;
		width: 90vw;
		margin-left: auto;
		margin-right: auto;
	}
</style>
