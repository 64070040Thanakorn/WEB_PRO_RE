<template>
    <div class="px-72 pt-20 pb-40 splitBg">
        <div class="mx-12 space-y-10">
            <div class="bg-white px-12 py-5 h-[328px] space-y-6">
                <div class="flex space-x-4 text-white">
                    <p class="px-4 py-2 bg-purple-500 rounded-full">Programming</p>
                    <p class="px-4 py-2 bg-pink-500 rounded-full">Game Development</p>
                </div>
                <h1 class="text-[36px]">Python for beginner</h1>
                <p class="text-[14px] font-light text-gray-01 limit2Line">Lorem ipsum dolor sit amet, consectetur adipiscing elit.
                    Nulla tristique gravida erat ac accumsan. Orci varius natoque penatibus et magnis dis parturient montes,
                    nascetur ridiculus mus. Donec eget venenatis dui, non facilisis turpis. lorem</p>
                <div class="flex">
                    <div class="flex space-x-3">
                        <svg width="23" height="23" viewBox="0 0 23 23" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <g clip-path="url(#clip0_173_469)">
                                <path
                                    d="M17.9238 17.2587C16.9311 15.5337 15.0668 14.3748 12.9375 14.3748H10.0625C7.9332 14.3748 6.06895 15.5337 5.07617 17.2587C6.65742 19.0197 8.94844 20.1248 11.5 20.1248C14.0516 20.1248 16.3426 19.0152 17.9238 17.2587ZM0 11.4998C0 8.44977 1.2116 5.5247 3.36827 3.36803C5.52494 1.21136 8.45001 -0.000244141 11.5 -0.000244141C14.55 -0.000244141 17.4751 1.21136 19.6317 3.36803C21.7884 5.5247 23 8.44977 23 11.4998C23 14.5497 21.7884 17.4748 19.6317 19.6315C17.4751 21.7882 14.55 22.9998 11.5 22.9998C8.45001 22.9998 5.52494 21.7882 3.36827 19.6315C1.2116 17.4748 0 14.5497 0 11.4998ZM11.5 12.2185C12.3578 12.2185 13.1805 11.8777 13.787 11.2712C14.3936 10.6646 14.7344 9.84194 14.7344 8.98413C14.7344 8.12632 14.3936 7.30365 13.787 6.69708C13.1805 6.09052 12.3578 5.74976 11.5 5.74976C10.6422 5.74976 9.81951 6.09052 9.21295 6.69708C8.60639 7.30365 8.26562 8.12632 8.26562 8.98413C8.26562 9.84194 8.60639 10.6646 9.21295 11.2712C9.81951 11.8777 10.6422 12.2185 11.5 12.2185Z"
                                    fill="black" />
                            </g>
                            <defs>
                                <clipPath id="clip0_173_469">
                                    <rect width="23" height="23" fill="white" transform="translate(0 -0.000244141)" />
                                </clipPath>
                            </defs>
                        </svg>
                        <p>2/12</p>
                    </div>
                    <div class="flex ml-32">
                        <p class="border-r-[0.12rem] border-black px-3">ใบ certificate</p>
                        <p class="border-r-[0.12rem] border-black px-3">ระดับกลาง</p>
                        <p class="border-black px-3 text-red-500">1200 บาท</p>
                    </div>
                </div>
                <div class="flex">
                    <RouterLink to="">
                        <div class="rounded bg-black text-white px-12 py-2">ลงคอร์สเรียน</div>
                    </RouterLink>
                </div>

            </div>
            <div class="bg-white px-32 py-12 border-2 border-black"></div>
        </div>
        <div class="mt-20">
            <p class="text-[36px]">เกี่ยวกับคอร์ส</p>
            <p class="text-gray-01 font-light text-[14px] mt-5">Lorem ipsum dolor sit amet, consectetur adipiscing elit.
                Nulla
                tristique gravida erat ac accumsan. Orci
                varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec eget venenatis dui,
                non facilisis turpis.

                <br><br>it amet, consectetur adipiscing elit. Nulla tristique gravida erat ac accumsan. Orci varius natoque
                penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec eget venenatis dui, non facilisis
                turpis.
            </p>
            <div class="border-2 border-black p-72 mt-16"></div>
        </div>
    </div>
    <div class="py-72 bg-black">
    </div>
    <div class="py-32 bg-white"></div>
    <Footer />
</template>

<style>
.splitBg {

    width: 100%;
    height: 100%;
    background: linear-gradient(to bottom,
            #FCFCFC 0%,
            #FCFCFC 31%,
            white 31%,
            white 100%);

}
</style>