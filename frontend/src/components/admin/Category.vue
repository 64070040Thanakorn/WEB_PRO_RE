<template>
  <div class="flex justify-between">
    <label for="" class="text-4xl mx-4">ประเภทวิชา</label>
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

  <div v-if="1" class="flex flex-col justify-center w-full items-center">
    <table class="w-full mt-5 w-full">
      <thead class="">
        <tr class="">
          <td class="px-4 py-3 w-[30vw]">Name</td>
          <td class="px-4 py-3 w-[30vw]">Detail</td>
          <td class="px-4 py-3 w-[30vw]">Color</td>
          <td class="px-4 py-3">Action</td>
        </tr>
      </thead>
      <tbody>
        <tr v-for="(category, index) in filteredItems" :key="index" class="text-sm">
          <td class="border-b border-[#F4F4F4] px-4 py-3">
            {{ category.category_name }}
          </td>
          <td class="border-b border-[#F4F4F4] px-4 py-3">
            {{ category.category_detail }}
          </td>
          <td class="border-b border-[#F4F4F4] px-4 py-3">
            {{ category.category_color }}
          </td>
          <td class="border-b border-[#F4F4F4] px-4 py-3">
            <button class="text-red-500" @click="removingCategory(category.category_id)">Remove</button>
          </td>
        </tr>
        <tr v-if="Adding" class="text-sm">
          <td class="border-b border-[#F4F4F4] px-4 py-3 space-x-3">
            <label for="">ชื่อประเภทวิชา :</label>
            <input class="border rounded px-3 py-1 w-[15vw]" type="text"/>
          </td>
          <td class="border-b border-[#F4F4F4] px-4 py-3 space-x-3">
            <label for="">รายละเอียดวิชา :</label>
            <input class="border rounded px-3 py-1 w-[15vw]" type="text"/>
          </td>
          <td class="border-b border-[#F4F4F4] px-4 py-3 space-x-3">
            <label for="">สี :</label>
            <input class="border rounded px-3 py-1 w-[15vw]" type="text"/>
          </td>
          <td class="border-b border-[#F4F4F4] px-4 py-3 space-x-3">
            <button @click="addCategory()" class="text-green-500">Add</button>
          </td>
        </tr>
      </tbody>
    </table>
    <button @click="adding" class="mt-3">เพิ่มประเภทวิชา</button>
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
    category: {
      type: Object,
      required: true,
    }
  },
  data() {
    return {
      searchValue: null,
      Adding: false
    }
  },
  emits: ['category-change'],
  computed:{
    filteredItems() {
      return this.searchValue ? this.category.filter((item) => item.title.toLocaleLowerCase().includes(this.searchValue.toLocaleLowerCase())) : this.category
    },
  },
  methods: {
    async removingCategory(category){
      await axios.delete(`http://localhost:3000/api/category/`, category)
        .then(res => {
          this.$emit('category-change')
        })
    },
    addCategory(){
      this.Adding = false
    },
    adding(){
      this.Adding = !this.Adding
      console.log(this.Adding);
    }
  }
}

</script>