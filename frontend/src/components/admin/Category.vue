<template>
  <div class="flex justify-between">
    <label for="" class="text-4xl mx-4">ประเภทวิชา</label>
    <div class="flex w-[50%]">
      <form class="w-full">
        <input id="" type="search" class="block w-full px-4 py-2 text-sm text-gray-900 border border-gray-950 rounded-3xl" placeholder="ค้นหาประเภทวิชา" v-model="searchValue">
      </form>
      <!-- <div class="flex mx-2">
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
      </div> -->
    </div>
  </div>
  <div v-if="category.length > 0" class="flex flex-col justify-center w-full items-center">
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

          <!-- <td v-if="editCategory && editRows === index" class="border-b border-[#F4F4F4] px-4 py-3 space-x-3">
            <label for="">ชื่อประเภทวิชา : {{ v$.category }}</label>
            <input class="border rounded px-3 py-1 w-[15vw]" type="text" v-model="category.category_name"/>
          </td> -->
          <td v-if="editCategory && editRows === index" class="border-b border-[#F4F4F4] px-4 py-3 space-x-3">
            <label for="">ชื่อประเภทวิชา :</label>
            <input class="border rounded px-3 py-1 w-[15vw]" type="text" v-model="category.category_name"/>
          </td>
          <td v-else class="border-b border-[#F4F4F4] px-4 py-3">
            {{ category.category_name }}
          </td>

          <td v-if="editCategory && editRows === index" class="border-b border-[#F4F4F4] px-4 py-3 space-x-3 flex">
            <label class="flex flex-col justify-start" for="">รายละเอียดวิชา :</label>
            <textarea class="border rounded px-3 py-1 w-[20vw]" type="text" v-model="category.category_detail"> </textarea>
          </td>
          <td v-else class="border-b border-[#F4F4F4] px-4 py-3">
            {{ category.category_detail }}
          </td>
          <td v-if="editCategory && editRows === index" class="border-b border-[#F4F4F4] px-4 py-3 space-x-3">
            <label for="">สี :</label>
            <input class="border rounded px-3 py-1 w-[15vw]" type="text" v-model="category.category_color"/>
          </td>
          <td v-else class="border-b border-[#F4F4F4] px-4 py-3">
            {{ category.category_color }}
          </td>
          <td v-if="editCategory && editRows === index" class="flex space-x-2 justify-center items-center border-b border-[#F4F4F4] px-4 py-3">
            <button class="underline" @click="edit(index, category)">Cancel</button>
            <button class="text-green-500 underline" @click="updateCategory(category)">Save</button>
          </td>
          <td v-else class="flex space-x-2 justify-center items-center border-b border-[#F4F4F4] px-4 py-3">
            <button class="underline" @click="edit(index, category)">Edit</button>
            <button class="text-red-500 underline" @click="removingCategory(category.category_id)">Remove</button>
          </td>
        </tr>




        <tr v-if="Adding" class="text-sm">
          <td class="border-b border-[#F4F4F4] px-4 py-3 space-x-3">
            <div class="flex space-x-3">
              <label for="">ชื่อประเภทวิชา :</label>
              <div class="flex flex-col">
                <input class="border rounded px-3 py-1 w-[15vw]" type="text" v-model="category_new.category_name"/>
                <span v-if="!v$.category_new.category_name.required.$response" class="text-red-500 text-xs">
                  *กรุณากรอกข้อมูล
                </span>
              </div>
            </div>
          </td>
          <td class="border-b border-[#F4F4F4] px-4 py-3 space-x-3">
            <div class="flex space-x-3">
              <label class="flex flex-col justify-start" for="">รายละเอียดวิชา :</label>
              <div class="flex flex-col">
                <textarea class="border rounded px-3 py-1 w-[20vw]" type="text" v-model="category_new.category_detail"></textarea>
                <span v-if="!v$.category_new.category_detail.required.$response" class="text-red-500 text-xs">
                  *กรุณากรอกข้อมูล
                </span>
              </div>
            </div>
          </td>
          <td class="border-b border-[#F4F4F4] px-4 py-3 space-x-3">
            <div class="flex space-x-3">
              <label for="">สี :</label>
              <div class="flex flex-col">
                <input class="border rounded px-3 py-1 w-[15vw]" type="text" v-model="category_new.category_color"/>
                <span v-if="!v$.category_new.category_color.required.$response" class="text-red-500 text-xs">
                  *กรุณากรอกข้อมูล
                </span>
              </div>
            </div>
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
import { useVuelidate } from '@vuelidate/core';
import { required } from '@vuelidate/validators';
import axios from 'axios';
import Swal from 'sweetalert2'

export default {
  setup() {
    return { v$: useVuelidate() };
  },
  props: {
    category: {
      type: Object,
      required: true,
    }
  },
  data() {
    return {
      searchValue: null,
      Adding: false,
      category_new: {
        category_name: null,
        category_detail: null,
        category_color: null,
      },
      editRows: null,
      editCategory: false,
      temp: {}
    }
  },
  emits: ['category-change'],
  computed:{
    filteredItems() {
      return this.searchValue ? this.category.filter((item) => item.category_name.toLocaleLowerCase().includes(this.searchValue.toLocaleLowerCase())) : this.category
    },
  },
  validations() {
    return {
      category_new: {
        category_name: { required },
        category_detail: { required },
        category_color: { required },
      },
      category: this.category.reduce((validations, item) => {
      validations[item.category_id] = {
        category_name: { required },
        category_detail: { required },
        category_color: { required },
      };
      return validations;
    }, {}),
    };
  },
  methods: {
    async removingCategory(category){
      await axios.delete(`http://localhost:3000/api/category/delete/${category}`, {
        headers: {
          'x-access-token': localStorage.getItem("token"),
        },
      })
        .then(res => {
          this.$emit('category-change')
          Swal.fire(
            'Success!',
            'ลบข้อมูลรายวิชาสำเร็จ',
            'warning'
          )
        })
        .catch((err) => {
          Swal.fire(
            'Error!',
            'ไม่สารถลบข้อมูลรายวิชานี้ได้',
            'error'
          )
        })
    },
    edit(index, category){
      this.temp = null
      // if (this.editCategory) {
      //    this.editCategory = !this.editCategory
      // }
      this.editCategory = !this.editCategory
      if(this.editCategory){
        this.editRows = index
        this.temp  = JSON.parse(JSON.stringify(this.filteredItems[index]))
      } else {
        this.editRows = null
        // this.filteredItems[index] = this.temp
        this.temp = null
      }
    },
    async updateCategory(category){
      // API HERE
      await axios.put(`http://localhost:3000/api/category/updateCategory/${category.category_id}`, {
        category_name: category.category_name,
        category_detail: category.category_detail,
        category_color: category.category_color
      }, {
        headers: {
          'x-access-token': localStorage.getItem("token"),
        },
      })
      .then( (res) => {
        this.$emit('category-change')
        this.editRows = null
         Swal.fire(
          'Success!',
          'แก้ไขรายวิชาสำเร็จ',
          'success'
        )
      })
    },
    addCategory(){
      if (this.v$.category_new.$invalid) {
        Swal.fire(
          'Error!',
          'โปรดตรวจสอบความถูกต้องของข้อมูล',
          'error'
        )
        return false;
      }
      const data = {
        category_name: this.category_new.category_name,
        category_detail: this.category_new.category_detail,
        category_color: this.category_new.category_color ? this.category_new.category_color: null,
      }
      this.axios.post("http://localhost:3000/api/category/addCategory/", data, {
        headers: {
          'x-access-token': localStorage.getItem("token"),
        },
      }).then((res) => {
        this.$emit('category-change')
        this.category_new.category_name = null
        this.category_new.category_detail = null
        this.category_new.category_color = null
        console.log(res.data);
        Swal.fire(
          'Success!',
          'เพิ่มรายวิชาสำเร็จ',
          'success'
        )
      })
      .catch((err) => {
        console.log(err.respones.message);
        Swal.fire(
          'Error!',
          'โปรดตรวจสอบความถูกต้องของข้อมูล',
          'error'
        )
      })
      this.Adding = false
    },
    adding(){
      this.Adding = !this.Adding
      console.log(this.Adding);
    }
  }
}

</script>