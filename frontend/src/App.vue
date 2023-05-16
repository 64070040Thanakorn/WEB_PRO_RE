<script setup>
import Navbar from "./components/Navbar.vue";


defineProps({
  enter: String,
  components: {
    Navbar,
  }
})

</script>

<template>
    <Navbar />
    <RouterView />
</template>

<style>
  @import url('https://fonts.googleapis.com/css2?family=Mitr:wght@200;300;400;500;700&display=swap');
  @import url('https://fonts.googleapis.com/css2?family=Sansita:wght@400;700&display=swap');
  *{
    font-family: 'Mitr', sans-serif;
  }
</style>