import { createRouter, createWebHistory } from 'vue-router'
import Course from '../views/CourseView.vue'
import Landing from '../views/LandingView.vue'
import Quiz from '../views/QuizView.vue'
import Search from '../views/SearchView.vue'

import user from './user'

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
    {
      path: '/course/:course_id',
      name: 'course',
      component: Course
    },
    ...user,
  ]
})

export default router
