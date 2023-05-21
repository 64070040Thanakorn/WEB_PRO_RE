<template>
  <div
    class="w-[300px] h-[430px] bg-gray-300 hover:bg-gray-400/60 shadow-lg shadow-black-500/50 rounded-[15px] flex items-center justify-center"
  >
    <p class="text-white">สร้างคอร์สเรียนเพิ่ม</p>
  </div>
</template>
<script>
export default {
  props: {
    userLog_on: {
      type: Object,
    },
  },
  data() {
    return {};
  },
  methods: {
    scrollToTop() {
      window.scrollTo(0, 0);
    },
  },
};
</script>
<style>
.textOver {
  overflow: hidden;
  display: -webkit-box;
  -webkit-line-clamp: 2; /* number of lines to show */
  line-clamp: 2;
  -webkit-box-orient: vertical;
}
</style>
