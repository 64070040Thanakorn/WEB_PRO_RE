import { createRouter, createWebHistory } from 'vue-router'
import Landing from '../views/LandingView.vue'
import Search from '../views/SearchView.vue'
import Quiz from '../views/QuizView.vue'

import user from './user'
import course from './course'

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
    {
      path: '/quiz',
      name: 'quiz',
      component: Quiz
    },
    ...user,
    ...course,
  ]
})

export default router
