<template>
  <div>
    <h1>Форма ввода данных</h1>
    <form @submit.prevent="saveData">
      <!-- Город -->
      <div>
        <label>Город:</label>
        <select v-model="form.city" @change="updateWorkshops">
          <option value="">Выберите город</option>
          <option v-for="city in $options.cities" :key="city.name" :value="city.name">{{ city.name }}</option>
        </select>
      </div>

      <!-- Цех -->
      <div>
        <label>Цех:</label>
        <select v-model="form.workshop" :disabled="!form.city" @change="updateEmployees">
          <option value="">Выберите цех</option>
          <option v-for="workshop in availableWorkshops" :key="workshop" :value="workshop">{{ workshop }}</option>
        </select>
      </div>

      <!-- Сотрудник -->
      <div>
        <label>Сотрудник:</label>
        <select v-model="form.employee" :disabled="!form.workshop">
          <option value="">Выберите сотрудника</option>
          <option v-for="employee in availableEmployees" :key="employee" :value="employee">{{ employee }}</option>
        </select>
      </div>

      <!-- Бригада -->
      <div>
        <label>Бригада:</label>
        <select v-model="form.brigade">
          <option value="">Выберите бригаду</option>
          <option v-for="brigade in $options.brigades" :key="brigade" :value="brigade">{{ brigade }}</option>
        </select>
      </div>

      <!-- Смена -->
      <div>
        <label>Смена:</label>
        <select v-model="form.shift">
          <option value="">Выберите смену</option>
          <option v-for="shift in $options.shifts" :key="shift" :value="shift">{{ shift }}</option>
        </select>
      </div>

      <button type="submit">Сохранить</button>
    </form>
  </div>
</template>

<script>
import { cities, workshops, brigades, shifts } from "@/entities/data";
import { useFormStore } from '@/stores/index.js'

export default {
  data() {
    return {
      form: {
        city: "",
        workshop: "",
        employee: "",
        brigade: "",
        shift: ""
      },
      availableWorkshops: [],
      availableEmployees: [],
    };
  },
  cities,
  brigades,
  shifts,
  methods: {
    updateWorkshops() {
      this.availableWorkshops = cities.find(c => c.name === this.form.city)?.workshops || [];
      this.form.workshop = "";
      this.availableEmployees = [];
    },
    updateEmployees() {
      this.availableEmployees = workshops[this.form.workshop] || [];
      this.form.employee = "";
    },
    saveData() {
      const store = useFormStore();
      store.setFormData(this.form);
      this.$router.push("/result");
    }
  }
};
</script>
