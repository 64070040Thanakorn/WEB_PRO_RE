<template>
  <div class="flex justify-between">
    <label for="" class="text-4xl mx-4">ประวัติการชำระเงิน</label>
  </div>

  <div v-if="0" class="grid grid-cols-1 lg:grid-cols-2 xl:grid-cols-3 2xl:grid-cols-4 gap-4 mt-4 mb-12 justify-items-center">

  </div>
  <div v-else class="flex justify-center items-center p-60 text-xl">
    <p>
      ไม่มีประวัติการชำระเงิน
      <RouterLink to="/search" class="text-orange-01">เพิ่มประวิติการชำเงินตอนนี้!</RouterLink>
    </p>
  </div>
</template>

<script>
import axios from 'axios';


export default {
  props: {
    data: {
      type: Object,
      required: true,
    }
  },
  data() {
    return {
      course: []
    }
  },
  methods: {
    async getCourse(){
      await axios.get('http//localhost:3000/api/course')
    }
  }
}

</script>