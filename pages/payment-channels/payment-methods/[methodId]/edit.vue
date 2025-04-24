<template>
    <div class="p-4 overflow-y-scroll relative">
        <Form
            @submit="onSubmit"
            v-slot="{ values }"
            id="form">
            <div class="bg-white p-4 mb-4 rounded-lg">
                <p class="text-xl font-semibold mb-4">
                    Payment Method Information
                </p>

                <div class="mb-4 border-b border-[#E9E9E9] pb-4">
                    <div class="flex gap-[8px] items-end mb-[8px]">
                        <!-- Bind conditional class to the label -->
                        <p>Payment Method Name</p>
                        <!-- Optional message rendered only if provided -->
                        <p class="text-[14px] opacity-40">Max 50 characters</p>
                    </div>

                    <!-- VeeValidate Field component -->
                    <Field
                        name="title"
                        rules="required|max:50"
                        placeholder="e.g. Payment Method ABC"
                        v-model="formValues.paymentMethodName"
                        class="w-full p-[16px] border placeholder:opacity-20 border-[#E9E9E9] rounded-[10px] mb-[8px] outline-none focus:border-ui-color" />

                    <!-- Error Message -->
                    <ErrorMessage
                        name="paymentMethodName"
                        class="text-danger font-[500]" />
                </div>

                <form-fieldsImageHandler
                    label="Payment Method Icon"
                    max="1"
                    size="2"
                    :data="main_image"
                    :dimension="{ width: 24, height: 24 }"
                    :input_payload="{
                        identifier: 'main_image',
                        id: 'mobile_image_id',
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
                        name="isPublished"
                        type="checkbox"
                        v-model="formValues.isPublished"
                     ">
                     <div class="flex items-center gap-2">
                        <button
                            type="button"
                            @click="togglePublished"
                            class="w-10 h-6 rounded-xl flex items-center p-0.5 transition-colors hover:border hover:border-black"
                            :class="[
                                formValues.isPublished === 'true'
                                    ? 'bg-ui-color justify-end'
                                    : 'bg-light-gray justify-start',
                            ]">
                            <div class="w-5 h-5 bg-white rounded-full"></div>
                        </button>
                        {{ formValues.isPublished === 'true' ? 'Yes' : 'No' }}
                    </div>
                    </Field>
                </div>
            </div>
        </Form>

        <button
            class="flex items-center mt-[32px] gap-[10px] text-[#F12222]"
            @click="
                openDeletePopup(`/cms/payment-methods/${route.params.methodId}`)
            ">
            <svg
                xmlns="http://www.w3.org/2000/svg"
                width="20"
                height="23"
                viewBox="0 0 20 23"
                fill="none">
                <!-- Delete icon SVG path -->
                <path
                    d="M7.77778 17.7778C8.07246 17.7778 8.35508 17.6607 8.56345 17.4523C8.77183 17.244 8.88889 16.9614 8.88889 16.6667V10C8.88889 9.70531 8.77183 9.4227 8.56345 9.21433C8.35508 9.00595 8.07246 8.88889 7.77778 8.88889C7.48309 8.88889 7.20048 9.00595 6.9921 9.21433C6.78373 9.4227 6.66667 9.70531 6.66667 10V16.6667C6.66667 16.9614 6.78373 17.244 6.9921 17.4523C7.20048 17.6607 7.48309 17.7778 7.77778 17.7778ZM18.8889 4.44444H14.4444V3.33333C14.4444 2.44928 14.0933 1.60143 13.4681 0.976311C12.843 0.35119 11.9952 0 11.1111 0H8.88889C8.00483 0 7.15699 0.35119 6.53187 0.976311C5.90674 1.60143 5.55556 2.44928 5.55556 3.33333V4.44444H1.11111C0.816426 4.44444 0.533811 4.56151 0.325437 4.76988C0.117063 4.97825 0 5.26087 0 5.55556C0 5.85024 0.117063 6.13286 0.325437 6.34123C0.533811 6.5496 0.816426 6.66667 1.11111 6.66667H2.22222V18.8889C2.22222 19.7729 2.57341 20.6208 3.19853 21.2459C3.82365 21.871 4.6715 22.2222 5.55556 22.2222H14.4444C15.3285 22.2222 16.1763 21.871 16.8015 21.2459C17.4266 20.6208 17.7778 19.7729 17.7778 18.8889V6.66667H18.8889C19.1836 6.66667 19.4662 6.5496 19.6746 6.34123C19.8829 6.13286 20 5.85024 20 5.55556C20 5.26087 19.8829 4.97825 19.6746 4.76988C19.4662 4.56151 19.1836 4.44444 18.8889 4.44444ZM7.77778 3.33333C7.77778 3.03865 7.89484 2.75603 8.10322 2.54766C8.31159 2.33929 8.5942 2.22222 8.88889 2.22222H11.1111C11.4058 2.22222 11.6884 2.33929 11.8968 2.54766C12.1052 2.75603 12.2222 3.03865 12.2222 3.33333V4.44444H7.77778V3.33333ZM15.5556 18.8889C15.5556 19.1836 15.4385 19.4662 15.2301 19.6746C15.0217 19.8829 14.7391 20 14.4444 20H5.55556C5.26087 20 4.97826 19.8829 4.76988 19.6746C4.56151 19.4662 4.44444 19.1836 4.44444 18.8889V6.66667H15.5556V18.8889ZM12.2222 17.7778C12.5169 17.7778 12.7995 17.6607 13.0079 17.4523C13.2163 17.244 13.3333 16.9614 13.3333 16.6667V10C13.3333 9.70531 13.2163 9.4227 13.0079 9.21433C12.7995 9.00595 12.5169 8.88889 12.2222 8.88889C11.9275 8.88889 11.6449 9.00595 11.4365 9.21433C11.2282 9.4227 11.1111 9.70531 11.1111 10V16.6667C11.1111 16.9614 11.2282 17.244 11.4365 17.4523C11.6449 17.6607 11.9275 17.7778 12.2222 17.7778Z"
                    fill="#F12222" />
            </svg>
            <span>Delete Item</span>
        </button>
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

    <PopupDelete
        v-model:show="showDeletePopup"
        :deletePath="deletePath"
        redirectPath="/payment-channels/payment-methods" />
</template>
<script setup>
// Imports
import { Form, Field, ErrorMessage } from 'vee-validate';
import { usePageTitleStore } from '~/stores/pageTitle';
import { ref, reactive, onMounted } from 'vue';

// Store and App Setup
const nuxtApp = useNuxtApp();
const route = useRoute();
const pageTitle = usePageTitleStore();

const isClient = ref(false);

// Form State
const formValues = reactive({
    paymentMethodName: '',
    isPublished: false,
    main_image: [],
});

// UI State
const showDeletePopup = ref(false);
const deletePath = ref('');
const main_image = ref(null);

// File Handling
const handleFileUpdate = (field, file) => {
    formValues.main_image = file;
};

// Toggle Functions
const togglePublished = () => {
    formValues.isPublished = formValues.isPublished === 'true' ? 'false' : 'true';
};


// Delete Handling
const openDeletePopup = url => {
    showDeletePopup.value = true;
    deletePath.value = url;
};

// Data Fetching
const fetchRecords = async () => {
    try {
        const response = await nuxtApp.$axios.get(
            `/cms/payment-methods/${route.params.methodId}`
        );

        // Update form values
        formValues.paymentMethodName = response.data.record.title;
        formValues.isPublished = response.data.record.published || false;
        // If there's an image in the response
        if (response.data.record.images) {
            main_image.value = response.data.record.images.filter(
                img => img.category === 'main_image'
            );
        }
    } catch (error) {
        console.error('Error:', error);
    }
};

// Form Submission
const onSubmit = async values => {
    try {
        const formElement = document.getElementById('form');
        const form_data = new FormData(formElement);
        form_data.append('published', formValues.isPublished);
        formValues.main_image.forEach((file, index) => {
            form_data.append(`main_image[]`, file);
        });
        form_data.append('_method', 'PATCH');

        await nuxtApp.$axios.post(
            `/cms/payment-methods/${route.params.methodId}`,
            form_data,
            {
                headers: {
                    'Content-Type': 'multipart/form-data',
                },
            }
        );

        await navigateTo({
            path: `/payment-channels/payment-methods`,
            query: {
                toast: 'update-success',
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

// Lifecycle Hooks
onMounted(async () => {
    pageTitle.reset();
    pageTitle.setTitle('Edit Payment Method');
    pageTitle.setBreadcrumbs([
        'Payment Channels',
        'Payment Methods',
        'Edit Payment Method',
    ]);

    pageTitle.setPageFrom('Payment Methods');
    pageTitle.setPageFromRoute('/payment-channels/payment-methods');
    await fetchRecords();

    isClient.value = true;
});

// Page Meta
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
