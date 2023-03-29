<template>
  <section>
    <div class="mx-32 my-20">
      <div class="my-5">
        <h1 class="text-6xl py-2">จัดการบัญชี</h1>
      </div>
      <div class="border-b-2 border-black"></div>
      <div class="flex flex-column">
        <div class="space-y-2 w-[20%] my-6 space-y-14">
          <div class="space-y-5">
            <div class="flex flex-column space-x-2 items-center">
              <i class="pi pi-sliders-h"></i>
              <p>บัญชี</p>
            </div>
            <ul class="space-y-5 indent-6">
              <li>จัดการคอร์สเรียน</li>
              <li>ชำระเงิน</li>
            </ul>
          </div>
          <div class="space-y-5">
            <div class="flex flex-column space-x-2 items-center">
              <i class="pi pi-user"></i>
              <p>จัดการโปรไฟล์</p>
            </div>
            <ul class="space-y-5 indent-6">
              <li>ข้อมูลผู้ใช้</li>
            </ul>
          </div>
        
        </div>
        <div class="border-r-2 border-black"></div>
        <div class="w-full mx-20 my-10 space-y-10">
          <div class="flex items-center space-x-16">
            <div class="rounded-full w-40 h-40 bg-black">
              <img src="" alt="">
            </div>
            <div class="flex flex-col space-y-2">
              <button class="bg-black text-white px-20 space-y-216 py-3 rounded-md">เปลี่ยนรูปโปรไฟล์</button>
              <button class="bg-white text-black px-20 py-3 rounded-md border-2 border-black">ลบรูปโปรไฟล์</button>
            </div>
          </div>
          <div>
            <form action="">
              <div class="grid grid-cols-2 gap-4">
                <div class="flex flex-col">
                  <label for="" class="text-black">ชื่อ</label>
                  <input class="border rounded-md pl-5 py-3 w-[90%]" type="email" placeholder="example@gmail.com">
                </div>
                <div class="flex flex-col">
                  <label for="" class="text-black">นามสกุล</label>
                  <input class="border rounded-md pl-5 py-3 w-[90%]" type="email" placeholder="example@gmail.com">
                </div>
                <div class="flex flex-col">
                  <label for="" class="text-black">อีเมล</label>
                  <input class="border rounded-md pl-5 py-3 w-[90%]" type="email" placeholder="example@gmail.com">
                </div>
                <div class="flex flex-col">
                  <label for="" class="text-black">รหัสผ่าน</label>
                  <input class="border rounded-md pl-5 py-3 w-[90%]" type="email" placeholder="example@gmail.com">
                </div>
                <div class="flex flex-col">
                  <label for="" class="text-black">เบอร์โทร</label>
                  <input class="border rounded-md pl-5 py-3 w-[90%]" type="email" placeholder="example@gmail.com">
                </div>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  </section>
</template>