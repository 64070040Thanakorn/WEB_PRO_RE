<script setup>
import gsap from "gsap";
import ScrollTrigger from "gsap/ScrollTrigger";
import { onMounted } from "vue";
import CourseDetail from "../components/course/CourseDetail.vue";
import CourseReview from "../components/course/CourseReview.vue";
import Main_card from "../components/main_card.vue";

gsap.registerPlugin(ScrollTrigger);

onMounted(() => {
  gsap.fromTo(
    ".slide",
    {
      opacity: 0,
      x: -15,
    },
    {
      x: 0,
      opacity: 1,
      duration: 1.2,
      stagger: 0.1,
      delay: 0.5,
      scrollTrigger: {
        // trigger: ".box",
        toggleActions: "play none none reset",
      },
    }
  );
});
</script>

<script>
export default {
  beforeCreate() {
    this.axios
      .get(`http://localhost:3000/api/course/${this.$route.params.course_id}`)
      .then((response) => {
        this.course_item = response.data;
        this.category_name = response.data.category.category_name;
        this.category_color = response.data.category.category_color;
        this.enrolled = response.data.enrolled;
      });

    this.axios.get(`http://localhost:3000/api/course/randomCourse/3`).then((response) => {
      this.random_course_item = response.data;
    });

    this.axios
      .get(`http://localhost:3000/api/comment/${this.$route.params.course_id}`)
      .then((response) => {
        this.comments = response.data;
      });

    this.axios
      .get(`http://localhost:3000/api/user/by/${localStorage.getItem("user")}`)
      .then((res) => {
        this.user = res.data;
      });

    this.axios
      .get(`http://localhost:3000/api/course/getEnrolledCourse/by/?user_id=${localStorage.getItem('user')}&course_id=${this.$route.params.course_id}`, {
      })
      .then((res) => {
        this.check_enrolled = res.data;
      });
  },
  mounted() {
    this.user = localStorage.getItem("user");
  },
  data() {
    return {
      showComponent: true,
      random_course_item: null,
      course_item: [],
      category_name: [],
      category_color: [],
      comments: [],
      enrolled: [],
      check_enrolled: [],
      user: {},
      userLog_on: {},
    };
  },
  methods: {
    toggleComponent() {
      this.showComponent = !this.showComponent;
    },
    fetchComment() {
      this.axios
      .get(`http://localhost:3000/api/comment/${this.$route.params.course_id}`)
      .then((response) => {
        this.comments = response.data;
      });
    },
    payment101(){
      const eiei = 'eiei'
      localStorage.setItem('payment', eiei)
    }
  },
};
</script>

<template>
  <div class="absolute z-[-1] w-full h-[510px] flex">
    <img
      :src="
        course_item.course_image
          ? `http://localhost:3000/images/${course_item.course_image}`
          : 'https://media.discordapp.net/attachments/1067453596351856650/1096913733281927369/no-picture-available-placeholder-thumbnail-icon-illustration-design.png'
      "
      class="w-full h-auto relative object-cover"
      alt="course_image"
    />
  </div>
  <div class="px-72 pt-20 pb-40">
    <div class="mx-12 space-y-10">
      <div class="bg-white px-12 py-5 h-[328px] space-y-6">
        <div class="flex space-x-4 text-white justify-between items-center">
          <p
            class="px-4 py-2 rounded-full"
            :style="`background-color: ${category_color}`"
          >
            {{ category_name }}
          </p>
          <div class="text-green-500 text-xl bg-black/5 px-4 py-2 rounded-md" v-if="this.user && this.check_enrolled.length > 0 && this.user.role !== 'Admin'">
            <span class="text-gray-01 font-light">status: </span>คุณกำลังเรียนคอร์สนี้อยู่
          </div>
          <div class="text-red-700 text-xl bg-black/5 px-4 py-2 rounded-md" v-if="this.user && this.check_enrolled.length < 1 && this.user.role !== 'Admin'">
            <span class="text-gray-01 font-light">status: </span>คุณไม่ได้เรียนคอร์สนี้
          </div>
        </div>
        <div class="flex justify-between items-center">
          <h1 class="text-[36px]">{{ course_item.title }}</h1>
          <div class="flex">
            <div class="flex space-x-3">
              <svg
                width="23"
                height="23"
                viewBox="0 0 23 23"
                fill="none"
                xmlns="http://www.w3.org/2000/svg"
              >
                <g clip-path="url(#clip0_173_469)">
                  <path
                    d="M17.9238 17.2587C16.9311 15.5337 15.0668 14.3748 12.9375 14.3748H10.0625C7.9332 14.3748 6.06895 15.5337 5.07617 17.2587C6.65742 19.0197 8.94844 20.1248 11.5 20.1248C14.0516 20.1248 16.3426 19.0152 17.9238 17.2587ZM0 11.4998C0 8.44977 1.2116 5.5247 3.36827 3.36803C5.52494 1.21136 8.45001 -0.000244141 11.5 -0.000244141C14.55 -0.000244141 17.4751 1.21136 19.6317 3.36803C21.7884 5.5247 23 8.44977 23 11.4998C23 14.5497 21.7884 17.4748 19.6317 19.6315C17.4751 21.7882 14.55 22.9998 11.5 22.9998C8.45001 22.9998 5.52494 21.7882 3.36827 19.6315C1.2116 17.4748 0 14.5497 0 11.4998ZM11.5 12.2185C12.3578 12.2185 13.1805 11.8777 13.787 11.2712C14.3936 10.6646 14.7344 9.84194 14.7344 8.98413C14.7344 8.12632 14.3936 7.30365 13.787 6.69708C13.1805 6.09052 12.3578 5.74976 11.5 5.74976C10.6422 5.74976 9.81951 6.09052 9.21295 6.69708C8.60639 7.30365 8.26562 8.12632 8.26562 8.98413C8.26562 9.84194 8.60639 10.6646 9.21295 11.2712C9.81951 11.8777 10.6422 12.2185 11.5 12.2185Z"
                    fill="black"
                  />
                </g>
                <defs>
                  <clipPath id="clip0_173_469">
                    <rect
                      width="23"
                      height="23"
                      fill="white"
                      transform="translate(0 -0.000244141)"
                    />
                  </clipPath>
                </defs>
              </svg>
              <p>{{ enrolled.length }}/{{ course_item.amount }}</p>
            </div>
          </div>
        </div>

        <p class="text-[14px] font-light text-gray-01 limit2Line">
          {{ course_item.description }}
        </p>
        <div class="flex">
          <div v-if="this.user && this.user.role !== 'Admin' && this.check_enrolled.length < 1 && !(this.course_item.amount <= this.enrolled.length)">
            <RouterLink :to="`/payment/${$route.params.course_id}`">
              <div @click="payment101" class="rounded bg-black text-white px-12 py-2 hover:bg-[#2E2E2E]">
                ลงคอร์สเรียน
              </div>
            </RouterLink>
          </div>
          <div v-if="(this.course_item.amount <= this.enrolled.length) && this.user">
            <button>
              <div class="rounded bg-black/40 text-white px-12 py-2 hover:bg-black/30">
                คอร์สเรียนเต็มแล้ว
              </div>
            </button>
          </div>
        </div>
      </div>
      <div class="bg-white py-8 border-2 border-black flex justify-around">
        <div class="flex items-center space-x-2">
          <div>
            <img src="..\assets\icon\level.png" alt="" />
          </div>
          <div>
            <p class="text-sm font-light">ระดับความสามารถ</p>
            <p class="text-2xl">{{ course_item.level }}</p>
          </div>
        </div>
        <div class="flex items-center space-x-2">
          <div>
            <img src="..\assets\icon\certificate.png" alt="" />
          </div>
          <div>
            <p class="text-sm font-light">ระยะเวลา</p>
            <p class="text-2xl">{{ course_item.lesson }} คาบเรียน</p>
          </div>
        </div>
        <div class="flex items-center space-x-2">
          <div>
            <img src="..\assets\icon\recieve.png" alt="" />
          </div>
          <div>
            <p class="text-sm font-light">ใบ Certificate</p>
            <p class="text-2xl">
              {{ course_item.certificate ? "มีในคอร์สเรียนนี้" : "ไม่มีในคอร์สเรียนนี้" }}
            </p>
          </div>
        </div>
        <div class="flex items-center space-x-2">
          <div>
            <img src="..\assets\icon\price.png" alt="" />
          </div>
          <div>
            <p class="text-sm font-light">ราคาคอร์สเรียน</p>
            <p class="text-2xl text-[#467A55]">{{ course_item.price }} บาท</p>
          </div>
        </div>
      </div>
    </div>
    <div class="mt-20">
      <div>
        <div class="flex space-x-8 border-b-2 border-black">
          <div
            class="text-xl px-2"
            :class="{ 'text-[#E99F30] border-b-4 border-orange-01': showComponent }"
          >
            <button @click="showComponent = true">เกี่ยวกับคอร์ส</button>
          </div>
          <div
            class="text-xl px-2"
            :class="{ 'text-[#E99F30] border-b-4 border-orange-01': !showComponent }"
          >
            <button @click="showComponent = false">แสดงความคิดเห็น</button>
          </div>
        </div>
        <div v-if="showComponent">
          <CourseDetail :course_info="course_item.info" />
        </div>
        <div v-else>
          <CourseReview :user="user" :comments="comments" @comment-change="fetchComment()"/>
        </div>
      </div>
    </div>
  </div>
  <div
    class="w-full h-[572px] bg-no-repeat bg-cover bg-course-01 flex justify-start items-center pl-32"
  >
    <div class="border-l-[0.8rem] border-orange-01 pl-6 slide">
      <p class="text-white text-[48px]">
        เรียนแบบ <span class="text-orange-01">“ลงมือทำจริง” </span
        ><br />มากกว่าการเรียนท่องจำทั่วไป
      </p>
      <p class="text-gray-01 text-[20px]">
        โดยประสบการ์ณของคนสอนมากกว่า 40 ปี<br />
        12 ปีที่เนปาล 2 ปีที่แม่น้ำไน โดยไม่มีอะไรกินเลย 10 ปี <br />ที่ประเทศไทย
        ผ่านการฝึกความมีระเบียบ ความมีวินัย<br />
        ความตรงต่อเวลา
      </p>
    </div>
  </div>
  <div class="py-20">
    <p class="flex justify-center text-[48px]">ต้องการอะไรอย่างอื่นอีกไหม?</p>
    <div class="flex gap-x-7 justify-center mt-8">
      <div v-for="item in random_course_item">
        <!-- <main_card :item="item" :userLog_on="user"/> -->
        <Main_card :item="item" :user-log_on="userLog_on" />
      </div>
    </div>
  </div>
  <Footer />
</template>
