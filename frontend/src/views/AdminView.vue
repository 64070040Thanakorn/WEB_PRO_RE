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
          <ul class="flex">
            <div @click="changeComponent('category')">
              <li
                id="user_interface"
                :class="categoryComponent ? 'underline' : ''"
                class="px-4 py-2 rounded"
              >
                รายวิชา
              </li>
            </div>
            <div @click="changeComponent('course')">
              <li
                id="course_interface"
                :class="courseComponent ? 'underline' : ''"
                class="px-4 py-2 rounded"
              >
                คอร์สเรียน
              </li>
            </div>
            <div @click="changeComponent('user')">
              <li
                id="user_interface"
                :class="userComponent ? 'underline' : ''"
                class="px-4 py-2 rounded"
              >
                ข้อมูลผู้ใช้
              </li>
            </div>
          </ul>
        </div>
        <div class="">
          <category v-if="categoryComponent" :category="category" @category-change="fetchCategory"/>
          <course v-if="courseComponent" :course="course" :userLog_on="userLog_on" @change-course="fetchCourse"/>
          <user v-if="userComponent" :user="user" @user-change="fetchUser" />
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import category from "../components/admin/Category.vue";
import course from "../components/admin/Course.vue";
import user from "../components/admin/User.vue";

export default {
  components: {
    user,
    course,
    category,
  },
  data() {
    return {
      user: [],
      userLog_on: {},
      course: [],
      category: [],
      courseComponent: false,
      userComponent: false,
      categoryComponent: true,
    };
  },
  beforeCreate() {
    this.axios.get(`http://localhost:3000/api/course/`).then((response) => {
      this.course = response.data;
    });
    this.axios.get(`http://localhost:3000/api/category/`).then((response) => {
      this.category = response.data;
    });
    this.axios.get(`http://localhost:3000/api/user/all`).then((res) => {
      this.user = res.data;
    });
    this.axios
      .get(`http://localhost:3000/api/user/by/${localStorage.getItem('user')}`)
      .then((res) => {
        this.userLog_on = res.data;
      });
    const role = localStorage.getItem('role')
    console.log(role);
    if(role !== 'Admin') {
      this.$router.push('/')
    }
  },
  methods: {
    changeComponent(el) {
      switch (el) {
        case "user":
          this.userComponent = true;
          this.courseComponent = false;
          this.categoryComponent = false;
          break;
        case "course":
          this.userComponent = false;
          this.courseComponent = true;
          this.categoryComponent = false;
          this.axios.get(`http://localhost:3000/api/course/`).then((response) => {
            this.course = response.data;
          });
          break;
        case "category":
          this.userComponent = false;
          this.categoryComponent = true;
          this.courseComponent = false;
          break;
        default:
          return 0;
      }
    },
    fetchUser() {
      this.axios.get(`http://localhost:3000/api/user/all`).then((res) => {
        this.user = res.data;
      });
    },
    fetchCategory() {
      this.axios.get(`http://localhost:3000/api/category/`).then((res) => {
        this.category = res.data;
      });
    },
    fetchCourse() {
      this.axios.get(`http://localhost:3000/api/course/`).then((res) => {
        this.course = res.data;
      });
    },
  },
};
</script>
