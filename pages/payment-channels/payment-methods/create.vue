<template>
    <div class="p-4 overflow-y-scroll relative">
        <Form
            @submit="onSubmit"
            v-slot="{ values }"
            id="form"
            :initial-values="initialValues">
            <div class="bg-white p-4 mb-4 rounded-lg">
                <p class="text-xl font-semibold mb-4">
                    Payment Method Information
                </p>
                <Field
                    v-slot="{ field }"
                    name="title"
                    rules="required|max:50">
                    <TextField
                        v-bind="field"
                        class="mb-4 border-b border-[#E9E9E9] pb-4"
                        label="Payment Method Name"
                        placeholder="e.g. Payment Method ABC"
                        optionalMessage="Max 50 characters" />
                </Field>

                <form-fieldsImageHandler
                    label="Payment Method Icon"
                    max="1"
                    size="2"
                    :dimension="{ width: 24, height: 24 }"
                    :input_payload="{
                        identifier: 'main_image',
                        id: 'main_image_id',
                        category: 'main_image_category',
                        category_value: 'main_image',
                        alt: 'main_image_alt',
                    }"
                    @update:file="handleFileUpdate('main_image', $event)" />

                <ImageTips class="mt-4" />
            </div>

            <div class="bg-white p-4 flex flex-col gap-4 rounded-lg w-full">
                <h2 class="font-semibold text-xl text-start w-full">
                    Payment Method Status
                </h2>
                <div class="flex flex-col gap-2">
                    <h3 class="font-normal text-base">Published</h3>
                    <Field
                        v-model="isPublished"
                        name="isPublished"
                        type="checkbox"
                        v-slot="{ field }">
                        <div class="flex items-center gap-2">
                            <button
                                type="button"
                                @click="togglePublished"
                                class="w-10 h-6 rounded-xl flex items-center p-0.5 transition-colors hover:border hover:border-black"
                                :class="[
                                    isPublished
                                        ? 'bg-ui-color justify-end'
                                        : 'bg-light-gray justify-start',
                                ]">
                                <div
                                    class="w-5 h-5 bg-white rounded-full"></div>
                            </button>
                            {{ isPublished ? 'Yes' : 'No' }}
                        </div>
                    </Field>
                </div>
            </div>
        </Form>
    </div>
    <div class="w-full flex items-center justify-between bg-white px-4 py-3">
        <NuxtLink
            to="/payment-channels/payment-methods"
            class="flex gap-2 items-center">
            <svg
                width="32"
                height="32"
                viewBox="0 0 32 32"
                fill="none"
                xmlns="http://www.w3.org/2000/svg">
                <path
                    d="M6.6665 16H25.3332M6.6665 16L14.6665 8M6.6665 16L14.6665 24"
                    stroke="#00A651"
                    stroke-width="3"
                    stroke-linecap="round"
                    stroke-linejoin="round" />
            </svg>
            <span class="text-ui-color">Back to Payment Methods</span>
        </NuxtLink>

        <button
            class="main-button"
            form="form">
            Save Payment Method
        </button>
    </div>
</template>

<script setup>
import { Form, Field, ErrorMessage } from 'vee-validate';
import { usePageTitleStore } from '~/stores/pageTitle';
import { ref, onMounted } from 'vue';

const initialValues = {
    paymentMethodName: '',
    isPublished: false,
};
const isPublished = ref(initialValues.isPublished);
const records = ref([]);
const totalRecords = ref(0);
const currentPage = ref(1);
const totalPages = ref(1);
const pageTitle = usePageTitleStore();
const main_image = ref([]);

const isClient = ref(false);

const handleFileUpdate = (field, file) => {
    main_image.value = file;
};

const togglePublished = () => {
    isPublished.value = !isPublished.value;
};

onMounted(() => {
    pageTitle.reset();
    pageTitle.setTitle('Payment Methods');
    pageTitle.setBreadcrumbs([
        'Payment Channels',
        'Payment Methods',
        'Add Payment Method',
    ]);

    pageTitle.setPageFrom('Payment Methods');
    pageTitle.setPageFromRoute('/payment-channels/payment-methods');

    isClient.value = true;
});

const nuxtApp = useNuxtApp();

const onSubmit = async values => {
    try {
        values.isPublished = isPublished.value;
        // const payload = {
        //     name: values.paymentMethodName,
        //     isPublished: values.isPublished,
        //     image: mobile_image.value,
        // };

        const formElement = document.getElementById('form');
        const form_data = new FormData(formElement);

        // form_data.append('title', values.paymentMethodName);
        form_data.append('published', values.isPublished);
        main_image.value.forEach((file, index) => {
            form_data.append(`main_image[]`, file);
        });

        // console.log(payload);

        await nuxtApp.$axios.post('/cms/payment-methods', form_data, {
            headers: {
                'Content-Type': 'multipart/form-data',
            },
        });

        await navigateTo({
            path: '/payment-channels/payment-methods',
            query: {
                toast: 'save-success',
            },
        });
    } catch (error) {
        console.error('Error submitting form:', error);
        nuxtApp.$toast.error(
            error.response?.data?.message ||
                'An error occurred while saving the payment method'
        );
    }
};

definePageMeta({
    middleware: 'authenticator',
});
</script>

<style scoped>
th {
    padding-block: 8px;
}

th,
td {
    text-align: left;
}
th:first-child,
td:first-child {
    padding-left: 24px;
}

th:last-child,
td:last-child {
    padding-right: 24px;
}
</style>
