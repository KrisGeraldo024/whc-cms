<template>
    <div>
        <div class="flex gap-[8px] items-end mb-[8px]">
            <!-- Bind conditional class to the label -->
            <p
                :class="[
                    { 'text-danger': hasError },
                    'text-[#2a2a2a] opacity-70',
                ]">
                {{ label }}
            </p>
            <!-- Optional message rendered only if provided -->
            <p
                v-if="optionalMessage"
                class="text-[14px] opacity-40">
                {{ optionalMessage }}
            </p>
        </div>

        <!-- VeeValidate Field component -->
        <Field
            :disabled="disabled"
            :name="name"
            :rules="rules"
            :as="as"
            :placeholder="placeholder"
            v-bind="fieldProps"
            :value="modelValue"
            class="w-full p-[16px] border placeholder:opacity-20 rounded-[10px] mb-[8px] outline-none focus:border-ui-color"
            :class="{
                'border-danger': hasError,
                'border-[#2A2A2A]/20': !hasError,
            }" />

        <!-- Error Message -->
        <ErrorMessage
            :name="name"
            class="text-danger font-[500]" />
    </div>
</template>

<script setup>
import { Field, ErrorMessage, useField } from 'vee-validate';
import { defineProps } from 'vue';

// Define props
const props = defineProps({
    label: {
        type: String,
        required: true,
    },
    name: {
        type: String,
        required: true,
    },
    placeholder: {
        type: String,
        required: true,
    },
    disabled: {
        type: Boolean,
        default: false,
    },
    rules: {
        type: String,
        default: 'required',
    },
    optionalMessage: {
        type: String,
        default: '',
    },
    as: {
        type: String,
        default: 'input',
    },
    fieldProps: {
        type: Object,
        default: () => ({}),
    },
    modelValue: {
        type: String,
        default: '',
    },
    hasErrors: {
        type: Object,
        default: {}
    }
});
const hasError = ref(false)
watch(() => props.hasErrors, (newErrors) => {
    // console.log(newErrors)
    hasError.value = newErrors && newErrors[props.name];
})

</script>
