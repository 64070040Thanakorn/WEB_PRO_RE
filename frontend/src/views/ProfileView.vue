<template>
  <div class="flex justify-center mb-52">
    <div class="flex flex-col my-10 mx-20 w-[90%]">
      <h1 class="text-4xl">Dashboard</h1>
      <div class="h-[2px] w-full bg-[#F6F6F6] rounded my-7"></div>
      <div class="flex">
        <div class="mr-20 w-[15%]">
          <ul>
            <div @click="changeComponent('user')" to="/dashboard/username">
              <li id="user-interface" :class="userComponent ? 'bg-gray-100': ''" class="px-4 py-2 rounded">รายละเอียดของฉัน</li>
            </div>
            <div @click="changeComponent('course')" to="/dashboard/course">
              <li id="course_interface" :class="courseComponent ? 'bg-gray-100': ''" class="px-4 py-2 rounded">คอร์สเรียน</li>
            </div>
            <div @click="changeComponent('payment')" to="/dashboard/studytable">
              <li id="payment_interface" :class="paymentComponent ? 'bg-gray-100': ''" class="px-4 py-2 rounded">ประวัติการชำระเงิน</li>
            </div>
          </ul>
        </div>
        <div class="w-[85%]">
          <user v-if="userComponent" :data="userData"/>
          <course v-if="courseComponent" :data="userData"/>
          <payment v-if="paymentComponent" :data ="userData"/>
          <!-- <div class="flex justify-between">
            <div class="flex justify-center items-center space-x-10">
              <div class="w-[200px] h-[200px] border-white border-[5px] rounded-full overflow-hidden drop-shadow-md">
                <img :src="file ? imageUrl : user.img ? `http://localhost:3000/images/${user.img}` : 'https://media.discordapp.net/attachments/1067453596351856650/1096914677780451378/Portrait_Placeholder.png'" alt="" class="w-full h-full object-cover"/>
              </div>
              <div class="flex flex-col">
                <h5 class="text-2xl">จัดการแก้ไขโปรไฟล์</h5>
                <p>อัพเดทแก้ไขข้อมูลส่วนตัว</p>
              </div>
            </div>
            <div class="space-x-1">
              <button class="bg-[#2B26D8] rounded text-white px-4 py-2">
                บันทึกโปรไฟล์
              </button>
            </div>
          </div>
          <div class="space-y-5 mt-16">
            <div class="flex">
              <label class="w-[20%]" for="">ชื่อ</label>
              <input class="border rounded px-3 py-1 w-[30%]" type="text" v-model="first_name"/>
            </div>
            <div class="h-[2px] w-full bg-[#F6F6F6] rounded"></div>
            <div class="flex">
              <label class="w-[20%]" for="">นามสกุล</label>
              <input class="border rounded px-3 py-1 w-[30%]" type="text" v-model="last_name"/>
            </div>
            <div class="h-[2px] w-full bg-[#F6F6F6] rounded"></div>
            <div class="flex">
              <label class="w-[20%]" for="">อีเมล</label>
              <input class="border rounded px-3 py-1 w-[30%]" type="email" v-model="email"/>
            </div>
            <div class="flex">
              <label class="w-[20%]" for="">เบอร์โทร</label>
              <input class="border rounded px-3 py-1 w-[30%]" type="email" v-model="phone"/>
            </div>
            <div class="h-[2px] w-full bg-[#F6F6F6] rounded"></div>
            <div class="flex">
                <label class="w-[20%]" for="">ที่อยู่</label>
                <textarea name="" cols="30" rows="10" class="border p-2 w-[30%]" v-model="address"></textarea>
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
                    <img :src="file ? imageUrl : user.img ? `http://localhost:3000/images/${user.img}` : 'https://media.discordapp.net/attachments/1067453596351856650/1096914677780451378/Portrait_Placeholder.png'" alt="" class="w-full h-full object-cover"/>
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
          </div> -->
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import axios from 'axios';
import course from '../components/profie/course.vue';
import payment from '../components/profie/payment.vue';
import user from '../components/profie/user.vue';

export default {
  components:{
    user,
    course,
    payment,
  },
  data() {
    return {
      userData: {},
      userComponent: true,
      courseComponent: false,
      paymentComponent: false,
    }
  },
  mounted() {
    this.getUser();
  },
  methods: {
    getUser() {
      axios.get(`http://localhost:3000/api/auth/${localStorage.getItem('user')}`)
        .then(res => {
          this.userData = res.data;
        })
        .catch(error => {
          console.error(error);
        });
    },
    changeComponent(el){
      switch(el) {
        case "user":
          this.courseComponent = false
          this.paymentComponent = false
          this.userComponent = true
          console.log('open user');
          break;
        case "course":
          this.userComponent = false
          this.paymentComponent = false
          this.courseComponent = true
          console.log('course user');

          break;
        case "payment":
          this.userComponent = false
          this.courseComponent = false
          this.paymentComponent = true
          console.log('payment user');

          break;
        default:
          return 0
      }
    }
  }
}

</script>