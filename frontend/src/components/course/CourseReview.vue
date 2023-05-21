<script setup>
import CourseComment from './CourseComment.vue'
</script>

<script>
export default {
  mounted() {
    this.user_id = localStorage.getItem("user");
  },
  props: {
    user: Object,
    comments: {
      type: Array,
      required: true,
    },
  },
  data() {
    return {
      comment: null,
      user_id: null,
    }
  },
  methods: {
    submit() {
      this.axios
        .post(
          'http://localhost:3000/api/comment/createComment/',
          {
            content: this.comment,
            user_id: this.user_id,
            course_id: this.$route.params.course_id,
          },
        )
        .then((res) => {
          // console.log(res);
          this.comment = null
          this.$emit('comment-change')
        })
        .catch((err) => {
          console.log(err)
        })
    },
    toLogin() {
      alert("You must login first!")
    }
  },
}
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
        <p>{{user ? user.first_name.charAt(0).toUpperCase() : ""}}</p>
      </div>
      <div class="flex flex-col grow">
        <textarea
          id=""
          v-model="comment"
          name=""
          class="flex justify-center border rounded-[10px] border-[#9F9F9F] mb-4 w-full h-40 px-6 py-3 grow"
          placeholder="เพิ่มคอมเมนต์..."
        ></textarea>
        <div v-if="user">
          <button
          class="w-full bg-orange-01 hover:bg-orange-hover text-white text-lg p-1 rounded-[5px]"
          @click="submit"
        >
          โพสต์
        </button>
        </div>
        <div v-else>
          <button
          class="w-full bg-orange-01 hover:bg-orange-hover text-white text-lg p-1 rounded-[5px]"
          @click="toLogin"
        >
          โพสต์
        </button>
        </div>
      </div>
    </div>
    <div v-for="(comment, index) in comments" :key="index">
      <CourseComment :comment="comment"/>
    </div>
  </div>
</template>