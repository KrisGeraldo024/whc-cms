import { configure } from 'vee-validate';
import { localize } from '@vee-validate/i18n';
import { defineRule } from 'vee-validate';
import * as rules from '@vee-validate/rules';

// Define validation rules globally
Object.keys(rules).forEach(rule => {
  defineRule(rule, rules[rule]);
});

// Optional: Configure localization
configure({
  generateMessage: localize('en'), // You can change 'en' to another locale
  validateOnInput: true, // Validate on input
});
