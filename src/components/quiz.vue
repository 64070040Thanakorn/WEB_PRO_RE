<script setup>
import gsap from 'gsap';
import { onMounted } from 'vue';

onMounted(() => {
  gsap.fromTo('.slide', {opacity:0,x: -15}, {x:0,opacity: 1, duration: 1.2, stagger: .1, delay:.5})
  gsap.fromTo('.showing', {opacity:0,y: -15}, {y:0,opacity: 1, duration: 1.2, stagger: .1, delay:1.5})

})
</script>
<template>
    <section>
    <div id="quiz" class="flex items-center bg-landing-02 w-screen h-[475px]">
      <div class="slide ml-[15rem]">
        <div class="flex text-white space-x-6">
          <div class="bg-[#EBC919] w-[5px] h-[165px]"></div>
          <div>
            <h5 class="text-[48px]">ไม่รู้จะเรียนอะไรดี?</h5>
            <p class="text-[32px] leading-tight">มาลองตอบคำถาม ง่ายๆเพียงไม่กี่ข้อ <br>เพื่อหาคำแนะนำสำหรับเริ่มต้น สำหรับหาคอร์สเรียน สำหรับตัวคุณ</p>
          </div>
        </div>
        <button class="showing bg-[#E99F30] rounded-md text-white px-12 py-2 ml-16 mt-3">ตอบคำถาม</button>
      </div>
    </div>
  </section>
</template>