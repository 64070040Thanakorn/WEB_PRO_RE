<script setup>
import { RouterLink, RouterView } from "vue-router";
import HelloWorld from "./components/HelloWorld.vue";
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
      <div class="bg-red-500 fadeSlideTo">to</div>
      <div class="bg-green-500 fadeSlideFrom">from</div>
      <div class="bg-blue-500 fadeSlideFromTo">fromTo</div>
    </div>
  </header>

  <RouterView />
</template>
