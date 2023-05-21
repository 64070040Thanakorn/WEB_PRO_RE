<script>
import { useVuelidate } from "@vuelidate/core";
import { email, maxLength, minLength, required, requiredIf } from "@vuelidate/validators";

export function isNumeric(value) {
  return /^[0-9]+$/.test(value);
}
export function isDatePattern(value) {
  return /^\d{2}\/\d{2}$/.test(value);
}

export default {
  setup(){
    return { v$: useVuelidate() };
  },
  name: "payment",
  data() {
    return {
      course: {
        id: null,
        name: null,
        category: null,
        price: null,
        img: null,
      },
      vat: null,
      paymentMethods: null,
      customer: {
        first_name: '',
        last_name: '',
        email: '',
        tel: '',
      },
      creditCard: {
        cc_number: null,
        cc_cvc: null,
        cc_exp: null,
        cc_first_name: null,
        cc_last_name: null,
      },
      userCreditCard: [],
      userCCSelected: null,
      }
  },
  validations(){
    return {
      customer: {
        first_name: { required },
        last_name: { required },
        email: { required, email },
        tel: { required, minLength: minLength(9), maxLength: maxLength(10) },
      },
      creditCard: {
        cc_number: { required: requiredIf(function () {
          return (this.paymentMethods === 'CreditCard' && !this.userCCSelected);
        }), minLength: minLength(16), maxLength: maxLength(16), isNumeric},
        cc_cvc: { required: requiredIf(function () {
          return (this.paymentMethods === 'CreditCard' && !this.userCCSelected);
        }), minLength: minLength(3), maxLength: maxLength(3), isNumeric },
        cc_exp: { required: requiredIf(function () {
          return (this.paymentMethods === 'CreditCard' && !this.userCCSelected);
        }), isDatePattern },
        cc_first_name: { required: requiredIf(function () {
          return (this.paymentMethods === 'CreditCard' && !this.userCCSelected);
        }) },
        cc_last_name: { required: requiredIf(function () {
          return (this.paymentMethods === 'CreditCard' && !this.userCCSelected);
        }) },
      },
    }
  },
  mounted() {
    this.axios
      .get(`http://localhost:3000/api/course/${this.$route.params.course_id}`)
      .then((res) => {
        this.course.id = res.data.course_id
        this.course.name = res.data.title
        this.course.category = res.data.category.category_name
        this.course.price = parseFloat(res.data.price)
        this.course.img = res.data.course_image
        this.vat = this.course.price+(this.course.price*0.07)
      });
    this.fetchUserCC()
    const payment101 = localStorage.getItem('payment')
    if(!payment101){
      this.$router.push("/")
    }
  },
  methods: {
    payment(){
      this.v$.$touch;
      if (this.v$.$invalid) {
        alert("โปรดตรวจสอบความถูกต้องของข้อมูล")
        return false;
      }

      const data = {
        user_id: localStorage.getItem('user'),
        course: {id: this.course.id},
        customer: this.customer,
        payment_methods: this.paymentMethods,
        total: this.vat,
      }
      if(this.paymentMethods === 'CreditCard' && !this.userCCSelected){
        data['creditCard'] = this.creditCard
      }
      if(this.userCCSelected){
        data['usingCC'] = this.userCCSelected
      }
      
      this.axios.post(`http://localhost:3000/api/payment/`,data, {
        headers: {
          'x-access-token': localStorage.getItem("token"),
        },
      })
        .then(res => {
          this.fetchEnroll()
          this.$router.push('/payment/success')
          localStorage.removeItem('payment')
          console.log(res);
        })
        .catch(err => {
          console.log(err);
        })
    },
    removeCC(id){
      this.axios.delete(`http://localhost:3000/api/payment/${id}`, {
        headers: {
          'x-access-token': localStorage.getItem("token"),
        },
      })
        .then(res => {
          this.fetchUserCC()
          console.log(`remove CC ${id}`);
        })
    },
    fetchUserCC(){
      const userData = { user_id: localStorage.getItem('user')}
      this.axios
      .get(`http://localhost:3000/api/payment/getCredit/${userData.user_id}`)
      .then((res) => {
        this.userCreditCard = res.data
      });
    },
    fetchEnroll() {
      const userData = { user_id: localStorage.getItem('user')}
      this.axios
      .post(`http://localhost:3000/api/course/enroll/${this.course.id}`, userData, {
        headers: {
          'x-access-token': localStorage.getItem("token"),
        },
      })
      .then((res) => {
      });
    },
  },
};

</script>
<template>
  <section>
    <div class="flex mt-10 justify-center">
      <!-- ชำระเงิน -->
      <div class="px-10">
        <div class="w-[50em]">
          <p class="text-2xl  py-3">ชำระเงิน</p>
  
          <div class="border-[1px] w-full rounded-full"></div>
          
          <div class="flex justify-between px-2 py-5">
            <div class="flex">
              <div class="bg-gray-200 w-[230px] h-[120px] rounded-xl mr-4 overflow-hidden flex items-center">
                <img :src="course.img ? `http://localhost:3000/images/${course.img}` : 'https://media.discordapp.net/attachments/1067453596351856650/1096913733281927369/no-picture-available-placeholder-thumbnail-icon-illustration-design.png'" alt="">
              </div>
              <div>
                <p>{{ course.name }}</p>
                <div class="flex justify-center border rounded-full w-[120px] mt-2">
                  <p>{{ course.category }}</p>
                </div>
              </div>
            </div>
            <p>{{ course.price }}.00 บาท</p>
          </div>
  
          <div class="border-[1px] w-full rounded-full"></div>
  
          <p class="text-2xl  pt-3">ข้อมูลผู้ชำระเงิน</p>
          <div class="py-8">
            <div class="flex justify-between mx-10">
              <div class="flex flex-col">
                <label for="">ชื่อ</label>
                <input type="text" class="border-2 w-[20em] py-1 px-2 rounded-[7px]" v-model="customer.first_name">
              </div>
              <div class="flex flex-col">
                <label for="">นามสกุล</label>
                <input type="text" class="border-2 w-[20em] py-1 px-2 rounded-[7px]" v-model="customer.last_name">
              </div>
            </div>
            <div class="flex justify-between mx-10 pt-3">
              <div class="flex flex-col">
                <label for="">อีเมล</label>
                <input type="text" class="border-2 w-[20em] py-1 px-2 rounded-[7px]" v-model="customer.email">
                <template v-if="v$.customer.email.$model">
                  <span v-if="!v$.customer.email.email.$response" class="text-red-500 text-xs">
                    *กรอกข้อมูลไม่ถูกต้อง
                  </span>
                </template>
              </div>
              <div class="flex flex-col">
                <label for="">เบอร์โทรศัพท์</label>
                <input type="text" class="border-2 w-[20em] py-1 px-2 rounded-[7px]" v-model="customer.tel">
                <template v-if="v$.customer.tel.$model">
                  <span v-if="!v$.customer.tel.minLength.$response" class="text-red-500 text-xs">
                    *กรอกข้อมูลไม่ถูกต้อง
                  </span>
                  <span v-if="!v$.customer.tel.maxLength.$response" class="text-red-500 text-xs">
                    *กรอกข้อมูลไม่ถูกต้อง
                  </span>
                </template>
              </div>
            </div>
          </div>
  
  
          <div class="border-[1px] w-full rounded-full mt-3"></div>
  
          <p class="text-2xl  py-3">วิธีชำระเงิน</p>
          <div>
            <div class="flex flex-col px-4 py-4">
              <label for="CreditCard" :class="paymentMethods === 'CreditCard' ? 'border-[#E99F30]': ''" class="flex border-2 rounded-md py-8 px-10 mt-2">
                <input type="radio" name="1" id="CreditCard" v-model="paymentMethods" value="CreditCard">
                <div class="flex flex-col ml-5 space-y-2">
                  <p for="PromtPay">ชำระผ่านบัตรเครดิต/เดบิต</p>
                  <div class="flex space-x-2">
                    <img class="h-[20px]" src="/src/assets/icon/mastercard.png" alt="">
                    <img class="h-[20px]" src="/src/assets/icon/visa.png" alt="">
                  </div>
                </div>
              </label>
              <label for="PromtPay" :class="paymentMethods === 'PromtPay' ? 'border-[#E99F30]': ''" class="flex border-2 rounded-md py-8 px-10 mt-2">
                <input type="radio" name="1" id="PromtPay" v-model="paymentMethods" value="PromtPay">
                <div class="flex flex-col ml-6 space-y-2">
                  <p for="PromtPay">ชำระผ่าน PromptPay (QR Code)</p>
                  <img class="h-[20px] w-[50px]" src="/src/assets/icon/promtpay.png" alt="">
                </div>
              </label>
            </div>
          </div>

          <div v-if="paymentMethods === 'CreditCard'">
            <p class="text-2xl  py-3">ข้อมูลบัตรเครดิต</p>
            <div v-if="userCreditCard.length !== 0">
              <div class="flex flex-col px-4 py-4">




                <div v-for="(index, i) in userCreditCard">
                  <label :for="index.cc_id" :class="userCCSelected === index.cc_id ? 'border-[#E99F30]' : 'not-same'" class="flex justify-between border-2 rounded-md py-5 px-10 mt-2">
                    <div class="flex">
                      <input type="radio" name="2" :id="index.cc_id" v-model="userCCSelected" :value='index.cc_id' @click.stop>
                      <div class="flex ml-5 items-center space-x-2">
                        <div class="flex space-x-2">
                          <img class="h-[20px]" src="/src/assets/icon/mastercard.png" alt="">
                        </div>
                        <p for="PromtPay">{{ index.cc_number }}</p>
                      </div>
                    </div>
                    <button @click="removeCC(index.cc_id)" class="underline text-red-400">remove</button>
                  </label>
                </div>




              </div>
              <div class="border-[1px] w-full rounded-full mt-5"></div>
            </div>
            <div class="py-8 space-y-5">
              <div class="flex justify-between mx-10">
                <div class="flex flex-col">
                  <label for="">รหัสบัตรเครดิต</label>
                  <input type="text" class="border-2 w-[20em] py-1 px-2 rounded-[7px]" v-model="creditCard.cc_number">
                  <template v-if="v$.creditCard.cc_number.$model">
                    <span v-if="!v$.creditCard.cc_number.isNumeric.$response" class="text-red-500 text-xs">
                      *กรอกข้อมูลบัตรไม่ถูกต้อง
                    </span>
                    <span v-if="!v$.creditCard.cc_number.minLength.$response" class="text-red-500 text-xs">
                      *กรอกข้อมูลบัตรอย่างน้อย 15 ตัว
                    </span>
                    <span v-if="!v$.creditCard.cc_number.maxLength.$response" class="text-red-500 text-xs">
                      *กรอกข้อมูลบัตรไม่ถูกต้อง
                    </span>
                  </template>
                </div>
                <div class="flex flex-col">
                  <label label for="">CVC</label>
                  <input type="text" class="border-2 w-[5em] py-1 px-2 rounded-[7px]" v-model="creditCard.cc_cvc">
                  <template v-if="v$.creditCard.cc_cvc.$model">
                    <span v-if="!v$.creditCard.cc_cvc.isNumeric.$response" class="text-red-500 text-xs">
                      *กรอกข้อมูลบัตรไม่ถูกต้อง
                    </span>
                    <span v-if="!v$.creditCard.cc_cvc.minLength.$response" class="text-red-500 text-xs">
                      *กรอกข้อมูลบัตรอย่างน้อย 3 ตัว
                    </span>
                    <span v-if="!v$.creditCard.cc_cvc.maxLength.$response" class="text-red-500 text-xs">
                      *กรอกข้อมูลบัตร 3 ตัว
                    </span>
                  </template>
               </div>
                <div class="flex flex-col">
                  <label for="">วันหมดอายุ</label>
                  <input type="text" class="border-2 w-[10em] py-1 px-2 rounded-[7px]" v-model="creditCard.cc_exp">
                  <template v-if="v$.creditCard.cc_exp.$model">
                    <span v-if="!v$.creditCard.cc_exp.isDatePattern.$response" class="text-red-500 text-xs">
                      *กรอกข้อมูลบัตรไม่ถูกต้อง
                    </span>
                  </template>
                </div>
              </div>
              <div class="flex justify-between mx-10">
                <div class="flex flex-col">
                  <label for="">ชื่อ</label>
                  <input type="text" class="border-2 w-[20em] py-1 px-2 rounded-[7px]" v-model="creditCard.cc_first_name">
                </div>
                <div class="flex flex-col">
                  <label for="">นามสกุล</label>
                  <input type="text" class="border-2 w-[20em] py-1 px-2 rounded-[7px]" v-model="creditCard.cc_last_name">
                </div>
              </div>
              <div class="flex justify-between mx-10 pt-3">

              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="border-[1px] mx-5 h-[80vh] rounded-full"></div>
      <!-- ยอดชำระเงิน -->
      <div class="">
        <p class=" text-2xl">ยอดชำระเงิน</p>
        <div class="ml-10 mt-7">
          <div class="w-[23.5em]">
            <div class="flex justify-between">
              <p>รวมสินค้าชำระเงิน</p>
              <p>{{ course.price }}.00 บาท</p>
            </div>
            <div class="flex justify-between mt-2">
              <div>
                <p class="">สรุปยอดชำระเงิน</p>
                <p class="text-[70%] ml-1 text-gray-400">**7% ภาษีมูลลค่าเพิ่ม**</p>
              </div>
              <p class="">{{ vat }}.00 บาท</p>
            </div>
          <p class="text-xs mt-5">เมื่อชำระเงิน ถือว่าท่านได้ยอมรับ <span class="text-violet-800">ข้อตกลงและเงื่อนไขการใช้บริการ, ประกาศความเป็นส่วนตัวสำหรับลูกค้าและผู้รับบริการ</span> และ <span>นโยบายการคืนเงิน</span> เรียบร้อยแล้ว</p>
          </div>
          <button class="bg-[#E99F30] rounded-full py-2 px-40 text-white mt-3" @click=payment>ชำระเงิน</button>
        </div>
      </div>
    </div>
  </section>
</template>
<style>
input {box-sizing: border-box;}
</style>