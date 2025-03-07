import { defineStore } from "pinia";

export const useFormStore = defineStore("form", {
  state: () => ({
    city: "",
    workshop: "",
    employee: "",
    brigade: "",
    shift: ""
  }),
  actions: {
    setFormData(data) {
      this.city = data.city;
      this.workshop = data.workshop;
      this.employee = data.employee;
      this.brigade = data.brigade;
      this.shift = data.shift;
    }
  }
});
