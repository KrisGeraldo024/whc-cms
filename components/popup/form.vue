<template>
    <Teleport to="body">
        <transition name="fade">
            <div
                v-if="show"
                class="bg-black/20 flex items-center justify-center fixed inset-0 z-[99999]"
                @click="closePopup">
                <div
                    class="bg-white p-[16px] rounded-[10px] w-[633px]"
                    @click.stop>
                    <div class="flex items-center justify-between mb-[16px]">
                        <p class="text-[20px] font-[600]">{{ title }}</p>
                        <button @click="closePopup">
                            <svg
                                xmlns="http://www.w3.org/2000/svg"
                                width="12"
                                height="12"
                                viewBox="0 0 12 12"
                                fill="none">
                                <path
                                    d="M11 11L6 6M6 6L1 1M6 6L11 1M6 6L1 11"
                                    stroke="#2A2A2A"
                                    stroke-width="2"
                                    stroke-linecap="round"
                                    stroke-linejoin="round" />
                            </svg>
                        </button>
                    </div>
                    <slot></slot>
                </div>
            </div>
        </transition>
    </Teleport>
</template>

<script setup>
import { defineProps, defineEmits } from 'vue';

const props = defineProps({
    show: {
        type: Boolean,
        required: true,
    },
    title: {
        type: String,
        default: 'Popup Title',
    },
});

const emit = defineEmits(['update:show']);

const closePopup = () => {
    emit('update:show', false);
};
</script>
