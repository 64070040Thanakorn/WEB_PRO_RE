<script setup>
import gsap from "gsap";
import ScrollTrigger from "gsap/ScrollTrigger";
import { onMounted } from "vue";

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

  gsap.fromTo(
    ".showing",
    { opacity: 0, y: -15 },
    { y: 0, opacity: 1, duration: 1.2, stagger: 0.1, delay: 1.5 }
  );
});
</script>

<script>
export default {
  methods: {
    scrollToTop() {
      window.scrollTo(0, 0)
    }
  }
}
</script>
<template>
  <section>
    <div
      id="quiz"
      class="flex items-center bg-landing-02 bg-no-repeat bg-cover w-full h-[475px]"
    >
      <div class="slide ml-[15rem]">
        <div class="text-white border-l-[0.5rem] border-orange-01 pl-8">
          <div>
            <h5 class="text-[40px]">พบกับคอร์สที่น่าสนใจมากมาย</h5>
            <p class="text-[20px] text-gray-01 leading-tight">
              เราออกแบบทุกความฝัน สร้างสรรค์ทุกอนาคต <br /> มาร่วมสัมผัสประสบการณ์การเรียนรู้ กับ
              GRATERER <br /> ครอบคลุมทุกวิชา ทั้งศาสตร์ด้านการเขียนโปรแกรม การเขียนเว็บโซด์ ไปถึงขั้นการ deplay
            </p>
          </div>
        </div>
        <br />
        <RouterLink to="/search" class="showing bg-orange-01 hover:bg-orange-hover rounded-md text-white px-12 py-2 ml-8 text-[20px]" @click="scrollToTop()">ลงคอร์สเรียนเลย</RouterLink>
      </div>
    </div>
  </section>
</template>
