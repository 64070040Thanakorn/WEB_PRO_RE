import CourseView from '../views/CourseView.vue'

export default [
  {
    path: '/course/:id/',
    name: 'course',
    component: CourseView
  },
]