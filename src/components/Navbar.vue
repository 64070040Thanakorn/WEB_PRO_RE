<template>
  <div class="navbar container">
    <div class="flex justify-between items-center px-48 w-screen h-[80px]">

      <div>
        <ul class="flex">
          <li class="px-8 font-extralight">
            คอร์สเรียน
            <i class="pi pi-angle-down" style="font-size: 0.75rem"></i>
          </li>
          <li class="px-8 font-extralight">ผลงาน</li>
          <li class="px-8 font-extralight">เกี่ยวกับเรา</li>
          <li class="px-8 font-extralight">ที่อยู่</li>
        </ul>
      </div>

      <div class="navbar-brand border-4 border-[#EBC919] px-8">
        <h1>GREATER</h1>
      </div>

      <div>
        <ul class="flex">
          <li class="flex items-center px-8 font-extralight">เข้าสู่ระบบ</li>
          <li class="border-2 rounded-md border-[#EBC919] py-2 px-6 font-extralight">สมัครสมาชิก</li>
        </ul>
      </div>

    </div>
  </div>
</template>
<style>
  :root {
    --text-color: #ffffff;
  }
  .navbar{
    position: absolute;
    color: var(--text-color);
    font-family: 'Mitr', sans-serif;
    font-size: 18px;
    z-index: 1;
  }
  .navbar-brand{
    transform: translateX(-50%);
    left: 50%;
    position: absolute;
  }
  .navbar-brand>h1{
    font-family: 'Sansita', sans-serif;
    font-size: 40px;
  }
</style>