<template>
	<div id="app1">
       <div class="padding1 flex flex-center ">
    <img
              alt="Quasar logo"
              src="~assets/logofps.png"
              style="width: 50px; height: 50px"
            >
       </div>
		<p class="calendar-text1">Calendario de Apertura de Sobres</p>
     <div class="calendar-controls">
          <div class="field">
          <label class="label">Periodo de Seleccion</label>
          <div class="control">
            <div class="select">
              <select v-model="displayPeriodUom">
                <option>month</option>
                <option>week</option>
                <option>year</option>
              </select>
            </div>
          </div>
        </div>
     </div>
    <div v-if="title" class="is-success">
                      <div class="text1">
                            <div > <span class="text__span"> DEPARTAMENTO:</span>{{ departamento}}</div>
                            <div @click="enviar"> <span class="text__span"> PROCESO:</span>{{ title}}</div>
                      </div>
                       <ul class="text">
                         <li> <span class="text__span"> CUCE: </span>  {{ cuce }} <a href="https://www.sicoes.gob.bo/portal/contrataciones/busqueda/convocatorias.php?tipo=convNacional" target="_blank">SICOES</a> </li>
                         <li> <span class="text__span"> FECHA:</span>  {{ fecha }}</li>
                         <li > <span class="text__span">  ENLACE PARA LA REUNION: </span> <a :href='url' target="_blank">{{ url }}</a></li>
                        </ul>
      </div>
		<calendar-view
			:show-date="showDate"
      :items="attributes"
      @click-date="onClickDay"
      @click-item="onClickItem"
     :display-period-uom="displayPeriodUom"
      :showTimes='true'

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
  import "../../node_modules/vue-simple-calendar/dist/css/holidays-us.css"


	export default {
		data() {
			return {
        showDate: new Date(),
        data:[],
        message: "",
        attributes:[],
        selectedDate: '',
        date: new Date(),
        displayPeriodUom: "month",
        fecha:'',
        title:'',
        url:'',
        cuce:'',
        departamento:'',
        idclick:'1',

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
       fechalarga(fecha){
         let fecha1=fecha.split("-")
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
         let answer=Number(fecha1[2])+" de "+meses[Number(fecha1[1])]+" de "+fecha1[0]
        return answer
      },
       mesesLiteral(fecha){

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
         let answer=meses[Number(fecha)]
        return answer
      },
      onClickDay(d) {
			this.message = `la fecha es: ${d.toLocaleDateString()}`
		},
    enviar(){
      // this.$router.push({name: 'detallelotes.view', params: {id:this.idclick}})
      // this.$router.push('/DetalleLotes')
    },
		onClickItem(e) {
      //console.log(e)
      let arr=e.tooltip.split(':')
			this.title = ` ${e.title}`
			this.fecha = e.startDate.getDate()+' de '+this.mesesLiteral(Number(e.startDate.getMonth()+1))+' de '+e.startDate.getFullYear()+' Horas: '+e.startDate.getHours()+':'+e.startDate.getMinutes()
			this.cuce =arr[1]
			this.url =e.url
      this.departamento=arr[0]
      this.idclick=e.id
		},
    	setShowDate(d) {
			//this.message = `Changing calendar view to ${d.toLocaleDateString()}`
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
          //      let fecha2= new Date(anio[0], anio[1]-1, anio[2],hora1[0],hora1[1],hora1[2]+10)
                 this.attributes.push({id:it.id,startDate:fecha1,title:it.nombre,url:it.link,tooltip:it.departamento.nombre+":"+it.cuce,classes:"lapaz",style:"orange"})

           })
         //  console.log(this.attributes)

         this.$q.loading.hide();
       });
    },
		}
	}
</script>
<style scoped>
.calendar-text1{
    font-family: 'Avenir', Helvetica, Arial, sans-serif;
    text-align: center;
    border: 0;
    font-weight: 900;
    font-size: 30px;
    padding-top: 0px;
    padding-bottom: 0px;
    margin-bottom: 0;
    border-bottom: 0px;
}
.padding1{
  padding-top: 20px;
  padding-bottom: 0;
}
.is-success {
    background-color: #23d160;
    color: #fff;
    border-radius: 10px;
    padding: 2px 20px;
}
.lapaz{
  background-color: red;
}
.text__span{
  font-weight: 700;
  color: rgb(38, 25, 153);
   font-family: Arial, Helvetica, sans-serif;
    padding-right: 10px;
}
.text1{
 padding: 5px 5px 0px 40px;
 color: #fff;

}
.text{
  list-style: none;
  display: flex;
  flex-wrap: wrap;
  justify-content: center;
  gap: 2rem;
}
	#app1 {
		font-family: 'Avenir', Helvetica, Arial, sans-serif;
		color: #2c3e50;
		height: 67vh;
		width: 90vw;
		margin-left: auto;
		margin-right: auto;
	}
  .calendar-controls {
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
.theme-default .cv-day.today{
  background-color: red;
}

</style>

