<template>
    <div class="overflow-y-scroll">
        <div class="p-[16px]">
            <!-- Control  -->
            <div class="flex items-center justify-between mb-[12px]">
                <div>
                    Displaying {{ records.length }} of
                    {{ totalRecords }} Payment Methods
                </div>
                <!-- this -->
                <NuxtLink
                    class="main-button"
                    to="/payment-channels/payment-methods/create">
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
                    <span>Add Payment Method</span>
                </NuxtLink>
            </div>
            <!-- Table  -->
            <table class="w-full border-separate border-spacing-y-[12px]">
                <colgroup>
                    <col style="width: 300px" />
                    <col style="width: 140px" />
                    <col style="width: 220px" />
                </colgroup>
                <thead class="bg-[#fcfcfc]">
                    <tr class="px-[24px] py-[8px] opacity-60">
                        <th>Payment Method Name</th>
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
                        <th>Actions</th>
                    </tr>
                </thead>

                <tbody>
                    <tr
                        class="bg-[#fff] border-[1px] border-[#e9e9e9]"
                        v-for="(record, index) in records"
                        :key="record">
                        <td class="py-[34.5px]">
                            <span class="font-[500]">{{ record.title }}</span>
                        </td>
                        <td class="py-[34.5px]">
                            {{ $moment(record.updated_at ? record.updated_at : record.created_at).format('MMM DD, YYYY') }}<br>
                                <span class="text-sm text-black"> <!-- Adjust styling as needed -->
                                    {{ $moment(record.updated_at ? record.updated_at : record.created_at).format('hh:mm A') }}
                                </span>
                        </td>

                        <!-- this  -->
                        <td class="py-[34.5px] relative">
                            <div class="flex gap-[1rem]">
                                <NuxtLink
                                    :to="`/payment-channels/payment-methods/${record.id}/edit`"
                                    class="px-[12px] py-[4px] bg-ui-hover text-black text-base font-normal rounded-[10px] flex justify-center items-center gap-x-[4px] w-auto cursor-pointer">
                                    <span class="w-[12px] h-[12.6px]">
                                        <svg
                                            xmlns="http://www.w3.org/2000/svg"
                                            width="14"
                                            height="14"
                                            viewBox="0 0 14 14"
                                            fill="none">
                                            <path
                                                d="M12.0032 1.0851L12.0032 1.08509C11.2922 0.338564 10.1358 0.338561 9.42478 1.08509L9.55096 1.20527L9.42478 1.08509L1.66647 9.23134C1.41323 9.49724 1.24149 9.8349 1.1717 10.2013L1.34344 10.234L1.1717 10.2013L0.849983 11.8903C0.675922 12.8041 1.44463 13.6381 2.34751 13.4485L3.95605 13.1107C4.30986 13.0364 4.63357 12.854 4.88689 12.588L12.6452 4.44179C13.3516 3.70009 13.3516 2.50092 12.6452 1.75921L12.0032 1.0851ZM11.6168 2.81432L11.6168 2.81434C11.7664 2.97145 11.7664 3.22955 11.6168 3.38667L11.6168 3.38668L10.2795 4.79084L9.10417 3.55674L10.4532 2.14022C10.4532 2.14021 10.4532 2.14021 10.4532 2.1402C10.5983 1.98791 10.8297 1.98792 10.9748 2.14022L11.6168 2.81432ZM2.31765 11.9235L2.59023 10.4925C2.6053 10.4134 2.64215 10.3418 2.6949 10.2864L2.56818 10.1658L2.6949 10.2864L8.08748 4.62422L9.26282 5.85833L3.85846 11.5329C3.80581 11.5882 3.73979 11.6248 3.66921 11.6397L3.6692 11.6397L2.31765 11.9235Z"
                                                fill="#2A2A2A"
                                                stroke="#2A2A2A"
                                                stroke-width="0.35" />
                                        </svg>
                                    </span>
                                    Edit Details
                                </NuxtLink>

                                <NuxtLink
                                    :to="`/payment-channels/payment-methods/${record.id}/payment-platforms`"
                                    class="px-[12px] py-[4px] bg-ui-hover text-black text-base font-normal rounded-[10px] flex justify-center items-center gap-x-[4px] w-auto cursor-pointer">
                                    <span class="w-[12px] h-[12.6px]">
                                        <svg
                                            xmlns="http://www.w3.org/2000/svg"
                                            width="15"
                                            height="15"
                                            viewBox="0 0 15 15"
                                            fill="none">
                                            <rect
                                                x="0.75"
                                                y="1.25"
                                                width="12.567"
                                                height="5.19856"
                                                rx="1.25"
                                                stroke="#2A2A2A"
                                                stroke-width="1.5" />
                                            <rect
                                                x="0.75"
                                                y="8.61816"
                                                width="5.13158"
                                                height="5.13158"
                                                rx="1.25"
                                                stroke="#2A2A2A"
                                                stroke-width="1.5" />
                                            <rect
                                                x="8.11816"
                                                y="8.61816"
                                                width="5.13158"
                                                height="5.13158"
                                                rx="1.25"
                                                stroke="#2A2A2A"
                                                stroke-width="1.5" />
                                        </svg>
                                    </span>

                                    List of Items
                                </NuxtLink>
                            </div>
                        </td>
                    </tr>
                </tbody>
            </table>
            <div>
                <NuxtLink
                    to="/payment-channels/payment-methods/create"
                    class="w-full py-[34.5px] border border-ui-color/20 rounded-[10px] flex items-center justify-center gap-x-[6px] font-[600]">
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
                            fill="#00A651" />
                    </svg>
                    <span class="text-ui-color">Add a New Payment Method</span>
                </NuxtLink>
            </div>
        </div>
    </div>
</template>

<script setup>
import { usePageTitleStore } from '~/stores/pageTitle';
import { ref, onMounted, watch } from 'vue';
const records = ref([]);
const totalRecords = ref(0);
const currentPage = ref(1);
const totalPages = ref(1);
const pageTitle = usePageTitleStore();
const route = useRoute();
const handleFileUpdate = (field, file) => {
    formData[field] = file; // Updates the specific image field
};

onMounted(() => {
    document.addEventListener('click', handleClickOutside);
    pageTitle.reset();
    pageTitle.setTitle('Payment Methods');
    pageTitle.setBreadcrumbs(['Payment Channels', 'Payment Methods']);
    fetchRecords();
    // if (route.query.toast === 'delete-success') {
    //     nuxtApp.$toast.success('Deleted successfully!');
    // }
    if (route.query.toast === 'save-success') {
        nuxtApp.$toast.success('Added successfully!');
    }
    if (route.query.toast === 'update-success') {
        nuxtApp.$toast.success('Updated successfully!');
    }
});

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
        const response = await nuxtApp.$axios.get(`/cms/payment-methods`);
        console.log(response.data.records.data);
        records.value = response.data.records.data;
        totalRecords.value = response.data.records.total;
        totalPages.value = Math.ceil(
            response.data.total / response.data.per_page
        );
        currentPage.value = page;
        activeMenuIndex.value = null;
    } catch (error) {
        nuxtApp.$toast.error('Failed to load unit types');
        console.log(error);
    }
};

const activeMenuIndex = ref(null);
const editingRecord = ref(null);

onUnmounted(() => {
    document.removeEventListener('click', handleClickOutside);
});

const toggleMenu = index => {
    activeMenuIndex.value = activeMenuIndex.value === index ? null : index;
};

const handleClickOutside = event => {
    if (!event.target.closest('button')) {
        activeMenuIndex.value = null;
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
