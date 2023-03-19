<script setup>
  import Footer from '../components/Footer.vue';
</script>

<template>
  <section>
    <div class="flex justify-center bg-black w-screen h-[1000px]">
      <div class="flex items-center space-x-48 text-white">
        <div class="slogan">
          <p class="font-extralight">NON STOP<br>
            LEARNING</p>
        </div>
        <div class="description space-y-8">
          <p class="indent-8 font-extralight">
            เรียนรู้ไปด้วยกันกับเรา GREATER “ไม่เคยหยุดนิ่ง”<br>
            โดย สถาบันพระจอมเกล้าคุณทหารลาดกระบัง
          </p>
          <button class="border-2 rounded-md border-[#EBC919] py-2 px-6 font-extralight">ลงทะเบียนเลยวันนี้</button>
        </div>
      </div>
    </div>
  </section>
  
  <section>
    <div class="flex justify-center items-center bg-white w-screen h-[250px]">
      <div id="total" class="flex justify-center items-center space-x-36">
        <div>
          <h1>4.5</h1>
          <p>80k รีวิว</p>
        </div>
        <div class="bg-[#EBC919] w-[4px] h-[60px]"></div>
        <div>
          <h1>30k</h1>
          <p>ลงทะเบียน</p>
        </div>
        <div class="bg-[#EBC919] w-[4px] h-[60px]"></div>
        <div>
          <h1>2k+</h1>
          <p>เรียนแล้ว</p>
        </div>
        <div class="bg-[#EBC919] w-[4px] h-[60px]"></div>
        <div>
          <h1>100+</h1>
          <p>คอร์ส</p>
        </div>
      </div>
    </div>
  </section>

  <section>
    <div id="hot" class="bg-[#FF834E] w-screen h-[950px]">
      <div class="py-6 mx-6">
        <h1>คอร์สเรียนยอดฮิต</h1>
        <p class="w-[710px]">Lorem ipsum dolor sit amet, consectetur adipiscing elit. In id maximus felis. Fusce massa urna, luctus sed mi quis, pretium sodales magna. Pellentesque gravida malesuada nibh</p>
      </div>
    </div>
  </section>

  <section>
    <div id="quiz" class="flex items-center bg-black w-screen h-[475px]">
      <div class="ml-[15rem]">
        <div class="flex text-white space-x-6">
          <div class="bg-[#EBC919] w-[5px] h-[165px]"></div>
          <div>
            <h5 class="text-[48px]">ไม่รู้จะเรียนอะไรดี?</h5>
            <p class="text-[32px] leading-tight">มาลองตอบคำถาม ง่ายๆเพียงไม่กี่ข้อ <br>เพื่อหาคำแนะนำสำหรับเริ่มต้น สำหรับหาคอร์สเรียน สำหรับตัวคุณ</p>
          </div>
        </div>
        <button class="bg-[#E99F30] rounded-md text-white px-12 py-2 ml-16 mt-3">ตอบคำถาม</button>
      </div>
    </div>
  </section>

  <section>
    <div class="w-screen h-[835px]">
      <div class="flex justify-center">
        <h1 class="text-[64px] text-black mt-6">ติดต่อเรา</h1>
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
              <label for="">อีเมล</label>
              <input class="border rounded-md pl-5 pr-[300px] py-3" type="email" placeholder="example@gmail.com">
            </div>
            <div class="flex flex-col">
              <label for="">ชื่อ</label>
              <input class="border rounded-md pl-5 pr-[300px] py-3" type="text" placeholder="ชื่อ-นามสกุล">
            </div>
            <div class="flex flex-col">
              <label for="">ข้อความ</label>
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