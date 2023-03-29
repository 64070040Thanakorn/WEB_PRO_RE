<template>
  <section>
    <div class="mx-32 my-20">
      <div class="border-b-2 border-black">
        <h1 class="text-4xl py-2">จัดการบัญชี</h1>
      </div>
      <div class="flex flex-column">
        <div class="border-r-2 border-black space-y-2">
          <div class="space-y-3">
            <div class="flex flex-column space-x-2">
              <i class="pi pi-sliders-h"></i>
              <p>บัญชี</p>
            </div>
            <ul class="space-y-2 indent-6">
              <li>จัดการคอร์สเรียน</li>
              <li>ชำระเงิน</li>
            </ul>
          </div>
          <div class="space-y-3">
            <div class="flex flex-column space-x-2">
              <i class="pi pi-user"></i>
              <p>จัดการโปรไฟล์</p>
            </div>
            <ul class="space-y-2 indent-6">
              <li>ข้อมูลผู้ใช้</li>
            </ul>
          </div>
        </div>
        <div class="w-full">
          <div class="flex items-center">
            <div class="rounded-full w-40 h-40 bg-black"></div>
            <div class="flex flex-col space-y-2">
              <button class="bg-black text-white px- space-y-216 py-3 rounded-md">เปลี่ยนรูปโปรไฟล์</button>
              <button class="bg-white text-black px-16 py-3 rounded-md border-2 border-black">ลบรูปโปรไฟล์</button>
            </div>
          </div>
          <div>
            <form action="">
              <div class="grid grid-rows-2">
                <div class="flex flex-col">
                  <label for="" class="text-black">อีเมล</label>
                  <input class="border rounded-md pl-5 py-3 w-[40%]" type="email" placeholder="example@gmail.com">
                </div>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  </section>
</template>