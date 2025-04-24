<template>
    <div class="overflow-y-scroll p-4">
        <div class="bg-white p-4 rounded-lg">
            <p class="text-xl font-semibold mb-4">Assigned Email Recipients</p>
            <Form
                @submit="onSubmit"
                id="addInquiryTypeForm">
                <div class="grid grid-cols-2 gap-4">
                    <TextField
                        label="Inquiry Type Name"
                        name="inquiryType"
                        placeholder="Type Inquiry Name"
                        :rules="'required'" />
                    <div></div>
                </div>

                <div class="grid grid-cols-2 gap-4">
                    <div class="relative">
                        <div class="flex gap-2 items-end mb-2 mt-4">
                            <p>Enter email</p>
                            <!-- <p class="text-sm opacity-40">
                                The confirmation will be sent to this email
                            </p> -->
                        </div>

                        <div class="relative">
                            <Field
                                @keydown.enter.prevent="addEmail"
                                v-model="currentEmail"
                                name="email"
                                rules="email"
                                placeholder="Enter Email Address"
                                class="w-full p-4 border border-[#2A2A2A]/20 placeholder:opacity-20 rounded-lg mb-2 pr-36" />
                            <button
                                type="button"
                                @click="addEmail"
                                class="flex gap-1 items-center absolute top-1/2 -translate-y-[60%] right-2 text-ui-color px-3 py-2 rounded-lg border border-ui-color">
                                <svg
                                    xmlns="http://www.w3.org/2000/svg"
                                    width="21"
                                    height="22"
                                    viewBox="0 0 21 22"
                                    fill="none">
                                    <path
                                        fill-rule="evenodd"
                                        clip-rule="evenodd"
                                        d="M10.5 20.1875C5.42587 20.1875 1.3125 16.0728 1.3125 11C1.3125 5.92719 5.42587 1.8125 10.5 1.8125C15.5741 1.8125 19.6875 5.92719 19.6875 11C19.6875 16.0728 15.5741 20.1875 10.5 20.1875ZM10.5 0.5C4.70072 0.5 0 5.19875 0 11C0 16.8012 4.70072 21.5 10.5 21.5C16.2993 21.5 21 16.8012 21 11C21 5.19875 16.2993 0.5 10.5 0.5ZM14.4375 10.3438H11.1562V7.0625C11.1562 6.70156 10.8629 6.40625 10.5 6.40625C10.1371 6.40625 9.84375 6.70156 9.84375 7.0625V10.3438H6.5625C6.19959 10.3438 5.90625 10.6391 5.90625 11C5.90625 11.3609 6.19959 11.6562 6.5625 11.6562H9.84375V14.9375C9.84375 15.2984 10.1371 15.5938 10.5 15.5938C10.8629 15.5938 11.1562 15.2984 11.1562 14.9375V11.6562H14.4375C14.8004 11.6562 15.0938 11.3609 15.0938 11C15.0938 10.6391 14.8004 10.3438 14.4375 10.3438Z"
                                        fill="#00A651" />
                                </svg>
                                <span>Add Email</span>
                            </button>
                        </div>
                        <!-- <ErrorMessage
                            name="email"
                            class="text-[#F12222] font-medium" /> -->
                        <span
                            class="text-[#f12222]"
                            v-if="errorMessage"
                            >{{ errorMessage }}</span
                        >
                    </div>
                    <div class="mt-4">
                        <p class="font-medium text-black opacity-70 mb-2">
                            Added Emails
                        </p>
                        <div class="flex flex-wrap gap-2">
                            <div
                                v-for="(email, index) in emails"
                                :key="index"
                                class="relative group">
                                <p
                                    class="px-3 py-0.5 bg-ui-color rounded-lg text-white w-max">
                                    {{ email }}
                                    <button
                                        type="button"
                                        @click="removeEmail(index)"
                                        class="ml-2 opacity-0 group-hover:opacity-100 transition-opacity">
                                        ×
                                    </button>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </Form>
        </div>
    </div>

    <div class="mt-auto px-[16px] py-[10px] flex justify-between bg-white">
        <NuxtLink
            to="/taxonomies/contact-us/inquiry-types"
            class="flex items-center gap-[4px]">
            <svg
                xmlns="http://www.w3.org/2000/svg"
                width="32"
                height="32"
                viewBox="0 0 32 32"
                fill="none">
                <path
                    d="M6.66602 16H25.3327M6.66602 16L14.666 8M6.66602 16L14.666 24"
                    stroke="#00A651"
                    stroke-width="3"
                    stroke-linecap="round"
                    stroke-linejoin="round" />
            </svg>
            <span class="font-[500] text-ui-color"
                >Back to Contact Inquiry Types</span
            >
        </NuxtLink>

        <button
            to=""
            class="main-button max-w-max"
            form="addInquiryTypeForm">
            Add Inquiry Type
        </button>
    </div>
</template>

<script setup>
import { Form, Field, ErrorMessage } from 'vee-validate';
import { usePageTitleStore } from '~/stores/pageTitle';
import { useFilterStore } from '~/stores/filters';
import { useSidebarStore } from '~/stores/sidebar';
import { ref, onMounted, watch } from 'vue';
import { useRouter } from 'vue-router';
const showPopup = ref(false);

const records = ref([]);
const totalRecords = ref(0);
const currentPage = ref(1);
const totalPages = ref(1);
const isSubmitting = ref(false);
const pageTitle = usePageTitleStore();
const filter = useFilterStore();
const sidebar = useSidebarStore();
const keyword = ref('');
const errorMessage = ref('');

onMounted(() => {
    pageTitle.reset();
    pageTitle.setTitle('Add Inquiry Type');
    pageTitle.setBreadcrumbs(['Taxonomies', 'Contact Us', 'Add Inquiry Types']);

    fetchRecords();
});

const emails = ref([]);
const currentEmail = ref('');
const addEmail = () => {
    if (currentEmail.value && isValidEmail(currentEmail.value)) {
        if (!emails.value.includes(currentEmail.value)) {
            emails.value.push(currentEmail.value);
            currentEmail.value = '';
            errorMessage.value = null;
        } else {
            errorMessage.value = 'This email is already added';
        }
    } else if (!currentEmail.value) {
        errorMessage.value = 'Add an email first';
    } else {
        errorMessage.value = 'Invalid email format';
    }
};

const removeEmail = index => {
    emails.value.splice(index, 1);
};

const isValidEmail = email => {
    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    return emailRegex.test(email);
};

const onSubmit = async (values, { resetForm }) => {
    if (isSubmitting.value) return;
    isSubmitting.value = true;
    console.log(values);
    try {
        const data = await nuxtApp.$axios.post('/cms/taxonomies', {
            name: values.inquiryType,
            type: 'inquiry_type',
            email_recipients: emails.value,
        });
        showPopup.value = false;
        // resetForm();
        navigateTo({
            path: `/taxonomies/contact-us/inquiry-types/${data.data.data.id}`,
            query: {
                success: true,
            },
        });
    } catch (error) {
        nuxtApp.$toast.error(
            error.response?.data?.errors.name[0] ||
                'An error occurred while adding the Inquiry Type'
        );
    } finally {
        isSubmitting.value = false;
    }
};

const sortBy = ref('updated_at');
const sortDirection = ref('desc');

const fetchRecords = async (page = 1) => {
    try {
        const response = await nuxtApp.$axios.get(
            `/cms/taxonomies/inquiry-types?page=${page}&sortBy=${sortBy.value}&sortDirection=${sortDirection.value}`
        );
        console.log('doing');
        records.value = response.data.data;
        totalRecords.value = response.data.total;
        totalPages.value = Math.ceil(
            response.data.total / response.data.per_page
        );
        currentPage.value = page;
    } catch (error) {
        console.log(error);
    }
};

const nuxtApp = useNuxtApp();
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
