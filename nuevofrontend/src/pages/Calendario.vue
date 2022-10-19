<template>
	<div id="app1">
     <div class="calendar-controls">
     <div v-if="message" class="notification is-success">{{ message }}</div>
     </div>
		<h6>Calendario de Apertura de Sobres</h6>
		<calendar-view
			:show-date="showDate"
      :items="attributes"
      @click-date="onClickDay"
      @click-item="onClickItem"

			class="theme-default holiday-us-traditional holiday-us-official calendar-parent">
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
        message: "",
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
      onClickDay(d) {
			this.message = `la fecha es: ${d.toLocaleDateString()}`
		},
		onClickItem(e) {
      console.log(e)
			this.message = `El evento es: ${e.title}`
		},
    	setShowDate(d) {
			this.message = `Changing calendar view to ${d.toLocaleDateString()}`
			this.showDate = d
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

            this.attributes.push({id:it.id,startDate:fecha1,title:it.nombre,url:it.link,tooltip:it.cuce})

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
  calendar-controls {
	margin-right: 1rem;
	min-width: 14rem;
	max-width: 14rem;
}

.calendar-parent {
	display: flex;
	flex-direction: column;
	flex-grow: 1;
	overflow-x: hidden;
	overflow-y: hidden;
	max-height: 80vh;
	background-color: white;
}

/* For long calendars, ensure each week gets sufficient height. The body of the calendar will scroll if needed */
.cv-wrapper.period-month.periodCount-2 .cv-week,
.cv-wrapper.period-month.periodCount-3 .cv-week,
.cv-wrapper.period-year .cv-week {
	min-height: 6rem;
}

/* These styles are optional, to illustrate the flexbility of styling the calendar purely with CSS. */

/* Add some styling for items tagged with the "birthday" class */
.theme-default .cv-event.birthday {
	background-color: #e0f0e0;
	border-color: #d7e7d7;
}

.theme-default .cv-event.birthday::before {
	content: "\1F382"; /* Birthday cake */
	margin-right: 0.5em;
}
html,
body {
	height: 100%;
	margin: 0;
	background-color: #f7fcff;
}

</style>
