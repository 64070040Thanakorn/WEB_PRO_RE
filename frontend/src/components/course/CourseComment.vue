<template>
  <div class="flex mt-8 border-b-[3px] pb-8">
    <div class="flex flex-col justify-center items-center mr-4">
      <div
        class="rounded-full bg-[#D9D9D9] p-3 h-[2.5rem] w-[2.5rem] flex justify-center items-center"
      >
        <p>{{comment.user.first_name.charAt(0).toUpperCase()}}</p>
      </div>
      <p class="text-[13px] text-[#bfbebe]">{{comment.user.role}}</p>
    </div>
    <div class="space-y-1">
      <div class="flex gap-x-4 items-center">
        <p class="text-[18px]">{{comment.user.first_name}} {{comment.user.last_name}}</p>
        <p class="text-[#D9D9D9] text-[13px]">เมื่อ {{comment.comment_date}}</p>
      </div>
      <p class="text-[#9F9F9F] text-[16px]">
        {{comment.content}}
      </p>
    </div>
  </div>
</template>

<script>
export default {
    name: "CourseComment",
    props:{
      comment: {
        required: true,
      }
    },
}
</script>