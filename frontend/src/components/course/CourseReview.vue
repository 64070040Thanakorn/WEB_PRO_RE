<script setup>
import CourseComment from './CourseComment.vue'
// export default {
//   name: 'CourseReview',
//   props: {
//     comments: {
//       type: Array,
//       required: true,
//     },
//     courses: {
//       type: Object,
//       required: true,
//     },
//     stars: {
//       type: Array,
//       required: true,
//     },
//   },
//   data() {
//     return {
//       test: 'test',
//       comment: '',
//     }
//   },
//   methods: {
//     submit() {
//       this.$axios
//         .post(
//           'http://localhost:5000/api/comment',
//           {
//             content: this.comment,
//             user_id: this.$auth.user.user_id,
//             course_id: this.$route.params.id,
//           },
//           {
//             headers: {
//               'Content-Type': 'application/json',
//             },
//           }
//         )
//         .then((res) => {
//           // console.log(res);
//           window.location.reload()
//         })
//         .catch((err) => {
//           console.log(err)
//         })
//     },
//   },
// }
</script>

<template>
  <div>
    <div class="flex w-full mt-1">
      <div class="flex flex-col basis-3/4">
      </div>
    </div>
    <div class="flex mt-8">
      <div
        class="rounded-full bg-[#D9D9D9] mr-4 p-3 h-[2.5rem] w-[2.5rem] flex justify-center items-center"
      >
        <p>T</p>
      </div>
      <div class="flex flex-col grow">
        <textarea
          id=""
          v-model="comment"
          name=""
          class="flex justify-center border rounded-[10px] border-[#9F9F9F] mb-4 w-full h-40 px-6 py-3 grow"
          placeholder="เพิ่มคอมเมนต์..."
        ></textarea>
        <button
          class="w-full bg-orange-01 hover:bg-orange-hover text-white text-lg p-1 rounded-[5px]"
          @click="submit"
        >
          โพสต์
        </button>
      </div>
    </div>
    <div v-for="(item, index) in 5" :key="index">
      <CourseComment/>
    </div>
  </div>
</template>