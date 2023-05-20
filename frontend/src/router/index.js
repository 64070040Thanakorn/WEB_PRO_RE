import { createRouter, createWebHistory } from 'vue-router'
import Admin from '../views/AdminView.vue'
import CategoryView from '../views/CategoryView.vue'
import Course from '../views/CourseView.vue'
import create_course from '../views/CreateCourseView.vue'
import course_edit from '../views/EditCourse.vue'
import Landing from '../views/LandingView.vue'
import payment_success from '../views/PaymentSuccessView.vue'
import payment from '../views/PaymentView.vue'
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
    {
      path: '/payment/:course_id',
      name: 'payment',
      component: payment,
    },
    {
      path: '/payment/success',
      name: 'payment_success',
      component: payment_success
    },
    {
      path: '/category/:category_id',
      name: 'category',
      component: CategoryView
    },
    {
      path: '/dashboard',
      name: 'admin',
      component: Admin
    },
    {
      path: '/edit/:course_id',
      name: 'course_edit',
      component: course_edit
    },
    {
      path: '/create',
      name: 'create_course',
      component: create_course
    },
    ...user,
  ]
})

export default router
