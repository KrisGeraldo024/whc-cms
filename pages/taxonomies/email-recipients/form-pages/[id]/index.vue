<template>
    <div class="overflow-y-scroll p-4">
        <div class="bg-white p-4 rounded-lg">
            <p class="text-xl font-semibold mb-4">Assigned Email Recipients</p>
            <Form
                @submit="onSubmit"
                id="addInquiryTypeForm">
                <div class="grid grid-cols-2 gap-4">
                <p class="absolute ">Form Page Name</p>
                    <Field
                        readonly
                        class="mt-[2rem] w-full p-[16px] border placeholder:opacity-20 rounded-[10px] mb-[8px] outline-none focus:border-ui-color"
                        rules="required"
                        v-model="formPage"
                        name="formPage"
                        placeholder="Type Inquiry Name"
                        :class="{
                            'border-danger': hasError,
                            'border-[#2A2A2A]/20': !hasError,
                        }" />
                    <ErrorMessage
                        name="formPage"
                        class="text-danger font-[500]" />
                        
                </div>
                <!-- <TextField
                        label="Inquiry Type Name"
                        name="formPage"
                        placeholder="Type Inquiry Name"
                        :rules="'required'" />
                    <div></div> -->

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

    <!-- <div class="p-[16px]">
        <button
            @click="showPopup = true"
            class="flex items-center justify-center text-[#F12222] font-[500] gap-[8px] w-max">
            <svg
                xmlns="http://www.w3.org/2000/svg"
                width="20"
                height="23"
                viewBox="0 0 20 23"
                fill="none">
                <path
                    d="M7.77778 17.7778C8.07246 17.7778 8.35508 17.6607 8.56345 17.4523C8.77183 17.244 8.88889 16.9614 8.88889 16.6667V10C8.88889 9.70531 8.77183 9.4227 8.56345 9.21433C8.35508 9.00595 8.07246 8.88889 7.77778 8.88889C7.48309 8.88889 7.20048 9.00595 6.9921 9.21433C6.78373 9.4227 6.66667 9.70531 6.66667 10V16.6667C6.66667 16.9614 6.78373 17.244 6.9921 17.4523C7.20048 17.6607 7.48309 17.7778 7.77778 17.7778ZM18.8889 4.44444H14.4444V3.33333C14.4444 2.44928 14.0933 1.60143 13.4681 0.976311C12.843 0.35119 11.9952 0 11.1111 0H8.88889C8.00483 0 7.15699 0.35119 6.53187 0.976311C5.90674 1.60143 5.55556 2.44928 5.55556 3.33333V4.44444H1.11111C0.816426 4.44444 0.533811 4.56151 0.325437 4.76988C0.117063 4.97825 0 5.26087 0 5.55556C0 5.85024 0.117063 6.13286 0.325437 6.34123C0.533811 6.5496 0.816426 6.66667 1.11111 6.66667H2.22222V18.8889C2.22222 19.7729 2.57341 20.6208 3.19853 21.2459C3.82365 21.871 4.6715 22.2222 5.55556 22.2222H14.4444C15.3285 22.2222 16.1763 21.871 16.8015 21.2459C17.4266 20.6208 17.7778 19.7729 17.7778 18.8889V6.66667H18.8889C19.1836 6.66667 19.4662 6.5496 19.6746 6.34123C19.8829 6.13286 20 5.85024 20 5.55556C20 5.26087 19.8829 4.97825 19.6746 4.76988C19.4662 4.56151 19.1836 4.44444 18.8889 4.44444ZM7.77778 3.33333C7.77778 3.03865 7.89484 2.75603 8.10322 2.54766C8.31159 2.33929 8.5942 2.22222 8.88889 2.22222H11.1111C11.4058 2.22222 11.6884 2.33929 11.8968 2.54766C12.1052 2.75603 12.2222 3.03865 12.2222 3.33333V4.44444H7.77778V3.33333ZM15.5556 18.8889C15.5556 19.1836 15.4385 19.4662 15.2301 19.6746C15.0217 19.8829 14.7391 20 14.4444 20H5.55556C5.26087 20 4.97826 19.8829 4.76988 19.6746C4.56151 19.4662 4.44444 19.1836 4.44444 18.8889V6.66667H15.5556V18.8889ZM12.2222 17.7778C12.5169 17.7778 12.7995 17.6607 13.0079 17.4523C13.2163 17.244 13.3333 16.9614 13.3333 16.6667V10C13.3333 9.70531 13.2163 9.4227 13.0079 9.21433C12.7995 9.00595 12.5169 8.88889 12.2222 8.88889C11.9275 8.88889 11.6449 9.00595 11.4365 9.21433C11.2282 9.4227 11.1111 9.70531 11.1111 10V16.6667C11.1111 16.9614 11.2282 17.244 11.4365 17.4523C11.6449 17.6607 11.9275 17.7778 12.2222 17.7778Z"
                    fill="#F12222" />
            </svg>
            Delete Inquiry
        </button>
    </div> -->

    <div class="mt-auto px-[16px] py-[10px] flex justify-between bg-white">
        <NuxtLink
            to="/taxonomies/email-recipients/form-pages"
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
                >Back to Recipients Form Page</span
            >
        </NuxtLink>

        <button
            to=""
            class="main-button max-w-max"
            form="addInquiryTypeForm">
            Edit Form Page
        </button>
    </div>

    <PopupDelete
        redirectPath="/taxonomies/email-recipients/form-pages"
        v-model:show="showPopup"
        :deletePath="`/cms/taxonomies/${route.params.id}`" />
</template>

<script setup>
import { Form, Field, ErrorMessage } from 'vee-validate';
import { usePageTitleStore } from '~/stores/pageTitle';
import { useFilterStore } from '~/stores/filters';
import { useSidebarStore } from '~/stores/sidebar';
import { ref, onMounted, watch, computed } from 'vue';
const route = useRoute();
const router = useRouter();
const errorMessage = ref('');
const showPopup = ref(false);
const record = ref({});
const isSubmitting = ref(false);
const pageTitle = usePageTitleStore();
const filter = useFilterStore();
const sidebar = useSidebarStore();
const formPage = ref('');

// Form related refs
const currentEmail = ref('');
const emails = computed(() => record.value.email_recipients || []);

onMounted(async () => {
    pageTitle.reset();
    pageTitle.setTitle('Edit Form Page');
    pageTitle.setBreadcrumbs([
        'Taxonomies',
        'Contact Us',
        'Edit Form Page',
    ]);

    if (route.query.success) {
        nuxtApp.$toast.success('Added inquiry type successfully!');

        setTimeout(() => {
            const router = useRouter();
            router.replace({ path: route.path });
        }, 3000);
    }

    await fetchRecords();
});

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
    record.value.email_recipients.splice(index, 1);
};

const isValidEmail = email => {
    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    return emailRegex.test(email);
};

const onSubmit = async (values, { resetForm }) => {
    if (isSubmitting.value) return;
    isSubmitting.value = true;

    try {
        await nuxtApp.$axios.put(`/cms/taxonomies/${route.params.id}`, {
            name: values.formPage,
            type: 'form_page',
            email_recipients: record.value.email_recipients,
        });
        showPopup.value = false;
        nuxtApp.$toast.success('Form Page updated successfully!');
    } catch (error) {
        console.error(error);
    } finally {
        isSubmitting.value = false;
    }
};

const fetchRecords = async () => {
    try {
        const response = await nuxtApp.$axios.get(
            `/cms/taxonomies/${route.params.id}`
        );
        record.value = response.data;
        formPage.value = record.value.name;
    } catch (error) {
        console.error(error);
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
