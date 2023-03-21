<script setup>
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

<template>
  <section>
    <div class="flex justify-center bg-landing-01 bg-no-repeat bg-cover w-full h-[1080px]">
      <div class="flex justify-start mt-72 space-x-36 text-white">
        <div class="slogan w-[600px]">
          <p class="animated-text slogan_word font-extralight">
          </p>
        </div>
        <div class="description space-y-8 mt-20">
          <p class="indent-8 font-extralight">
            เรียนรู้ไปด้วยกันกับเรา GREATER “ไม่เคยหยุดนิ่ง”<br>
            โดย สถาบันพระจอมเกล้าคุณทหารลาดกระบัง
          </p>
          <button id="btn" class="border-2 rounded-md border-[#EBC919] py-2 px-6 font-extralight">ลงทะเบียนเลยวันนี้</button>
        </div>
      </div>
    </div>
  </section>
  
  <Total />
  
  <section>
    <div id="hot" class="bg-pattern-01 w-full h-[950px]">
      <div class="py-6 mx-6">
        <h1>คอร์สเรียนยอดฮิต</h1>
        <p class="w-[710px]">Lorem ipsum dolor sit amet, consectetur adipiscing elit. In id maximus felis. Fusce massa urna, luctus sed mi quis, pretium sodales magna. Pellentesque gravida malesuada nibh</p>
      </div>
      <div class="flex justify-center">
        <div class="grid grid-cols-3 gap-6 justify-center">
          <Landing_Card class="card_showing" v-for="n in 6"/>
        </div>
      </div>
      <div class="flex justify-center my-8">
        <button class="bg-black text-white py-2 px-8 rounded-md">ดูคอร์สเรียนเพิ่มเติม</button>
      </div>
    </div>
  </section>

  <Quiz />

  <section>
    <div class="bg-white w-full h-[835px]">
      <div class="flex justify-center">
        <h1 class="text-[64px] text-black my-12">ติดต่อเรา</h1>
      </div>
      <div class="flex justify-center space-x-32">
        <div class="mapouter">
          <div class="gmap_canvas">
            <!-- <iframe width="830" height="480" id="gmap_canvas" src="https://maps.google.com/maps?q=kmitl&t=&z=14&ie=UTF8&iwloc=&output=embed" frameborder="0" scrolling="no" marginheight="0" marginwidth="0"></iframe> -->
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
            <button class="flex justify-center items-center rounded-md bg-black text-white border w-[126px] h-[35px]">ติดต่อ</button>
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