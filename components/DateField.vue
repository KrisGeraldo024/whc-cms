<template>
    <div>
        <div class="flex gap-[8px] items-end mb-[8px]">
            <p
                :class="[
                    { 'text-[#F12222]': hasError },
                    'text-[#2a2a2a] opacity-70',
                ]">
                {{ label }}
            </p>
            <p
                v-if="optionalMessage"
                class="text-[14px] opacity-40">
                {{ optionalMessage }}
            </p>
        </div>
        <Field
            :name="name"
            :rules="rules"
            as="input"
            v-bind="{...fieldProps, type: 'date'}"
            :value="formattedDate"
            :validate-on-blur="true"
            class="w-full p-[16px] border border-[#2A2A2A]/20 rounded-[10px] mb-[8px] bg-white outline-none focus:border-ui-color">
            <!-- <option
                v-if="placeholder"
                value=""
                disabled
                selected>
                {{ placeholder }}
            </option>
            <option
                v-for="option in options"
                :key="option.value"
                :value="option.value">
                {{ option.label }}
            </option> -->
        </Field>
        <ErrorMessage
            :name="name"
            class="text-[#F12222] font-[500]" />
    </div>
</template>

<script setup>
import { Field, ErrorMessage, useField } from 'vee-validate';
import { defineProps, computed } from 'vue';

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
        default: '',
    },
    rules: {
        type: String,
        default: 'required',
    },
    optionalMessage: {
        type: String,
        default: '',
    },
    // options: {
    //     type: Array,
    //     required: true,
    //     validator: value => {
    //         return value.every(
    //             option =>
    //                 typeof option === 'object' &&
    //                 'value' in option &&
    //                 'label' in option
    //         );
    //     },
    // },
    fieldProps: {
        type: Object,
        default: () => ({}),
    },
    modelValue: {
        type: String,
        default: '',
    },
});

const formattedDate = computed(() => {
    // Convert modelValue to YYYY-MM-DD format if it includes a time portion
    return props.modelValue ? props.modelValue.split(' ')[0] : '';
});

const { errorMessage } = useField(props.name);
const hasError = computed(() => !!errorMessage.value);
</script>
