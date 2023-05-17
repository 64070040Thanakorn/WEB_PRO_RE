

<template>
    <div id="card" class="flex justify-center w-[420px] h-[550px] bg-white rounded-md border">
      <div class="flex flex-col justify-between h-full px-10 py-5 space-y-10">
        <div class="space-y-10">
          <div class="flex justify-between items-center">
            <h1 class="text-4xl">ยินดีต้อนรับกลับ 🖐</h1>
            <i @click="modal_close" class="pi pi-times cursor-pointer" style="font-size: 1.5rem"></i>
          </div>
          <div>
            <div>
              <div class="flex flex-col space-y-3">
                <div class="flex flex-col">
                  <label for="">อีเมล</label>
                  <input type="email" class="border w-full rounded-md py-1 px-2" v-model="email">
                </div>
                <div class="flex-col">
                  <label for="">รหัสผ่าน</label>
                  <input type="password" class="border w-full rounded-md py-1 px-2" v-model="password">
                </div>
                <div class="flex justify-center">
                  <button @click="submit()" class="bg-[#E99F30] rounded-full px-20 py-2 text-white">เข้าสู่ระบบ</button>
                </div>
                <div class="flex items-center space-x-2">
                  <div class="w-full h-[2px] bg-[#D9D9D9]"></div>
                  <div class="text-[#D9D9D9]">หรือ</div>
                  <div class="w-full h-[2px] bg-[#D9D9D9]"></div>
                </div>
                <div>
                  <button class="flex justify-center items-center w-full py-3 bg-white text-[#777777] space-x-2 drop-shadow-md">
                    <svg width="25" height="25" class="gn y">
                      <g fill="none" fill-rule="evenodd">
                        <path d="M20.66 12.7c0-.61-.05-1.19-.15-1.74H12.5v3.28h4.58a3.91 3.91 0 0 1-1.7 2.57v2.13h2.74a8.27 8.27 0 0 0 2.54-6.24z" fill="#4285F4"></path>
                        <path d="M12.5 21a8.1 8.1 0 0 0 5.63-2.06l-2.75-2.13a5.1 5.1 0 0 1-2.88.8 5.06 5.06 0 0 1-4.76-3.5H4.9v2.2A8.5 8.5 0 0 0 12.5 21z" fill="#34A853"></path>
                        <path d="M7.74 14.12a5.11 5.11 0 0 1 0-3.23v-2.2H4.9A8.49 8.49 0 0 0 4 12.5c0 1.37.33 2.67.9 3.82l2.84-2.2z" fill="#FBBC05"></path>
                        <path d="M12.5 7.38a4.6 4.6 0 0 1 3.25 1.27l2.44-2.44A8.17 8.17 0 0 0 12.5 4a8.5 8.5 0 0 0-7.6 4.68l2.84 2.2a5.06 5.06 0 0 1 4.76-3.5z" fill="#EA4335"></path>
                      </g>
                    </svg>
                    <p>Sign in with Google</p>
                  </button>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="flex justify-center items space-x-2">
          <p class="text-[#767676]">ยังไม่เป็นสมาชิก?</p>
          <p class="text-[#AAAAAA]">ลงทะเบียนที่นี้</p>
        </div>
      </div>
    </div>
</template>

<script>
import axios from 'axios';
 
export default{
  data() {
    return {
      email: 'nora@gmail.com',
      password: 'nora123123',
      isOpen: false,
    };
  },
  methods: {
    toggleModal() {
      this.isOpen = !this.isOpen;
    },
    submit(){
      const data = {
        email: this.email,
        password: this.password
      }
      axios.post('http://localhost:3000/api/auth/login', data)
        .then(res => {
            localStorage.setItem('user', res.data.user)
            localStorage.setItem('token', res.data.token)
            this.$emit('auth-change')
            this.$router.push({path: '/'})
        })
        .catch(error => {
          this.error = error.response.data
          console.log(error.response.data)
        })
    },
    modal_close(){
      console.log('modal');
      this.$emit('modal_close')
    },
  }
}
</script>