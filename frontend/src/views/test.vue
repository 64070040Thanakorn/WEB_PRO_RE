<template>
  <div>
    <div v-for="item in options">
      <div>
        <label>
          <input type="checkbox" v-model="selectedOptions[item.id]" />
          {{ item.label }}
        </label>
      </div>
    </div>
    <div>
      <h3>Selected Options:</h3>
      <ul>
        <li v-for="item in filteredOptions" :key="item.course_id">
          title: {{ item.title }} price: {{ item.price }} amount:
          {{ item.amount }} lesson: {{ item.lesson }} certificate:
          {{ item.certificate }} Amount: {{ item.enrolled.length }}/{{ item.amount }}
        </li>
      </ul>
    </div>
    <button type="" @click="clearFilter()" class="text-red-500">remove all</button>
    {{ selectedOptions }}
  </div>
</template>

<script>
export default {
  data() {
    return {
      options: [
        { id: "price1200", label: "Price1200" },
        { id: "price2400", label: "Price2400" },
        { id: "lesson20", label: "Lesson10" },
        { id: "lesson30", label: "Lesson25" },
        { id: "certificateT", label: "have cer" },
        { id: "certificateF", label: "not have cer" },
        { id: "AmountFull", label: "full" },
        { id: "AmountNotFull", label: "not full" },
      ],
      checkSelected: [],
      selectedOptions: {},
      test: [
        {
          course_id: "6a22609e-3df2-4569-b477-5f809de16401",
          title: "Easy for every one",
          category_id: "311a8428-70bc-4085-87bb-745af7283ddf",
          description: "New course for newbie",
          info:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
          price: 2400,
          level: "ระดับสูง",
          certificate: true,
          lesson: 30,
          amount: 50,
          start_date: "2022-01-04T03:34:23.550Z",
          end_date: "2022-01-05T03:34:23.550Z",
          createAt: "2023-05-17T16:18:59.380Z",
          course_image: "fileupload-1684340747516.jpg",
          category: {
            category_id: "311a8428-70bc-4085-87bb-745af7283ddf",
            category_name: "Java",
            category_detail: "No detail",
            category_color: "#5484a4",
          },
          enrolled: [
            {
              user_id: "3d35db42-9bb7-4188-a6dd-5a002b6cfa94",
              course_id: "6a22609e-3df2-4569-b477-5f809de16401",
              enroll_date: "2023-05-21T08:21:20.430Z",
            },
          ],
        },
        {
          course_id: "7ac778d0-32bb-4450-802a-53cbd6065d20",
          title: "JS very hard",
          category_id: "9144682f-a79c-4fd5-9c6b-9528b948e92c",
          description: "Hard js for big brain",
          info:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
          price: 2400,
          level: "ระดับสูง",
          certificate: true,
          lesson: 20,
          amount: 100,
          start_date: "2022-01-04T03:34:23.550Z",
          end_date: "2022-01-05T03:34:23.550Z",
          createAt: "2023-05-16T11:59:55.507Z",
          course_image: "fileupload-1684633370402.webp",
          category: {
            category_id: "9144682f-a79c-4fd5-9c6b-9528b948e92c",
            category_name: "JavaScript",
            category_detail: "No detail",
            category_color: "#FBBF24",
          },
          enrolled: [
            {
              user_id: "1efca52a-60b6-46e6-97ed-b0a6565ccf2f",
              course_id: "7ac778d0-32bb-4450-802a-53cbd6065d20",
              enroll_date: "2023-05-21T07:40:42.894Z",
            },
          ],
        },
        {
          course_id: "50bce8cf-f61e-4626-8751-ad850609f28b",
          title: "JS For Beginner",
          category_id: "9144682f-a79c-4fd5-9c6b-9528b948e92c",
          description: "JS is not hard if you know",
          info:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
          price: 1200,
          level: "ระดับเริ่มต้น",
          certificate: true,
          lesson: 20,
          amount: 2,
          start_date: "2022-01-04T03:34:23.550Z",
          end_date: "2022-01-05T03:34:23.550Z",
          createAt: "2023-05-16T11:33:38.727Z",
          course_image: "fileupload-1684633392237.jpg",
          category: {
            category_id: "9144682f-a79c-4fd5-9c6b-9528b948e92c",
            category_name: "JavaScript",
            category_detail: "No detail",
            category_color: "#FBBF24",
          },
          enrolled: [
            {
              user_id: "1efca52a-60b6-46e6-97ed-b0a6565ccf2f",
              course_id: "50bce8cf-f61e-4626-8751-ad850609f28b",
              enroll_date: "2023-05-17T15:20:56.212Z",
            },
            {
              user_id: "4ffc9d99-f923-40cc-ac44-6ad45353813e",
              course_id: "50bce8cf-f61e-4626-8751-ad850609f28b",
              enroll_date: "2023-05-17T15:20:34.010Z",
            },
          ],
        },
        {
          course_id: "434ab3b7-007d-45a6-b9bc-eff4db6f9d61",
          title: "Easy PHP",
          category_id: "93b932c2-11c3-415a-99d8-6df547021da4",
          description: "pat1 is easy if you know",
          info:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
          price: 1200,
          level: "ระดับเริ่มต้น",
          certificate: false,
          lesson: 20,
          amount: 80,
          start_date: "2022-01-04T03:34:23.550Z",
          end_date: "2022-01-05T03:34:23.550Z",
          createAt: "2023-05-16T11:33:37.871Z",
          course_image: "fileupload-1684633250422.png",
          category: {
            category_id: "93b932c2-11c3-415a-99d8-6df547021da4",
            category_name: "PHP",
            category_detail: "PHP is not hard if you know",
            category_color: "#4287f5",
          },
          enrolled: [
            {
              user_id: "1efca52a-60b6-46e6-97ed-b0a6565ccf2f",
              course_id: "434ab3b7-007d-45a6-b9bc-eff4db6f9d61",
              enroll_date: "2023-05-17T14:10:26.946Z",
            },
          ],
        },
      ],
    };
  },
  computed: {
    selectedOptionsArray() {
      return Object.keys(this.selectedOptions)
        .map((key) => key)
        .filter((key) => this.selectedOptions[key]);
    },
    filteredOptions() {
      if (this.checkSelected.length < 1) {
        return this.test;
      }
      return this.test.filter((item) => {
        if (this.selectedOptions.lesson30 && item.lesson <= 30) {
          return true;
        }

        if (this.selectedOptions.AmountFull && item.amount <= item.enrolled.length) {
          return true;
        }
        if (this.selectedOptions.AmountNotFull && item.amount > item.enrolled.length) {
          return true;
        }
        if (this.selectedOptions.price1200 && item.price <= 1200) {
          return true;
        }
        if (this.selectedOptions.price2400 && item.price <= 2400) {
          return true;
        }

        if (this.selectedOptions.certificateT && item.certificate) {
          return true;
        }

        if (this.selectedOptions.certificateF && !item.certificate) {
          return true;
        }

        if (this.selectedOptions.lesson20 && item.lesson <= 20) {
          return true;
        }

        return false;
      });
    },
  },
  methods: {
    clearFilter() {
      this.selectedOptions = {};
    },
  },
  watch: {
    selectedOptionsArray(newValues) {
      this.checkSelected = newValues;
      console.log(this.checkSelected); // Perform any desired action with the updated array
    },
  },
};
</script>
