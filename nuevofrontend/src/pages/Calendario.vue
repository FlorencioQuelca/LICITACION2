<template>
<div>

<v-calendar :attributes="attributes" @dayclick="onDayClick" />
</div>
</template>

<script>

export default {


  data() {

    return {
     fecha: new Date(),
     date:'2022/10/13',
     events:[ '2022/10/13', '2022/10/14', '2022/10/15', '2022/10/16', '2022/10/17' ],
      selectedDate: ''
    };
  },
  created() {},
  mounted() {

  },
  methods: {
    eventsFn (date) {
       if (date === '2022/10/13' ||
          date === '2022/10/14' ||
          date === '2022/10/15' ||
          date === '2022/10/16' ||
          date === '2022/10/16') {
          return true
        }
        return false
      },
  }
};
</script>
