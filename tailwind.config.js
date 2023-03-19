/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    "./index.html",
    "./src/**/*.{vue,js,ts,jsx,tsx}",
  ],
  theme: {
    color: {
      orange: {
        "1" : "#EBC919",
      }
    },
    extend: {
      backgroundImage: {
        'ladning-img': "url('./assets/landing_img.png')",
      },
      gridTemplateRows: {
        '8': 'repeat(8, minmax(0, 1fr))',
      }
    },
  },
  plugins: [],
}
