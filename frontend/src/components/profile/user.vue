<template>
  <div class="flex justify-between">
    <div class="flex justify-center items-center space-x-10">
      <div class="w-[200px] h-[200px] border-white border-[5px] rounded-full overflow-hidden drop-shadow-md">
        <img :src="data.user_image ? `http://localhost:3000/images/${data.user_image}` : 'https://media.discordapp.net/attachments/1067453596351856650/1096914677780451378/Portrait_Placeholder.png'" alt="" class="w-full h-full object-cover"/>
      </div>
      <div class="flex flex-col">
        <h5 class="text-2xl">จัดการแก้ไขโปรไฟล์</h5>
        <p>อัพเดทแก้ไขข้อมูลส่วนตัว</p>
      </div>
    </div>
    <div class="space-x-1">
      <button class="bg-[#2B26D8] rounded text-white px-4 py-2" @click="updateData()">
        บันทึกโปรไฟล์
      </button>
    </div>
  </div>
  <div class="space-y-5 mt-16">
    <div class="flex">
      <label class="w-[20%]" for="">ชื่อ</label>
      <input class="border rounded px-3 py-1 w-[30%]" type="text" v-model="data.first_name"/>
    </div>
    <div class="h-[2px] w-full bg-[#F6F6F6] rounded"></div>
    <div class="flex">
      <label class="w-[20%]" for="">นามสกุล</label>
      <input class="border rounded px-3 py-1 w-[30%]" type="text" v-model="data.last_name"/>
    </div>
    <div class="h-[2px] w-full bg-[#F6F6F6] rounded"></div>
    <div class="flex">
      <label class="w-[20%]" for="">อีเมล</label>
      <input class="border rounded px-3 py-1 w-[30%]" type="email" v-model="data.email"/>
    </div>
    <div class="flex">
      <label class="w-[20%]" for="">เบอร์โทร</label>
      <input class="border rounded px-3 py-1 w-[30%]" type="email" v-model="data.phone"/>
    </div>
    <div class="h-[2px] w-full bg-[#F6F6F6] rounded"></div>
    <div class="flex">
        <label class="w-[20%]" for="">ที่อยู่</label>
        <textarea name="" cols="30" rows="10" class="border p-2 w-[30%]" v-model="data.address"></textarea>
    </div>
    <div class="h-[2px] w-full bg-[#F6F6F6] rounded"></div>
    <div class="flex">
      <label class="w-[20%]" for="">
        โปรไฟล์
        <p class="">แก้ไขรูปภาพของคุณ</p>
      </label>
      <div class="flex flex-col">
        <div class="flex justify-between">
          <div class="w-[100px] h-[100px] overflow-hidden rounded-full">
            <img :src="file ? imageUrl : data.user_image ? `http://localhost:3000/images/${data.user_image}` : 'https://media.discordapp.net/attachments/1067453596351856650/1096914677780451378/Portrait_Placeholder.png'" alt="" class="w-full h-full object-cover"/>
          </div>
          <div class="space-x-3">
            <button @click="change()" class="text-red-700  hover:text-red-900">
              อัพเดท
            </button>
          </div>
        </div>
        <div>
          <input id="image-upload" class="block w-full text-sm text-gray-900 border border-gray-300 cursor-pointer bg-gray-50 dark:text-gray-400 focus:outline-none mt-8" type="file" accept="image/*" @change="onFileSelected"/>
        </div>
      </div>
    </div>
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
      file: null,
      imageUrl: null,
    }
  },
  methods: {
    updateData() {
      axios.put(`http://localhost:3000/api/user/`, this.data, {
        headers: {
          'x-access-token': localStorage.getItem("token"),
        },
      })
          .then(res => {
            this.asyncData()
          })
    },
    onFileSelected(event) {
      const selectedFile = event.target.files[0];
      this.file = selectedFile;
      try{
        this.imageUrl = URL.createObjectURL(selectedFile);
      } catch(err){
      }
    },
    change() {
      if (this.file) {
        const x = new FormData();
        x.append("user_id", this.data.user_id);
        x.append("fileupload", this.file);
        axios.put(`http://localhost:3000/api/user/updateImage`, x, {
          headers: {
          'x-access-token': localStorage.getItem("token"),
        },
        })
          .then(
            window.location.reload()
          )
      }
    },
  }
}

</script>