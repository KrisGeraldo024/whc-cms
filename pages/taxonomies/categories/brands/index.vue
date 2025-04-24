<template>
    <div class="overflow-y-scroll">
        <div class="p-[16px]">
            <!-- Control  -->
            <div class="flex items-center justify-between mb-[12px]">
                <div>Displaying <b>{{ records?.length }}</b> of
                    <b>{{ totalRecords }}</b> brand(s)</div>

                <button
                    @click="openPopup()"
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
                    <span> Add a Brand</span>
                </button>
            </div>
            <!-- Table  -->
            <table class="w-full border-separate border-spacing-y-[12px]">
                <colgroup>
                    <col style="width: 300px" />
                    <col style="width: 300px" />
                    <col style="width: 140px" />
                    <col style="width: 220px" />
                    <col style="width: 96px" />
                </colgroup>
                <thead class="bg-[#fcfcfc]">
                    <tr class="px-[24px] py-[8px] opacity-60">
                        <th>Brand name</th>
                        <th
                            class="flex items-center cursor-pointer"
                            @click="toggleSort('updated_at')">
                            Last edited
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
                        <th>No. of usage</th>
                        <th
                            class="flex items-center cursor-pointer"
                            @click="toggleSort('created_at')">
                            Created at
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
                                        sortBy === 'created_at' &&
                                        sortDirection === 'asc'
                                            ? '#4B545B'
                                            : '#A6A8AB'
                                    " />
                                <!-- Downward triangle -->
                                <path
                                    d="M13.0268 10.6519L9.66928 14.8357C9.3706 15.2227 8.87841 15.2227 8.57916 14.8357L5.2216 10.6519C4.92291 10.2649 5.06353 9.94873 5.57316 9.94873H12.6747C13.1843 9.94873 13.325 10.2654 13.0263 10.6519H13.0268Z"
                                    :fill="
                                        sortBy === 'created_at' &&
                                        sortDirection === 'desc'
                                            ? '#4B545B'
                                            : '#A6A8AB'
                                    " />
                            </svg>
                        </th>
                    </tr>
                </thead>

                <tbody>
                    <tr
                        v-for="(record, index) in records"
                        :key="record.id"
                        class="bg-[#fff] border-[1px] border-[#e9e9e9]">
                        <td class="py-[34.5px]">
                            <span class="font-[500]">{{ record.name }}</span>
                        </td>
                        <td class="py-[34.5px]">
                            <span>
                                {{
                                    $moment(record.updated_at).format(
                                        'MMM. DD, YYYY hh:mmA'
                                    )
                                }}
                            </span>
                        </td>
                        <td class="py-[34.5px]">
                            <span>{{record.brand_count || "pending"}}</span>
                        </td>
                        <td class="py-[34.5px]">
                            <span>
                                {{
                                    $moment(record.created_at).format(
                                        'MMM. DD, YYYY hh:mmA'
                                    )
                                }}
                            </span>
                        </td>
                        <td class="py-[34.5px] relative">
                            <button @click.stop="toggleMenu(index)">
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
                            </button>

                            <div
                                v-if="activeMenuIndex === index"
                                class="absolute top-0 left-0 bg-white flex flex-col p-[10px] gap-[10px] rounded-[10px] translate-y-[-70%] font-[600] border border-gray">
                                <button
                                    class="flex items-center gap-[10px] pb-[10px] border-b border-black/30"
                                    @click="openPopup(record)">
                                    <svg
                                        width="22px"
                                        height="22px"
                                        viewBox="0 0 24 24"
                                        fill="none"
                                        xmlns="http://www.w3.org/2000/svg">
                                        <!-- Edit icon SVG path -->
                                        <path
                                            fill-rule="evenodd"
                                            clip-rule="evenodd"
                                            d="M20.8477 1.87868C19.6761 0.707109 17.7766 0.707105 16.605 1.87868L2.44744 16.0363C2.02864 16.4551 1.74317 16.9885 1.62702 17.5692L1.03995 20.5046C0.760062 21.904 1.9939 23.1379 3.39334 22.858L6.32868 22.2709C6.90945 22.1548 7.44285 21.8693 7.86165 21.4505L22.0192 7.29289C23.1908 6.12132 23.1908 4.22183 22.0192 3.05025L20.8477 1.87868ZM18.0192 3.29289C18.4098 2.90237 19.0429 2.90237 19.4335 3.29289L20.605 4.46447C20.9956 4.85499 20.9956 5.48815 20.605 5.87868L17.9334 8.55027L15.3477 5.96448L18.0192 3.29289ZM13.9334 7.3787L3.86165 17.4505C3.72205 17.5901 3.6269 17.7679 3.58818 17.9615L3.00111 20.8968L5.93645 20.3097C6.13004 20.271 6.30784 20.1759 6.44744 20.0363L16.5192 9.96448L13.9334 7.3787Z"
                                            fill="#0F0F0F" />
                                    </svg>
                                    <span>Edit Item</span>
                                </button>
                                <button v-if="record.brand_count === 0"
                                    class="flex items-center gap-[10px] text-[#F12222]"
                                    @click="
                                        openDeletePopup(
                                            `/cms/taxonomies/${record.id}`
                                        )
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
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <PopupForm
            v-model:show="showPopup"
            :title="isEditing ? 'Edit Brand' : 'Add a Brand'">
            <Form
                @submit="onSubmit"
                :initial-values="formInitialValues">
                <TextField
                    label="Brand Name"
                    v-model="formInitialValues.brandName"
                    name="brandName"
                    placeholder="Enter a brand name"
                    :rules="'required|max:50'"
                    optionalMessage="Max 50 characters" />

                <div class="flex gap-[24px] mt-[16px] ml-auto max-w-max">
                    <button
                        @click="closePopup"
                        type="button">
                        Cancel
                    </button>
                    <button
                        class="px-[16px] py-[10px] bg-ui-color rounded-[10px] text-white">
                        {{ isEditing ? 'Save Changes' : 'Add Brand' }}
                    </button>
                </div>
            </Form>
        </PopupForm>
        <PopupDelete
            v-model:show="showDeletePopup"
            :deletePath="deletePath"
            @delete-success="fetchRecords(1)" />
        <Pagination />
    </div>
</template>
<script setup>
import { Form } from 'vee-validate';
import { usePageTitleStore } from '~/stores/pageTitle';
import { usePaginationStore } from '~/stores/pagination';
import { ref, onMounted, watch, onUnmounted } from 'vue';
const showPopup = ref(false);
const showDeletePopup = ref(false);
const deletePath = ref('');
const nuxtApp = useNuxtApp();
const records = ref([]);
const totalRecords = ref(0);
const currentPage = ref(1);
const totalPages = ref(1);
const isSubmitting = ref(false);
const pageTitle = usePageTitleStore();
const pagination = usePaginationStore();
const sortBy = ref('updated_at');
const sortDirection = ref('desc');

onUnmounted(() => {
    document.removeEventListener('click', handleClickOutside);
});

onMounted(() => {
    document.addEventListener('click', handleClickOutside);
    pageTitle.reset();
    pageTitle.setTitle('Brands');
    pageTitle.setBreadcrumbs(['Taxonomies', 'Tile-Categories', 'Brands']);
    fetchRecords();
});

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
            `/cms/taxonomies/brand?page=${pagination.page}&sortBy=${sortBy.value}&sortDirection=${sortDirection.value}`
        );
        records.value = response.data;
        totalRecords.value = response.data.length;
        totalPages.value = Math.ceil(
            response.data.total / response.data.per_page
        );
        currentPage.value = page;
        activeMenuIndex.value = null;
        pagination.setTotalPages(response.data.last_page);
    } catch (error) {
        console.error('Error fetching records:', error);
        nuxtApp.$toast.error('Failed to load brand');
    }
};
//  here
const activeMenuIndex = ref(null);
const editingRecord = ref(null);
const isEditing = computed(() => !!editingRecord.value);
const formInitialValues = computed(() => ({
    brandName: editingRecord.value?.name || '',
}));

const openDeletePopup = url => {
    showDeletePopup.value = true;
    deletePath.value = url;
    activeMenuIndex.value = null;
};

const openPopup = (record = null) => {
    console.log(record);
    editingRecord.value = record;
    showPopup.value = true;
    activeMenuIndex.value = null;
};

const closePopup = () => {
    showPopup.value = false;
    editingRecord.value = null;
};

const onSubmit = async (values, { resetForm }) => {
    if (isSubmitting.value) return;
    isSubmitting.value = true;

    try {
        const payload = {
            name: values.brandName,
            property_type: values.property_type,
            type: 'brand',
        };

        if (isEditing.value) {
            await nuxtApp.$axios.put(
                `/cms/taxonomies/${editingRecord.value.id}`,
                payload
            );
            nuxtApp.$toast.success('Brand updated successfully!');
        } else {
            await nuxtApp.$axios.post('/cms/taxonomies', payload);
            nuxtApp.$toast.success('Brand added successfully!');
        }

        closePopup();
        resetForm();
        fetchRecords(1);
    } catch (error) {
        console.error('Error submitting form:', error);
        nuxtApp.$toast.error(
            error.response?.data?.errors.name[0] ||
                'An error occurred while saving the brand'
        );
    } finally {
        isSubmitting.value = false;
    }
};
const toggleMenu = index => {
    activeMenuIndex.value = activeMenuIndex.value === index ? null : index;
};

const handleClickOutside = event => {
    if (!event.target.closest('button')) {
        activeMenuIndex.value = null;
    }
};

watch(() => pagination.page, (newPage) => {
    fetchRecords(); // Call the API whenever the page changes
});

definePageMeta({
    middleware: 'authenticator'
})
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
