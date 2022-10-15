<template>
  <div class="text-center section">
    <h2 class="h2">CALENDARIO DE APERTURA DE PROPUESTAS PUBLICAS</h2>
    <p class="text-lg font-medium text-gray-600 mb-6">
      FONDO NACIONAL DE INVERSION PRODUCTIVA Y SOCIAL - BOLIVIA
    </p>
    <v-calendar
      class="custom-calendar max-w-full"
      :masks="masks"
      :attributes="attributes"
      disable-page-swipe
      is-expanded
      is-dark
      color="purple"
      first-day-of-week=1
    >
    <!--
      <template v-slot:day-content="{ day, attributes }">
        <div class="flex flex-col h-full z-10 overflow-hidden">
          <span class="day-label text-sm text-gray-900">{{ day.day }}</span>
          <div class="flex-grow overflow-y-auto overflow-x-auto">
            <p
              v-for="attr in attributes"
              :key="attr.key"
              class="text-xs leading-tight rounded-sm p-1 mt-0 mb-1"
              :class="attr.class"
            >
              {{ attr.customData.hora}}
              <button>

              </button>
            </p>

          </div>
        </div>
      </template>
      -->
    </v-calendar>
  </div>


<!--
    <div style="max-width: 800px; width: 100%;">
     <div class="row justify-center items-center">
      <q-btn flat dense label="Prev" @click="calendarPrev" />
      <q-separator vertical />
      <q-btn flat dense label="Next" @click="calendarNext" />
    </div>
    <q-separator />
    <div style="overflow: hidden">
      <q-calendar
        refs="calendar"
        v-model="selectedDate"
        view="week"
        locale="en-us"
        animated
        transition-prev="slide-right"
        transition-next="slide-left"
        style="height: 400px; overflow: hidden"
      />
    </div>
  </div>
  -->
</template>

<script>
import 'v-calendar/dist/style.css';
export default {
  data() {

    return {
      masks: {
        weekdays: 'WWWW',
      },
      data:[],
       attributes:[],
        selectedDate: '',
         date: new Date(),


    };
  },
  created() {},
  mounted() {
    this.misdatos();
  },
  methods: {
    misdatos() {
      this.$q.loading.show();
      this.$api.get(process.env.API+"/proyectoslibre").then((res)=>{
         this.data =res.data
           this.attributes=[]
             let  propower={}
              let customData={}
               let highlight ={}
                let dot={}
                 let key=0
              let fecha= new Date()
              res.data.forEach(it =>{
                let anio=it.fecha.split('-')
               let hora1=it.hora.split(':')
             fecha= new Date(anio[0], anio[1]-1, anio[2],hora1[0],hora1[1],hora1[2])
           key=it.id
             customData={
               fecha:it.fecha,
              hora:it.hora,
              title:it.nombre,
              class:'bg-blue-500 text-white'

            }
             propower={
               label:it.nombre,
              labelClass:'bg-blue-500 text-white',
              isInteractive:true,
            }
            highlight ={
              color:'red',
              fillMode:'none',
            }
           dot={
             color:'blue'
            }
            this.attributes.push({key:key,dates:fecha,customData:customData, order: 0, content: 'red',  highlight:highlight, dot:dot,popover:propower})

           })
              propower={
               label:'hoy',
              labelClass:'bg-blue-500 text-white',
              isInteractive:true,
            }
       fecha= new Date()
         this.attributes.push({key:1000,dates:fecha,customData:customData, order: 0, content: 'red',  highlight:highlight, dot:dot,popover:propower})
       // this.attributes.push({key:100000,dates:fecha, order: 0, content: 'red'})
        // console.log(this.attributes)
         this.$q.loading.hide();
       });
    },
    calendarNext () {
      this.$refs.calendar.next()
    },
    calendarPrev () {
      this.$refs.calendar.prev()
    }
  },
  ver(){
    console.log('ads')

  }
};
</script>
