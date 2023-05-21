<script setup>
import { gsap } from "gsap";
import { TweenMax } from "gsap/gsap-core";
import Main_card from "../components/main_card.vue";
import Recommend_card from "../components/mini_card.vue";
</script>

<script>
export default {
  name: "Search",
  beforeCreate() {
    this.axios.get(`http://localhost:3000/api/course/`).then((response) => {
      this.course_item = response.data;
    });

    this.axios.get(`http://localhost:3000/api/category/`).then((response) => {
      this.category = response.data;
    });

    this.axios.get(`http://localhost:3000/api/course/randomCourse/1`).then((response) => {
      this.random_course_item = response.data;
    });
    // if(this.user){
    //   this.axios.get(`http://localhost:3000/api/user/by/${localStorage.getItem('user')}`)
    //     .then(res => {
    //       this.userLog_on = res.data
    //     })
    // }
  },
  mounted(){
    this.user = localStorage.getItem('user')
  },
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
      course_item: [],
      category: [],
      random_course_item: [],
      user: {},
      userLog_on: {},
    };
  },
  computed: {
    pageAmount() {
      return Math.ceil(this.items.length / 12);
    },
    all_course_length() {
      return this.course_item ? this.course_item.length : 0;
    },
    item_length() {
      return this.filteredItems ? this.filteredItems.length : 0;
    },
    filteredItems() {
      return this.searchValue
        ? this.course_item.filter((item) =>
            item.title.toLocaleLowerCase().includes(this.searchValue.toLocaleLowerCase())
          )
        : this.course_item;
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
          rotate: 180,
        });
        TweenMax.to(content, 0.1, {
          y: -20,
          autoAlpha: 0,
          display: "none",
        });
        if (bottom) {
          TweenMax.to(bottom, 0.1, {
            y: value,
          });

          gsap.to(bottom, {
            delay: 0.1,
            duration: 0,
            y: 0,
          });
        }
      } else {
        gsap.to(header, {
          rotate: 0,
        });

        TweenMax.to(content, 0.1, {
          y: 0,
          autoAlpha: 1,
          display: "block",
        });

        if (bottom) {
          TweenMax.to(bottom, 0.1, {
            y: 0,
          });
        }
      }
    },
    scrollToTop() {
      window.scrollTo(0, 0);
    },
  },
};
</script>
<template>
  <section>
    <div class="relative z-10">
      <div class="bg-search-01 w-full h-[600px] bg-cover bg-no-repeat flex items-center">
        <div class="text-white w-full gap-8 flex flex-col">
          <p class="flex justify-center text-6xl font-medium">
            หาคอร์สเรียนที่เหมาะกับคุณ
          </p>
          <div class="flex justify-center text-center">
            <p class="w-[70%] text-sm">
              แหล่งรวมคอร์สเรียนมากกว่าหนึ่งร้อยคอร์สเรียน มาไว้ให้คุณที่นี้แล้ว <br />
              ค้นหาคอร์สที่คุณสนใจด้านล่างนี้เลย
            </p>
          </div>
          <div class="flex justify-center text-black">
            <span class="p-input-icon-left w-[50%]">
              <!--  !!!!!! icon หน้าโง่ไม่อยู่ใน input, primevue มีแต่กูใช้มะได้ !!!!!!-->

              <!-- <i class="pi pi-search" /> -->
              <InputText
                v-model="searchValue"
                class="py-2 px-5 rounded-[30px] w-full"
                placeholder="ค้นหา..."
              />
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
    <div class="flex">
      <div class="w-[18%] bg-white shadow-md shadow-black/10 mx-auto">
        <div class="flex flex-col p-8 overflow-y-auto h-full w-full scrollbar">
          <!-- upper side-bar -->
          <div class="gap-4 flex flex-col dropdown mb-[10rem]">
            <div class="flex justify-between items-center">
              <p class="text-2xl font-medium">หมวดหมู่วิชา</p>
              <!-- <i class="pi pi-chevron-up cate-icon"></i> -->
            </div>
            <div class="cate-content">
              <div>
                <ul class="flex flex-col gap-2 text-normal ml-4 list-disc">
                  <Router-link to="/search">
                    <li class="font-light hover:font-normal">All</li>
                  </Router-Link>
                </ul>
                <ul
                  class="flex flex-col gap-2 text-normal ml-4 list-disc"
                  v-for="item in category"
                >
                  <Router-link :to="{ path: `category/${item.category_id}` }">
                    <li class="font-light hover:font-normal">{{ item.category_name }}</li>
                  </Router-Link>
                </ul>
              </div>
            </div>
            <hr class="border-[1.2px]" />
          </div>

          <!-- lower side-bar -->
          <div class="mt-8 mb-8">
            <div class="flex flex-col">
              <div class="flex items-center">
                <h3 class="text-2xl font-normal">All Course</h3>
              </div>
              <p class="text-xs underline font-light text-[#676767]">
                {{ item_length }} ผลลัพท์
              </p>
              <hr class="mt-2 border-[1.5px] border-black" />
            </div>
            <div class="flex flex-col gap-4 mt-4">
              <div class="flex justify-between items-center">
                <div class="flex gap-2 items-center">
                  <i class="pi pi-sliders-h text-xl"></i>
                  <p class="text-xl font-light">กรอง</p>
                </div>
                <button
                  type="button"
                  class="texl-lg font-light text-red-500 underline"
                  @click="clearFilter()"
                >
                  ล้างกรอง
                </button>
              </div>
              <div class="flex flex-col gap-2 dropdown">
                <button
                  type="button"
                  class="flex justify-between items-center"
                  @click="
                    showHide(
                      '.level-icon',
                      '.level-content',
                      '.level-bottom',
                      isActiveLevel,
                      -90
                    ),
                      (isActiveLevel = !isActiveLevel)
                  "
                >
                  <p class="text-lg font-normal">ระดับ</p>
                  <i class="pi pi-chevron-up level-icon"></i>
                </button>
                <div class="level-content">
                  <div class="ml-3 gap-2 flex flex-col">
                    <div class="flex items-center gap-2">
                      <input
                        id="beginner"
                        type="checkbox"
                        name="level"
                        value="beginner"
                        class="p-2 border-2 border-black inline-block"
                        v-model="beginner"
                      />
                      <label for="beginner" class="font-light">ระดับเริ่มต้น</label>
                    </div>
                    <div class="flex items-center gap-2">
                      <input
                        id="intermediate"
                        type="checkbox"
                        name="level"
                        value="intermediate"
                        class="p-2 border-2 border-black inline-block"
                        v-model="intermediate"
                      />
                      <label for="intermediate" class="font-light">ระดับกลาง</label>
                    </div>
                    <div class="flex items-center gap-2">
                      <input
                        id="advanced"
                        type="checkbox"
                        name="level"
                        value="advanced"
                        class="p-2 border-2 border-black inline-block"
                        v-model="advanced"
                      />
                      <label for="advanced" class="font-light">ระดับสูง</label>
                    </div>
                  </div>
                </div>
              </div>

              <div class="flex flex-col gap-2 dropdown level-bottom">
                <hr class="border-[1.2px]" />
                <button
                  type="button"
                  class="flex justify-between items-center"
                  @click="
                    showHide(
                      '.price-icon',
                      '.price-content',
                      '.price-bottom',
                      isActivePrice,
                      -120
                    ),
                      (isActivePrice = !isActivePrice)
                  "
                >
                  <p class="text-lg font-normal">ราคา</p>
                  <i class="pi pi-chevron-up price-icon"></i>
                </button>
                <div class="price-content">
                  <div class="ml-3 gap-2 flex flex-col">
                    <div class="flex items-center gap-2">
                      <input
                        id="priceFree"
                        type="checkbox"
                        name="priceFree"
                        value="priceFree"
                        class="p-2 border-2 border-black inline-block"
                        v-model="priceFree"
                      />
                      <label for="priceFree" class="font-light">ฟรี</label>
                    </div>
                    <div class="flex items-center gap-2">
                      <input
                        id="price1To1000"
                        type="checkbox"
                        name="price1To1000"
                        value="price1To1000"
                        class="p-2 border-2 border-black inline-block"
                        v-model="price1To1000"
                      />
                      <label for="price1To1000" class="font-light">1-1000 บาท</label>
                    </div>
                    <div class="flex items-center gap-2">
                      <input
                        id="price1001To3000"
                        type="checkbox"
                        name="price1001To3000"
                        value="price1001To3000"
                        class="p-2 border-2 border-black inline-block"
                        v-model="price1001To3000"
                      />
                      <label for="price1001To3000" class="font-light"
                        >1001-3000 บาท</label
                      >
                    </div>
                    <div class="flex items-center gap-2">
                      <input
                        id="price3000"
                        type="checkbox"
                        name="price3000"
                        value="price3000"
                        class="p-2 border-2 border-black inline-block"
                        v-model="price3000"
                      />
                      <label for="price3000" class="font-light">มากกว่า 3000 บาท</label>
                    </div>
                  </div>
                </div>
              </div>

              <div class="flex flex-col gap-2 dropdown price-bottom level-bottom">
                <hr class="border-[1.2px]" />
                <button
                  type="button"
                  class="flex justify-between items-center"
                  @click="
                    showHide(
                      '.amount-icon',
                      '.amount-content',
                      '.amount-bottom',
                      isActiveAmount,
                      -60
                    ),
                      (isActiveAmount = !isActiveAmount)
                  "
                >
                  <p class="text-lg font-normal">จำนวนคน</p>
                  <i class="pi pi-chevron-up amount-icon"></i>
                </button>
                <div class="amount-content">
                  <div class="ml-3 gap-2 flex flex-col">
                    <div class="flex items-center gap-2">
                      <input
                        id="amountFull"
                        type="checkbox"
                        name="amountFull"
                        value="amountFull"
                        class="p-2 border-2 border-black inline-block"
                        v-model="amountFull"
                      />
                      <label for="amountFull" class="font-light">เต็ม</label>
                    </div>
                    <div class="flex items-center gap-2">
                      <input
                        id="amountNotFull"
                        type="checkbox"
                        name="amountNotFull"
                        value="amountNotFull"
                        class="p-2 border-2 border-black inline-block"
                        v-model="amountNotFull"
                      />
                      <label for="amountNotFull" class="font-light">ไม่เต็ม</label>
                    </div>
                  </div>
                </div>
              </div>

              <div
                class="flex flex-col gap-2 dropdown amount-bottom price-bottom level-bottom"
              >
                <hr class="border-[1.2px]" />
                <button
                  type="button"
                  class="flex justify-between items-center"
                  @click="
                    showHide(
                      '.cer-icon',
                      '.cer-content',
                      '.cer-bottom',
                      isActiveCer,
                      -60
                    ),
                      (isActiveCer = !isActiveCer)
                  "
                >
                  <p class="text-lg font-normal">ใบ Certificate</p>
                  <i class="pi pi-chevron-up cer-icon"></i>
                </button>
                <div class="cer-content">
                  <div class="ml-3 gap-2 flex flex-col">
                    <div class="flex items-center gap-2">
                      <input
                        id="cerHave"
                        type="checkbox"
                        name="cerHave"
                        value="cerHave"
                        class="p-2 border-2 border-black inline-block"
                        v-model="cerHave"
                      />
                      <label for="cerHave" class="font-light">มี</label>
                    </div>
                    <div class="flex items-center gap-2">
                      <input
                        id="cerNot"
                        type="checkbox"
                        name="cerNot"
                        value="cerNot"
                        class="p-2 border-2 border-black inline-block"
                        v-model="cerNot"
                      />
                      <label for="cerNot" class="font-light">ไม่มี</label>
                    </div>
                  </div>
                </div>
              </div>

              <div
                class="flex flex-col gap-2 dropdown level-bottom price-bottom amount-bottom cer-bottom"
              >
                <hr class="border-[1.2px]" />
                <button
                  type="button"
                  class="flex justify-between items-center"
                  @click="
                    showHide(
                      '.lesson-icon',
                      '.lesson-content',
                      null,
                      isActiveLesson,
                      -60
                    ),
                      (isActiveLesson = !isActiveLesson)
                  "
                >
                  <p class="text-lg font-normal">บทเรียน</p>
                  <i class="pi pi-chevron-up lesson-icon"></i>
                </button>
                <div class="lesson-content">
                  <div class="ml-3 gap-2 flex flex-col">
                    <div class="flex items-center gap-2">
                      <input
                        id="lesson0To4"
                        type="checkbox"
                        name="lesson0To4"
                        value="lesson0To4"
                        class="p-2 border-2 border-black inline-block"
                        v-model="lesson0To4"
                      />
                      <label for="lesson0To4" class="font-light">0 - 4 บท</label>
                    </div>
                    <div class="flex items-center gap-2">
                      <input
                        id="lesson5To15"
                        type="checkbox"
                        name="lesson5To15"
                        value="lesson5To15"
                        class="p-2 border-2 border-black inline-block"
                        v-model="lesson5To15"
                      />
                      <label for="lesson5To15" class="font-light">5 - 15 บท</label>
                    </div>
                    <div class="flex items-center gap-2">
                      <input
                        id="lesson16"
                        type="checkbox"
                        name="lesson16"
                        value="lesson16"
                        class="p-2 border-2 border-black inline-block"
                        v-model="lesson16"
                      />
                      <label for="lesson16" class="font-light">16+ บท</label>
                    </div>
                  </div>
                </div>
              </div>
              <!-- <div class="level-bottom price-bottom amount-bottom cer-bottom lesson-bottom"></div> -->
            </div>
          </div>
        </div>
      </div>
      <div class="w-[82%] mb-20">
        <div class="bg-search-02 h-[650px] px-20 py-12">
          <div class="space-y-8">
            <p class="text-md text-[#EBC919]">
              หมวดหมู่ <span class="text-black">/ All</span>
            </p>
            <p class="text-4xl font-medium">คอร์สเรียนทั้งหมด</p>
            <p class="text-lg">
              แหล่งรวมคอร์สเรียนต่างๆที่เราคัดสรรมาอย่างมีคุณภาพ เพื่อให้คุณได้มาเรียนรู้ หรือเสริมสร้างประสบการณ์ใหม่ๆ ได้แล้วที่นี่ มีคอร์สมากกว่า {{all_course_length}} คอร์สเรียน มีอาจารย์ที่มีความรู้ จบจากสายตรง การันตีคุณภาพ
            </p>
            <h1 class="text-2xl font-medium">คอร์สเรียนที่น่าสนใจ</h1>
            <div class="flex justify-start">
              <Router-link
                v-for="item in random_course_item"
                :to="{ path: `/course/${item.course_id}` }"
                @click="scrollToTop()"
              >
                <Recommend_card class="card_showing" :item="item" />
              </Router-link>
            </div>
          </div>
        </div>
        <div
          class="grid grid-cols-4 justify-items-center px-12 py-12 gap-y-10 gap-x-1 mb-20"
        >
          <div v-for="item in filteredItems">
            <Main_card :item="item" :user-log_on="userLog_on"/>
          </div>
        </div>
        <!-- <div class="flex justify-center gap-4">
          <RouterLink to="" v-for="value in pageAmount">
            <span class="font-light hover:font-normal">{{ value }}</span>
          </RouterLink>
        </div> -->
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
