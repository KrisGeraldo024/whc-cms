<template>
    <div class="w-full h-auto flex items-center flex-col relative overflow-y-auto overflow-x-hidden px-[16px]">
        <div class="mt-[94px] bg-white w-full rounded-[10px] p-[24px] flex flex-col gap-y-[24px] h-auto">
            <h1 class="text-[32px] font-semibold text-black w-full text-center">What would you like to do today?</h1>
            <div class="grid grid-cols-3 gap-x-[16px]">
                <router-link v-for="tile in tileItems" :key="tile.name" :to="tile.link" v-show="isAuthorized(tile.unique)"
                class="group p-[20px] rounded-[10px] bg-white border border-[1px] border-gray flex justify-center items-center gap-x-[10px] hover:bg-ui-hover hover:border-ui-color transition">
                    <p class="text-[20px] font-semibold">{{ tile.name }}</p>
                    <span class="relative w-[40px] h-[40px]">
                        <svg xmlns="http://www.w3.org/2000/svg" width="41" height="40" viewBox="0 0 41 40" fill="none">
                            <circle cx="20.832" cy="20" r="19" stroke="#00A651" stroke-width="2"/>
                        </svg>
                        <span class="absolute top-1/2 left-1/2 -translate-x-1/2 -translate-y-1/2" v-html="tile.icon"></span>
                    </span>
                </router-link>
            </div>
            <!-- <div class="h-[0px] border border-gray"></div> -->
            <!-- <div class="text-center text-black text-2xl font-semibold text-start">CMS Guides and Resources</div>
            <div class="grid grid-cols-3 gap-x-[16px]"> -->
                <!-- <div v-for="resource in resources" :key="resource.name"  @click="downloadResource(resource.link)"  class="p-4 bg-white rounded-[20px] transition border-[1px] border-gray/50 hover:border-[2px] hover:border-[#CF1524] flex cursor-pointer justify-start items-start gap-2 inline-flex">
                    <div class="w-10 h-10 px-[13px] py-[15px] bg-[#ecf8e4] rounded-[80px] flex-col justify-center items-center gap-2.5 inline-flex">
                        <div class="w-5 h-5 relative">
                            <span class="w-5 h-5 absolute top-1/2 left-1/2 -translate-x-1/2 -translate-y-1/2" v-html="resource.icon"></span>
                        </div>
                    </div>
                    <div class="grow shrink basis-0 flex-col justify-start items-start gap-6 inline-flex">
                        <div class="self-stretch h-[62px] flex-col justify-start items-start gap-1 flex">
                            <div class="self-stretch text-black text-base font-medium leading-snug">{{resource.name}}</div>
                            <div class="self-stretch opacity-40 text-black text-xs font-normal leading-[18px]">{{resource.desc}}</div>
                        </div>
                        <div class="self-stretch justify-between items-center inline-flex">
                            <div class="flex-col justify-center items-start gap-0.5 inline-flex">
                                <div class="opacity-40 text-[#2a2a2a] text-xs font-normal leading-[18px]">{{resource.size}}</div>
                            </div>
                            <div class="w-8 h-8 p-[3px] bg-[#d9d9d9]/50 rounded-[80px] justify-center items-center gap-2.5 flex">
                                <div class="w-[13.33px] h-[13.78px] relative">
                                    <div class="transform left-1/2 top-1/2 -translate-x-1/2 -translate-y-1/2 absolute">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 16 16" fill="none">
                                        <path d="M1.33203 8.22217V13.4076C1.33203 13.8005 1.48812 14.1774 1.76597 14.4552C2.04381 14.7331 2.42065 14.8892 2.81359 14.8892H13.1845C13.5774 14.8892 13.9542 14.7331 14.2321 14.4552C14.5099 14.1774 14.666 13.8005 14.666 13.4076V8.22217" stroke="#2A2A2A" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
                                        <path d="M4.96094 8.22217L7.99812 11.1853L11.0353 8.22217" stroke="#2A2A2A" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
                                        <path d="M8 1.11084V9.62977" stroke="#2A2A2A" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
                                        </svg>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div> -->
            <!-- </div> -->
        </div>
        <div class="h-auto w-full mt-[32px] mb-[60px]">
            <div class="w-full h-auto p-[16px] justify-start items-center flex  gap-x-[16px]">
                <h1 class="font-semibold text-black text-[28px]">Access Logs</h1>
                <p class="font-normal text-black/40 text-base">(covers the past 30 days)</p>
            </div>
            <div class="p-[16px] gap-y-[20px]">
                <p v-if="records" class="text-black font-medium text-base"><span class="text-black/60">Displaying </span> {{ records.from }} - {{ records.to }} <span class="text-black/60">of</span> {{ records.total }} <span class="text-black/60">items</span></p>
                <table class="min-w-full border-collapse  rounded-[10px] overflow-hidden bg-off-white border-separate border-spacing-0">
                    <thead>
                        <tr class="h-[40px] bg-white text-black/60 font-medium text-base text-left">
                            <th class="px-[24px] py-[8px] rounded-[10px]">CMS Account</th>
                            <th class="px-[24px] py-[8px]">Action</th>
                            <th class="px-[24px] py-[8px]">CMS Page</th>
                            <th class="px-[24px] py-[8px]">Item</th>
                            <th class="px-[24px] py-[8px] rounded-tr-[10px]">Date & Time</th>
                        </tr>
                    </thead>
                    <tbody v-if="records && records.data.length" class="gap-y-[12px] mt-[12px]">
                        <template v-for="record in records.data" :key="record.id">
                            <!-- Spacer row before each record -->
                            <tr class="h-3"> <!-- Adjust the height as needed -->
                                <td colspan="5"></td> <!-- Empty cell to occupy space -->
                            </tr>
                            <!-- Data row -->
                            <tr class="h-[40px] bg-white text-black/60 font-normal text-base text-left font-light px-[24px] py-[8px]">
                                <td class="px-[24px] py-[8px] rounded-[10px]">
                                    {{ record.user.user_detail.full_name }}
                                </td>
                                <td class="px-[24px] py-[8px] flex gap-x-[8px] items-center" :class="getActionClass(record.action)">
                                    <span>
                                        <svg xmlns="http://www.w3.org/2000/svg" width="7" height="7" viewBox="0 0 7 7" :class="getActionClass(record.action)">
                                            <circle cx="3.5" cy="3.5" r="3.5" />
                                        </svg>
                                    </span>
                                    {{ record.action }}
                                </td>
                                <td class="px-[24px] py-[8px]">
                                    {{ record.page ? record.page : '--' }}
                                </td>
                                <td class="px-[24px] py-[8px]">
                                    {{ record.item_name ? record.item_name : '--' }}
                                </td>
                                <td class="px-[24px] py-[8px] rounded-tr-[10px]">
                                    {{ $moment(record.created_at).format('MMM DD, YYYY') }}<br>
                                    <span class="text-sm text-black"> <!-- Adjust styling as needed -->
                                        {{ $moment(record.created_at).format('hh:mm A') }}
                                    </span>
                                </td>
                            </tr>
                        </template>
                    </tbody>
                </table>
            </div>
        </div>
        <Pagination />
    </div>
</template>

<script setup>
import { ref, onMounted, watch } from 'vue';
import { usePaginationStore } from '~/stores/pagination';
import { useAuthStore } from '~/stores/auth';

    // You can use definePageMeta to define the middleware for this page
    definePageMeta({
        name: 'dashboard',
        middleware: 'authenticator'
    })

    const Pagination = defineAsyncComponent(() => {
        return import('@/components/Pagination.vue')
    })

    const pagination = usePaginationStore();
    const auth = useAuthStore();
    const permissions = computed(() => JSON.parse(auth.user.role.permissions));

    const isAuthorized = (page) => {
        // console.log(permissions.value.find((item) => item.unique === page));
        return permissions.value.find((item) => item.unique === page);
    }

    const nuxtApp = useNuxtApp()

    const records = ref(null);

    const fetchRecords = async () => {
        try {
            const response = await nuxtApp.$axios.get(`/cms/dashboard?page=${pagination.page}`); // Add your endpoint
            records.value = response.data.records;
            pagination.setTotalPages(records.value.last_page);
        } catch (error) {
            console.error('Error:', error);
        }
    };

    onMounted(() => {
        fetchRecords(); // Fetch records when the component mounts
    });

    // Watch for changes in pagination.page
    watch(() => pagination.page, (newPage) => {
        fetchRecords(); // Call the API whenever the page changes
    });

    const getActionClass = (action) => {
        switch (action) {
            case 'Created':
                return 'text-success fill-success'; // Green
            case 'Deleted':
                return 'text-danger fill-danger'; // Red
            case 'Changed':
                return 'text-warning fill-warning'; // Orange
            case 'Logout':
                return 'text-purple fill-purple'; // Purple
            default:
                return 'text-ui-color fill-ui-color'; // Default
        }
    };
    const tileItems = [
        {
            name: 'Edit Pages',
            unique: 'pages-all',
            icon: `<svg xmlns="http://www.w3.org/2000/svg" width="23" height="22" viewBox="0 0 23 22" fill="none" class="absolute top-1/2 left-1/2 -translate-x-1/2 -translate-y-1/2">
                        <path fill-rule="evenodd" clip-rule="evenodd" d="M13.6667 6.4165C13.1604 6.4165 12.75 6.82691 12.75 7.33317V14.6665C12.75 15.1728 13.1604 15.5832 13.6667 15.5832H17.3333C17.8396 15.5832 18.25 15.1728 18.25 14.6665V7.33317C18.25 6.82691 17.8396 6.4165 17.3333 6.4165H13.6667ZM16.4167 8.24984H14.5833V13.7498H16.4167V8.24984Z" fill="#00A651"/>
                        <path d="M6.33073 6.4165C5.82447 6.4165 5.41406 6.82691 5.41406 7.33317C5.41406 7.83943 5.82447 8.24984 6.33073 8.24984H9.9974C10.5037 8.24984 10.9141 7.83943 10.9141 7.33317C10.9141 6.82691 10.5037 6.4165 9.9974 6.4165H6.33073Z" fill="#00A651"/>
                        <path d="M6.33073 10.0835C5.82447 10.0835 5.41406 10.4939 5.41406 11.0002C5.41406 11.5064 5.82447 11.9168 6.33073 11.9168H9.9974C10.5037 11.9168 10.9141 11.5064 10.9141 11.0002C10.9141 10.4939 10.5037 10.0835 9.9974 10.0835H6.33073Z" fill="#00A651"/>
                        <path d="M5.41406 14.6667C5.41406 14.1604 5.82447 13.75 6.33073 13.75H9.9974C10.5037 13.75 10.9141 14.1604 10.9141 14.6667C10.9141 15.1729 10.5037 15.5833 9.9974 15.5833H6.33073C5.82447 15.5833 5.41406 15.1729 5.41406 14.6667Z" fill="#00A651"/>
                        <path fill-rule="evenodd" clip-rule="evenodd" d="M4.5 2.75C2.98122 2.75 1.75 3.98122 1.75 5.5V16.5C1.75 18.0188 2.98122 19.25 4.5 19.25H19.1667C20.6855 19.25 21.9167 18.0188 21.9167 16.5V5.5C21.9167 3.98122 20.6855 2.75 19.1667 2.75H4.5ZM19.1667 4.58333H4.5C3.99374 4.58333 3.58333 4.99374 3.58333 5.5V16.5C3.58333 17.0063 3.99374 17.4167 4.5 17.4167H19.1667C19.6729 17.4167 20.0833 17.0063 20.0833 16.5V5.5C20.0833 4.99374 19.6729 4.58333 19.1667 4.58333Z" fill="#00A651"/>
                    </svg>`,
            link: '/pages'
        },
        {
            name: 'Tiles Directory',
            unique: 'properties',
            icon: `<svg xmlns="http://www.w3.org/2000/svg" width="23" height="22" viewBox="0 0 23 22" fill="none" class="absolute top-1/2 left-1/2 -translate-x-1/2 -translate-y-1/2">
                        <path fill-rule="evenodd" clip-rule="evenodd" d="M13.6667 6.4165C13.1604 6.4165 12.75 6.82691 12.75 7.33317V14.6665C12.75 15.1728 13.1604 15.5832 13.6667 15.5832H17.3333C17.8396 15.5832 18.25 15.1728 18.25 14.6665V7.33317C18.25 6.82691 17.8396 6.4165 17.3333 6.4165H13.6667ZM16.4167 8.24984H14.5833V13.7498H16.4167V8.24984Z" fill="#00A651"/>
                        <path d="M6.33073 6.4165C5.82447 6.4165 5.41406 6.82691 5.41406 7.33317C5.41406 7.83943 5.82447 8.24984 6.33073 8.24984H9.9974C10.5037 8.24984 10.9141 7.83943 10.9141 7.33317C10.9141 6.82691 10.5037 6.4165 9.9974 6.4165H6.33073Z" fill="#00A651"/>
                        <path d="M6.33073 10.0835C5.82447 10.0835 5.41406 10.4939 5.41406 11.0002C5.41406 11.5064 5.82447 11.9168 6.33073 11.9168H9.9974C10.5037 11.9168 10.9141 11.5064 10.9141 11.0002C10.9141 10.4939 10.5037 10.0835 9.9974 10.0835H6.33073Z" fill="#00A651"/>
                        <path d="M5.41406 14.6667C5.41406 14.1604 5.82447 13.75 6.33073 13.75H9.9974C10.5037 13.75 10.9141 14.1604 10.9141 14.6667C10.9141 15.1729 10.5037 15.5833 9.9974 15.5833H6.33073C5.82447 15.5833 5.41406 15.1729 5.41406 14.6667Z" fill="#00A651"/>
                        <path fill-rule="evenodd" clip-rule="evenodd" d="M4.5 2.75C2.98122 2.75 1.75 3.98122 1.75 5.5V16.5C1.75 18.0188 2.98122 19.25 4.5 19.25H19.1667C20.6855 19.25 21.9167 18.0188 21.9167 16.5V5.5C21.9167 3.98122 20.6855 2.75 19.1667 2.75H4.5ZM19.1667 4.58333H4.5C3.99374 4.58333 3.58333 4.99374 3.58333 5.5V16.5C3.58333 17.0063 3.99374 17.4167 4.5 17.4167H19.1667C19.6729 17.4167 20.0833 17.0063 20.0833 16.5V5.5C20.0833 4.99374 19.6729 4.58333 19.1667 4.58333Z" fill="#00A651"/>
                    </svg>`,
            link: '/properties/house-and-lots'
        },
        {
            name: 'View Articles',
            unique: 'news-and-articles',
            icon: `<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" viewBox="0 0 25 25" fill="none" class="absolute top-1/2 left-1/2 -translate-x-1/2 -translate-y-1/2">
                        <g clip-path="url(#clip0_4336_820)">
                            <mask id="mask0_4336_820" style="mask-type:luminance" maskUnits="userSpaceOnUse" x="0" y="0" width="25" height="25">
                            <path d="M24.6641 0.5H0.664062V24.5H24.6641V0.5Z" fill="white"/>
                            </mask>
                            <g mask="url(#mask0_4336_820)">
                            <path d="M3.66406 4.5V18.5C3.66406 19.6046 4.55949 20.5 5.66406 20.5H17.6641H19.6641C20.7687 20.5 21.6641 19.6046 21.6641 18.5V8.5H17.6641" stroke="#00A651" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
                            <path d="M3.66406 4.5H17.6641V18.5C17.6641 19.6046 18.5595 20.5 19.6641 20.5" stroke="#00A651" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
                            <path d="M13.6641 8.5H7.66406" stroke="#00A651" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
                            <path d="M13.6641 12.5H9.66406" stroke="#00A651" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
                            </g>
                        </g>
                        <defs>
                            <clipPath id="clip0_4336_820">
                            <rect width="24" height="24" fill="white" transform="translate(0.664062 0.5)"/>
                            </clipPath>
                        </defs>
                    </svg>`,
            link: '/articles',
        }
    ]

    const resources = [
        {
            name: 'Suntrust CMS Manual.pdf',
            desc: 'CMS Manual for Suntrust’s new website.',
            size: '1.98 MB',
            link: '/cms_manual.pdf',
            icon: `<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 20 20" fill="none">
                <g clip-path="url(#clip0_4336_6100)">
                    <path fill-rule="evenodd" clip-rule="evenodd" d="M8.33333 0.833496C8.11232 0.833496 7.90036 0.921296 7.74407 1.07757L2.74408 6.07757C2.5878 6.23385 2.5 6.44581 2.5 6.66683V16.6668C2.5 18.0476 3.61929 19.1668 5 19.1668H5.83333C6.29357 19.1668 6.66667 18.7937 6.66667 18.3335C6.66667 17.8732 6.29357 17.5002 5.83333 17.5002H5C4.53977 17.5002 4.16667 17.1271 4.16667 16.6668V7.50016H8.33333C8.79358 7.50016 9.16667 7.12706 9.16667 6.66683V2.50016H15C15.4603 2.50016 15.8333 2.87326 15.8333 3.3335V9.16683C15.8333 9.62708 16.2064 10.0002 16.6667 10.0002C17.1269 10.0002 17.5 9.62708 17.5 9.16683V3.3335C17.5 1.95279 16.3808 0.833496 15 0.833496H8.33333ZM7.5 5.8335H5.34518L7.5 3.67867V5.8335ZM8.58983 19.6358C8.72142 19.7981 8.91267 19.9312 9.15383 19.9803C9.37967 20.0265 9.57692 19.9843 9.71358 19.9345C9.96508 19.8427 10.163 19.6697 10.2921 19.5423C10.4951 19.3422 10.7076 19.0708 10.9191 18.7642C11.8435 18.4453 13.1426 18.1518 14.4058 17.967C15.1081 17.8642 15.7638 17.8004 16.3158 17.7787C16.5344 18.0362 16.7333 18.258 16.899 18.4256C17.0027 18.5304 17.1179 18.6394 17.2307 18.7227C17.2815 18.7603 17.3766 18.8268 17.4992 18.8746C17.5629 18.8994 17.9818 19.0593 18.3687 18.7476C18.5963 18.5642 18.8071 18.3588 18.9537 18.1272C19.101 17.8946 19.2399 17.5394 19.1243 17.1356C19.0109 16.7402 18.7157 16.5186 18.4983 16.4042C18.2766 16.2875 18.0274 16.2225 17.7988 16.1824C17.5917 16.1461 17.3573 16.1233 17.1028 16.1122C16.5868 15.4681 15.9838 14.667 15.4108 13.85C14.9083 13.1335 14.4398 12.4202 14.0758 11.7991C14.1133 11.6388 14.1445 11.4848 14.1688 11.3385C14.2103 11.0878 14.2353 10.8368 14.2298 10.6011C14.2246 10.3749 14.1903 10.1026 14.0667 9.84825C13.9295 9.56641 13.68 9.30983 13.3068 9.20933C12.972 9.11916 12.6528 9.18675 12.4078 9.27733C12.0299 9.41716 11.8228 9.72733 11.7512 10.0302C11.6907 10.2866 11.7234 10.5341 11.7613 10.7109C11.8397 11.0764 12.0224 11.4965 12.2329 11.9079C12.2517 11.9445 12.2709 11.9816 12.2906 12.0189C12.0919 12.6728 11.7982 13.4442 11.4493 14.2417C10.938 15.4109 10.3379 16.5698 9.82108 17.3985C9.46825 17.5463 9.14267 17.7155 8.8955 17.9098C8.72717 18.0422 8.50158 18.2577 8.39367 18.5725C8.261 18.9597 8.35508 19.3463 8.58983 19.6358ZM14.1645 16.3178C13.4863 16.4171 12.7871 16.5473 12.1248 16.6995C12.4201 16.1271 12.7108 15.5169 12.9763 14.9097C13.1272 14.5647 13.2724 14.2152 13.4071 13.8694C13.6133 14.1814 13.8285 14.4965 14.0463 14.8069C14.3818 15.2852 14.7278 15.7593 15.0632 16.2032C14.7655 16.2353 14.4639 16.2741 14.1645 16.3178ZM13.3841 10.3203C13.384 10.3192 13.3839 10.3187 13.3838 10.3187C13.3838 10.3187 13.3839 10.32 13.3842 10.3228C13.3842 10.3218 13.3841 10.321 13.3841 10.3203Z" fill="#8924EE"/>
                </g>
                <defs>
                    <clipPath id="clip0_4336_6100">
                    <rect width="20" height="20" fill="white"/>
                    </clipPath>
                </defs>
                </svg>`
        },
        // {
        //     name: 'Suntrust Import Template.xls',
        //     desc: 'Import template for importing Suntrust’s old website content',
        //     size: '1.5 MB',
        //     link: '',
        //     icon: `<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 20 20" fill="none">
        //         <path fill-rule="evenodd" clip-rule="evenodd" d="M7.74407 1.07757C7.90036 0.921296 8.11232 0.833496 8.33333 0.833496H15C16.3807 0.833496 17.5 1.95279 17.5 3.3335V7.50016C17.5 7.9604 17.1269 8.3335 16.6667 8.3335C16.2064 8.3335 15.8333 7.9604 15.8333 7.50016V3.3335C15.8333 2.87326 15.4602 2.50016 15 2.50016H9.16667V6.66683C9.16667 7.12706 8.79358 7.50016 8.33333 7.50016H4.16667V16.6668C4.16667 17.1271 4.53977 17.5002 5 17.5002H5.83333C6.29357 17.5002 6.66667 17.8732 6.66667 18.3335C6.66667 18.7937 6.29357 19.1668 5.83333 19.1668H5C3.61929 19.1668 2.5 18.0476 2.5 16.6668V6.66683C2.5 6.44581 2.5878 6.23385 2.74408 6.07757L7.74407 1.07757ZM5.34517 5.8335H7.5V3.67867L5.34517 5.8335ZM15.8333 10.0002C16.2936 10.0002 16.6667 10.3732 16.6667 10.8335V15.8335H19.1667C19.6269 15.8335 20 16.2066 20 16.6668C20 17.1271 19.6269 17.5002 19.1667 17.5002H15.8333C15.3731 17.5002 15 17.1271 15 16.6668V10.8335C15 10.3732 15.3731 10.0002 15.8333 10.0002ZM9.84475 10.3492C9.57725 9.97458 9.05683 9.88791 8.68233 10.1554C8.30779 10.4229 8.22105 10.9433 8.48858 11.3178L10.2259 13.7502L8.48858 16.1825C8.22105 16.557 8.30779 17.0774 8.68233 17.3449C9.05683 17.6124 9.57725 17.5257 9.84475 17.1512L11.25 15.1839L12.6552 17.1512C12.9227 17.5257 13.4432 17.6124 13.8177 17.3449C14.1922 17.0774 14.2789 16.557 14.0114 16.1825L12.2741 13.7502L14.0114 11.3178C14.2789 10.9433 14.1922 10.4229 13.8177 10.1554C13.4432 9.88791 12.9227 9.97458 12.6552 10.3492L11.25 12.3164L9.84475 10.3492Z" fill="#68A816"/>
        //         </svg>`
        // },
    ]

    const downloadResource = (link) => {
        window.open(link, '_blank')
    }
</script>
