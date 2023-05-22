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
            <span v-if="!v$.course.title.required.$response" class="text-red-500 text-xs">
              *กรุณากรอกข้อมูล
            </span>
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
            <span v-if="!v$.course.category_id.required.$response" class="text-red-500 text-xs">
              *กรุณากรอกข้อมูล
            </span>
          </div>
          <div class="flex flex-col space-y-1">
            <label class="" for="">ข้อมูลเพิ่มเติม</label>
            <input class="border rounded px-3 py-1 w-[50vw]" type="text" v-model="course.description"/>
            <span v-if="!v$.course.description.required.$response" class="text-red-500 text-xs">
              *กรุณากรอกข้อมูล
            </span>
            <span v-if="!v$.course.description.minLength.$response" class="text-red-500 text-xs">
                *ต้องมีอย่างน้อย 10 ตัวอักษร
            </span>
            <span v-if="!v$.course.description.maxLength.$response" class="text-red-500 text-xs">
                *ต้องมีไม่มากกว่า 200 ตัวอักษร
            </span>
          </div>
          <div class="flex flex-col space-y-1">
            <label class="" for="">ข้อมูลคอร์สเรียน</label>
            <textarea class="border rounded px-3 py-1 w-[50vw]" type="text" v-model="course.info"></textarea>
            <span v-if="!v$.course.info.required.$response" class="text-red-500 text-xs">
              *กรุณากรอกข้อมูล
            </span>
            <span v-if="!v$.course.info.minLength.$response" class="text-red-500 text-xs">
                *ต้องมีอย่างน้อย 80 ตัวอักษร
            </span>
          </div>
          <div class="flex flex-col space-y-1">
            <label class="" for="">ราคา</label>
            <input class="border rounded px-3 py-1 w-[50vw]" type="number" v-model="course.price"/>
            <span v-if="!v$.course.price.required.$response" class="text-red-500 text-xs">
              *กรุณากรอกข้อมูล
            </span>
            <span v-if="!v$.course.price.numeric.$response" class="text-red-500 text-xs">
              *ข้อมูลต้องเป็นตัวเลข
            </span>
          </div>
          <div class="flex flex-col space-y-1">
            <label class="" for="">ระดับ</label>
            <select class="border rounded px-3 py-1 w-[50vw]" v-model="c_level">
              <option value="ระดับเริ่มต้น">ระดับเริ่มต้น</option>
              <option value="ระดับกลาง">ระดับกลาง</option>
              <option value="ระดับสูง">ระดับสูง</option>
            </select>
            <span v-if="!v$.course.level.required.$response" class="text-red-500 text-xs">
              *กรุณากรอกข้อมูล
            </span>
          </div>
          <div class="flex space-x-2">
            <input id="certificate" class="border rounded px-3 py-1" type="checkbox" v-model="course.certificate"/>
            <label class="" for="certificate">ใบ certificate</label>
          </div>
          <div class="flex flex-col space-y-1">
            <label class="" for="">คาบเรียน</label>
            <input class="border rounded px-3 py-1 w-[50vw]" type="number" v-model="course.lesson"/>
            <span v-if="!v$.course.lesson.required.$response" class="text-red-500 text-xs">
              *กรุณากรอกข้อมูล
            </span>
            <span v-if="!v$.course.lesson.numeric.$response" class="text-red-500 text-xs">
              *ข้อมูลต้องเป็นตัวเลข
            </span>
          </div>
          <div class="flex flex-col space-y-1">
            <label class="" for="">จำนวนคนที่รับ</label>
            <input class="border rounded px-3 py-1 w-[50vw]" type="number" v-model="course.amount"/>
            <span v-if="!v$.course.amount.required.$response" class="text-red-500 text-xs">
              *กรุณากรอกข้อมูล
            </span>
            <span v-if="!v$.course.amount.numeric.$response" class="text-red-500 text-xs">
              *ข้อมูลต้องเป็นตัวเลข
            </span>
          </div>
          <div class="flex flex-col space-y-1">
            <label class="" for="">เริ่มเรียน</label>
            <input class="border rounded px-3 py-1 w-[50vw]" type="datetime-local" v-model="course.start_date"/>
            <span v-if="!v$.course.start_date.required.$response" class="text-red-500 text-xs">
              *กรุณากรอกข้อมูล
            </span>
          </div>
          <div class="flex flex-col space-y-1">
            <label class="" for="">จบเรียน</label>
            <input class="border rounded px-3 py-1 w-[50vw]" type="datetime-local" v-model="course.end_date"/>
            <span v-if="!v$.course.end_date.required.$response" class="text-red-500 text-xs">
              *กรุณากรอกข้อมูล
            </span>
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
import { useVuelidate } from "@vuelidate/core";
import { minLength, maxLength, required, numeric, minValue } from "@vuelidate/validators";


export default {
  components:{
    user,
    course,
  },
  setup() {
    return { v$: useVuelidate() };
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
  validations() {
    return {
      course: {
        title: {
          required,
        },
        category_id: {
          required,
        },
        description: {
          required,
          minLength: minLength(10),
          maxLength: maxLength(200),
        },
        info: {
          required,
          minLength: minLength(80),
        },
        price: {
          required,
          numeric,
        },
        level: {
          required,
        },
        certificate: {
        },
        lesson: {
          required,
          numeric,
        },
        amount: {
          required,
          numeric,
        },
        start_date: {
          required,
        },
        end_date: {
          required,
        },
      }
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
      this.v$.$touch;
      if (this.v$.$invalid) {
        Swal.fire(
          'Error!',
          'โปรดตรวจสอบความถูกต้องของข้อมูล',
          'error'
        )
        return false;
      }
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
          Swal.fire(
            'Success!',
            'แก้ไขคอร์สเรียนสำเร็จ',
            'success'
          )
          this.$router.push("/dashboard")
        })
        .catch((err) => {
          console.log(err);
          Swal.fire(
            'Error!',
            'โปรดตรวจสอบความถูกต้องของข้อมูล',
            'error'
          )
        });
    },
  },
}

</script>