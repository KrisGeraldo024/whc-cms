<template>
    <div class="relative w-full p-[16px] flex flex-col gap-y-[15px] bg-white">
        <div class="relative w-full flex justify-between items-center">
            <form @submit.prevent="onSubmit" class="gap-y-[8px]">
                <label for="search" class="text-base font-medium text-black/70">
                    Search by Page Name
                </label>
                <Search v-model="keyword" />
            </form>
            <div class="gap-y-[8px]">
                <label for="filter" class="text-base font-medium text-black/70">
                    Filter by Page Category
                </label>
                <Filter v-if="records" :options="records" :placeholder="'Choose a Category'" :filterBy="'Category'"/>
            </div>
        </div>
        <div v-if="filter.value" class="flex justify-start items-center w-full">
            <div class="py-[4px] px-[16px] rounded-[60px] bg-ui-color flex justify-center items-center  gap-x-[8px]">
                <p class="text-sm font-normal text-white/40">{{ filter.name }}</p>
                <p class="text-sm font-medium text-white">{{ filter.value }}</p>
                <span class="w-[10px] h-[10px] cursor-pointer" @click="filter.reset()">
                    <svg xmlns="http://www.w3.org/2000/svg" width="10" height="11" viewBox="0 0 10 11" fill="none">
                    <path d="M8.75011 0.500488L4.99956 4.25016L1.24989 0.500488L0 1.75038L3.74967 5.50005L0 9.24971L1.24989 10.4996L4.99956 6.74994L8.75011 10.4996L10 9.24971L6.25033 5.50005L10 1.75038L8.75011 0.500488Z" fill="white"/>
                    </svg>
                </span>
            </div>
            <div class="ml-[56px] text-danger/40 text-base font-medium leading-normal cursor-pointer flex justify-center items-center  " @click="filter.reset()">
                <span class="w-[25px] h-[25px]">
                    <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" viewBox="0 0 25 25" class="fill-danger/40">
                    <path d="M8.33333 7.2915C8.05707 7.2915 7.79211 7.40125 7.59676 7.5966C7.40141 7.79195 7.29167 8.0569 7.29167 8.33317C7.29167 8.60944 7.40141 
                    8.87439 7.59676 9.06974C7.79211 9.26509 8.05707 9.37484 8.33333 9.37484H20.8333C21.1096 9.37484 21.3746 9.26509 21.5699 9.06974C21.7653 8.87439 
                    21.875 8.60944 21.875 8.33317C21.875 8.0569 21.7653 7.79195 21.5699 7.5966C21.3746 7.40125 21.1096 7.2915 20.8333 7.2915H8.33333ZM5.20833 
                    12.4998C5.20833 12.2236 5.31808 11.9586 5.51343 11.7633C5.70878 11.5679 5.97373 11.4582 6.25 11.4582H18.75C19.0263 11.4582 19.2912 11.5679 
                    19.4866 11.7633C19.6819 11.9586 19.7917 12.2236 19.7917 12.4998C19.7917 12.7761 19.6819 13.0411 19.4866 13.2364C19.2912 13.4318 19.0263 
                    13.5415 18.75 13.5415H6.25C5.97373 13.5415 5.70878 13.4318 5.51343 13.2364C5.31808 13.0411 5.20833 12.7761 5.20833 12.4998ZM3.125 16.6665C3.125 
                    16.3902 3.23475 16.1253 3.4301 15.9299C3.62545 15.7346 3.8904 15.6248 4.16667 15.6248H16.6667C16.9429 15.6248 17.2079 15.7346 17.4032 15.9299C17.5986 
                    16.1253 17.7083 16.3902 17.7083 16.6665C17.7083 16.9428 17.5986 17.2077 17.4032 17.4031C17.2079 17.5984 16.9429 17.7082 16.6667 17.7082H4.16667C3.8904 
                    17.7082 3.62545 17.5984 3.4301 17.4031C3.23475 17.2077 3.125 16.9428 3.125 16.6665Z"/>
                    </svg>
                </span>
                <span class="ml-[4px]">Clear All Filters</span>
            </div>
        </div>
    </div>
    <div class="p-[16px] gap-y-[20px] overflow-y-auto">
        <p v-if="pageRecords" class="text-black font-medium text-base"><span class="text-black/60">Displaying </span> {{ pageRecords.from }} - {{ pageRecords.to }} <span class="text-black/60">of</span> {{ pageRecords.total }} <span class="text-black/60">items</span></p>
        <table class="min-w-full border-collapse rounded-[10px] overflow-hidden bg-off-white border-separate border-spacing-0">
            <thead>
                <tr class="h-[40px] bg-white text-black/60 font-medium text-base text-left">
                <th class="px-[24px] py-[8px] rounded-[10px] w-[200px]">Page Name</th>
                <th class="px-[24px] py-[8px] w-[460px]">Edit Modules</th>
                <th class="px-[24px] py-[8px] w-[100px]">Metadata</th>
                <th class="px-[24px] py-[8px] w-[60px]">Link</th>
                <th class="px-[24px] py-[8px] rounded-tr-[10px] w-[104px]">Last Edited</th>
                </tr>
            </thead>
            <tbody v-if="pageRecords && pageRecords.data.length" class="gap-y-[12px] mt-[12px]">
                <template v-for="(record, index) in pageRecords.data" :key="record.id">
                    <!-- Spacer row before each record -->
                    <tr class="h-3"> <!-- Adjust the height as needed -->
                        <td colspan="5"></td> <!-- Empty cell to occupy space -->
                    </tr>
                    <tr v-if="index === 0 || record.category !== pageRecords.data[index - 1].category" class="h-3">
                        <td colspan="5" class=" py-[8px] text-black font-semibold text-left">{{ record.category }}</td>
                    </tr>
                    <!-- Data row -->
                    <tr class="h-[40px] bg-white text-black font-normal text-base text-left font-light">
                        <td class="px-[24px] py-[8px] rounded-[10px]">
                        {{ record.name }}
                        </td>
                        <td class="px-[24px] py-[8px] gap-[8px] flex justify-start items-center flex-wrap w-[460px]">
                            <span
                                class="px-[12px] py-[4px] bg-ui-hover text-black text-base font-normal rounded-[10px] flex justify-center items-center gap-x-[4px] w-auto cursor-pointer"
                                v-for="module in record.page_sections" :key="module" @click="goToPage(record, module)">
                                <span class="w-[12px] h-[12.6px]">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 14 14" fill="none">
                                    <path d="M12.0032 1.0851L12.0032 1.08509C11.2922 0.338564 10.1358 0.338561 9.42478 1.08509L9.55096 1.20527L9.42478 1.08509L1.66647 9.23134C1.41323 9.49724 1.24149 9.8349 1.1717 10.2013L1.34344 10.234L1.1717 10.2013L0.849983 11.8903C0.675922 12.8041 1.44463 13.6381 2.34751 13.4485L3.95605 13.1107C4.30986 13.0364 4.63357 12.854 4.88689 12.588L12.6452 4.44179C13.3516 3.70009 13.3516 2.50092 12.6452 1.75921L12.0032 1.0851ZM11.6168 2.81432L11.6168 2.81434C11.7664 2.97145 11.7664 3.22955 11.6168 3.38667L11.6168 3.38668L10.2795 4.79084L9.10417 3.55674L10.4532 2.14022C10.4532 2.14021 10.4532 2.14021 10.4532 2.1402C10.5983 1.98791 10.8297 1.98792 10.9748 2.14022L11.6168 2.81432ZM2.31765 11.9235L2.59023 10.4925C2.6053 10.4134 2.64215 10.3418 2.6949 10.2864L2.56818 10.1658L2.6949 10.2864L8.08748 4.62422L9.26282 5.85833L3.85846 11.5329C3.80581 11.5882 3.73979 11.6248 3.66921 11.6397L3.6692 11.6397L2.31765 11.9235Z" fill="#2A2A2A" stroke="#2A2A2A" stroke-width="0.35"/>
                                    </svg>
                                </span>
                                {{ module.name }}
                            </span>
                        </td>
                        <!-- Metadata column -->
                        <td class="px-[24px] py-[8px] w-[100px]">
                        <router-link :to="`/pages/metadata/${record.id}`" class="w-[28px] h-[24px] bg-ui-hover text-ui-color p-[4px] flex justify-center items-center font-medium rounded-[5px]">{{'</>'}}</router-link>
                        </td>
                        <!-- Link column -->
                        <td class="px-[24px] py-[8px] w-[60px]">
                            <a :href="`https://uat.suntrust.com.ph/${record.slug === 'homepage' ? '' : record.slug}`" target="_blank" referrer="no-referrer" class="p-[4px] flex justify-start w-fit items-center bg-ui-hover rounded-[5px]">
                                <svg xmlns="http://www.w3.org/2000/svg" width="22" height="23" viewBox="0 0 22 23" fill="none">
                                <g clip-path="url(#clip0_4486_48528)">
                                    <path fill-rule="evenodd" clip-rule="evenodd" d="M18.9722 16.8824C17.6557 16.4445 16.2401 16.1173 14.7503 15.9055C14.9531 14.7141 15.0611 13.4656 15.0954 12.1875H20.5989C20.4758 13.9207 19.8935 15.5246 18.9722 16.8824ZM13.3609 20.8218C13.8188 19.7156 14.1934 18.5201 14.4815 17.2606C15.7176 17.4435 16.9029 17.7136 18.0256 18.0684C16.7853 19.3904 15.1752 20.3633 13.3609 20.8218ZM11.6676 21.0913C11.4462 21.1071 11.2255 21.125 11 21.125C10.7745 21.125 10.5545 21.1071 10.3324 21.0913C9.74738 19.8731 9.27369 18.5173 8.92307 17.0784C9.60644 17.0186 10.2987 16.9835 11 16.9835C11.7013 16.9835 12.3936 17.0186 13.0776 17.0784C12.7263 18.5173 12.2526 19.8731 11.6676 21.0913ZM3.97444 18.0684C5.09713 17.7136 6.28238 17.4435 7.5185 17.2606C7.80657 18.5201 8.18125 19.7156 8.63912 20.8218C6.82481 20.3633 5.21538 19.3904 3.97444 18.0684ZM3.02775 16.8824C2.1065 15.5246 1.52418 13.9207 1.40112 12.1875H6.90456C6.93894 13.4656 7.04687 14.7141 7.24969 15.9055C5.75987 16.1173 4.34432 16.4445 3.02775 16.8824ZM3.02775 6.11758C4.34432 6.55551 5.75987 6.88342 7.24969 7.09449C7.04687 8.28592 6.93894 9.53444 6.90456 10.8125H1.40112C1.52418 9.07931 2.1065 7.47539 3.02775 6.11758ZM8.63912 2.17817C8.18125 3.28436 7.80657 4.47992 7.5185 5.73942C6.28238 5.55723 5.09713 5.28636 3.97444 4.93161C5.21538 3.60955 6.82481 2.63674 8.63912 2.17817ZM10.3324 1.9087C10.5545 1.89357 10.7745 1.875 11 1.875C11.2255 1.875 11.4462 1.89357 11.6676 1.9087C12.2526 3.12695 12.7263 4.48337 13.0776 5.92162C12.3936 5.98143 11.7013 6.01649 11 6.01649C10.2987 6.01649 9.60644 5.98143 8.92307 5.92162C9.27369 4.48337 9.74738 3.12695 10.3324 1.9087ZM13.7184 12.1875C13.6812 13.3982 13.5712 14.5889 13.3643 15.7323C12.5902 15.6649 11.803 15.625 11 15.625C10.197 15.625 9.40981 15.6649 8.63637 15.7323C8.42875 14.5889 8.31875 13.3982 8.28231 12.1875H13.7184ZM8.28231 10.8125C8.31875 9.60181 8.42875 8.41106 8.63637 7.26775C9.40981 7.33512 10.197 7.375 11 7.375C11.803 7.375 12.5902 7.33512 13.3636 7.26775C13.5713 8.41106 13.6812 9.60181 13.7184 10.8125H8.28231ZM18.0256 4.93161C16.9029 5.28636 15.7176 5.55723 14.4815 5.73942C14.1934 4.47992 13.8188 3.28436 13.3609 2.17817C15.1752 2.63674 16.7853 3.60955 18.0256 4.93161ZM18.9722 6.11758C19.8935 7.47539 20.4758 9.07931 20.5989 10.8125H15.0954C15.0611 9.53444 14.9531 8.28592 14.7503 7.09449C16.2401 6.88342 17.6557 6.55551 18.9722 6.11758ZM11 0.5C4.92525 0.5 0 5.42456 0 11.5C0 17.5754 4.92525 22.5 11 22.5C17.0748 22.5 22 17.5754 22 11.5C22 5.42456 17.0748 0.5 11 0.5Z" fill="#00A651"/>
                                </g>
                                <defs>
                                    <clipPath id="clip0_4486_48528">
                                    <rect width="22" height="22" fill="white" transform="translate(0 0.5)"/>
                                    </clipPath>
                                </defs>
                                </svg>
                            </a>
                        </td>
                        <!-- Last Edited column -->
                        <td class="px-[24px] py-[8px] rounded-tr-[10px]">
                        {{ $moment(record.updated_at).format('MMM DD, YYYY') }}<br>
                        <span class="text-sm text-black"> <!-- Adjust styling as needed -->
                            {{ $moment(record.updated_at).format('hh:mm A') }}
                        </span>
                        </td>
                    </tr>
                </template>
            </tbody>
        </table>
    </div>
    
</template>

<script setup>  
import { usePageTitleStore } from '~/stores/pageTitle';
import { useFilterStore } from '~/stores/filters';
import { useSidebarStore } from '~/stores/sidebar';
import { ref, onMounted, watch } from 'vue';
import { useRouter } from 'vue-router';
import authenticator from '~/middleware/authenticator';
import { useAuthStore } from '~/stores/auth';

    const router = useRouter();



    definePageMeta({
        name: 'pages',
        middleware: 'authenticator'
    })

    const pageTitle = usePageTitleStore();
    const filter = useFilterStore();
    const sidebar = useSidebarStore();
    const authStore = useAuthStore();

    
    onMounted(() => {
        pageTitle.reset();
        pageTitle.setTitle('Pages');
        pageTitle.setBreadcrumbs(['Pages']);

        fetchRecords();
    });

    
    const keyword = ref('');

    const onSubmit = () => {
        fetchRecords();
    }

    watch(keyword, () => {
        console.log(keyword.value);
        fetchRecords();
    })


    const nuxtApp = useNuxtApp()
    const records = ref(null);
    const pageRecords = ref(null);

    const normalizeName = (name) => name.replace(/^Page\s/, '').trim();
    const permissions = computed(() => JSON.parse(authStore.user.role.permissions));

    const fetchRecords = async () => {
        try {
            const categories_response = await nuxtApp.$axios.get(`http://api.whc.local/api/v1/cms/page-categories`); // Add your endpoint
            const pages_response = await nuxtApp.$axios.get(`http://api.whc.local/api/v1/cms/pages?page=1&category=${filter.value}&keyword=${keyword.value}`);
            pageRecords.value = pages_response.data.records;
            records.value = categories_response.data.record
            .filter((name) => {
                const match = permissions.value.find((item) => normalizeName(item.name) === name.category);
                return !!match; // Keep only items where a match exists
            })
            .map((name) => name.category);
            // console.log(permissions.value);
            console.log(records.value);
            // records.value = categories_response.data.record.map((record) => record.category);
        } catch (error) {
            console.error('Error:', error);
        }
    };

    
    watch(() => filter.value, (newPage) => {
        if(filter.value !== '') {

            fetchRecords(); // Call the API whenever the page changes
        } else {
            window.location.reload();
        }
    });

    const goToPage = (page, module) => {
        console.log(router.options.routes);

        
        pageTitle.setTitle(`Edit ${module.name}`);
        pageTitle.setBreadcrumbs(['Pages', page.name, module.name]);
        sidebar.setActiveLink(page.name);

        pageTitle.setPageFrom('Pages');
        pageTitle.setPageFromRoute('/pages');

        router.push(`/pages/${page.slug}/${module.name.toLowerCase().replace(/ /g, '-')}/${module.id}`);
    }


</script>
