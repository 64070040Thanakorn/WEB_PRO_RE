<template>
  <div class="flex justify-center mb-52">
    <div class="flex flex-col my-10 mx-20 w-[90%]">
      <div class="flex justify-between">
        <div>
          <h1 class="text-4xl">สร้างคอร์สเรียน</h1>
          <p class="text-gray-400">คอร์สเรียน: {{ course.title }}</p>
        </div>
      </div>
      <div class="h-[2px] w-full bg-[#F6F6F6] rounded my-7"></div>
      <div class="flex justify-center">
        <div class="flex flex-col space-y-5">
          <div class="flex flex-col space-y-1">
            <label class="" for="">ชื่อ</label>
            <input class="border rounded px-3 py-1 w-[50vw]" type="text" v-model="course.title"/>
          </div>
          <div class="flex flex-col space-y-1">
            <label class="" for="">ประเภทวิชา</label>
            <select name="" id="" class="border rounded px-3 py-1">
              <option value=""></option>
            </select>
          </div>
          <div class="flex flex-col space-y-1">
            <label class="" for="">ข้อมูลเพิ่มเติม</label>
            <input class="border rounded px-3 py-1 w-[50vw]" type="text" v-model="course.description"/>
          </div>
          <div class="flex flex-col space-y-1">
            <label class="" for="">ข้อมูลคอร์สเรียน</label>
            <textarea class="border rounded px-3 py-1 w-[50vw]" type="text" v-model="course.info"></textarea>
          </div>
          <div class="flex flex-col space-y-1">
            <label class="" for="">ราคา</label>
            <input class="border rounded px-3 py-1 w-[50vw]" type="text" v-model="course.price"/>
          </div>
          <div class="flex flex-col space-y-1">
            <label class="" for="">ระดับ</label>
            <select class="border rounded px-3 py-1 w-[50vw]">
              <option value="1">พึ่งเริ่มต้น</option>
              <option value="2">มีพื้นฐาน</option>
              <option value="3">เชี่ยวชาญ</option>
            </select>
          </div>
          <div class="flex space-x-2">
            <input class="border rounded px-3 py-1" type="checkbox" v-model="course.certificate"/>
            <label class="" for="">ใบ certificate</label>
          </div>
          <div class="flex flex-col space-y-1">
            <label class="" for="">คาบเรียน</label>
            <input class="border rounded px-3 py-1 w-[50vw]" type="text" v-model="course.lesson"/>
          </div>
          <div class="flex flex-col space-y-1">
            <label class="" for="">จำนวนคนที่รับ</label>
            <input class="border rounded px-3 py-1 w-[50vw]" type="text" v-model="course.amount"/>
          </div>
          <div class="flex flex-col space-y-1">
            <label class="" for="">เริ่มเรียน</label>
            <input class="border rounded px-3 py-1 w-[50vw]" type="date" v-model="course.start_date"/>
          </div>
          <div class="flex flex-col space-y-1">
            <label class="" for="">จบเรียน</label>
            <input class="border rounded px-3 py-1 w-[50vw]" type="date" v-model="course.end_date"/>
          </div>
          <div class="flex flex-col">
            <div class="flex justify-between">
              <div class="w-[350px] h-[150px] overflow-hidden rounded">
                <img :src="file ? imageUrl : course.course_image ? `http://localhost:3000/images/${course.course_image}` : 'https://media.discordapp.net/attachments/1067453596351856650/1096913733281927369/no-picture-available-placeholder-thumbnail-icon-illustration-design.png'" alt="" class="w-full h-full object-cover"/>
              </div>
              <div class="space-x-3">
                <button @click="change()" class="text-red-700  hover:text-red-900">
                  อัพเดท
                </button>
              </div>
            </div>
            <div>
              <input id="image-upload" class="block w-full text-sm text-gray-900 border border-gray-300 cursor-pointer bg-gray-50 dark:text-gray-400 focus:outline-none mt-8" type="file" accept="image/*" @change="onFileSelected"/>
            </div>
          </div>
          <div class="flex justify-between mt-5">
            <button class="border px-3 py-1 rounded">ยกเลิก</button>
            <button class="bg-black text-white px-3 py-1 rounded">สร้างคอร์สเรียน</button>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import course from '../components/admin/Course.vue';
import user from '../components/admin/User.vue';

export default {
  components:{
    user,
    course,
  },
  data() {
    return {
      course: {},
      file: null,
      imageUrl: null,
    }
  },
  beforeCreate(){
    this.axios
      .get(`http://localhost:3000/api/course/${this.$route.params.course_id}`)
      .then((response) => {
        this.course = response.data
      });
  },
  methods: {
    onFileSelected(event) {
      const selectedFile = event.target.files[0];
      this.file = selectedFile;
      try{
        this.imageUrl = URL.createObjectURL(selectedFile);
      } catch(err){
      }
    },
  }
}

</script>