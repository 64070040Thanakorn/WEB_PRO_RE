import { createRouter, createWebHistory } from 'vue-router'
import Landing from '../views/LandingView.vue'
import Search from '../views/SearchView.vue'

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: '/',
      name: 'home',
      component: Landing
    },
    {
      path: '/search',
      name: 'search',
      component: Search,
    },
  ]
})

export default router
