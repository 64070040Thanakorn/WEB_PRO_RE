import gsap from "gsap";

export default {
  methods: {
    // where the animation will start from
    beforeEnter(el) {
      el.style.opacity = '0'
      el.style.transform = 'translateY(-100px)'
    },
    // where the animation will end up
    enter(el) {
      gsap.to('#nav_course', {
        duration: 1,
        y: 0,
        opacity: 1,
      })
    }
  },
}


