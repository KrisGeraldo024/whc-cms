<template>
    <div class="overflow-y-scroll">
        <div class="p-[16px]">
            <!-- Control  -->
            <div class="flex items-center justify-between mb-[12px]">
                <div>
                    Displaying {{ records.length }} of
                    {{ totalRecords }} Inquiry Types
                </div>

                <NuxtLink
                    to="/taxonomies/contact-us/inquiry-types/create"
                    class="main-button">
                    <svg
                        xmlns="http://www.w3.org/2000/svg"
                        width="21"
                        height="21"
                        viewBox="0 0 21 21"
                        fill="none">
                        <path
                            fill-rule="evenodd"
                            clip-rule="evenodd"
                            d="M10.5 19.6875C5.42587 19.6875 1.3125 15.5728 1.3125 10.5C1.3125 5.42719 5.42587 1.3125 10.5 1.3125C15.5741 1.3125 19.6875 5.42719 19.6875 10.5C19.6875 15.5728 15.5741 19.6875 10.5 19.6875ZM10.5 0C4.70072 0 0 4.69875 0 10.5C0 16.3012 4.70072 21 10.5 21C16.2993 21 21 16.3012 21 10.5C21 4.69875 16.2993 0 10.5 0ZM14.4375 9.84375H11.1562V6.5625C11.1562 6.20156 10.8629 5.90625 10.5 5.90625C10.1371 5.90625 9.84375 6.20156 9.84375 6.5625V9.84375H6.5625C6.19959 9.84375 5.90625 10.1391 5.90625 10.5C5.90625 10.8609 6.19959 11.1562 6.5625 11.1562H9.84375V14.4375C9.84375 14.7984 10.1371 15.0938 10.5 15.0938C10.8629 15.0938 11.1562 14.7984 11.1562 14.4375V11.1562H14.4375C14.8004 11.1562 15.0938 10.8609 15.0938 10.5C15.0938 10.1391 14.8004 9.84375 14.4375 9.84375Z"
                            fill="#FCFCFC" />
                    </svg>
                    <span> Add an Inquiry Type</span>
                </NuxtLink>
            </div>
            <!-- Table  -->
            <table class="w-full border-separate border-spacing-y-[12px]">
                <thead class="bg-[#fcfcfc]">
                    <tr class="px-[24px] py-[8px] opacity-60">
                        <th>Inquiry Type</th>
                        <th>Assigned Email Recipients</th>
                        <th
                            class="flex items-center cursor-pointer"
                            @click="toggleSort('updated_at')">
                            Last Edited
                            <svg
                                xmlns="http://www.w3.org/2000/svg"
                                width="18"
                                height="18"
                                viewBox="0 0 18 18"
                                fill="none">
                                <!-- Upward triangle -->
                                <path
                                    d="M5.22216 7.34717L8.57972 3.1633C8.87841 2.7763 9.37059 2.7763 9.66985 3.1633L13.0274 7.34717C13.3261 7.73417 13.1855 8.0503 12.6758 8.0503H5.57428C5.06466 8.0503 4.92403 7.73361 5.22272 7.34717H5.22216Z"
                                    :fill="
                                        sortBy === 'updated_at' &&
                                        sortDirection === 'asc'
                                            ? '#4B545B'
                                            : '#A6A8AB'
                                    " />
                                <!-- Downward triangle -->
                                <path
                                    d="M13.0268 10.6519L9.66928 14.8357C9.3706 15.2227 8.87841 15.2227 8.57916 14.8357L5.2216 10.6519C4.92291 10.2649 5.06353 9.94873 5.57316 9.94873H12.6747C13.1843 9.94873 13.325 10.2654 13.0263 10.6519H13.0268Z"
                                    :fill="
                                        sortBy === 'updated_at' &&
                                        sortDirection === 'desc'
                                            ? '#4B545B'
                                            : '#A6A8AB'
                                    " />
                            </svg>
                        </th>
                        <th></th>
                    </tr>
                </thead>

                <tbody>
                    <tr
                        class="bg-[#fff] border-[1px] border-[#e9e9e9]"
                        v-for="(record, index) in records"
                        :key="record">
                        <td class="py-[34.5px]">
                            <span class="font-[500]">{{ record.name }}</span>
                        </td>
                        <td>
                            <div
                                class="font-[500] flex flex-col gap-[10px] py-[10px]">
                                <p
                                    class="px-[12px] py-[2px] bg-ui-color rounded-[10px] text-white w-max"
                                    v-for="(
                                        email, index
                                    ) in record.email_recipients"
                                    :key="index">
                                    {{ email }}
                                </p>
                            </div>
                        </td>
                        <td class="py-[34.5px]">
                            <span>
                                {{
                                    $moment(record.updated_at).format(
                                        'MMM. DD, YYYY hh:mmA'
                                    )
                                }}</span
                            >
                        </td>

                        <td class="py-[34.5px]">
                            <NuxtLink
                                :to="`/taxonomies/contact-us/inquiry-types/${record.id}`">
                                <svg
                                    width="40"
                                    height="20"
                                    viewBox="0 0 40 20"
                                    fill="none"
                                    xmlns="http://www.w3.org/2000/svg">
                                    <rect
                                        width="40"
                                        height="20"
                                        rx="10"
                                        fill="#E9E9E9" />
                                    <circle
                                        cx="10"
                                        cy="10"
                                        r="2"
                                        fill="#2A2A2A" />
                                    <circle
                                        cx="20"
                                        cy="10"
                                        r="2"
                                        fill="#2A2A2A" />
                                    <circle
                                        cx="30"
                                        cy="10"
                                        r="2"
                                        fill="#2A2A2A" />
                                </svg>
                            </NuxtLink>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <Pagination />
    </div>
</template>

<script setup>
import { Form } from 'vee-validate';
import { usePageTitleStore } from '~/stores/pageTitle';
import { useFilterStore } from '~/stores/filters';
import { useSidebarStore } from '~/stores/sidebar';
import { ref, onMounted, watch } from 'vue';
import { useRouter } from 'vue-router';
import { usePaginationStore } from '~/stores/pagination';
const showPopup = ref(false);

// definePageMeta({
//     name: 'pages',
//     middleware: 'authenticator'
// })

const records = ref([]);
const totalRecords = ref(0);
const currentPage = ref(1);
const totalPages = ref(1);
const isSubmitting = ref(false);
const pageTitle = usePageTitleStore();
const filter = useFilterStore();
const sidebar = useSidebarStore();
const keyword = ref('');
const pagination = usePaginationStore();

onMounted(() => {
    pageTitle.reset();
    pageTitle.setTitle('Contact Inquiry Types');
    pageTitle.setBreadcrumbs(['Taxonomies', 'Contact Us', 'Inquiry Types']);

    fetchRecords();
});

const onSubmit = async (values, { resetForm }) => {
    if (isSubmitting.value) return;
    isSubmitting.value = true;
    try {
        await nuxtApp.$axios.post('/cms/taxonomies', {
            name: values.employmentTypeName,
            type: 'inquiry_type',
        });
        showPopup.value = false;
        resetForm();
        fetchRecords(1);
    } catch (error) {
    } finally {
        isSubmitting.value = false;
    }
};

const sortBy = ref('updated_at');
const sortDirection = ref('desc');

const toggleSort = async column => {
    if (sortBy.value === column) {
        sortDirection.value = sortDirection.value === 'asc' ? 'desc' : 'asc';
    } else {
        sortBy.value = column;
        sortDirection.value = 'asc';
    }

    await fetchRecords(currentPage.value);
};
const fetchRecords = async (page = 1) => {
    try {
        const response = await nuxtApp.$axios.get(
            `/cms/taxonomies/inquiry-types?page=${pagination.page}&sortBy=${sortBy.value}&sortDirection=${sortDirection.value}`
        );
        console.log('doing');
        records.value = response.data.data;
        totalRecords.value = response.data.total;
        totalPages.value = Math.ceil(
            response.data.total / response.data.per_page
        );
        currentPage.value = page;
        pagination.setTotalPages(response.data.last_page);
    } catch (error) {
        console.log(error);
    }
};

const nuxtApp = useNuxtApp();
watch(() => pagination.page, (newPage) => {
    fetchRecords(); // Call the API whenever the page changes
});
definePageMeta({
    middleware: 'authenticator',
});
// const goToPage = (page, module) => {
//     pageTitle.setTitle(`Edit ${module.name}`);
//     pageTitle.setBreadcrumbs(['Pages', page.name, module.name]);
//     sidebar.setActiveLink(page.name);

//     pageTitle.setPageFrom('Pages');
//     pageTitle.setPageFromRoute('/pages');

//     router.push(
//         `/pages/${page.name.toLowerCase().replace(/ /g, '-')}/${module.name
//             .toLowerCase()
//             .replace(/ /g, '-')}/${module.id}`
//     );
// };
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
