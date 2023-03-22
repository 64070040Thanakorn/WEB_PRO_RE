<template>
    <div class="container w-[20rem] h-[27rem] bg-white shadow-md shadow-black/10 p-4">
        <div class="flex flex-col">
            <div class="flex flex-col gap-1">
                <div class="flex gap-1">
                    <p class="bg-[#FEB8B8] rounded-[15px] text-xs px-4 py-[0.2rem] text-white">Beginner</p>
                    <p class="bg-[#46AECF] rounded-[15px] text-xs px-4 py-[0.2rem] text-white">ใบ Certificate</p>
                </div>
                <h1 class="text-2xl font-normal">Python for beginner</h1>
                <div class="flex text-sm justify-between">
                    <p>16 บทเรียน</p>
                    <p>9/25</p>
                </div>
                <hr class="border-black">
                <p class="text-[#717171] text-sm">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Eveniet, aperiam? Voluptates magnam, sapiente quisquam quos in ut fugiat vitae, necessitatibus magni omnis earum voluptatum consequatur enim nulla temporibus, quam placeat?</p>
            </div>
            <div class="flex flex-col mt-24 gap-2">
                <p class="flex justify-end text-[#5CA949]">ฟรี</p>
                <RouterLink to="">
                    <div class="bg-black text-white py-2 rounded-[3px] text-center">ดูคอร์สเรียน</div>
                </RouterLink>
            </div>
        </div>
    </div>
</template>