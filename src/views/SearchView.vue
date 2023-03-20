<template>
    <section>
        <div class="relative z-10">
            <img src="../assets/search_view_img.png" class="w-full min-h-[500px]" alt="" />
            <div class="absolute top-0 left-0 h-[35%] w-full bg-gradient-to-b from-black to-white-0% p-5"></div>
            <div
                class="absolute top-1/3 left-1/2 traslate-y-[-50%] translate-x-[-50%] text-white w-full gap-8 flex flex-col">
                <p class="flex justify-center text-6xl font-semibold">
                    หาคอร์สเรียนที่เหมาะกับคุณ
                </p>
                <div class="flex justify-center text-center">
                    <p class="w-[70%] text-sm">
                        Lorem Ipsum is simply dummy text of the printing and typesetting industry.
                    </p>
                </div>
                <div class="flex justify-center text-black">
                    <span class="p-input-icon-left w-[50%]">
                        <!--  !!!!!! icon หน้าโง่ไม่อยู่ใน input, primevue มีแต่กูใช้มะได้ !!!!!!-->

                        <!-- <i class="pi pi-search" /> -->
                        <InputText v-model="value1" class="py-2 px-5 rounded-[30px] w-full" placeholder="ค้นหา..." />
                    </span>
                </div>
                <div class="flex justify-around items-center w-[50%] mx-auto text-[12px]">
                    <span class="underline">การค้นหาที่ยอดนิยม</span>
                    <button class="bg-[#1D1D1D]/[.7] py-2 px-8 rounded-[20px]">Python</button>
                    <button class="bg-[#1D1D1D]/[.7] py-2 px-8 rounded-[20px]">C</button>
                    <button class="bg-[#1D1D1D]/[.7] py-2 px-8 rounded-[20px]">Java</button>
                    <button class="bg-[#1D1D1D]/[.7] py-2 px-8 rounded-[20px]">PHP</button>
                    <button class="bg-[#1D1D1D]/[.7] py-2 px-8 rounded-[20px]">Sql</button>
                </div>
            </div>
        </div>
    </section>
    <section>
        <div class="flex z-0">
            <div class="lg:basis-2/12 2xl:basis-3/12 bg-white shadow-md shadow-black/10 mx-auto">
                <div class="flex flex-col p-8 overflow-y-auto h-full fixed top-0 lg:w-[16.67%] 2xl:w-[25%]">
                    <div class="gap-4 flex flex-col dropdown">
                        <button class="flex justify-between items-center" @click="IsActive = !IsActive">
                            <p class="text-lg font-md">หมวดหมู่วิชา</p>
                            <i class="pi" :class="{ 'pi-chevron-down': !IsActive, 'pi-chevron-up': IsActive }"></i>
                        </button>
                        <div :class="{ 'dropdown-content': IsActive }">
                            <div class="flex flex-col gap-2 text-sm">
                                <a href="" class="font-light hover:font-normal">All</a>
                                <a href="" class="font-light hover:font-normal">Python</a>
                                <a href="" class="font-light hover:font-normal">JavaScript</a>
                                <a href="" class="font-light hover:font-normal">HTML & CSS</a>
                                <a href="" class="font-light hover:font-normal">SQL</a>
                                <a href="" class="font-light hover:font-normal">Java</a>
                                <a href="" class="font-light hover:font-normal">C++</a>
                                <a href="" class="font-light hover:font-normal">C#</a>
                                <a href="" class="font-light hover:font-normal">Bash</a>
                                <a href="" class="font-light hover:font-normal">C</a>
                                <a href="" class="font-light hover:font-normal">PHP</a>
                                <a href="" class="font-light hover:font-normal">R</a>
                                <a href="" class="font-light hover:font-normal">Swift</a>
                            </div>
                        </div>
                        <hr class="border-[1.2px] mb-8" />
                    </div>
                    <div class="flex flex-col gap-4 mt-8 mb-8">
                        <div class="flex justify-between items-center">
                            <h3 class="2xl:text-3xl lg:text-2xl font-md">Python</h3>
                            <p class="2xl:text-sm lg:text-xs font-light">30 ผลลัพท์</p>
                        </div>
                        <div class="flex justify-between items-center">
                            <div class="flex gap-2 items-center">
                                <i class="pi pi-sliders-h text-xl"></i>
                                <p class="text-xl font-light">กรอง</p>
                            </div>
                            <p class="texl-lg font-light text-[#676767] underline">ล้างกรอง</p>
                        </div>
                        <div class="flex flex-col gap-2">
                            <p class="text-lg font-md">ระดับ</p>
                            <div class="ml-3 gap-2 flex flex-col">
                                <div class="flex items-center gap-2">
                                    <input type="checkbox" name="level" value="level"
                                        class="p-2 border-2 border-black inline-block" />
                                    <span class="font-light">Beginner</span>
                                </div>
                                <div class="flex items-center gap-2">
                                    <input type="checkbox" name="level" value="level"
                                        class="p-2 border-2 border-black inline-block" />
                                    <span class="font-light">Intermediate</span>
                                </div>
                                <div class="flex items-center gap-2">
                                    <input type="checkbox" name="level" value="level"
                                        class="p-2 border-2 border-black inline-block" />
                                    <span class="font-light">Advanced</span>
                                </div>
                            </div>
                        </div>
                        <hr class="border-[1.2px]" />
                        <div class="flex flex-col gap-2">
                            <p class="text-lg font-md">ราคา</p>
                            <div class="ml-3 gap-2 flex flex-col">
                                <div class="flex items-center gap-2">
                                    <input type="checkbox" name="price" value="price"
                                        class="p-2 border-2 border-black inline-block" />
                                    <span class="font-light">ฟรี</span>
                                </div>
                                <div class="flex items-center gap-2">
                                    <input type="checkbox" name="price" value="price"
                                        class="p-2 border-2 border-black inline-block" />
                                    <span class="font-light">1-1000 บาท</span>
                                </div>
                                <div class="flex items-center gap-2">
                                    <input type="checkbox" name="price" value="price"
                                        class="p-2 border-2 border-black inline-block" />
                                    <span class="font-light">1001-3000 บาท</span>
                                </div>
                                <div class="flex items-center gap-2">
                                    <input type="checkbox" name="price" value="price"
                                        class="p-2 border-2 border-black inline-block" />
                                    <span class="font-light">มากกว่า 3000 บาท</span>
                                </div>
                            </div>
                        </div>
                        <hr class="border-[1.2px]" />
                        <div class="flex flex-col gap-2">
                            <p class="text-lg font-md">จำนวนคน</p>
                            <div class="ml-3 gap-2 flex flex-col">
                                <div class="flex items-center gap-2">
                                    <input type="checkbox" name="amount" value="amount"
                                        class="p-2 border-2 border-black inline-block" />
                                    <span class="font-light">เต็ม</span>
                                </div>
                                <div class="flex items-center gap-2">
                                    <input type="checkbox" name="amount" value="amount"
                                        class="p-2 border-2 border-black inline-block" />
                                    <span class="font-light">ไม่เต็ม</span>
                                </div>
                            </div>
                        </div>
                        <hr class="border-[1.2px]" />
                        <div class="flex flex-col gap-2">
                            <p class="text-lg font-md">ใบ Certificate</p>
                            <div class="ml-3 gap-2 flex flex-col">
                                <div class="flex items-center gap-2">
                                    <input type="checkbox" name="cer" value="cer"
                                        class="p-2 border-2 border-black inline-block" />
                                    <span class="font-light">มี</span>
                                </div>
                                <div class="flex items-center gap-2">
                                    <input type="checkbox" name="cer" value="cer"
                                        class="p-2 border-2 border-black inline-block" />
                                    <span class="font-light">ไม่มี</span>
                                </div>
                            </div>
                        </div>
                        <hr class="border-[1.2px]" />
                        <div class="flex flex-col gap-2">
                            <p class="text-lg font-md">บทเรียน</p>
                            <div class="ml-3 gap-2 flex flex-col">
                                <div class="flex items-center gap-2">
                                    <input type="checkbox" name="lesson" value="lesson"
                                        class="p-2 border-2 border-black inline-block" />
                                    <span class="font-light">0-4 บท</span>
                                </div>
                                <div class="flex items-center gap-2">
                                    <input type="checkbox" name="lesson" value="lesson"
                                        class="p-2 border-2 border-black inline-block" />
                                    <span class="font-light">5-15 บท</span>
                                </div>
                                <div class="flex items-center gap-2">
                                    <input type="checkbox" name="lesson" value="lesson"
                                        class="p-2 border-2 border-black inline-block" />
                                    <span class="font-light">16+ บท</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="lg:basis-10/12 2xl:basis-9/12 mb-20">
                <div class="flex flex-col relative">
                    <img src="../assets/search_view_sub.png" class="w-full min-h-[500px]" alt="" />
                    <div class="absolute top-0 left-0 px-20 py-12 flex flex-col gap-8">
                        <p class="text-md text-[#EBC919]">
                            หมวดหมู่ <span class="text-black">/ Python</span>
                        </p>
                        <p class="text-4xl font-semibold">Python</p>
                        <p class="text-lg">
                            Lorem ipsum dolor sit amet consectetur adipisicing elit. Magni dolorem
                            facere suscipit itaque facilis iste tempora, aliquam id fuga distinctio
                            inventore in commodi alias cumque perferendis ducimus reiciendis ratione
                            dolore.
                        </p>
                        <RouterLink to="/">
                            <div class="bg-black p-20 w-[35%]"></div>
                        </RouterLink>
                    </div>
                </div>
                <div class="grid grid-cols-4 justify-items-center px-20 py-12 gap-6">
                    <RouterLink to="/" v-for="item in items">
                        <div class="flex bg-black border-2 p-20 w-[300px] h-[400px] text-white"></div>
                    </RouterLink>
                </div>
            </div>
        </div>
    </section>
    <section>
        <Footer />
    </section>
</template>

<script>
export default {
    data() {
        return {
            IsActive: false,
            value1: "test",
            items: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12],
        };
    },
};
</script>
<style>
.dropdown {
    position: relative;
    display: inline-block;
}

.dropdown-content {
    /* position: absolute; */
    display: none;
}
</style>
