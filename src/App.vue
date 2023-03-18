<script setup>
import { RouterLink, RouterView } from "vue-router";
import HelloWorld from "./components/HelloWorld.vue";

defineProps({
  enter: String,
})

</script>

<template>
  <header>
    <img alt="Vue logo" class="logo" src="@/assets/logo.svg" width="125" height="125" />

    <div>
      <HelloWorld class="underline" msg="You did it!" />

      <nav>
        <RouterLink to="/">Home</RouterLink>
        <RouterLink to="/about">About</RouterLink>
      </nav>
      
      <transition
        appear
        @enter="enter"
      >
        <p>Gsap Test</p>
      </transition>

      <div class="flex">
        <i class="pi pi-check mt-1"></i>
        <p class="ml-3">Prime Icon TEST</p>
      </div>
    </div>
  </header>

  <RouterView />
</template>

