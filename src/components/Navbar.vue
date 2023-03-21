<script setup>
import { gsap } from 'gsap';
import { onMounted } from 'vue';

let nav_site = [
  {
    "id": "nav_course",
    "title": "คอร์เรียน",
    "dropdown": true,
    "path": "/"
  },
  {
    "id": "portfolio",
    "title": "ผลงาน",
    "dropdown": false,
    "path": "/portfolio"
  },
  {
    "id": "about",
    "title": "เกี่ยวกับเรา",
    "dropdown": false,
    "path": "/about"
  },
  {
    "id": "location",
    "title": "ที่อยู่",
    "dropdown": false,
    "path": "/location"
  }
]
const tl = gsap.timeline({repeat:0});

onMounted(() => {
  tl.fromTo('.nav_site', {opacity:0,y: -15}, {y:0,opacity: 1, duration: 1.2, stagger: .1})
  gsap.fromTo('.nav_logo', {opacity:0,y: -15}, {y:0,opacity: 1, duration: 1.2, stagger: .1, delay:.5})
  gsap.fromTo('.nav_search', {opacity:0,y: -15}, {y:0,opacity: 1, duration: 1.2, stagger: .1, delay:.6})
  gsap.fromTo('.nav_login', {opacity:0,y: -15}, {y:0,opacity: 1, duration: 1.2, stagger: .1, delay:.7})
  gsap.fromTo('.nav_register', {opacity:0,y: -15}, {y:0,opacity: 1, duration: 1.2, stagger: .1, delay:.8})

})
</script>

<template>
  <div class="navbar container z-50">
    <div class="flex justify-between items-center px-48 w-screen h-[80px]">

      <div>
        <ul class="flex">
          <li class="nav_site flex items-center space-x-2 px-8 font-extralight" v-for="nav in nav_site">
              <h5>{{ nav.title }}</h5>
              <i class="pi pi-angle-down" style="font-size: 0.75rem" v-if="nav.dropdown"></i>
          </li>
        </ul>
      </div>

      <RouterLink to="/" id="logo" class="nav_logo navbar-brand border-4 border-[#EBC919] px-8">
        <h1>GREATER</h1>
      </RouterLink>

      <div>
        <ul class="flex">
          <RouterLink to="/search" id="search" class="nav_search pi pi-search flex items-center"></RouterLink>
          <li id="login" class="nav_login flex items-center px-8 font-extralight">เข้าสู่ระบบ</li>
          <li id="register" class="nav_register flex items-center border-2 rounded-md border-[#EBC919] py-2 px-6 font-extralight">สมัครสมาชิก</li>
        </ul>
      </div>

    </div>
  </div>
</template>
<style>
  :root {
    --text-color: #ffffff;
  }
  .navbar{
    position: absolute;
    color: var(--text-color);
    font-family: 'Mitr', sans-serif;
    font-size: 18px;
    z-index: 1;
  }
  .navbar-brand{
    transform: translateX(-50%);
    left: 50%;
    position: absolute;
  }
  .navbar-brand>h1{
    font-family: 'Sansita', sans-serif;
    font-size: 40px;
  }
</style>