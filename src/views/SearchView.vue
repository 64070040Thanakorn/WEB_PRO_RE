<template>
    <section>
        <div class="relative z-10">
            <img src="../assets/search_view_img.png" class="w-full min-h-[500px]" alt="" />
            <div
                class="absolute top-1/3 left-1/2 traslate-y-[-50%] translate-x-[-50%] text-white w-full gap-8 flex flex-col">
                <p class="flex justify-center text-6xl font-medium">
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
                        <InputText v-model="searchValue" class="py-2 px-5 rounded-[30px] w-full" placeholder="ค้นหา..." />
                    </span>
                </div>
                <div class="flex justify-around items-center w-[50%] mx-auto text-[12px]">
                    <span class="underline">การค้นหาที่ยอดนิยม</span>
                    <button type='button' class="bg-[#1D1D1D]/[.7] py-2 px-8 rounded-[20px]">Python</button>
                    <button type='button' class="bg-[#1D1D1D]/[.7] py-2 px-8 rounded-[20px]">C</button>
                    <button type='button' class="bg-[#1D1D1D]/[.7] py-2 px-8 rounded-[20px]">Java</button>
                    <button type='button' class="bg-[#1D1D1D]/[.7] py-2 px-8 rounded-[20px]">PHP</button>
                    <button type='button' class="bg-[#1D1D1D]/[.7] py-2 px-8 rounded-[20px]">Sql</button>
                </div>
            </div>
        </div>
    </section>
    <section>
        <div class="flex z-0">
            <div class="w-[25%] bg-white shadow-md shadow-black/10 mx-auto">
                <div class="flex flex-col p-8 overflow-y-auto h-full absolute w-full scrollbar">
                    <div class="gap-4 flex flex-col dropdown">
                        <button type='button' class="flex justify-between items-center" @click="IsActiveCate = !IsActiveCate">
                            <p class="text-lg font-normal">หมวดหมู่วิชา</p>
                            <i class="pi" :class="{ 'pi-chevron-down': !IsActiveCate, 'pi-chevron-up': IsActiveCate }"></i>
                        </button>
                        <div :class="{ 'hidden': !IsActiveCate }">
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
                        <hr class="border-[1.2px] mb-8" :class="{'mb-[25rem]': !IsActiveCate, 'mb-[1.75rem]': IsActiveCate}"/>
                    </div>
                    <div class="flex flex-col gap-4 mt-8 mb-8">
                        <div class="flex justify-between items-center">
                            <h3 class="2xl:text-3xl lg:text-2xl font-normal">Python</h3>
                            <p class="2xl:text-sm lg:text-xs font-light">30 ผลลัพท์</p>
                        </div>
                        <div class="flex justify-between items-center">
                            <div class="flex gap-2 items-center">
                                <i class="pi pi-sliders-h text-xl"></i>
                                <p class="text-xl font-light">กรอง</p>
                            </div>
                            <button type="button" class="texl-lg font-light text-[#676767] underline" @click="clearFilter()">ล้างกรอง</button>
                        </div>
                        <div class="flex flex-col gap-2 dropdown">
                            <button type='button' class="flex justify-between items-center" @click="IsActiveLevel = !IsActiveLevel">
                                <p class="text-lg font-normal">ระดับ</p>
                                <i class="pi" :class="{ 'pi-chevron-down': !IsActiveLevel, 'pi-chevron-up': IsActiveLevel }"></i>
                            </button>
                            <div :class="{ 'hidden': !IsActiveLevel }">
                                <div class="ml-3 gap-2 flex flex-col">
                                    <div class="flex items-center gap-2">
                                        <input type="checkbox" name="level" value="beginner"
                                            class="p-2 border-2 border-black inline-block" v-model="beginner"/>
                                        <span class="font-light">Beginner</span>
                                    </div>
                                    <div class="flex items-center gap-2">
                                        <input type="checkbox" name="level" value="intermediate"
                                            class="p-2 border-2 border-black inline-block" v-model="intermediate"/>
                                        <span class="font-light">Intermediate</span>
                                    </div>
                                    <div class="flex items-center gap-2">
                                        <input type="checkbox" name="level" value="advanced"
                                            class="p-2 border-2 border-black inline-block" v-model="advanced"/>
                                        <span class="font-light">Advanced</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <hr class="border-[1.2px]" />
                        <div class="flex flex-col gap-2 dropdown">
                            <button type='button' class="flex justify-between items-center" @click="IsActivePrice = !IsActivePrice">
                                <p class="text-lg font-normal">ราคา</p>
                                <i class="pi" :class="{ 'pi-chevron-down': !IsActivePrice, 'pi-chevron-up': IsActivePrice }"></i>
                            </button>
                            <div :class="{ 'hidden': !IsActivePrice }">
                                <div class="ml-3 gap-2 flex flex-col">
                                    <div class="flex items-center gap-2">
                                        <input type="checkbox" name="price" value="price"
                                            class="p-2 border-2 border-black inline-block" v-model="priceFree"/>
                                        <span class="font-light">ฟรี</span>
                                    </div>
                                    <div class="flex items-center gap-2">
                                        <input type="checkbox" name="price" value="price"
                                            class="p-2 border-2 border-black inline-block" v-model="price1To1000"/>
                                        <span class="font-light">1-1000 บาท</span>
                                    </div>
                                    <div class="flex items-center gap-2">
                                        <input type="checkbox" name="price" value="price"
                                            class="p-2 border-2 border-black inline-block" v-model="price1001To3000"/>
                                        <span class="font-light">1001-3000 บาท</span>
                                    </div>
                                    <div class="flex items-center gap-2">
                                        <input type="checkbox" name="price" value="price"
                                            class="p-2 border-2 border-black inline-block" v-model="price3000"/>
                                        <span class="font-light">มากกว่า 3000 บาท</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <hr class="border-[1.2px]" />
                        <div class="flex flex-col gap-2 dropdown">
                            <button type='button' class="flex justify-between items-center" @click="IsActiveAmount = !IsActiveAmount">
                                <p class="text-lg font-normal">จำนวนคน</p>
                                <i class="pi" :class="{ 'pi-chevron-down': !IsActiveAmount, 'pi-chevron-up': IsActiveAmount }"></i>
                            </button>
                            <div :class="{ 'hidden': !IsActiveAmount }">
                                <div class="ml-3 gap-2 flex flex-col">
                                    <div class="flex items-center gap-2">
                                        <input type="checkbox" name="amount" value="amount"
                                            class="p-2 border-2 border-black inline-block" v-model="amountFull"/>
                                        <span class="font-light">เต็ม</span>
                                    </div>
                                    <div class="flex items-center gap-2">
                                        <input type="checkbox" name="amount" value="amount"
                                            class="p-2 border-2 border-black inline-block" v-model="amountNotFull"/>
                                        <span class="font-light">ไม่เต็ม</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <hr class="border-[1.2px]" />
                        <div class="flex flex-col gap-2 dropdown">
                            <button type='button' class="flex justify-between items-center" @click="IsActiveCer = !IsActiveCer">
                                <p class="text-lg font-normal">ใบ Certificate</p>
                                <i class="pi" :class="{ 'pi-chevron-down': !IsActiveCer, 'pi-chevron-up': IsActiveCer }"></i>
                            </button>
                            <div :class="{ 'hidden': !IsActiveCer }">
                                <div class="ml-3 gap-2 flex flex-col">
                                    <div class="flex items-center gap-2">
                                        <input type="checkbox" name="cer" value="cer"
                                            class="p-2 border-2 border-black inline-block" v-model="cerHave"/>
                                        <span class="font-light">มี</span>
                                    </div>
                                    <div class="flex items-center gap-2">
                                        <input type="checkbox" name="cer" value="cer"
                                            class="p-2 border-2 border-black inline-block" v-model="cerNot"/>
                                        <span class="font-light">ไม่มี</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <hr class="border-[1.2px]" />
                        <div class="flex flex-col gap-2 dropdown">
                            <button type='button' class="flex justify-between items-center" @click="IsActiveLesson = !IsActiveLesson">
                                <p class="text-lg font-normal">บทเรียน</p>
                                <i class="pi" :class="{ 'pi-chevron-down': !IsActiveLesson, 'pi-chevron-up': IsActiveLesson }"></i>
                            </button>
                            <div :class="{ 'hidden': !IsActiveLesson }">
                                <div class="ml-3 gap-2 flex flex-col">
                                    <div class="flex items-center gap-2">
                                        <input type="checkbox" name="lesson" value="lesson"
                                            class="p-2 border-2 border-black inline-block" v-model="lesson0To4"/>
                                        <span class="font-light">0 - 4 บท</span>
                                    </div>
                                    <div class="flex items-center gap-2">
                                        <input type="checkbox" name="lesson" value="lesson"
                                            class="p-2 border-2 border-black inline-block" v-model="lesson5To15"/>
                                        <span class="font-light">5 - 15 บท</span>
                                    </div>
                                    <div class="flex items-center gap-2">
                                        <input type="checkbox" name="lesson" value="lesson"
                                            class="p-2 border-2 border-black inline-block" v-model="lesson16"/>
                                        <span class="font-light">16+ บท</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="w-[75%] mb-20">
                <div class="flex flex-col relative">
                    <img src="../assets/search_view_sub.png" class="w-full min-h-[500px]" alt="" />
                    <div class="absolute top-0 left-0 px-20 py-12 flex flex-col gap-8">
                        <p class="text-md text-[#EBC919]">
                            หมวดหมู่ <span class="text-black">/ Python</span>
                        </p>
                        <p class="text-4xl font-medium">Python</p>
                        <p class="text-lg">
                            Lorem ipsum dolor sit amet consectetur adipisicing elit. Magni dolorem
                            facere suscipit itaque facilis iste tempora, aliquam id fuga distinctio
                            inventore in commodi alias cumque perferendis ducimus reiciendis ratione
                            dolore.
                        </p>
                        <RouterLink class="bg-black p-20 w-[35%]" to="">
                            <div></div>
                        </RouterLink>
                    </div>
                </div>
                <div class="grid grid-cols-4 justify-items-center px-20 py-12 gap-6">
                    <RouterLink to="" v-for="item in items.slice(0, 8)">
                        <div class="flex bg-black border-2 p-20 w-[300px] h-[400px] text-white"></div>
                    </RouterLink>
                </div>
                <div class="flex justify-center gap-4">
                    <RouterLink to="" v-for="value in pageAmount">
                        <span class="font-light hover:font-normal">{{ value }}</span>
                    </RouterLink>
                </div>
            </div>
        </div>
    </section>
    <Footer />
</template>

<script>
export default {
    data() {
        return {
            IsActiveCate: true,
            IsActiveLevel: true,
            IsActivePrice: true,
            IsActiveAmount: true,
            IsActiveCer: true,
            IsActiveLesson: true,
            searchValue: null,
            beginner: null,
            intermediate: null,
            advanced: null,
            priceFree: null,
            price1To1000: null,
            price1001To3000: null,
            price3000: null,
            amountFull: null,
            amountNotFull: null,
            cerHave: null,
            cerNot: null,
            lesson0To4: null,
            lesson5To15: null,
            lesson16: null,
            items: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12],
        };
    },
    computed: {
        pageAmount() {
            return Math.ceil(this.items.length/8)
        }
    },
    methods: {
        clearFilter() {
            this.beginner = null
            this.intermediate = null
            this.advanced = null
            this.priceFree = null
            this.price1To1000 = null
            this.price1001To3000 = null
            this.price3000 = null
            this.amountFull = null
            this.amountNotFull = null
            this.cerHave = null
            this.cerNot = null
            this.lesson0To4 = null
            this.lesson5To15 = null
            this.lesson16 = null
        }
    }
};
</script>
<style>

.dropdown {
    position: relative;
    display: inline-block;
}

/* scroll bar */
.scrollbar::-webkit-scrollbar {
    background-color:#fff;
    width:16px
}

.scrollbar::-webkit-scrollbar-track {
    background-color:#fff
}
.scrollbar::-webkit-scrollbar-track:hover {
    background-color:#f4f4f4
}

.scrollbar::-webkit-scrollbar-thumb {
    background-color:#babac0;
    border-radius:16px;
    border:5px solid #fff
}
.scrollbar::-webkit-scrollbar-thumb:hover {
    background-color:#a0a0a5;
    border:4px solid #f4f4f4
}

.scrollbar::-webkit-scrollbar-button {display:none}

</style>
