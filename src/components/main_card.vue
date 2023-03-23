<template>
    <div class="container w-[20rem] h-[27rem] bg-white shadow-lg shadow-black/25 p-4 hover:shadow-md hover:scale-[1.05]">
        <div class="flex flex-col">
            <div class="flex flex-col gap-1">
                <div class="flex gap-1">
                    <p class="bg-[#FEB8B8] rounded-[15px] text-xs px-4 py-[0.2rem] text-white">Beginner</p>
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
    </div>
</template>