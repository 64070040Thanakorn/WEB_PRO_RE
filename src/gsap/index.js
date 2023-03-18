import gsap from "gsap";

export default {
  methods: {
    enter(el) {
      gsap.to(el, {
        x: 500,
        duration: 3,
      });
      console.log("Gsap Is Working");
    }
  }
}


