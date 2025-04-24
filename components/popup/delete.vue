<template>
    <Teleport to="body">
        <transition name="fade">
            <div
                v-if="show"
                class="bg-black/20 flex items-center justify-center fixed inset-0 z-[99999]"
                @click="closePopup">
                <div
                    class="bg-white p-[24px] rounded-[10px] w-[459px] text-center relative"
                    @click.stop>
                    <button
                        @click="closePopup"
                        class="block p-[10px] absolute right-0 top-0">
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
                    <p class="text-[24px] mb-[16px] font-[600]">
                        Are you sure you want to delete this?
                    </p>
                    <p class="mb-[32px]">This action cannot be undone.</p>

                    <div class="flex items-center gap-[16px] mx-auto w-max">
                        <button @click="closePopup">Cancel</button>
                        <button
                            class="main-button bg-red-500"
                            @click="deleteRecord">
                            Yes, I'm sure
                        </button>
                    </div>
                </div>
            </div>
        </transition>
    </Teleport>
</template>

<script setup>
const nuxtApp = useNuxtApp();
import { defineProps, defineEmits } from 'vue';

const props = defineProps({
    show: {
        type: Boolean,
        required: true,
    },
    title: {
        type: String,
        default: 'Are you sure you want to delete this?',
    },
    deletePath: {
        type: String,
    },
    redirectPath: {
        type: String,
    },
});

const emit = defineEmits(['update:show', 'delete-success']);

const router = useRouter();

const deleteRecord = async () => {
    try {
        // console.log(props.redirectPath);
        if(props.deletePath) {
            const response = await nuxtApp.$axios.delete(`${props.deletePath}`);
        }
        
        nuxtApp.$toast.success('Deleted successfully!');
        emit('delete-success');

        if (props.redirectPath) {
            await navigateTo({
                path: props.redirectPath,
                query: {
                    toast: 'delete-success',
                },
            });
        }
    } catch (error) {
        nuxtApp.$toast.error('Failed to delete item');
        console.error('Error deleting record:', error);
    }

    emit('update:show', false);
};
const closePopup = () => {
    emit('update:show', false);
};
</script>
