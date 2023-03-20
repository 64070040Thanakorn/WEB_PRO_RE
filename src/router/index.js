import { createRouter, createWebHistory } from 'vue-router'
import Landing from '../views/LandingView.vue'

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: '/',
      name: 'home',
      component: Landing
    },
    {
      path: '/about',
      name: 'about',
      component: null
    },
    {
      path: '/portfoilo',
      name: 'portfoilo',
      component: null
    },
    {
      path: '/location',
      name: 'location',
      component: null
    },
  ]
})

export default router
