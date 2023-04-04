<template>
  <div id="mini_card" class="transition-all duration-500 hover:opacity-[0.8] shadow-md shadow-black/10 hover:scale-[1.10]">
    <div class="bg-black rounded-t-md w-[510px] h-[33px] flex items-center px-3">
      <div class="flex space-x-2">
        <div class="bg-[#FF4E4E] rounded-full w-[15px] h-[15px]"></div>
        <div class="bg-[#EBC919] rounded-full w-[15px] h-[15px]"></div>
        <div class="bg-[#95C903] rounded-full w-[15px] h-[15px]"></div>
      </div>
    </div>
    <div class="bg-white rounded-b-md w-[510px] h-[225px] px-3 py-3">
      <div>
        <div class="flex justify-between items-center">
          <h5 class="text-[32px]">Course Title</h5>
          <div class="flex space-x-3">
            <svg width="23" height="23" viewBox="0 0 23 23" fill="none" xmlns="http://www.w3.org/2000/svg">
              <g clip-path="url(#clip0_173_469)">
                <path d="M17.9238 17.2587C16.9311 15.5337 15.0668 14.3748 12.9375 14.3748H10.0625C7.9332 14.3748 6.06895 15.5337 5.07617 17.2587C6.65742 19.0197 8.94844 20.1248 11.5 20.1248C14.0516 20.1248 16.3426 19.0152 17.9238 17.2587ZM0 11.4998C0 8.44977 1.2116 5.5247 3.36827 3.36803C5.52494 1.21136 8.45001 -0.000244141 11.5 -0.000244141C14.55 -0.000244141 17.4751 1.21136 19.6317 3.36803C21.7884 5.5247 23 8.44977 23 11.4998C23 14.5497 21.7884 17.4748 19.6317 19.6315C17.4751 21.7882 14.55 22.9998 11.5 22.9998C8.45001 22.9998 5.52494 21.7882 3.36827 19.6315C1.2116 17.4748 0 14.5497 0 11.4998ZM11.5 12.2185C12.3578 12.2185 13.1805 11.8777 13.787 11.2712C14.3936 10.6646 14.7344 9.84194 14.7344 8.98413C14.7344 8.12632 14.3936 7.30365 13.787 6.69708C13.1805 6.09052 12.3578 5.74976 11.5 5.74976C10.6422 5.74976 9.81951 6.09052 9.21295 6.69708C8.60639 7.30365 8.26562 8.12632 8.26562 8.98413C8.26562 9.84194 8.60639 10.6646 9.21295 11.2712C9.81951 11.8777 10.6422 12.2185 11.5 12.2185Z" fill="black"/>
              </g>
              <defs>
                <clipPath id="clip0_173_469">
                  <rect width="23" height="23" fill="white" transform="translate(0 -0.000244141)"/>
                </clipPath>
              </defs>
            </svg>
            <p>2/12</p>
          </div>
        </div>
        <p class="text-secondary">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
      </div>
      <div class="flex justify-between absolute inset-x-0 bottom-2 px-3 py-1">
        <div class="flex items-center space-x-3">
          <p>ใบ Certificate</p>
          <p>|</p>
          <p>15 บท</p>
          <p>|</p>
          <p>Intermediate</p>
        </div>
        <div>
          <p class="text-[20px]">1200 บาท</p>
        </div>
      </div>
    </div>
  </div>
</template>