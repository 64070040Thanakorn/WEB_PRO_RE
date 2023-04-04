
import Mini_card from '../mini_card.vue';

<script setup>
import mini_card from '../mini_card.vue';
</script>
<template>
    <div class="flex flex-col items-center">
        <p class="text-[30px] mb-12">จากการทำแบบสอบถามของคุณ เราแนะนำ:</p>
        <mini_card/>
        <button class="text-white px-12 py-2 bg-[#E99F30] rounded-[10px] text-[20px] mt-12">เริ่มเรียนเลย</button>
        <p class="underline text-[#888888] mt-6">ดูคอร์สที่แนะนำเพิ่มเติม</p>
    </div>
</template>