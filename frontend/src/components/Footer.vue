<script>
export default {
  beforeCreate() {
    this.axios.get("http://localhost:3000/api/category/").then((res) => {
      this.category = res.data;
    });
  },
  data() {
    return {
      category: []
    };
  },
  methods: {
    scrollToTop() {
      window.scrollTo(0, 0);
    },
  }
};
</script>

<template>
  <section id="footer">
    <div class="w-full h-[480px] bg-[#0B0B0B] text-white">
      <div class="flex justify-between mx-20 pt-10">
        <div class="space-y-5">
          <h4 class="text-[20px]">เกี่ยวกับเรา</h4>
          <p class="text-[#B0B0B0] w-[480px]">
            Lorem ipsum dolor, sit amet consectetur adipisicing elit. Quasi ut harum
            aperiam cumque eveniet quod explicabo quis commodi ab odit doloribus ea ipsam
            pariatur illum earum ex debitis aut sint culpa, repudiandae necessitatibus
            ipsa voluptatem. Facilis odio ducimus illo dignissimos!
          </p>
        </div>
        <div class="space-y-5">
          <h4 class="text-[20px]">คอร์ส</h4>
          <ul class="text-[#B0B0B0] grid grid-rows-10 grid-flow-col gap-2 gap-x-36">
            <template v-for="item in category">
              <li>
                <RouterLink :to="{path: `/category/${item.category_id}`}" @click="scrollToTop()">
                  {{item.category_name}}
                </RouterLink>
              </li>
            </template>
          </ul>
        </div>
        <div class="space-y-5">
          <h4 class="text-[20px]">ติดต่อเรา</h4>
          <p class="text-[#B0B0B0] w-[480px]">
            Lorem ipsum dolor, sit amet consectetur adipisicing elit. Quasi ut harum
            aperiam cumque eveniet quod explicabo quis commodi ab odit doloribus ea ipsam
            pariatur illum earum ex debitis aut sint culpa, repudiandae necessitatibus
            ipsa voluptatem. Facilis odio ducimus illo dignissimos!
          </p>
        </div>
      </div>

      <div class="flex justify-center absolute inset-x-0 bottom-2">
        <p class="text-[#B0B0B0] text-[13px]">
          Copy right © 2077 All Right Reserved Cyberpunk
        </p>
      </div>
    </div>
  </section>
</template>
