<template>
  <div class="flex justify-center mb-52">
    <div class="flex flex-col my-10 mx-20 w-[90%]">
      <div class="flex justify-between">
        <div>
          <h1 class="text-4xl">แก้ไขคอร์สเรียน</h1>
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
            <select name="" id="" class="border rounded px-3 py-1" v-model="c_category">
              <template v-for="item in category">
                <option :value="item.category_id">
                    {{item.category_name}}
                </option>
              </template>
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
            <select class="border rounded px-3 py-1 w-[50vw]" v-model="c_level">
              <option value="ระดับเริ่มต้น">ระดับเริ่มต้น</option>
              <option value="ระดับกลาง">ระดับกลาง</option>
              <option value="ระดับสูง">ระดับสูง</option>
            </select>
          </div>
          <div class="flex space-x-2">
            <input id="certificate" class="border rounded px-3 py-1" type="checkbox" v-model="course.certificate"/>
            <label class="" for="certificate">ใบ certificate</label>
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
            <input class="border rounded px-3 py-1 w-[50vw]" type="datetime-local" v-model="course.start_date"/>
          </div>
          <div class="flex flex-col space-y-1">
            <label class="" for="">จบเรียน</label>
            <input class="border rounded px-3 py-1 w-[50vw]" type="datetime-local" v-model="course.end_date"/>
          </div>
          <div class="flex flex-col">
            <div class="flex justify-center">
              <div class="w-[50vh] overflow-hidden rounded">
                <img :src="file ? imageUrl : course.course_image ? `http://localhost:3000/images/${course.course_image}` : 'https://media.discordapp.net/attachments/1067453596351856650/1096913733281927369/no-picture-available-placeholder-thumbnail-icon-illustration-design.png'" alt="" class="w-full h-full object-cover"/>
              </div>
              <!-- <div class="space-x-3">
                <button @click="change()" class="text-red-700  hover:text-red-900">
                  อัพเดท
                </button>
              </div> -->
            </div>
            <div>
              <input id="image-upload" class="block w-full text-sm text-gray-900 border border-gray-300 cursor-pointer bg-gray-50 dark:text-gray-400 focus:outline-none mt-8" type="file" accept="image/*" @change="onFileSelected"/>
            </div>
          </div>
          <div class="flex justify-between mt-5">
            <button class="border px-3 py-1 rounded" @click="back()">ยกเลิก</button>
            <button class="bg-black hover:bg-black1-hover text-white px-3 py-1 rounded" @click="updateData()">อัพเดทคอร์สเรียน</button>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import course from '../components/admin/Course.vue';
import user from '../components/admin/User.vue';
import moment from 'moment';
import Swal from 'sweetalert2'


export default {
  components:{
    user,
    course,
  },
  data() {
    return {
      course: {},
      category: {},
      c_category: null,
      c_level: null,
      file: null,
      imageUrl: null,
    }
  },
  beforeCreate(){
    this.axios
      .get(`http://localhost:3000/api/course/${this.$route.params.course_id}`)
      .then((response) => {
        this.course = response.data
        this.c_category = response.data.category.category_id
        this.c_level = response.data.level
      });

    this.axios.get(`http://localhost:3000/api/category/`).then((response) => {
      this.category = response.data;
    });

    const user = localStorage.getItem('user')
    const role = localStorage.getItem('role')
    if (!user) {
      this.$router.push('/')
    }
    if(role !== 'Admin') {
      this.$router.push('/')
    }
  },
  methods: {
    onFileSelected(event) {
      const selectedFile = event.target.files[0];
      this.file = selectedFile;
      console.log(this.file);
      try{
        this.imageUrl = URL.createObjectURL(selectedFile);
      } catch(err){
      }
    },
    back() {
      this.$router.push("/dashboard")
    },
    updateData() {
      const formData = new FormData();
      if (this.file) {
        formData.append("fileupload", this.file);
      }
      formData.append("course_id", this.course.course_id);
      formData.append("title", this.course.title);
      formData.append("category_id", this.c_category);
      formData.append("description", this.course.description);
      formData.append("info", this.course.info);
      formData.append("price", this.course.price);
      formData.append("level", this.c_level);
      formData.append("certificate", this.course.certificate);
      formData.append("lesson", this.course.lesson);
      formData.append("amount", this.course.amount);
      formData.append("start_date", this.course.start_date);
      formData.append("end_date", this.course.end_date);
      this.axios
        .put("http://localhost:3000/api/course/updateCourse", formData, {
          headers: {
            'x-access-token': localStorage.getItem("token"),
          },
        })
        .then((respones) => {
          console.log(respones);
          this.$router.push("/dashboard")
        })
        .catch((err) => {
          console.log(err);
        });
    },
  },
}

</script>