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

    this.axios.get(`http://localhost:3000/api/category/recommend`).then((response) => {
      this.r_category = response.data;
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
  mounted() {
    this.user = localStorage.getItem("user");
  },
  data() {
    return {
      checkSelected: [],
      selectedOptions: {},
      options: [
        { id: "level1", label: "ระดับเริ่มต้น", name: "level", title: "ระดับ" },
        { id: "level1", label: "ระดับเริ่มต้น", name: "level", title: "ระดับ" },
        { id: "level1", label: "ระดับเริ่มต้น", name: "level", title: "ระดับ" },
        { id: "level1", label: "ระดับเริ่มต้น", name: "level", title: "ระดับ" },
        { id: "level1", label: "ระดับเริ่มต้น", name: "level", title: "ระดับ" },
        { id: "level1", label: "ระดับเริ่มต้น", name: "level", title: "ระดับ" },
        { id: "level1", label: "ระดับเริ่มต้น", name: "level", title: "ระดับ" },
        { id: "level2", label: "ระดับกลาง", name: "level", title: "ระดับ"  },
        { id: "level3", label: "ระดับสูง", name: "level", title: "ระดับ"  },
        { id: "price1000", label: "0-1000 บาท", name: "price", title: "ราคา"  },
        { id: "price2000", label: "0-2000 บาท", name: "price", title: "ราคา"  },
        { id: "price3000", label: "0-3000 บาท", name: "price", title: "ราคา"  },
        { id: "full", label: "เต็ม", name: "amount", title: "จำนวนคน"  },
        { id: "notfull", label: "ไม่เต็ม", name: "amount", title: "จำนวนคน"  },
        { id: "cer", label: "มี", name: "certificate", title: "ใบ Certificate"  },
        { id: "notcer", label: "ไม่มี", name: "certificate", title: "ใบ Certificate"  },
        { id: "lesson4", label: "0-4 บท", name: "lesson", title: "บทเรียน"  },
        { id: "lesson16", label: "0-16 บท", name: "lesson", title: "บทเรียน"  },
        { id: "lesson24", label: "0-24 บท", name: "lesson", title: "บทเรียน"  },
      ],
      searchValue: null,
      isActive: true,
      isActiveLevel: true,
      isActivePrice: true,
      isActiveAmount: true,
      isActiveCer: true,
      isActiveLesson: true,
      course_item: [],
      category: [],
      r_category: [],
      random_course_item: [],
      user: {},
      userLog_on: {},
    };
  },
  computed: {
    selectedOptionsArray() {
      return Object.keys(this.selectedOptions)
        .map((key) => key)
        .filter((key) => this.selectedOptions[key]);
    },
    filteredOptions() {
      if (this.checkSelected.length < 1) {
        return this.filteredItems;
      }
      return this.filteredItems.filter((item) => {
        if (this.selectedOptions.level1 && item.level === "ระดับเริ่มต้น") {
          return true;
        }

        if (this.selectedOptions.level2 && item.level === "ระดับกลาง") {
          return true;
        }

        if (this.selectedOptions.level3 && item.level === "ระดับสูง") {
          return true;
        }

        if (this.selectedOptions.price1000 && item.price <= 1000) {
          return true;
        }

        if (this.selectedOptions.price2000 && item.price <= 2000) {
          return true;
        }

        if (this.selectedOptions.price3000 && item.price <= 3000) {
          return true;
        }

        if (this.selectedOptions.full && item.amount <= item.enrolled.length) {
          return true;
        }
        if (this.selectedOptions.notfull && item.amount > item.enrolled.length) {
          return true;
        }

        if (this.selectedOptions.cer && item.certificate) {
          return true;
        }

        if (this.selectedOptions.notcer && !item.certificate) {
          return true;
        }

        if (this.selectedOptions.lesson4 && item.lesson <= 4) {
          return true;
        }

        if (this.selectedOptions.lesson16 && item.lesson <= 16) {
          return true;
        }

        if (this.selectedOptions.lesson24 && item.lesson <= 24) {
          return true;
        }

        return false;
      });
    },

    pageAmount() {
      return Math.ceil(this.items.length / 12);
    },
    all_course_length() {
      return this.course_item ? this.course_item.length : 0;
    },
    item_length() {
      return this.filteredOptions ? this.filteredOptions.length : 0;
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
      this.selectedOptions = {};
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
  watch: {
    selectedOptionsArray(newValues) {
      this.checkSelected = newValues;
      console.log(this.checkSelected); // Perform any desired action with the updated array
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
            <span class="underline">รายวิชาใหม่ๆที่น่าสนใจ</span>
            <template v-for="item in r_category">
              <Router-link :to="{ path: `/category/${item.category_id}` }">
                <button
                  type="button"
                  class="bg-[#1D1D1D]/70 hover:bg-[#1D1D1D]/90 py-2 px-8 rounded-[20px]"
                >
                  {{ item.category_name }}
                </button>
              </Router-link>
            </template>
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
                  </Router-link>
                </ul>
                <ul
                  class="flex flex-col gap-2 text-normal ml-4 list-disc"
                  v-for="item in category"
                >
                  <Router-link :to="{ path: `category/${item.category_id}` }">
                    <li class="font-light hover:font-normal">{{ item.category_name }}</li>
                  </Router-link>
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


              <!-- filter -->
              <section class="flex flex-col dropdown" v-for="(item, index) in options" :key="index">
                  <button v-if="index === 0 || item.name != options[index-1].name"
                    type="button"
                    class="flex justify-between items-center"
                    :class="!(index === 0 || item.name != options[index-1].name) ? 'hidden' : ''"
                    @click="showHide(`.${item.name}-icon`, `.${item.name}-content`, null, isActive), (isActive = !isActive)">
                    <p class="text-lg font-normal">{{item.title}}</p>
                    <i class="pi pi-chevron-up" :class="`${item.name}-icon`"></i>
                  </button>
                  <div :class="`${item.name}-content`">
                    <div class="ml-3 gap-2 flex flex-col">
                      <div class="flex items-center gap-2" >
                          <input :id="item.id" type="checkbox" class="p-2 border-2 border-black inline-block" v-model="selectedOptions[item.id]"/>
                          <label :for="item.id" class="font-light">{{item.label}}</label>
                      </div>
                    </div>
                  </div>
                  <template v-if="index === options.length - 1 || item.name !== options[index + 1].name">
                    <hr class="border-[1.2px]" />
                  </template>
              </section>


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
              แหล่งรวมคอร์สเรียนต่างๆที่เราคัดสรรมาอย่างมีคุณภาพ เพื่อให้คุณได้มาเรียนรู้
              หรือเสริมสร้างประสบการณ์ใหม่ๆ ได้แล้วที่นี่ มีคอร์สมากกว่า
              {{ all_course_length }} คอร์สเรียน มีอาจารย์ที่มีความรู้ จบจากสายตรง
              การันตีคุณภาพ
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
          <div v-for="item in filteredOptions">
            <Main_card :item="item" :user-log_on="userLog_on" />
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
