import moment from 'moment';

export default defineNuxtPlugin((nuxtApp) => {
  // Add moment to the nuxtApp's global properties
  nuxtApp.provide('moment', moment);
});
