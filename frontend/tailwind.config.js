/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    "./index.html",
    "./src/**/*.{vue,js,ts,jsx,tsx}",
  ],
  theme: {
    extend: {
      backgroundImage: {
        'landing-01': "url('../assets/landing/landing_01.png')",
        'landing-02': "url('../assets/landing/landing_02.png')",
        'pattern-01': "url('../assets/pattern/pattern_01.png')",
        'search-01': "url('../assets/search/search_01.png')",
        'search-02': "url('../assets/search/search_02.png')",
        'course-01': "url('../assets/course/course_01.png')"
      },
      gridTemplateRows: {
        '10': 'repeat(10, minmax(0, 1fr))',
      },
      colors: {
        'gray': {
          '01': '#717171',
        },
        'orange': {
          '01': '#E99F30',
          'hover': '#cf8c29',
        }
      }
    },
  },
  plugins: [],
}
