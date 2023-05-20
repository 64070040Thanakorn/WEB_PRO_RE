<template>
  <div class="flex justify-center mb-52">
    <div class="flex flex-col my-10 mx-20 w-[90%]">
      <div class="flex justify-between">
        <div>
          <h1 class="text-4xl">Dashboard</h1>
          <p class="text-gray-400">Lorem ipsum dolor sit amet.</p>
        </div>
        <div class="flex space-x-7">
          <div class="flex flex-col space-y-5 p-2 w-[7vw]">
            <p class="text-gray-400">User</p>
            <p class="flex justify-end">
              <span class="text-5xl mr-2">{{ user.length }}</span>
              คน
            </p>
          </div>
          <div class="flex flex-col space-y-5 p-2 w-[7vw]">
            <p class="text-gray-400">Course</p>
            <p class="flex justify-end">
              <span class="text-5xl mr-2">{{ course.length }}</span>
              คอร์ส
            </p>
          </div>
        </div>
      </div>
      <div class="h-[2px] w-full bg-[#F6F6F6] rounded my-7"></div>
      <div class="flex flex-col space-y-5">
        <div class="mr-20">
          <ul class=flex>
            <div @click="changeComponent('course')" to="/dashboard/course">
              <li id="course_interface" :class="courseComponent ? 'underline': ''" class="px-4 py-2 rounded">คอร์สเรียน</li>
            </div>
            <div @click="changeComponent('user')" to="/dashboard/studytable">
              <li id="user_interface" :class="userComponent ? 'underline': ''" class="px-4 py-2 rounded">ข้อมูลผู้ใช้</li>
            </div>
          </ul>
        </div>
        <div class="">
          <course v-if="courseComponent" :course="course"/>
          <user v-if="userComponent" :user ="user" @user-change="fetchUser"/>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import course from '../components/admin/CreateCourse.vue';
import user from '../components/admin/User.vue';

export default {
  components:{
    user,
    course,
  },
  data() {
    return {
      user: [],
      course: [],
      courseComponent: false,
      userComponent: true
    }
  },
  beforeCreate(){
    this.axios.get(`http://localhost:3000/api/course/`)
      .then((response) => {
        this.course = response.data
      })
    this.axios.get(`http://localhost:3000/api/user/all`)
      .then(res => {
        this.user = res.data;
      })
  },
  methods: {
    changeComponent(el){
      switch(el) {
        case "user":
          this.userComponent = true
          this.courseComponent = false
          break;
        case "course":
          this.userComponent = false
          this.courseComponent = true
          break;
        default:
          return 0
      }
    },
    fetchUser(){
      this.axios.get(`http://localhost:3000/api/user/all`)
        .then(res => {
          this.user = res.data;
        })
    }
  }
}

</script>