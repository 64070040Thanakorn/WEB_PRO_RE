<!-- <div class="container w-[20rem] h-[27rem] bg-white shadow-lg shadow-black/25 p-4 hover:shadow-md hover:scale-[1.05]">
        <div class="flex flex-col">
            <div class="flex flex-col gap-1">
                <div class="flex gap-1">
                    <p class="bg-[#FEB8B8] rounded-[15px] text-xs px-4 py-[0.2rem] text-white">ระดับเริ่มต้น</p>
                    <p class="bg-[#46AECF] rounded-[15px] text-xs px-4 py-[0.2rem] text-white">ใบ Certificate</p>
                </div>
                <h1 class="text-2xl font-normal">Python for beginner</h1>
                <div class="flex text-sm justify-between">
                    <p>16 บทเรียน</p>
                    <div class="flex space-x-1">
                        <svg width="20" height="20" viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <g clip-path="url(#clip0_168_2334)">
                                <path
                                    d="M15.5859 15.0078C14.7226 13.5078 13.1015 12.5 11.25 12.5H8.74999C6.89843 12.5 5.27734 13.5078 4.41406 15.0078C5.78905 16.539 7.78124 17.5 9.99999 17.5C12.2187 17.5 14.2109 16.5351 15.5859 15.0078ZM0 9.99999C0 7.34782 1.05357 4.80429 2.92893 2.92893C4.80429 1.05357 7.34782 0 9.99999 0C12.6521 0 15.1957 1.05357 17.071 2.92893C18.9464 4.80429 20 7.34782 20 9.99999C20 12.6521 18.9464 15.1957 17.071 17.071C15.1957 18.9464 12.6521 20 9.99999 20C7.34782 20 4.80429 18.9464 2.92893 17.071C1.05357 15.1957 0 12.6521 0 9.99999ZM9.99999 10.625C10.7459 10.625 11.4613 10.3287 11.9887 9.80122C12.5162 9.27378 12.8125 8.55841 12.8125 7.81249C12.8125 7.06657 12.5162 6.3512 11.9887 5.82375C11.4613 5.29631 10.7459 4.99999 9.99999 4.99999C9.25407 4.99999 8.5387 5.29631 8.01125 5.82375C7.48381 6.3512 7.18749 7.06657 7.18749 7.81249C7.18749 8.55841 7.48381 9.27378 8.01125 9.80122C8.5387 10.3287 9.25407 10.625 9.99999 10.625Z"
                                    fill="black" />
                            </g>
                            <defs>
                                <clipPath id="clip0_168_2334">
                                    <rect width="20" height="20" fill="white" />
                                </clipPath>
                            </defs>
                        </svg>
                        <p>9/25</p>
                    </div>

                </div>
                <hr class="border-black">
                <p class="text-[#717171] text-sm">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Eveniet,
                    aperiam? Voluptates magnam, sapiente quisquam quos in ut fugiat vitae, necessitatibus magni omnis earum
                    voluptatum consequatur enim nulla temporibus, quam placeat?</p>
            </div>
            <div class="flex flex-col mt-24 gap-2">
                <p class="flex justify-end text-[#5CA949]">ฟรี</p>
                <RouterLink to="">
                    <div class="bg-black text-white py-2 rounded-[3px] text-center hover:bg-[#2E2E2E]">ดูคอร์สเรียน</div>
                </RouterLink>
            </div>
        </div>
    </div> -->

<template>
  <div
    class="w-[300px] h-[430px] shadow-lg shadow-black-500/50 rounded-[15px] flex flex-col"
  >
    <img
      :src="
        item.course_image
          ? `http://localhost:3000/images/${item.course_image}`
          : 'https://media.discordapp.net/attachments/1067453596351856650/1096913733281927369/no-picture-available-placeholder-thumbnail-icon-illustration-design.png'
      "
      class="basis-5/12 rounded-t-[15px] w-auto h-0 object-cover"
      alt="course_img"
    />
    <div class="absolute mx-3 my-2">
      <p class="px-5 py-1 rounded-full text-white text-sm" :style="`background-color: ${item.category.category_color}`">
        {{ item.category.category_name }}
      </p>
    </div>
    <div class="basis-7/12 p-4 gap-y-1 flex flex-col justify-between">
      <div>
        <div class="flex text- justify-between">
          <p>{{ item.lesson }} บทเรียน</p>
          <div class="flex space-x-1 items-center">
            <svg
              width="20"
              height="20"
              viewBox="0 0 20 20"
              fill="none"
              xmlns="http://www.w3.org/2000/svg"
            >
              <g clip-path="url(#clip0_168_2334)">
                <path
                  d="M15.5859 15.0078C14.7226 13.5078 13.1015 12.5 11.25 12.5H8.74999C6.89843 12.5 5.27734 13.5078 4.41406 15.0078C5.78905 16.539 7.78124 17.5 9.99999 17.5C12.2187 17.5 14.2109 16.5351 15.5859 15.0078ZM0 9.99999C0 7.34782 1.05357 4.80429 2.92893 2.92893C4.80429 1.05357 7.34782 0 9.99999 0C12.6521 0 15.1957 1.05357 17.071 2.92893C18.9464 4.80429 20 7.34782 20 9.99999C20 12.6521 18.9464 15.1957 17.071 17.071C15.1957 18.9464 12.6521 20 9.99999 20C7.34782 20 4.80429 18.9464 2.92893 17.071C1.05357 15.1957 0 12.6521 0 9.99999ZM9.99999 10.625C10.7459 10.625 11.4613 10.3287 11.9887 9.80122C12.5162 9.27378 12.8125 8.55841 12.8125 7.81249C12.8125 7.06657 12.5162 6.3512 11.9887 5.82375C11.4613 5.29631 10.7459 4.99999 9.99999 4.99999C9.25407 4.99999 8.5387 5.29631 8.01125 5.82375C7.48381 6.3512 7.18749 7.06657 7.18749 7.81249C7.18749 8.55841 7.48381 9.27378 8.01125 9.80122C8.5387 10.3287 9.25407 10.625 9.99999 10.625Z"
                  fill="black"
                />
              </g>
              <defs>
                <clipPath id="clip0_168_2334">
                  <rect width="20" height="20" fill="white" />
                </clipPath>
              </defs>
            </svg>
            <p>{{item.enrolled.length}}/{{ item.amount }}</p>
          </div>
        </div>
        <p class="text-xl">{{ item.title }}</p>
        <div class="flex justify-between items-center">
          <p class="text-orange-01 text-sm">
            {{ item.level }}{{ item.certificate ? ", ใบ Certificate" : null }}
          </p>
        </div>
        <hr class="border-[1.2px]" />
        <p class="text-[#9F9F9F] font-light text-[10px] textOver">
          {{ item.description }}
        </p>
      </div>
      <div>
        <p class="flex justify-end text-[#467A55] py-2">{{ item.price }} บาท</p>
        <div>
          <RouterLink :to="{ name: 'course', params: { course_id: item.course_id } }" target="" @click="scrollToTop">
            <div class="bg-black text-white py-1 rounded-[3px] text-center hover:bg-black1-hover">
              ดูคอร์สเรียน
            </div>
          </RouterLink>

          <div v-if="userLog_on.role === 'Admin'" class="flex justify-between">
            <RouterLink :to="`/edit/${item.course_id}`" class="bg-white hover:bg-gray-200 py-1 rounded-[3px] text-center border-2 border-black mt-2 w-full">
              แก้ไขคอร์เรียน
            </RouterLink>
            <button class="bg-red-500 hover:bg-red-700 text-white py-1 rounded-[3px] text-center border-2 border-black mt-2 w-full" @click="deleteCourse(item.course_id)">
              ลบคอร์สเรียน
            </button>
          </div>

        </div>
      </div>
    </div>
    <!-- <div class="flex justify-between mx-2 mt-12">
        <a
          href="#"
          class="inline-flex items-center justify-center w-28 px-3 py-2 text-sm font-normal text-center text-green-600 bg-transparent hover:text-green-800"
        >
          แก้ไขคอร์ส
        </a>
        <a
          href="#"
          class="inline-flex items-center justify-center w-28 px-3 py-2 text-sm font-normal text-center text-red-700 bg-transparent hover:text-red-800"
        >
          ลบคอร์ส
        </a>
      </div> -->
  </div>
</template>
<script>
import Swal from 'sweetalert2'

export default {
  props: {
    item: {
      type: Object,
      required: true,
    },
    userLog_on: {
      type: Object,
    }
  },
  data() {
    return {
    };
  },
  methods: {
    scrollToTop() {
      window.scrollTo(0, 0);
    },
    deleteCourse(id) {
      console.log(id);
      this.axios.delete(`http://localhost:3000/api/course/deleteCourse/${id}`, {
        headers: {
          'x-access-token': localStorage.getItem("token"),
        },
      }).then((res) => {
        console.log(res.data);
        this.$emit("change-delete")
        Swal.fire(
            'Success!',
            'ลบคอร์สเรียนสำเร็จ',
            'warning'
          )
        })
        .catch((err) => {
          Swal.fire(
            'Error!',
            'ไม่สามารถลบคอร์สเรียนได้',
            'error'
          )
        })
    }
  },
};
</script>
<style>
.textOver {
  overflow: hidden;
  display: -webkit-box;
  -webkit-line-clamp: 2; /* number of lines to show */
  line-clamp: 2;
  -webkit-box-orient: vertical;
}
</style>
