<template>
  <div class="flex justify-between">
    <label for="" class="text-4xl mx-4">ประวัติการชำระเงิน</label>
  </div>

  <div v-if="payment.length > 0" class="justify-items-center">
    <table class="w-full mt-5 w-full">
      <thead class="">
        <tr class="">
          <td class="px-4 py-3">ID</td>
          <td class="px-4 py-3">Order</td>
          <td class="px-4 py-3">Summary</td>
          <td class="px-4 py-3">Date</td>
        </tr>
      </thead>
      <tbody>
        <tr v-for="(row, index) in payment" :key="index" class="text-sm">
          <td class="border-b border-[#F4F4F4] px-4 py-3">
            {{ row.payment_history_id }}
          </td>
          <td class="border-b border-[#F4F4F4] px-4 py-3">
            {{ row.course.title }}
          </td>
          <td class="border-b border-[#F4F4F4] px-4 py-3">
            {{ row.summary }}
          </td>
          <td class="border-b border-[#F4F4F4] px-4 py-3">
            {{ row.createdAt.split('T')[0] }}
          </td>
        </tr>
      </tbody>
    </table>
  </div>
  <div v-else class="flex justify-center items-center p-60 text-xl">
    <p>
      ไม่มีประวัติการชำระเงิน
      <RouterLink to="/search" class="text-orange-01">เพิ่มประวิติการชำเงินตอนนี้!</RouterLink>
    </p>
  </div>
</template>

<script>


export default {
  props: {
    data: {
      type: Object,
      required: true,
    }
  },
  data() {
    return {
      course: [],
      payment: [],
    }
  },
  mounted(){
    this.axios.get(`http://localhost:3000/api/user/by/${localStorage.getItem('user')}`)
      .then(res => {
        this.userLog_on = res.data
      })
    this.axios.get(`http://localhost:3000/api/payment/by/${localStorage.getItem('user')}`)
      .then(res => {
        this.payment = res.data
      })
  },
  methods: {
    async getCourse(){
      await axios.get('http//localhost:3000/api/course')
    }
  }
}

</script>