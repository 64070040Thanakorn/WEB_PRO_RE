<script setup>
import Register from '../components/auth/register.vue';
import Quiz from '../components/landing/landing_quiz.vue';
import Total from '../components/landing/landing_total.vue';
import Landing_Card from '../components/mini_card.vue';

import gsap from 'gsap';
import TextPlugin from 'gsap/TextPlugin';
import { onMounted } from 'vue';

gsap.registerPlugin(TextPlugin);

const sologan_words = ["Nerver Stop Learning ✌️", "อย่าหยุดเรียนรู้"]

let tlMaster = gsap.timeline({repeat: -1, repeatDelay: 1});

onMounted(() => {
  sologan_words.forEach(word => {
    let tlText = gsap.timeline({repeat: 1, yoyo: true, repeatDelay: 1});
    tlText.to(".animated-text",{duration: 2, text: word})
    tlMaster.add(tlText)
  });
})
</script>

<script>
export default {
  beforeCreate() {
    this.axios.get(`http://localhost:3000/api/course/randomCourse/6`).then((response) => {
      this.random_course_item = response.data;
    });
  },
  components:{
    Register,
  },
  data() {
    return {
      random_course_item: [],
      user: null,
      isActive_Login: false,
      isActive_Register: false,
      isActive_auth: false,
      isOpen: false,
    }
  },
  mounted(){
    this.user = localStorage.getItem('user')
  },
  methods: {
    scrollToTop() {
      window.scrollTo(0, 0);
    },
    viewCourse() {
      this.$router.push("/search");
      window.scrollTo(0, 0);
    },
    closing_auth(){
      if(this.isActive_Login){
        this.isOpen = !this.isOpen
        this.isActive_Login = !this.isActive_Login
      }
      if(this.isActive_Register){
        this.isOpen = !this.isOpen
        this.isActive_Register = !this.isActive_Register
      }
    },
    toggleModal(el) {
      this.isOpen = !this.isOpen
      switch(el) {
        case "register":
          this.isActive_Register = !this.isActive_Register

          break;
        default:
          return 0
      }
    },
    onAuthChange(){
      window.location.reload()
    },
  }
}
</script>

<template>
  <div v-if="isOpen" class="w-full z-[50] fixed">
    <div class="absolute left-1/2 translate-x-[-50%] w-full h-screen flex justify-center items-center">
      <div class="bg-black w-full h-full absolute opacity-80"></div>
      <Register v-if="isActive_Register" @auth-change="onAuthChange" @modal_close="closing_auth()"/>
    </div>
  </div>
  
  <section>
    <div class="flex justify-center bg-landing-01 bg-no-repeat bg-cover w-full h-[1080px]">
      <div class="flex justify-start mt-72 space-x-36 text-white">
        <div class="slogan w-[600px]">
          <p class="animated-text slogan_word font-extralight"></p>
        </div>
        <div class="description space-y-8 mt-20">
          <p class="indent-8 font-extralight">
            เรียนรู้ไปด้วยกันกับเรา GREATER “ไม่เคยหยุดนิ่ง”<br>
            โดย สถาบันพระจอมเกล้าคุณทหารลาดกระบัง
          </p>
          <div v-if="!user">
            <button @click="toggleModal('register')" id="btn" class="transition-all duration-200 border-2 rounded-md hover:bg-[#EBC919]/80  border-[#EBC919] py-2 px-6 font-extralight">ลงทะเบียนเลยวันนี้</button>
          </div>
          <div v-else>
            <RouterLink to="/search">
              <button id="btn" class="transition-all duration-200 border-2 rounded-md hover:bg-[#EBC919]/80  border-[#EBC919] py-2 px-6 font-extralight">ค้นหาคอร์สเรียนเลย!</button>
            </RouterLink>
          </div>
        </div>
      </div>
    </div>
  </section>

  <Total />

  <section>
    <div id="hot" class="bg-pattern-01 w-full h-[950px]">
      <div class="py-6 mx-6">
        <h1>คอร์สเรียนที่น่าสนใจ</h1>
        <p class="w-[710px]">พบกับคอร์สเรียนมากมายที่ทางเราจัดหามาให้ มีทั้ง Python, JS, JAVA, C, C# และอื่นๆอีกมากมายพร้อมให้คุณมาเรียนรู้ได้แล้ววันนี้!</p>
      </div>
      <div class="flex justify-center">
        <div class="grid grid-cols-3 gap-6 justify-center">
          <Router-link v-for="item in random_course_item" :to="{ path: `course/${item.course_id}` }" @click="scrollToTop()">
            <Landing_Card class="card_showing" :item="item"/>
          </Router-link>
        </div>
      </div>
      <div class="flex justify-center my-8">
        <button class="bg-black hover:bg-black1-hover text-white py-2 px-8 rounded-md" @click="viewCourse()">ดูคอร์สเรียนเพิ่มเติม</button>
      </div>
    </div>
  </section>

  <Quiz />

  <section>
    <div id="contract" class="bg-white w-full h-[835px]">
      <div class="flex justify-center">
        <h1 class="text-[64px] text-black my-12">ติดต่อเรา</h1>
      </div>
      <div class="flex justify-center space-x-32">
        <div class="mapouter">
          <div class="gmap_canvas">
            <iframe width="830" height="480" id="gmap_canvas" src="https://maps.google.com/maps?q=kmitl&t=&z=14&ie=UTF8&iwloc=&output=embed" frameborder="0" scrolling="no" marginheight="0" marginwidth="0"></iframe>
          </div>
        </div>
        <div class="space-y-10">
          <form class="flex flex-col space-y-3">
            <div class="flex flex-col">
              <label for="" class="text-black">อีเมล</label>
              <input class="border rounded-md pl-5 pr-[300px] py-3" type="email" placeholder="example@gmail.com">
            </div>
            <div class="flex flex-col">
              <label for="" class="text-black">ชื่อ</label>
              <input class="border rounded-md pl-5 pr-[300px] py-3" type="text" placeholder="ชื่อ-นามสกุล">
            </div>
            <div class="flex flex-col">
              <label for="" class="text-black">ข้อความ</label>
              <textarea class="border rounded-md px-5 py-3" name="" id="" cols="30" rows="10"></textarea>
            </div>
            <button class="flex justify-center items-center rounded-md bg-black hover:bg-black1-hover text-white border w-[126px] h-[35px]">ติดต่อ</button>
          </form>
        </div>
      </div>
      
    </div>
  </section>

  <Footer />
</template>

<style>
  .slogan{
    font-size: 96px;
  }
  .description{
    font-size: 22px;
  }
  #total>div{
    display:flex;
    flex-direction: column;
    align-items: center;
    font-size: 64px;
  }
  #total>div>h1{
    font-size: 64px;
    color: black;
  }
  #total>div>p{
    font-size: 16px;
    color: #787878;
  }

  #hot>div{
    color: black;
  }
  #hot>div>h1{
    font-size: 96px;
  }
  #hot>div>p{
    font-size: 16px;
  }
</style>

<style>
  .mapouter{
    position:relative;
    text-align:right;
    height:480px;
    width:830px;
  }
  .gmap_canvas{
    overflow:hidden;
    background:none!important;
    height:480px;
    width:830px;
  }
</style>