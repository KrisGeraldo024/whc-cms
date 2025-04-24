<template>
    <div
        class="relative text-left mb-4"
        ref="dropdownRef">
        <label
            :for="name"
            class="block text-gray-700 mb-2 opacity-70">
            {{ label }}
        </label>
        <div class="w-full">
            <!-- Dropdown Button -->
            <button
                type="button"
                @click="toggleDropdown"
                class="inline-flex justify-between w-full rounded-md border border-gray-300 bg-white p-[16px] text-gray-700 border-black/20 hover:bg-gray-50 focus:outline outline-[2px]"
                aria-haspopup="true"
                :aria-expanded="isOpen">
                <span v-if="selectedText">{{ selectedText }}</span>
                <span
                    v-else
                    class="opacity-20"
                    >{{ placeholder }}</span
                >
                <svg
                    class="ml-2 h-5 w-5"
                    xmlns="http://www.w3.org/2000/svg"
                    viewBox="0 0 20 20"
                    fill="currentColor"
                    aria-hidden="true">
                    <path
                        fill-rule="evenodd"
                        d="M5.293 7.293a1 1 0 011.414 0L10 10.586l3.293-3.293a1 1 0 111.414 1.414l-4 4a1 1 0 01-1.414 0l-4-4a1 1 0 010-1.414z"
                        clip-rule="evenodd" />
                </svg>
            </button>

            <!-- Dropdown Menu -->
            <div
                v-if="isOpen"
                class="absolute z-10 mt-2 w-full rounded-md bg-white shadow-lg ring-1 ring-black ring-opacity-5 focus:outline-none">
                <ul class="py-1">
                    <li
                        v-for="(option, index) in options"
                        :key="index"
                        @click="selectOption(option)"
                        class="block px-4 py-2 text-gray-700 cursor-pointer hover:bg-gray-100">
                        {{ option.text }}
                    </li>
                </ul>
            </div>
        </div>
    </div>
</template>

<script setup>
import { ref, onMounted, onBeforeUnmount, computed } from 'vue';

const props = defineProps({
    options: {
        type: Array,
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
    title: {
        type: String,
        default: '',
    },
    label: {
        type: String,
        default: 'Select an option',
    },
});

const isOpen = ref(false);
const selected = ref(null);
const dropdownRef = ref(null);

const selectedText = computed(() => {
    const selectedOption = props.options.find(
        option => option.value === selected.value
    );
    return selectedOption ? selectedOption.text : null;
});

const emit = defineEmits(['update:modelValue']);

const toggleDropdown = () => {
    isOpen.value = !isOpen.value;
};

const selectOption = option => {
    selected.value = option.value;
    emit('update:modelValue', option.value);
    isOpen.value = false;
};

// Close dropdown when clicking outside
const handleClickOutside = event => {
    if (dropdownRef.value && !dropdownRef.value.contains(event.target)) {
        isOpen.value = false;
    }
};

onMounted(() => {
    document.addEventListener('click', handleClickOutside);
});

onBeforeUnmount(() => {
    document.removeEventListener('click', handleClickOutside);
});
</script>
