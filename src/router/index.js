import { createRouter, createWebHistory } from "vue-router";
import FormPage from '@/views/FormPage.vue'
import ResultPage from '@/views/ResultPage.vue'

const routes = [
  { path: "/", component: FormPage },
  { path: "/result", component: ResultPage }
];

const router = createRouter({
  history: createWebHistory(),
  routes
});

export default router;
