<template>
  <section>
    <div class="flex justify-center items-center bg-white w-full h-[250px]">
      <div id="total" class="flex justify-center items-center space-x-36">
        <div>
            <h1 class="data">{{all_category}}</h1>
            <p>รายวิชา</p>
          </div>
          <div class="bg-[#EBC919] w-[4px] h-[60px]"></div>
        <div>
          <h1 class="data">{{all_user}}</h1>
          <p>ลงทะเบียน</p>
        </div>
        <div class="bg-[#EBC919] w-[4px] h-[60px]"></div>
        <div>
          <h1>{{all_enrolled}}</h1>
          <p>เรียนแล้ว</p>
        </div>
        <div class="bg-[#EBC919] w-[4px] h-[60px]"></div>
        <div>
          <h1>{{all_course}}</h1>
          <p>คอร์ส</p>
        </div>
      </div>
    </div>
  </section>
</template>

<script>
export default {
  mounted() {
    this.axios.get("http://localhost:3000/api/user/all").then((res) => {
      this.all_user= res.data.length
    })

    this.axios.get("http://localhost:3000/api/course/getenrolled/all").then((res) => {
      this.all_enrolled = res.data.length
    })

    this.axios.get("http://localhost:3000/api/course").then((res) => {
      this.all_course = res.data.length
    })

    this.axios.get("http://localhost:3000/api/category/").then((res) => {
      this.all_category = res.data.length
    })
  },
  data() {
    return {
      all_user: null,
      all_enrolled: null,
      all_course: null,
      all_category: null,
    }
  }
}
</script>
