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
  <div class="mt-16">
    <div class="flex">
      <label class="w-[20%]" for="">ชื่อ</label>
      <input class="border rounded px-3 py-1 w-[30%]" type="text" v-model="data.first_name"/>
    </div>
    <div class="flex">
      <div class="w-[20%]" for=""></div>
      <p v-if="!v$.data.first_name.required.$response" class="text-red-500 text-xs">
         *This field is required
      </p>
    </div>
    <div class="h-[2px] w-full bg-[#F6F6F6] rounded mt-5"></div>
    <div class="flex mt-5">
      <label class="w-[20%]" for="">นามสกุล</label>
      <input class="border rounded px-3 py-1 w-[30%]" type="text" v-model="data.last_name"/>
    </div>
    <div class="flex">
      <div class="w-[20%]" for=""></div>
      <p v-if="!v$.data.last_name.required.$response" class="text-red-500 text-xs">
         *This field is required
      </p>
    </div>
    <div class="h-[2px] w-full bg-[#F6F6F6] rounded mt-5"></div>
    <div class="flex mt-5">
      <label class="w-[20%]" for="">รหัสผ่าน</label>
      <div v-if="togglePassword" class="flex flex-col space-y-3 w-[30%]">
        <!-- <input class="border rounded px-3 py-1 w-full" type="password" placeholder="Old Password" v-model="OldPassword"/> -->
        <div class="flex flex-col">
          <input class="border rounded px-3 py-1 w-full" type="password" placeholder="New Password" v-model="NewPassword"/>
          <template v-if="v$.NewPassword.$model">
            <span v-if="!v$.NewPassword.complex.$response" class="text-red-500 text-xs">
              *Password is not safe
            </span>
          </template>
        </div>
        <div class="flex flex-col">
          <input class="border rounded px-3 py-1 w-full" type="password" placeholder="Confirm Password" v-model="ConfirmPassword"/>
          <template v-if="v$.ConfirmPassword.$model">
                <span
                  v-if="!v$.ConfirmPassword.sameAsNewPassword.$response"
                  class="text-red-500 text-xs"
                  >*Password not match</span
                >
              </template>
        </div>
      </div>
      
      <input v-else class="border bg-gray-200 text-gray-700 rounded px-3 py-1 w-[30%]" type="password" v-model="data.password" readonly/>
      <button v-if="togglePassword" class="underline ml-7 align-top flex" @click="toggle()">ยกเลิก</button>
      <button v-if="togglePassword" class="underline ml-7 align-top flex" @click="changepassword()">เปลี่ยนรหัสผ่าน</button>
      <button v-if="!togglePassword" class="underline ml-7 align-top flex" @click="toggle()">แก้ไขรหัสผ่าน</button>
    </div>
    <div class="h-[2px] w-full bg-[#F6F6F6] rounded mt-5"></div>
    <div class="flex mt-5">
      <label class="w-[20%]" for="">อีเมล</label>
      <input class="border rounded px-3 py-1 w-[30%]" type="email" v-model="data.email"/>
    </div>
    <div class="flex">
      <div class="w-[20%]" for=""></div>
      <p v-if="!v$.data.email.required.$response" class="text-red-500 text-xs">
        *This field is required
      </p>
    </div>
    <div class="flex">
      <div class="w-[20%]" for=""></div>
      <p v-if="!v$.data.email.email.$response" class="text-red-500 text-xs">
        *Invalid email
      </p>
    </div>
    <div class="h-[2px] w-full bg-[#F6F6F6] rounded mt-5"></div>
    <div class="flex mt-5">
      <label class="w-[20%]" for="">เบอร์โทร</label>
      <input class="border rounded px-3 py-1 w-[30%]" type="email" v-model="data.phone"/>
    </div>
    <div class="flex">
      <div class="w-[20%]" for=""></div>
      <p v-if="!v$.data.phone.minLength.$response" class="text-red-500 text-xs">
        *Must be at least 9 digits
      </p>
    </div>
    <div class="flex">
      <div class="w-[20%]" for=""></div>
      <p v-if="!v$.data.phone.maxLength.$response" class="text-red-500 text-xs">
        *Must be at most 10 digits
      </p>
    </div>
    <div class="h-[2px] w-full bg-[#F6F6F6] rounded mt-5"></div>
    <div class="flex mt-5">
        <label class="w-[20%]" for="">ที่อยู่</label>
        <textarea name="" cols="30" rows="10" class="border p-2 w-[30%]" v-model="data.address"></textarea>
    </div>
    <div class="h-[2px] w-full bg-[#F6F6F6] rounded mt-5"></div>
    <div class="flex mt-5">
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
import { useVuelidate } from "@vuelidate/core";
import { email, minLength, maxLength ,required, sameAs } from "@vuelidate/validators";
import axios from 'axios';
import Swal from 'sweetalert2'


export function complexPassword(value) {
  if (!(value.match(/[a-z]/) && value.match(/[A-Z]/) && value.match(/[0-9]/))) {
    return false
  }
  return true
}

export default {
  setup(){
    return { v$: useVuelidate() };
  },
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
      togglePassword: false,
      // OldPassword: '',
      NewPassword: null,
      ConfirmPassword: null,
    }
  },
  validations(){
    return {
      data: {
        first_name: {
          required
        },
        last_name: {
          required
        },
        email: {
          required,
          email
        },
        phone: {
          minLength: minLength(9),
          maxLength: maxLength(10)
        },
      },
      NewPassword: {
        required: required,
        minLength: minLength(8),
        complex: {
          $validator: complexPassword,
        }
      },
      ConfirmPassword: {
        required: required,
        sameAsNewPassword: sameAs(this.NewPassword),
      },
    }
  },
  methods: {
    updateData() {
      if (this.v$.data.$invalid) {
        Swal.fire(
          'Error!',
          'โปรดตรวจสอบความถูกต้องของข้อมูล',
          'error'
        )
        return false;
      }
      axios.put(`http://localhost:3000/api/user/`, this.data, {
        headers: {
          'x-access-token': localStorage.getItem("token"),
        },
      })
          .then(res => {
            Swal.fire(
              'Success!',
              'แก้ไขข้อมูลสำเร็จ',
              'success'
            )
          })
          .catch(res => {
            Swal.fire(
              'error!',
              'โปรดตรวจสอบความถูกต้องของข้อมูล',
              'error'
            )
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
    toggle(){
      this.togglePassword = !this.togglePassword
      if(this.togglePassword){
        this.NewPassword = ''
        this.ConfirmPassword = ''
      }
    },
    changepassword(){
      this.v$.$touch;
      if (this.v$.NewPassword.$invalid || this.v$.ConfirmPassword.$invalid) {
        Swal.fire(
          'Error!',
          'โปรดตรวจสอบความถูกต้องของข้อมูล',
          'error'
        )
        return false
      }
      const password = {
        user_id: this.data.user_id,
        password: this.NewPassword
      }

      axios.put(`http://localhost:3000/api/user/changepassword/${this.data.user_id}`, password, {
        headers: {
          'x-access-token': localStorage.getItem("token"),
        },
      })
      .then((res) => {
        console.log(res.data);
        Swal.fire(
          'Success!',
          'แก้ไขรหัสผ่านสำเร็จ',
          'success'
        )
        setTimeout(function() {
          window.location.reload()
        }, 2000);
      })
    }
  }
}

</script>