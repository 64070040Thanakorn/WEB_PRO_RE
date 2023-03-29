<script setup>
import Quiz1 from '../components/quiz/quiz1.vue'
import Quiz2 from '../components/quiz/quiz2.vue'
import Quiz3 from '../components/quiz/quiz3.vue'
import Quiz4 from '../components/quiz/quiz4.vue'
import Result from '../components/quiz/result.vue'
</script>

<template>
    <section class="flex h-[94vh]">
        <!-- side nav -->
        <div class="px-6 py-12 bg-white shadow-md shadow-black/10">
            <div class="flex items-center space-x-1">
                <i class="pi pi-angle-left text-4xl"></i>
                <p class="text-xl inline-block whitespace-nowrap">กลับสู่หน้าหลัก</p>
            </div>
            <div class="flex flex-col space-y-4 items-center mt-16">
                <p class="text-lg rounded-full w-[3rem] h-[3rem] flex items-center justify-center border-[#EBC919] border-4 text-center">
                    1
                </p>
                <p class="text-lg rounded-full w-[3rem] h-[3rem] flex items-center justify-center border-[#EBC919] border-4 text-center">
                    2
                </p>
                <p class="text-lg rounded-full w-[3rem] h-[3rem] flex items-center justify-center border-[#EBC919] border-4 text-center">
                    3
                </p>
                <p class="text-lg rounded-full w-[3rem] h-[3rem] flex items-center justify-center border-[#EBC919] border-4 text-center">
                    4
                </p>
                <p class="rounded-full w-[3rem] h-[3rem] flex items-center justify-center border-[#EBC919] border-4 text-center">
                    <i class="text-xl pi pi-check"></i>
                </p>
            </div>
        </div>
        <div class="flex flex-col mt-36 w-full">
            <div class="mx-20">
                <Quiz1/>
            </div>
            <div class="bottom-0 absolute w-full">
                <div class="py-[2.5rem] bg-[#262626]">
                    <p class="text-center text-white text-4xl">ยืนยัน</p>
                </div>
            </div>
        </div>
    </section>
</template>

<style>
    .inputBox {
        display: flex;
        border-width: 0.15rem;
        width: 45rem;
        padding-left: 1.25rem;
        padding-top: 0.5rem;
        padding-bottom: 0.5rem;
        border-color: #B7B7B7;
        border-radius: 5px;
        align-items: center;
    }
    .inputBigBox {
        display: flex;
        border-width: 0.15rem;
        width: 15rem;
        height: 6rem;
        border-color: #B7B7B7;
        align-items: center;
        justify-content: center;
        text-align: center;
    }
    .inputUltraBox {
        display: flex;
        border-width: 0.15rem;
        width: 20rem;
        height: 11rem;
        border-color: #B7B7B7;
        justify-content: center;
        text-align: center;
    }
    .inputSize1 {
        font-size: 20px;
    }
    .inputSize2 {
        font-size: 24px;
    }
</style>