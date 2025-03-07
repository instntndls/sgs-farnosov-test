<template>
  <div>
    <h1>Результаты</h1>
    <p><strong>Город:</strong> {{ form.city }}</p>
    <p><strong>Цех:</strong> {{ form.workshop }}</p>
    <p><strong>Сотрудник:</strong> {{ form.employee }}</p>
    <p><strong>Бригада:</strong> {{ form.brigade }}</p>
    <p><strong>Смена:</strong> {{ form.shift }}</p>
    <button @click="$router.back()">Назад</button>
  </div>
</template>

<script>
import { useFormStore } from '@/stores/index.js'

export default {
  computed: {
    form() {
      return useFormStore().$state;
    }
  }
};
</script>
