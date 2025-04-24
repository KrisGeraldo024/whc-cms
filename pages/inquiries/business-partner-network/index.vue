<template>
    <div class="relative w-full flex flex-col gap-y-[15px] bg-offwhite overflow-y-auto">
        <div class="bg-white flex flex-col p-[16px] gap-[16px] w-full ">
            <div class="relative w-full flex justify-between items-center bg-white">
                <div class="gap-y-[8px]">
                    <label for="search" class="text-base font-medium text-black/70">
                        Search For a Name, Email or Contact Number
                    </label>
                    <Search v-model="keyword" />
                </div>
                <Filters :filters="filters" v-model="filterValues" :sortDate="true" @update:modelValue="updateValue"/>
                <!-- <div class="gap-y-[8px]">
                    <label for="filter" class="text-base font-medium text-black/70">
                        Filter by Location
                    </label>
                    <Filter v-if="locations" :options="locations" :placeholder="'Choose a Location'"
                        :filterBy="'Location'" />
                </div> -->
            </div>
            <div v-if="filter.value" class="flex justify-start items-center w-full">
                <div
                    class="py-[4px] px-[16px] rounded-[60px] bg-ui-color flex justify-center items-center  gap-x-[8px]">
                    <p class="text-sm font-normal text-white/40">{{ filter.name }}</p>
                    <p class="text-sm font-medium text-white">{{ filter.value }}</p>
                    <span class="w-[10px] h-[10px] cursor-pointer" @click="filter.reset()">
                        <svg xmlns="http://www.w3.org/2000/svg" width="10" height="11" viewBox="0 0 10 11" fill="none">
                            <path
                                d="M8.75011 0.500488L4.99956 4.25016L1.24989 0.500488L0 1.75038L3.74967 5.50005L0 9.24971L1.24989 10.4996L4.99956 6.74994L8.75011 10.4996L10 9.24971L6.25033 5.50005L10 1.75038L8.75011 0.500488Z"
                                fill="white" />
                        </svg>
                    </span>
                </div>
                <div class="ml-[56px] text-danger/40 text-base font-medium leading-normal cursor-pointer flex justify-center items-center  "
                    @click="filter.reset()">
                    <span class="w-[25px] h-[25px]">
                        <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" viewBox="0 0 25 25"
                            class="fill-danger/40">
                            <path d="M8.33333 7.2915C8.05707 7.2915 7.79211 7.40125 7.59676 7.5966C7.40141 7.79195 7.29167 8.0569 7.29167 8.33317C7.29167 8.60944 7.40141 
                        8.87439 7.59676 9.06974C7.79211 9.26509 8.05707 9.37484 8.33333 9.37484H20.8333C21.1096 9.37484 21.3746 9.26509 21.5699 9.06974C21.7653 8.87439 
                        21.875 8.60944 21.875 8.33317C21.875 8.0569 21.7653 7.79195 21.5699 7.5966C21.3746 7.40125 21.1096 7.2915 20.8333 7.2915H8.33333ZM5.20833 
                        12.4998C5.20833 12.2236 5.31808 11.9586 5.51343 11.7633C5.70878 11.5679 5.97373 11.4582 6.25 11.4582H18.75C19.0263 11.4582 19.2912 11.5679 
                        19.4866 11.7633C19.6819 11.9586 19.7917 12.2236 19.7917 12.4998C19.7917 12.7761 19.6819 13.0411 19.4866 13.2364C19.2912 13.4318 19.0263 
                        13.5415 18.75 13.5415H6.25C5.97373 13.5415 5.70878 13.4318 5.51343 13.2364C5.31808 13.0411 5.20833 12.7761 5.20833 12.4998ZM3.125 16.6665C3.125 
                        16.3902 3.23475 16.1253 3.4301 15.9299C3.62545 15.7346 3.8904 15.6248 4.16667 15.6248H16.6667C16.9429 15.6248 17.2079 15.7346 17.4032 15.9299C17.5986 
                        16.1253 17.7083 16.3902 17.7083 16.6665C17.7083 16.9428 17.5986 17.2077 17.4032 17.4031C17.2079 17.5984 16.9429 17.7082 16.6667 17.7082H4.16667C3.8904 
                        17.7082 3.62545 17.5984 3.4301 17.4031C3.23475 17.2077 3.125 16.9428 3.125 16.6665Z" />
                        </svg>
                    </span>
                    <span class="ml-[4px]">Clear All Filters</span>
                </div>
            </div>
        </div>

        <div class="p-[16px] gap-y-[20px] overflow-y-auto  gap-[16px] flex flex-col">
            <div class="flex justify-between items-center w-full">
                <div class="flex items-center justify-between w-full">
                    <p v-if="records && records.data" class="text-black font-medium text-base">
                        <span class="text-black/60">Displaying </span>
                        {{ records.total > 0 ? records.from : 0 }} {{ records.total > 0 ? ' - ' + records.to :
                            '' }}
                        <span class="text-black/60">of</span>
                        {{ records.total }}
                        <span class="text-black/60">items</span>
                    </p>
                    <p v-else class=""></p>

                    <div class="relative">
                        <button @click="isDropdownOpen = !isDropdownOpen"
                            class="font-[500] text-[#4FB220]  flex items-center gap-[16px] px-[1rem] py-[10px] rounded-[10px] border border-[#4FB220] text-base transition group hover:text-white hover:bg-[#4FB220]"
                            :class="{ '!bg-[#4FB220] !text-white': isDropdownOpen }">
                            <span>Export List</span> <svg xmlns="http://www.w3.org/2000/svg" width="13" height="8"
                                class="transition-all" :class="{ 'transform rotate-180': isDropdownOpen }"
                                viewBox="0 0 13 8" fill="none">
                                <path fill-rule="evenodd" clip-rule="evenodd"
                                    d="M6.69506 7.39778C6.47539 7.61746 6.11929 7.61746 5.89961 7.39778L0.164751 1.66291C-0.0549169 1.44323 -0.0549169 1.08713 0.164751 0.867456L0.429921 0.602256C0.649588 0.382581 1.00574 0.382581 1.22542 0.602256L6.29734 5.67421L11.3693 0.602256C11.589 0.382581 11.9451 0.382581 12.1647 0.602256L12.4299 0.867456C12.6496 1.08713 12.6496 1.44323 12.4299 1.66291L6.69506 7.39778Z"
                                    fill="#4FB220" class="group-hover:fill-white transition"
                                    :class="{ '!fill-white ': isDropdownOpen }" />
                            </svg></button>

                        <!-- dropdown  -->
                        <transition name="fade">
                            <div v-if="isDropdownOpen"
                                class="absolute top-[calc(100%+10px)] rounded-[10px] w-full shadow-md p-[4px] flex flex-col items-start z-10 bg-white text-[14px] font-[500]">
                                <button @click="exportList('csv')"
                                    class="p-[8px] transition-all hover:bg-[#E8F1FF] hover:text-ui-color w-full text-left rounded-[5px]">
                                    CSV
                                </button>
                                <hr class="py-[4px]">
                                <button @click="exportList('excel')"
                                    class="p-[8px] transition-all hover:bg-[#E8F1FF] hover:text-ui-color w-full text-left rounded-[5px]">
                                    Excel (.xls)
                                </button>
                            </div>
                        </transition>
                    </div>
                </div>
                <!-- <div class="flex gap-[16px] items-center"> -->
                <!-- <button type="button" @click="openPopup" class="px-[16px] py-[10px] rounded-[10px] border border-ui-color text-ui-color text-base font-medium transition
                    hover:bg-dark-ui-color hover:text-white">
                        Batch Import    
                    </button> -->
                <!-- <router-link :to="`/properties/${propertyType}/create`" class="px-[16px] py-[10px] rounded-[10px] bg-ui-color border border-ui-color text-white text-base font-medium transition
                    hover:bg-dark-ui-color flex gap-[4px]">
                    <span class="w-[21px] h-[21px]">
                        <svg xmlns="http://www.w3.org/2000/svg" width="21" height="21" viewBox="0 0 21 21" fill="none">
                        <path fill-rule="evenodd" clip-rule="evenodd" d="M10.5 19.6875C5.42587 19.6875 1.3125 15.5728 1.3125 10.5C1.3125 5.42719 5.42587 1.3125 10.5 1.3125C15.5741 1.3125 19.6875 5.42719 19.6875 10.5C19.6875 15.5728 15.5741 19.6875 10.5 19.6875ZM10.5 0C4.70072 0 0 4.69875 0 10.5C0 16.3012 4.70072 21 10.5 21C16.2993 21 21 16.3012 21 10.5C21 4.69875 16.2993 0 10.5 0ZM14.4375 9.84375H11.1562V6.5625C11.1562 6.20156 10.8629 5.90625 10.5 5.90625C10.1371 5.90625 9.84375 6.20156 9.84375 6.5625V9.84375H6.5625C6.19959 9.84375 5.90625 10.1391 5.90625 10.5C5.90625 10.8609 6.19959 11.1562 6.5625 11.1562H9.84375V14.4375C9.84375 14.7984 10.1371 15.0938 10.5 15.0938C10.8629 15.0938 11.1562 14.7984 11.1562 14.4375V11.1562H14.4375C14.8004 11.1562 15.0938 10.8609 15.0938 10.5C15.0938 10.1391 14.8004 9.84375 14.4375 9.84375Z" fill="#FCFCFC"/>
                        </svg>
                    </span>
                        Add a {{ formattedTitle }}    
                    </router-link>
                </div> -->
            </div>
            <div v-if="isLoading" class="flex flex-col gap-y-4 animate-pulse">
                <div v-for="n in 3" :key="n" class="h-16 bg-gray-100 rounded-lg"></div>
            </div>

            <div v-else-if="!records.data.length"
                class="flex flex-col items-center justify-center py-16 w-full bg-white rounded-lg">
                <!-- Simple Illustrated Icon -->
                <div class="w-20 h-20 mb-4">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" class="w-full h-full text-gray-200">
                        <path fill="currentColor"
                            d="M20 6h-4V4c0-1.1-.9-2-2-2h-4c-1.1 0-2 .9-2 2v2H4c-1.1 0-2 .9-2 2v12c0 1.1.9 2 2 2h16c1.1 0 2-.9 2-2V8c0-1.1-.9-2-2-2zM10 4h4v2h-4V4z" />
                    </svg>
                </div>

                <!-- Simple Message -->
                <h3 class="text-lg font-medium text-gray-900">No Records Found</h3>
                <p class="text-sm text-gray-500 mt-1">Check back later for updates</p>
            </div>
            <div class="flex pb-[3rem]" v-else>
                <!-- Table 1 -->
                <div class="min-w-[180px] ">
                    <!-- Headers -->
                    <div class="bg-white text-black/60 py-[8px] w-full mb-[12px] pl-[30px] border-r border-[#2a2a2a33]">
                        <p>Inquiry No.</p>
                    </div>
                    <!-- Contents  -->
                    <div class="flex flex-col gap-[12px] ">
                        <div v-if="records && records.data" v-for="(record, index) in records.data"
                            class="h-[40px] bg-white text-black font-normal text-base text-left border-r border-[#2a2a2a33]">
                            <p class="p-[8px] pl-[30px] w-max font-[500] text-right">{{ record.inquiry_number }}</p>
                        </div>
                    </div>
                </div>
                <!-- Table 2 -->
                <div ref="horizScrollContainer" class="overflow-x-auto scroll-custom w-full" @mousedown="startDragging"
                    @mousemove="drag" @mouseup="stopDragging" @mouseleave="stopDragging">
                    <table class="w-full min-w-max">
                        <!-- Headers -->
                        <thead class="">
                            <tr class=" bg-white text-black/60 text-left">
                                <th class="opacity-60 font-[500] pl-[16px] pr-[24px] py-[8px]">Name</th>
                                <th class="opacity-60 font-[500] pr-[24px] py-[8px]">Email</th>
                                <th class="opacity-60 font-[500] pr-[24px] py-[8px]">Contact Num.</th>
                                <th class="opacity-60 font-[500] flex gap-[8px] cursor-pointer pr-[24px] py-[8px]"
                                    @click="toggleSort('updated_at')">
                                    Date Added
                                    <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 18 18"
                                        fill="none">
                                        <!-- Upward triangle -->
                                        <path
                                            d="M5.22216 7.34717L8.57972 3.1633C8.87841 2.7763 9.37059 2.7763 9.66985 3.1633L13.0274 7.34717C13.3261 7.73417 13.1855 8.0503 12.6758 8.0503H5.57428C5.06466 8.0503 4.92403 7.73361 5.22272 7.34717H5.22216Z"
                                            :fill="sortBy === 'updated_at' &&
                                                sortDirection === 'asc'
                                                ? '#4B545B'
                                                : '#A6A8AB'
                                                " />
                                        <!-- Downward triangle -->
                                        <path
                                            d="M13.0268 10.6519L9.66928 14.8357C9.3706 15.2227 8.87841 15.2227 8.57916 14.8357L5.2216 10.6519C4.92291 10.2649 5.06353 9.94873 5.57316 9.94873H12.6747C13.1843 9.94873 13.325 10.2654 13.0263 10.6519H13.0268Z"
                                            :fill="sortBy === 'updated_at' &&
                                                sortDirection === 'desc'
                                                ? '#4B545B'
                                                : '#A6A8AB'
                                                " />
                                    </svg>
                                </th>
                                <th class="opacity-60 font-[500] pr-[24px] py-[8px]">Partnership</th>
                                <th class="opacity-60 font-[500] pr-[24px] py-[8px]">Broker/Realty Company</th>
                                <th class="opacity-60 font-[500] pr-[24px] py-[8px]">Priority Location</th>
                                <th class="opacity-60 font-[500] pr-[24px] py-[8px]">Message</th>
                            </tr>
                        </thead>
                        <!-- Contents  -->
                        <tbody v-if="records && records.data" v-for="(record, index) in records.data">
                            <tr class="h-3"> <!-- Adjust the height as needed -->
                                <td colspan="5"></td> <!-- Empty cell to occupy space -->
                            </tr>
                            <tr class="h-[40px] bg-white text-black font-normal text-base text-left ">
                                <td class="pl-[16px] pr-[24px] py-[8px]">{{ record.first_name }} {{ record.last_name }}
                                </td>
                                <td class="pr-[24px] py-[8px]">{{ record.email_address }}</td>
                                <td class="pr-[24px] py-[8px]">{{ record.contact_number }}</td>
                                <td class="pr-[24px] py-[8px]">{{ $moment(record.created_at).format('MM/DD/YYYY')
                                    }}</td>
                                <td class="pr-[24px] py-[8px]">{{ record.partnership }}</td>
                                <td class="pr-[24px] py-[8px]">{{ record.company }}</td>
                                <td class="pr-[24px] py-[8px] capitalize">{{ record.location.toLowerCase() }}</td>
                                <td class="pr-[24px] py-[8px]">{{ record.message }}</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
    <PopupForm v-model:show="showPopup" :title="'Batch Import'">
        <Form id="form" @submit="onSubmit">

            <div class="flex flex-col gap-[8px] mt-[8px]">
                <form-fieldsImageHandler label="Batch Upload" max="1" size="5"
                    acceptedFormats="xlsx|csv|pdf|jpg|jpeg|png|gif|bmp|webp" :input_payload="{
                        identifier: 'file',
                        id: 'file_id',
                        category: 'file_category',
                        category_value: 'file',
                        alt: 'file_alt',
                    }" @update:file="handleFileUpdate('file', $event)" />
            </div>


            <div class="flex gap-[24px] mt-[16px] ml-auto max-w-max">
                <button @click="closePopup" type="button">
                    Cancel
                </button>
                <button class="px-[16px] py-[10px] bg-ui-color rounded-[10px] text-white">
                    Import
                </button>
            </div>
        </Form>
    </PopupForm>
    <PopupDelete v-model:show="showDeletePopup" :deletePath="deletePath" @delete-success="fetchRecords(1)" />
    <Pagination />
</template>

<style scoped>
.scroll-custom::-webkit-scrollbar {
    height: 5px;
}

.scroll-custom {
    cursor: grab;
}

.scroll-custom:active {
    cursor: grabbing;
}

.fade-enter-active,
.fade-leave-active {
    transition: opacity 0.3s;
}

.fade-enter,
.fade-leave-to {
    opacity: 0;
}

.fade-enter-from,
.fade-leave-to {
    opacity: 0;
}
</style>

<script setup>
import { usePageTitleStore } from '~/stores/pageTitle';
import { usePaginationStore } from '~/stores/pagination';
import { useFilterStore } from '~/stores/filters';
import { useSidebarStore } from '~/stores/sidebar';
import { useRoute } from 'vue-router';
import { useAsyncData } from 'nuxt/app'
import { Form } from 'vee-validate';
import { utils as XLSXUtils, writeFile } from 'xlsx';

const isDropdownOpen = ref(false);

definePageMeta({
    // name: 'properties',
    middleware: 'authenticator'
})

const pageTitle = usePageTitleStore();
const pagination = usePaginationStore();
const filter = useFilterStore();
const sidebar = useSidebarStore();
const route = useRoute();

const propertyType = route.params.propertyType;


const formattedTitle = ref('');
const secondLastSegment = ref('');

onMounted(() => {
    pagination.reset();
    filter.reset();
    document.addEventListener('click', handleClickOutside);

    // console.log(formattedTitle); // Output: 'Featured House & Lots'
    pageTitle.setTitle(`Business Partner Network`);
    pageTitle.setBreadcrumbs(['Inquiries', 'Business Partner Network']);

    pageTitle.setPageFrom('');
    pageTitle.setPageFromRoute('');
    fetchRecords();
    // populateData(sectionData.value);
});

const nuxtApp = useNuxtApp();
const locations = ref(null);
const isLoading = ref(true);
const records = ref({ data: [] });
const filters = ref(null);
const filterValues = reactive({
    startDate: '',
    endDate: '',
});

const fetchRecords = async () => {
    try {
        isLoading.value = true;
        const records_response = await nuxtApp.$axios.get(`/cms/inquiries?inquiry_type=Business Partner Network
        &page=${pagination.page}
        &keyword=${keyword.value}
        &sortDirection=${sortDirection.value}
        &sortBy=${sortBy.value}
        &startDate=${filterValues.startDate}
        &endDate=${filterValues.endDate}`);
        records.value = records_response.data.records || { data: [] };
        filters.value = [];
        filters.value.push(
            {
                name: 'startDate',
                title: 'Start Date',
                value: '',
                placeholder: 'Choose a Start Date'
            },
            {
                name: 'endDate',
                title: 'End Date',
                value: '',
                placeholder: 'Choose an End Date'
            }
        )
        pagination.setTotalPages(records_response.data.records.last_page);
    } catch (error) {
        console.error('Error:', error);
    } finally {
        isLoading.value = false;
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

    await fetchRecords();
};

const handleFileUpdate = (field, file) => {
    const idx = parseInt(field.match(/\d+$/), 10); // Get the number from the field string
    const fieldName = field.replace(/\d+$/, ""); // Remove the number to get the base field name

    if (!Number.isNaN(idx)) {
        formData[fieldName][idx] = file;
        console.log(formData[fieldName]);
    } else {

        formData[fieldName] = file; // Updates the specific image field

        console.log(field);
    }
};

const formData = reactive({
    file: []
});
const showPopup = ref(false);
const showDeletePopup = ref(false);
const deletePath = ref('');
const activeMenuIndex = ref(null);

const openDeletePopup = url => {
    showDeletePopup.value = true;
    deletePath.value = url;
    activeMenuIndex.value = null;
};

const openPopup = (record = null) => {
    showPopup.value = true;
    activeMenuIndex.value = null;
};

const closePopup = () => {
    showPopup.value = false;
    editingRecord.value = null;
};

const toggleMenu = index => {
    activeMenuIndex.value = activeMenuIndex.value === index ? null : index;
};

const handleClickOutside = event => {
    if (!event.target.closest('button')) {
        activeMenuIndex.value = null;
    }
};


const keyword = ref('');
const onSubmit = async () => {
    let form_data = new FormData(document.getElementById('form'));

    formData.file.forEach((file) => {
        form_data.append('file[]', file);
    })

    try {
        const response = await nuxtApp.$axios.post(`/cms/batch-upload?query=properties`, form_data, {
            headers: {
                'Content-Type': 'multipart/form-data',
            },
        }).then((response) => {
            const record = response.data.record;
            nuxtApp.$toast.success('Properties imported successfully!');
            fetchRecords();
            closePopup();
        });

    } catch (error) {
        // console.error('Error:', error.response);
        nuxtApp.$toast.error(error.response.data.message);
    }
};
onUnmounted(() => {
    document.removeEventListener('click', handleClickOutside);
});

watch(keyword, () => {
    fetchRecords();
});

const updateValue = (value) => {
    if (value) {
        // console.log(value);
        fetchRecords();
    } else {
        filterValues.startDate = '';
        filterValues.endDate = '';
        fetchRecords();
    }
}

watch(() => filter.value, (newPage) => {
    fetchRecords(); // Call the API whenever the page changes
});

watch(() => pagination.page, (newPage) => {
    fetchRecords(); // Call the API whenever the page changes
});
const horizScrollContainer = ref(null);
const isDragging = ref(false);
const startX = ref(0);
const scrollLeft = ref(0);

// Smooth Dragging Implementation
const startDragging = (e) => {
    if (!horizScrollContainer.value) return;

    isDragging.value = true;
    startX.value = e.pageX - horizScrollContainer.value.offsetLeft;
    scrollLeft.value = horizScrollContainer.value.scrollLeft;

    // Smoother cursor interaction
    horizScrollContainer.value.style.cursor = 'grabbing';
    horizScrollContainer.value.style.userSelect = 'none';
};

const drag = (e) => {
    if (!isDragging.value || !horizScrollContainer.value) return;

    e.preventDefault();
    const x = e.pageX - horizScrollContainer.value.offsetLeft;

    // Enhanced scroll calculation with easing
    const delta = (x - startX.value) * 1.5; // Increased multiplier for smoother movement
    const newScrollPosition = scrollLeft.value - delta;

    // Smooth scrolling with requestAnimationFrame
    requestAnimationFrame(() => {
        horizScrollContainer.value.scrollLeft = newScrollPosition;
    });
};

const stopDragging = () => {
    if (!horizScrollContainer.value) return;

    isDragging.value = false;
    horizScrollContainer.value.style.cursor = 'grab';
    horizScrollContainer.value.style.userSelect = 'auto';
};

const exportToCSV = async () => {
    const records_response = await nuxtApp.$axios.get(`/cms/export-inquiries?inquiry_type=Business Partner Network
    &startDate=${filterValues.startDate}
    &endDate=${filterValues.endDate}`);
    const records = records_response.data.records

    if (!records) {
        nuxtApp.$toast.error('No data available to export');
        return;
    }

    // Prepare CSV data with selected columns
    const csvData = records.map(record => ({
        'Inquiry Number': record.inquiry_number,
        'Name': `${record.first_name} ${record.last_name}`,
        'Email': record.email_address,
        'Contact Number': record.contact_number,
        'Date Added': nuxtApp.$moment(record.created_at).format('MM/DD/YYYY'),
        'Partnership': record.partnership,
        'Broker/Realty Company': record.company,
        'Priority Location': record.location,
        'Message': record.message
    }));

    // Create CSV content
    const csvContent = [
        Object.keys(csvData[0]).join(','),
        ...csvData.map(row => Object.values(row).map(value =>
            `"${value ? value.toString().replace(/"/g, '""') : ''}"`.replace(/\n/g, ' ')
        ).join(','))
    ].join('\n');

    // Create and download CSV file
    const blob = new Blob([csvContent], { type: 'text/csv;charset=utf-8;' });
    const link = document.createElement('a');
    const url = URL.createObjectURL(blob);
    link.setAttribute('href', url);
    link.setAttribute('download', generateExportFilename('csv'));
    link.style.visibility = 'hidden';
    document.body.appendChild(link);
    link.click();
    document.body.removeChild(link);
};

const exportToExcel = async () => {
    const records_response = await nuxtApp.$axios.get(`/cms/export-inquiries?inquiry_type=Business Partner Network
    &startDate=${filterValues.startDate}
    &endDate=${filterValues.endDate}`);
    const records = records_response.data.records

    if (!records) {
        nuxtApp.$toast.error('No data available to export');
        return;
    }

    // Prepare Excel data with selected columns
    const excelData = records.map(record => ({
        'Inquiry Number': record.inquiry_number,
        'Name': `${record.first_name} ${record.last_name}`,
        'Email': record.email_address,
        'Contact Number': record.contact_number,
        'Date Added': nuxtApp.$moment(record.created_at).format('MM/DD/YYYY'),
        'Partnership': record.partnership,
        'Broker/Realty Company': record.company,
        'Priority Location': record.location,
        'Message': record.message
    }));

    // Create workbook and worksheet
    const worksheet = XLSXUtils.json_to_sheet(excelData);
    const workbook = XLSXUtils.book_new();
    XLSXUtils.book_append_sheet(workbook, worksheet, 'Inquiries');

    // Write and download Excel file
    writeFile(workbook, generateExportFilename('excel'));
};

const generateExportFilename = (type) => {
    const contentType = 'Inquiries';
    const exportType = type.toUpperCase();
    // Choose between simple or comprehensive format
    const filename = `${contentType}_Business-Partner-Network_${exportType}_.${type === 'csv' ? 'csv' : 'xlsx'}`;
    return filename;
};

// Modify the export dropdown to call these methods
const exportList = async (type) => {
    isDropdownOpen.value = false;

    switch (type) {
        case 'csv':
            await exportToCSV();
            break;
        case 'excel':
            await exportToExcel();
            break;
    }
};
</script>