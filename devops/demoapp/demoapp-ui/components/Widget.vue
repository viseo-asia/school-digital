<template>
  <div class="widget">
    <iframe :src="url"></iframe>
  </div>
</template>

<script lang="ts">
import { Component, Prop, Vue } from "vue-property-decorator";

@Component({
  components: {},
})
export default class Widget extends Vue {
  @Prop() public id?: string;

  private url = "";

  private created(): void {
    console.log(`Widget Created: ${this.id}`);
    this.url = `/${this.id}/`;
  }
}
</script>

<style>
.widget {
  width: 100%;
  height: 100%;
  background-color: #efefef;
}
.widget iframe {
  width: 100%;
  height: 100%;
}

@keyframes appear {
  0% {
    opacity: 0;
  }
}
</style>
