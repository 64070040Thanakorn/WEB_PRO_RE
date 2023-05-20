<template>
  <div class="flex justify-between">
    <label for="" class="text-4xl mx-4">ข้อมูลผู้ใช้</label>
    <div class="flex w-[50%]">
      <form class="w-full">
        <input id="" type="search" class="block w-full px-4 py-2 text-sm text-gray-900 border border-gray-950 rounded-3xl" placeholder="ค้นหาคอร์สเรียน" v-model="searchValue">
      </form>
      <div class="flex mx-2">
        <button data-dropdown-toggle="dropdown" class="text-black border border-gray-950 bg-white font-medium rounded-3xl text-sm w-36 px-2 py-2 text-center inline-flex justify-center items-center" type="button">
          เรียงตาม
          <svg class="w-4 h-4 ml-2" aria-hidden="true" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"> <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7"></path>
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
              <a href="#" class="block px-4 py-2 hover:bg-gray-100">วันที่ลงเรียน : (ก่อน - หลัง)</a>
            </li>
            <li>
              <a href="#" class="block px-4 py-2 hover:bg-gray-100">วันที่ลงเรียน : (หลัง - ก่อน)</a>
            </li>
          </ul>
        </div>
      </div>
    </div>
  </div>

  <div v-if="1" class="flex justify-center w-full">
    <table class="w-full mt-5 w-full">
      <thead class="">
        <tr class="">
          <td class="px-4 py-3">User</td>
          <td class="px-4 py-3">First Name</td>
          <td class="px-4 py-3">Last Name</td>
          <td class="px-4 py-3">Email</td>
          <td class="px-4 py-3">Role</td>
          <td class="px-4 py-3">Action</td>
        </tr>
      </thead>
      <tbody>
        <tr v-for="(user, index) in filteredItems" :key="index" class="text-sm">
          <td class="border-b border-[#F4F4F4] px-4 py-3">
            <img class="h-[30px] w-[30px] rounded-full" :src="user.image ? 'http://localhost:5000/images/' + user.image : 'https://media.discordapp.net/attachments/1067453596351856650/1096914677780451378/Portrait_Placeholder.png'" alt=""/>
          </td>
          <td class="border-b border-[#F4F4F4] px-4 py-3">
            {{ user.first_name }}
          </td>
          <td class="border-b border-[#F4F4F4] px-4 py-3">
            {{ user.last_name }}
          </td>
          <td class="border-b border-[#F4F4F4] px-4 py-3">
            {{ user.email }}
          </td>
          <td class="border-b border-[#F4F4F4] px-4 py-3">
            {{ user.role }}
          </td>
          <td class="border-b border-[#F4F4F4] px-4 py-3">
            <button class="underline text-red-500" @click="removingUser(user.user_id)">Remove</button>
          </td>
        </tr>
      </tbody>
    </table>
  </div>
  <div v-else class="flex justify-center items-center p-60 text-xl">
    <p>
      ไม่มีข้อมูลผู้ใช้
    </p>
  </div>
</template>

<script>
import axios from 'axios';


export default {
  props: {
    user: {
      type: Object,
      required: true,
    }
  },
  data() {
    return {
      searchValue: null,
    }
  },
  emits: ['user-change'],
  computed:{
    filteredItems() {
      return this.searchValue ? this.user.filter((item) => item.title.toLocaleLowerCase().includes(this.searchValue.toLocaleLowerCase())) : this.user
    },
  },
  methods: {
    async removingUser(id){
      await axios.delete(`http://localhost:3000/api/auth/${id}/deleteAcc`)
        .then(res => {
          this.$emit('user-change')
        })
    }
  }
}

</script>