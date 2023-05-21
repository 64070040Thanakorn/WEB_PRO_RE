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
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import axios from 'axios';
import course from '../components/profile/course.vue';
import payment from '../components/profile/payment.vue';
import user from '../components/profile/user.vue';

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
    const token = localStorage.getItem('token')
    if(!token) {
      this.$router.push('/')
    }
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