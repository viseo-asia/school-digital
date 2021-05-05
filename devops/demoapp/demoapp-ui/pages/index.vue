<template>
  <div class="container">
    <div class="header">
      <h1 class="title">[DemoApp] Portal</h1>
    </div>
    <div v-for="widget in widgets" :key="widget.id" class="widget-container">
      <Widget :id="widget.id" />
    </div>
  </div>
</template>

<script lang="ts">
import { Vue, Component, Prop } from "vue-property-decorator";
import axios from "axios";

@Component({
  components: {},
})
export default class AppPage extends Vue {
  private baseUrlComponentInventory = "/demoapp-component-inventory/";

  widgets: any[] = [];

  private created(): void {
    this.checkComponents();
    setInterval(() => {
      this.checkComponents();
    }, 5000);
  }

  async checkComponents(): Promise<void> {
    try {
      this.widgets = (await axios.get(this.baseUrlComponentInventory)).data;
    } catch (err) {
      console.error(err);
    }
  }
}
</script>

<style>
/* Sample `apply` at-rules with Tailwind CSS
.container {
@apply min-h-screen flex justify-center items-center text-center mx-auto;
}
*/
.container {
  margin: 0 auto;
  min-height: 100vh;
  display: grid;
  grid-template-columns: 1fr 1fr;
  grid-template-rows: 5em 20em;
}

.header {
  grid-column: span 2;
}

.title {
  font-family: "Quicksand", "Source Sans Pro", -apple-system, BlinkMacSystemFont,
    "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif;
  display: block;
  font-weight: 300;
  font-size: 3em;
  color: #35495e;
  letter-spacing: 1px;
}

.subtitle {
  font-weight: 300;
  font-size: 42px;
  color: #526488;
  word-spacing: 5px;
  padding-bottom: 15px;
}

.links {
  padding-top: 15px;
}

.widget-container {
  padding: 1em;
}
</style>
