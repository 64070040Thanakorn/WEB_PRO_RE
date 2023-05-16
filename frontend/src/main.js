import { createPinia } from 'pinia';
import PrimeVue from 'primevue/config';
import InputText from 'primevue/inputtext';
import { createApp } from 'vue';
import Vuelidate from 'vuelidate';


import axios from 'axios';
import VueAxios from 'vue-axios';

import App from './App.vue';
import Footer from './components/Footer.vue';
import router from './router';

import 'primeicons/primeicons.css';
import './styles/main.css';


const app = createApp(App)

app.use(createPinia())
app.use(VueAxios, axios)
app.use(router)
app.use(PrimeVue, { ripple: true })
app.use(Vuelidate)

app.component('InputText', InputText)
app.component('Footer', Footer)


app.mount('#app')
