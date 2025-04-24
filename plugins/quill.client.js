import { QuillEditor, Quill } from '@vueup/vue-quill';
import { defineNuxtPlugin } from '#app';
import '@vueup/vue-quill/dist/vue-quill.snow.css';

export default defineNuxtPlugin(async (nuxtApp) => {
  if (process.client) {
    const { QuillEditor } = await import('@vueup/vue-quill');
    nuxtApp.vueApp.component('QuillEditor', QuillEditor);
  }
  // nuxtApp.vueApp.component('QuillEditor', QuillEditor);
});