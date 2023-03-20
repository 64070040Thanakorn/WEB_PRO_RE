import { createPinia } from 'pinia'
import { createApp } from 'vue'
import PrimeVue from 'primevue/config';
import InputText from 'primevue/inputtext';

import App from './App.vue'
import router from './router'
import Footer from './components/Footer.vue'

import 'primeicons/primeicons.css'
import './gsap/index.js'
import './styles/main.css'


const app = createApp(App)

app.use(createPinia())
app.use(router)
app.use(PrimeVue, { ripple: true })

app.component('InputText', InputText)
app.component('Footer', Footer)

app.mount('#app')
