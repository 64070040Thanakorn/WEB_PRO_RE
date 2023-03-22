<script setup>
import { gsap } from "gsap";
import { TweenMax } from "gsap/gsap-core";
import recommend_card from '../components/mini_card.vue';
import main_card from "../components/main_card.vue";
</script>

<script>


export default {
    data() {
        return {
            isActiveCate: true,
            isActiveLevel: true,
            isActivePrice: true,
            isActiveAmount: true,
            isActiveCer: true,
            isActiveLesson: true,
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
            items: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21],
        };
    },
    computed: {
        pageAmount() {
            return Math.ceil(this.items.length / 12);
        },
    },
    methods: {
        clearFilter() {
            this.beginner = null;
            this.intermediate = null;
            this.advanced = null;
            this.priceFree = null;
            this.price1To1000 = null;
            this.price1001To3000 = null;
            this.price3000 = null;
            this.amountFull = null;
            this.amountNotFull = null;
            this.cerHave = null;
            this.cerNot = null;
            this.lesson0To4 = null;
            this.lesson5To15 = null;
            this.lesson16 = null;
        },
        showHide(header, content, bottom, bool, value) {
            if (bool) {
                gsap.to(header, {
                    rotate: 180
                })
                TweenMax.to(content, 0.1, {
                    y: -20,
                    autoAlpha: 0,
                    display: 'none',
                })
                if (bottom) {
                    TweenMax.to(bottom, 0.1, {
                        y: value
                    })

                    gsap.to(bottom, {
                        delay: 0.1,
                        duration: 0,
                        y: 0,
                    })
                }

            }
            else {

                gsap.to(header, {
                    rotate: 0,
                })

                TweenMax.to(content, 0.1, {
                    y: 0,
                    autoAlpha: 1,
                    display: 'block',
                })

                if (bottom) {
                    TweenMax.to(bottom, 0.1, {
                        y: 0
                    })
                }


            }
        },
    },
};

</script>
<template>
    <section>
        <div class="relative z-10">
            <div class="bg-search-01 w-full h-[600px] bg-cover bg-no-repeat">
                <div class="top-1/3 left-1/2 traslate-y-[-50%] translate-x-[-50%] text-white w-full gap-8 flex flex-col">
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
                            <InputText v-model="searchValue" class="py-2 px-5 rounded-[30px] w-full"
                                placeholder="ค้นหา..." />
                        </span>
                    </div>
                    <div class="flex justify-around items-center w-[50%] mx-auto text-[12px]">
                        <span class="underline">การค้นหาที่ยอดนิยม</span>
                        <button type="button" class="bg-[#1D1D1D]/[.7] py-2 px-8 rounded-[20px]">
                            Python
                        </button>
                        <button type="button" class="bg-[#1D1D1D]/[.7] py-2 px-8 rounded-[20px]">
                            C
                        </button>
                        <button type="button" class="bg-[#1D1D1D]/[.7] py-2 px-8 rounded-[20px]">
                            Java
                        </button>
                        <button type="button" class="bg-[#1D1D1D]/[.7] py-2 px-8 rounded-[20px]">
                            PHP
                        </button>
                        <button type="button" class="bg-[#1D1D1D]/[.7] py-2 px-8 rounded-[20px]">
                            Sql
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <section>
        <div class="flex z-0">
            <div class="w-[15%] bg-white shadow-md shadow-black/10 mx-auto">
                <div class="flex flex-col p-8 overflow-y-auto h-full w-full scrollbar">
                    <!-- upper side-bar -->
                    <div class="gap-4 flex flex-col dropdown mb-[10rem]">
                        <div class="flex justify-between items-center">
                            <p class="text-2xl font-medium">หมวดหมู่วิชา</p>
                            <!-- <i class="pi pi-chevron-up cate-icon"></i> -->
                        </div>
                        <div class="cate-content">
                            <ul class="flex flex-col gap-2 text-normal ml-4 list-disc">
                                <li class="font-light hover:font-normal">All</li>
                                <li class="font-light hover:font-normal">Python</li>
                                <li class="font-light hover:font-normal">JavaScript</li>
                                <li class="font-light hover:font-normal">HTML & CSS</li>
                                <li class="font-light hover:font-normal">SQL</li>
                                <li class="font-light hover:font-normal">Java</li>
                                <li class="font-light hover:font-normal">C++</li>
                                <li class="font-light hover:font-normal">C#</li>
                                <li class="font-light hover:font-normal">Bash</li>
                                <li class="font-light hover:font-normal">C</li>
                                <li class="font-light hover:font-normal">PHP</li>
                                <li class="font-light hover:font-normal">R</li>
                                <li class="font-light hover:font-normal">Swift</li>
                            </ul>
                        </div>
                        <hr class="border-[1.2px]" />
                    </div>
                    <div class="mt-8 mb-8">
                        <div class="flex flex-col">
                            <div class="flex items-center">
                                <h3 class="text-2xl font-normal">Python Course</h3>
                            </div>
                            <p class="text-xs underline font-light text-[#676767]">30 ผลลัพท์</p>
                            <hr class="mt-2 border-[1.5px] border-black">
                        </div>
                        <div class="flex flex-col gap-4 mt-4">
                            <div class="flex justify-between items-center">
                                <div class="flex gap-2 items-center">
                                    <i class="pi pi-sliders-h text-xl"></i>
                                    <p class="text-xl font-light">กรอง</p>
                                </div>
                                <button type="button" class="texl-lg font-light text-red-500 underline"
                                    @click="clearFilter()">
                                    ล้างกรอง
                                </button>
                            </div>
                            <div class="flex flex-col gap-2 dropdown">
                                <button type="button" class="flex justify-between items-center"
                                    @click="showHide('.level-icon', '.level-content', '.level-bottom', isActiveLevel, -90), isActiveLevel = !isActiveLevel">
                                    <p class="text-lg font-normal">ระดับ</p>
                                    <i class="pi pi-chevron-up level-icon"></i>
                                </button>
                                <div class="level-content">
                                    <div class="ml-3 gap-2 flex flex-col">
                                        <div class="flex items-center gap-2">
                                            <input type="checkbox" name="level" value="beginner"
                                                class="p-2 border-2 border-black inline-block" v-model="beginner" />
                                            <span class="font-light">Beginner</span>
                                        </div>
                                        <div class="flex items-center gap-2">
                                            <input type="checkbox" name="level" value="intermediate"
                                                class="p-2 border-2 border-black inline-block" v-model="intermediate" />
                                            <span class="font-light">Intermediate</span>
                                        </div>
                                        <div class="flex items-center gap-2">
                                            <input type="checkbox" name="level" value="advanced"
                                                class="p-2 border-2 border-black inline-block" v-model="advanced" />
                                            <span class="font-light">Advanced</span>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- lower-side-bar -->
                            <div class="flex flex-col gap-2 dropdown level-bottom">
                                <hr class="border-[1.2px]" />
                                <button type="button" class="flex justify-between items-center"
                                    @click="showHide('.price-icon', '.price-content', '.price-bottom', isActivePrice, -120), isActivePrice = !isActivePrice">
                                    <p class="text-lg font-normal">ราคา</p>
                                    <i class="pi pi-chevron-up price-icon"></i>
                                </button>
                                <div class="price-content">
                                    <div class="ml-3 gap-2 flex flex-col">
                                        <div class="flex items-center gap-2">
                                            <input type="checkbox" name="price" value="price"
                                                class="p-2 border-2 border-black inline-block" v-model="priceFree" />
                                            <span class="font-light">ฟรี</span>
                                        </div>
                                        <div class="flex items-center gap-2">
                                            <input type="checkbox" name="price" value="price"
                                                class="p-2 border-2 border-black inline-block" v-model="price1To1000" />
                                            <span class="font-light">1-1000 บาท</span>
                                        </div>
                                        <div class="flex items-center gap-2">
                                            <input type="checkbox" name="price" value="price"
                                                class="p-2 border-2 border-black inline-block" v-model="price1001To3000" />
                                            <span class="font-light">1001-3000 บาท</span>
                                        </div>
                                        <div class="flex items-center gap-2">
                                            <input type="checkbox" name="price" value="price"
                                                class="p-2 border-2 border-black inline-block" v-model="price3000" />
                                            <span class="font-light">มากกว่า 3000 บาท</span>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="flex flex-col gap-2 dropdown price-bottom level-bottom">
                                <hr class="border-[1.2px]" />
                                <button type="button" class="flex justify-between items-center"
                                    @click="showHide('.amount-icon', '.amount-content', '.amount-bottom', isActiveAmount, -60), isActiveAmount = !isActiveAmount">
                                    <p class="text-lg font-normal">จำนวนคน</p>
                                    <i class="pi pi-chevron-up amount-icon"></i>
                                </button>
                                <div class="amount-content">
                                    <div class="ml-3 gap-2 flex flex-col">
                                        <div class="flex items-center gap-2">
                                            <input type="checkbox" name="amount" value="amount"
                                                class="p-2 border-2 border-black inline-block" v-model="amountFull" />
                                            <span class="font-light">เต็ม</span>
                                        </div>
                                        <div class="flex items-center gap-2">
                                            <input type="checkbox" name="amount" value="amount"
                                                class="p-2 border-2 border-black inline-block" v-model="amountNotFull" />
                                            <span class="font-light">ไม่เต็ม</span>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="flex flex-col gap-2 dropdown amount-bottom price-bottom level-bottom">
                                <hr class="border-[1.2px]" />
                                <button type="button" class="flex justify-between items-center"
                                    @click="showHide('.cer-icon', '.cer-content', '.cer-bottom', isActiveCer, -60), isActiveCer = !isActiveCer">
                                    <p class="text-lg font-normal">ใบ Certificate</p>
                                    <i class="pi pi-chevron-up cer-icon"></i>
                                </button>
                                <div class="cer-content">
                                    <div class="ml-3 gap-2 flex flex-col">
                                        <div class="flex items-center gap-2">
                                            <input type="checkbox" name="cer" value="cer"
                                                class="p-2 border-2 border-black inline-block" v-model="cerHave" />
                                            <span class="font-light">มี</span>
                                        </div>
                                        <div class="flex items-center gap-2">
                                            <input type="checkbox" name="cer" value="cer"
                                                class="p-2 border-2 border-black inline-block" v-model="cerNot" />
                                            <span class="font-light">ไม่มี</span>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="flex flex-col gap-2 dropdown level-bottom price-bottom amount-bottom cer-bottom">
                                <hr class="border-[1.2px]" />
                                <button type="button" class="flex justify-between items-center"
                                    @click="showHide('.lesson-icon', '.lesson-content', null, isActiveLesson, -60), isActiveLesson = !isActiveLesson">
                                    <p class="text-lg font-normal">บทเรียน</p>
                                    <i class="pi pi-chevron-up lesson-icon"></i>
                                </button>
                                <div class="lesson-content">
                                    <div class="ml-3 gap-2 flex flex-col">
                                        <div class="flex items-center gap-2">
                                            <input type="checkbox" name="lesson" value="lesson"
                                                class="p-2 border-2 border-black inline-block" v-model="lesson0To4" />
                                            <span class="font-light">0 - 4 บท</span>
                                        </div>
                                        <div class="flex items-center gap-2">
                                            <input type="checkbox" name="lesson" value="lesson"
                                                class="p-2 border-2 border-black inline-block" v-model="lesson5To15" />
                                            <span class="font-light">5 - 15 บท</span>
                                        </div>
                                        <div class="flex items-center gap-2">
                                            <input type="checkbox" name="lesson" value="lesson"
                                                class="p-2 border-2 border-black inline-block" v-model="lesson16" />
                                            <span class="font-light">16+ บท</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- <div class="level-bottom price-bottom amount-bottom cer-bottom lesson-bottom"></div> -->
                        </div>
                    </div>
                </div>
            </div>
            <div class="w-[85%] mb-20">
                <div class="flex flex-col relative">
                    <div class="bg-search-02 w-full h-[650px]">
                        <div class="top-0 left-0 px-20 py-12 flex flex-col gap-8">
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
                            <h1 class="text-2xl font-medium">คอร์สเรียนที่แนะนำ</h1>
                            <RouterLink id="recommend_card" class="scale-[0.9] translate-x-[-4vw]" to="">
                                <recommend_card/>
                            </RouterLink>
                        </div>

                    </div>
                </div>
                <div class="grid grid-cols-4 justify-items-center px-12 py-12 gap-y-10 space-x-1">
                    <div v-for="item in items.slice(0, 12)">
                        <main_card/>
                    </div>
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

<style>
.dropdown {
    position: relative;
    display: inline-block;
}

/* scroll bar */
.scrollbar::-webkit-scrollbar {
    background-color: #fff;
    width: 16px;
}

.scrollbar::-webkit-scrollbar-track {
    background-color: #fff;
}

.scrollbar::-webkit-scrollbar-track:hover {
    background-color: #f4f4f4;
}

.scrollbar::-webkit-scrollbar-thumb {
    background-color: #babac0;
    border-radius: 16px;
    border: 5px solid #fff;
}

.scrollbar::-webkit-scrollbar-thumb:hover {
    background-color: #a0a0a5;
    border: 4px solid #f4f4f4;
}

.scrollbar::-webkit-scrollbar-button {
    display: none;
}
</style>
