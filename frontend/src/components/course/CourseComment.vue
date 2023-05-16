<template>
  <div class="flex mt-8 border-b-[3px] pb-8">
    <div class="flex flex-col justify-center items-center mr-4">
      <div
        class="rounded-full bg-[#D9D9D9] p-3 h-[2.5rem] w-[2.5rem] flex justify-center items-center"
      >
        <p>t</p>
      </div>
      <p class="text-[13px]" :class="{'text-[#726FE5] font-medium': checkRole,  'text-[#9F9F9F]': !checkRole}">student</p>
    </div>
    <div class="space-y-1">
      <div class="flex gap-x-4 items-center">
        <p class="text-[18px]">Thana Korn</p>
        <p class="text-[#D9D9D9] text-[13px]">เมื่อ 11.11.11</p>
      </div>
      <p class="text-[#9F9F9F] text-[16px]">
        haha
      </p>
    </div>
  </div>
</template>

<script>
export default {
    name: "CourseComment",
    props:{
      comment: {
        type: Object,
        required: true,
      }
    },
}
</script>