import { createApp } from "vue";
import App from "./App.vue";
import { createPinia } from "pinia";
import router from '@/router/index.js'
import "./assets/main.css"; // Подключаем стили

const app = createApp(App);

app.use(createPinia());
app.use(router);

app.mount("#app");
