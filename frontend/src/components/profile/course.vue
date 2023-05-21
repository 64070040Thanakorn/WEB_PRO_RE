<template>
  <div class="flex justify-between">
    <label for="" class="text-4xl mx-4">คอร์สเรียนของฉัน</label>
    <div class="flex w-[50%]">
      <form class="w-full">
        <input
          id=""
          type="search"
          class="block w-full px-4 py-2 text-sm text-gray-900 border border-gray-950 rounded-3xl"
          placeholder="ค้นหาคอร์สเรียน"
        />
      </form>
      <!-- <div class="flex mx-2">
        <button
          data-dropdown-toggle="dropdown"
          class="text-black border border-gray-950 bg-white font-medium rounded-3xl text-sm w-36 px-2 py-2 text-center inline-flex justify-center items-center"
          type="button"
        >
          เรียงตาม
          <svg
            class="w-4 h-4 ml-2"
            aria-hidden="true"
            fill="none"
            stroke="currentColor"
            viewBox="0 0 24 24"
            xmlns="http://www.w3.org/2000/svg"
          >
            <path
              stroke-linecap="round"
              stroke-linejoin="round"
              stroke-width="2"
              d="M19 9l-7 7-7-7"
            ></path>
          </svg>
        </button>
        <div id="dropdown" class="z-10 hidden bg-white divide-y divide-gray-100 rounded-lg shadow w-48">
          <ul class="py-2 text-sm text-gray-700 text-center" aria-labelledby="dropdownDefaultButton">
            <li>
              <a href="#" class="block px-4 py-2 hover:bg-gray-100">A - Z</a>
            </li>
            <li>
              <a href="#" class="block px-4 py-2 hover:bg-gray-100">Z - A</a>
            </li>
            <li>
              <a href="#" class="block px-4 py-2 hover:bg-gray-100"
                >วันที่ลงเรียน : (ก่อน - หลัง)</a
              >
            </li>
            <li>
              <a href="#" class="block px-4 py-2 hover:bg-gray-100">วันที่ลงเรียน : (หลัง - ก่อน)</a>
            </li>
          </ul>
        </div>
      </div> -->
    </div>
  </div>
  <div v-if="course.length > 0" class="grid grid-cols-1 lg:grid-cols-2 xl:grid-cols-3 2xl:grid-cols-4 gap-4 mt-4 mb-12 justify-items-center">
    <div v-for="item in course">
      <Main_card :item="item.course" :user-log_on="userLog_on"></Main_card>
    </div>
  </div>
  <div v-else class="flex justify-center items-center p-60 text-xl">
    <p>
      คุณยังไม่มีคอร์สที่เรียน
      <RouterLink to="/search" class="text-orange-01"
        >ลงคอร์สเรียนที่สนใจตอนนี้!</RouterLink
      >
    </p>
  </div>
</template>

<script setup>
import axios from "axios";
import Main_card from "../main_card.vue";
</script>

<script>
export default {
  props: {
    data: {
      type: Object,
      required: true,
    },
  },
  beforeMount(){
    if(this.user){
      this.axios.get(`http://localhost:3000/api/user/by/${localStorage.getItem('user')}`)
        .then(res => {
          this.userLog_on = res.data
        })
    }
  },
  mounted() {
    this.user = localStorage.getItem('user')
    axios
      .get(`http://localhost:3000/api/course/getenrolled/${localStorage.getItem("user")}`)
      .then((res) => {
        this.course = res.data;
      });
  },
  data() {
    return {
      user: {},
      userLog_on: {},
      course: [],
    };
  },
};
</script>
