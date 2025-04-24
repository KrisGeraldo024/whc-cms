<template>
    <div class="h-full bg-white border border-[1px] border-gray relative z-20" :class="{'min-w-[260px] w-auto' : isSidebarToggled, 'w-[72px]' : !isSidebarToggled}">
        <div class="w-full h-16 border-b-[1px] border-gray px-[24px] flex items-center">
            <!-- <img src="/suntrust_logo.png" alt="db_logo" class="w-[159px] h-[27px]" :class="{'object-contain' : isSidebarToggled, 'object-cover object-left' : !isSidebarToggled}"> -->
        </div>
        <div class="w-full h-[calc(100vh-64px)] overflow-auto px-[16px] py-[8px]" @mouseover="handleMouseOver()" @mouseleave="handleMouseLeave()">
            <div v-for="(item, index) in sidebar.links" :key="item" class="h-auto" 
            :class="{'min-h-[46px]' : item.unique !== 'dashboard' &&  (permissions.find(perm => perm.unique === item.unique) && item.unique !== 'pages'), 
            'min-h-[0px]' : !(item.unique !== 'dashboard' &&  (permissions.find(perm => perm.unique === item.unique) && item.unique !== 'pages'))}">
                <div v-if=" item.unique !== 'dashboard' &&  (permissions.find(perm => perm.unique === item.unique) && item.unique !== 'pages')" @click="toggle(item, index)" class="w-full h-full p-[8px] hover:rounded-[10px] hover:bg-ui-hover cursor-pointer group flex justify-between" :class="{'bg-ui-hover rounded-[10px]' : isActiveLink(item.name)}">
                    <div class="flex justify-start items-center gap-x-[8px]">
                        <span class="fill-black group-hover:fill-ui-color transition" v-html="item.icon"></span>
                        <h1 v-show="isSidebarToggled" class="text-base font-[500] text-black group-hover:font-semibold transition" :class="{'font-semibold' : isActiveLink(item.name)}">{{ item.name }}</h1>
                    </div>
                    <span v-show="isSidebarToggled" v-if="item.subs">
                        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 20 20" fill="none" class="transition" :class="{'rotate-180' : openedItems[index], 'rotate-0' : !openedItems[index]}">
                            <path fill-rule="evenodd" clip-rule="evenodd" d="M9.66688 13.0522C9.84994 13.2352 10.1467 13.2352 10.3298 13.0522L15.1088 8.27312C15.2919 8.09006 15.2919 7.79331 15.1088 7.61025L14.8878 7.38925C14.7048 7.20619 14.408 7.20619 14.2249 7.38925L9.99831 11.6159L5.77169 7.38925C5.58863 7.20619 5.29188 7.20619 5.10881 7.38925L4.88781 7.61025C4.70475 7.79331 4.70475 8.09006 4.88781 8.27312L9.66688 13.0522Z" fill="#2A2A2A" />
                        </svg>
                    </span>
                </div>
                <div v-else-if="item.unique === 'pages' || item.unique === 'dashboard'" @click="toggle(item, index)" class="w-full h-full p-[8px] hover:rounded-[10px] hover:bg-ui-hover cursor-pointer group flex justify-between" :class="{'bg-ui-hover rounded-[10px]' : isActiveLink(item.name)}">
                    <div class="flex justify-start items-center gap-x-[8px]">
                        <span class="fill-black group-hover:fill-ui-color transition" v-html="item.icon"></span>
                        <h1 v-show="isSidebarToggled" class="text-base font-[500] text-black group-hover:font-semibold transition" :class="{'font-semibold' : isActiveLink(item.name)}">{{ item.name }}</h1>
                    </div>
                    <span v-show="isSidebarToggled" v-if="item.subs">
                        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 20 20" fill="none" class="transition" :class="{'rotate-180' : openedItems[index], 'rotate-0' : !openedItems[index]}">
                            <path fill-rule="evenodd" clip-rule="evenodd" d="M9.66688 13.0522C9.84994 13.2352 10.1467 13.2352 10.3298 13.0522L15.1088 8.27312C15.2919 8.09006 15.2919 7.79331 15.1088 7.61025L14.8878 7.38925C14.7048 7.20619 14.408 7.20619 14.2249 7.38925L9.99831 11.6159L5.77169 7.38925C5.58863 7.20619 5.29188 7.20619 5.10881 7.38925L4.88781 7.61025C4.70475 7.79331 4.70475 8.09006 4.88781 8.27312L9.66688 13.0522Z" fill="#2A2A2A" />
                        </svg>
                    </span>
                </div>
                <div v-show="isSidebarToggled" v-if="item.subs && openedItems[index]" class="w-full h-auto py-[6px]">
                    <div v-for="(sub, subIndex) in item.subs" :key="sub" class="w-full">
                        <div v-if="permissions.find(item => item.unique === sub.unique) && item.unique === 'pages'" class="w-full h-full p-[8px] pl-[48px] hover:rounded-[10px] hover:bg-ui-hover cursor-pointer group flex justify-between" :class="{'bg-ui-hover rounded-[10px]' : isActiveLink(sub.name)}">
                            <div @click="toggleSub(sub, index, subIndex)" class="flex justify-start items-center gap-x-[8px] w-full">
                                <h1 class="text-sm font-[500] group-hover:font-semibold transition" :class="{'font-semibold text-ui-color' : isActiveLink(sub.name), 'text-black' : !isActiveLink(sub.name)}">{{ sub.name }}</h1>
                                <span v-if="sub.subs" class="ml-auto">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 20 20" fill="none" class="transition" :class="{'rotate-180' : openedSubItems[`${index}-${subIndex}`], 'rotate-0' : !openedSubItems[`${index}-${subIndex}`]}">
                                        <path fill-rule="evenodd" clip-rule="evenodd" d="M9.66688 13.0522C9.84994 13.2352 10.1467 13.2352 10.3298 13.0522L15.1088 8.27312C15.2919 8.09006 15.2919 7.79331 15.1088 7.61025L14.8878 7.38925C14.7048 7.20619 14.408 7.20619 14.2249 7.38925L9.99831 11.6159L5.77169 7.38925C5.58863 7.20619 5.29188 7.20619 5.10881 7.38925L4.88781 7.61025C4.70475 7.79331 4.70475 8.09006 4.88781 8.27312L9.66688 13.0522Z" fill="#2A2A2A" />
                                    </svg>
                                </span>
                            </div>
                        </div>
                        <div v-if="item.unique !== 'pages'" class="w-full h-full p-[8px] pl-[48px] hover:rounded-[10px] hover:bg-ui-hover cursor-pointer group flex justify-between" :class="{'bg-ui-hover rounded-[10px]' : isActiveLink(sub.name)}">
                            <div @click="toggleSub(sub, index, subIndex)" class="flex justify-start items-center gap-x-[8px] w-full">
                                <h1 class="text-sm font-[500] group-hover:font-semibold transition" :class="{'font-semibold text-ui-color' : isActiveLink(sub.name), 'text-black' : !isActiveLink(sub.name)}">{{ sub.name }}</h1>
                                <span v-if="sub.subs" class="ml-auto">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 20 20" fill="none" class="transition" :class="{'rotate-180' : openedSubItems[`${index}-${subIndex}`], 'rotate-0' : !openedSubItems[`${index}-${subIndex}`]}">
                                        <path fill-rule="evenodd" clip-rule="evenodd" d="M9.66688 13.0522C9.84994 13.2352 10.1467 13.2352 10.3298 13.0522L15.1088 8.27312C15.2919 8.09006 15.2919 7.79331 15.1088 7.61025L14.8878 7.38925C14.7048 7.20619 14.408 7.20619 14.2249 7.38925L9.99831 11.6159L5.77169 7.38925C5.58863 7.20619 5.29188 7.20619 5.10881 7.38925L4.88781 7.61025C4.70475 7.79331 4.70475 8.09006 4.88781 8.27312L9.66688 13.0522Z" fill="#2A2A2A" />
                                    </svg>
                                </span>
                            </div>
                        </div>
                        <div v-if="sub.subs && openedSubItems[`${index}-${subIndex}`]" class="pl-[64px]">
                            <div v-for="item in sub.subs" :key="item.name" @click="toggleSub(item, index, subIndex)" class="p-[8px] hover:rounded-[10px] hover:bg-ui-hover cursor-pointer">
                                <span class="text-sm font-[500] text-black">{{ item.name }}</span>
                            </div>
                        </div>
                    </div>
                </div>
                <div v-if=" item.unique !== 'dashboard' &&  (permissions.find(perm => perm.unique === item.unique) && item.unique !== 'pages')" class="h-[0.5px] opacity-20 border-[0.5px] border-black my-[12px]"></div>
                <div v-if=" item.unique == 'dashboard' || item.unique === 'pages'" class="h-[0.5px] opacity-20 border-[0.5px] border-black my-[12px]"></div>
            </div>
        </div>
        <div @click="toggleSidebar()" class="absolute right-[-16px] top-1/2 transform -translate-y-1/2 w-[33px] h-[33px] z-30">
            <svg xmlns="http://www.w3.org/2000/svg" width="33" height="33" viewBox="0 0 33 33" fill="none" class="cursor-pointer" :class="{'rotate-180' : !isSidebarToggled, 'rotate-0' : isSidebarToggled}">
                <circle cx="16.5" cy="16.5" r="16.5" fill="#F8D50F"/>
                <path fill-rule="evenodd" clip-rule="evenodd" d="M11.2312 17.5684C10.9229 17.2544 10.9229 16.7455 11.2312 16.4316L19.2801 8.23546C19.5885 7.92151 20.0882 7.92151 20.3966 8.23546L20.7688 8.61443C21.0771 8.92837 21.0771 9.43738 20.7688 9.75133L13.6503 17L20.7688 24.2487C21.0771 24.5626 21.0771 25.0716 20.7688 25.3855L20.3966 25.7645C20.0882 26.0785 19.5885 26.0785 19.2801 25.7645L11.2312 17.5684Z" fill="#FCFCFC"/>
            </svg>
        </div>
    </div>
</template>

<script setup>
import { ref } from 'vue';
import { useRoute } from 'vue-router';
import { useSidebarStore } from '~/stores/sidebar';
import { useFilterStore } from '~/stores/filters';
import { useAuthStore } from '~/stores/auth';

const route = useRoute();
const sidebar = useSidebarStore();
const filter = useFilterStore();
const authStore = useAuthStore();

const permissions = computed(() => JSON.parse(authStore.user.role.permissions));

const isSidebarToggled = ref(true);
const isHovered = ref(false);
const openedItems = ref({});
const openedSubItems = ref({});

const isActiveLink = (name) => {
    return sidebar.activeLink === name;
};

const toggle = (item, index) => {
    if (!item.subs) {
        navigateTo(item.slug);
        sidebar.setActiveLink(item.name);
    } else {
        openedItems.value[index] = !openedItems.value[index];
        sidebar.setActiveLink(item.name);
    }
};

const toggleSub = (sub, parentIndex, subIndex) => {
    if (sub.subs) {
        const key = `${parentIndex}-${subIndex}`;
        openedSubItems.value[key] = !openedSubItems.value[key];
    } else {
        navigateTo(sub.slug);
        if (sub.slug === '/pages') {
            filter.setName('Category');
            filter.setValue(sub.name !== 'All Pages' ? sub.name : '');
        }
        sidebar.setActiveLink(sub.name);
    }
};

const handleButtonClick = (button) => {
    if (button.isButton) {
        console.log('Button clicked:', button.name);
        // Handle taxonomy button click
    }
};

const handleMouseOver = () => {
    if (!isSidebarToggled.value && !isHovered.value) {
        isSidebarToggled.value = true;
        isHovered.value = true;
    }
};

const handleMouseLeave = () => {
    if (isSidebarToggled.value && isHovered.value) {
        isSidebarToggled.value = false;
        isHovered.value = false;
    }
};

const toggleSidebar = () => {
    isSidebarToggled.value = !isSidebarToggled.value;
};

onMounted(() => {
    const currentPath = route.path.replace(/^\//, '');
    const pathSegments = route.path.split('/');
    const secondLastSegment = pathSegments.length > 3 ? pathSegments[pathSegments.length - 3] : (currentPath === 'pages' ? 'All Pages' : currentPath);

    sidebar.links.forEach((item, index) => {
        if (item.name === secondLastSegment.replace(/\b\w/g, char => char.toUpperCase())) {
            sidebar.setActiveLink(item.name);
        }

        if (item.subs) {
            item.subs.forEach((sub) => {
                if (sub.name === secondLastSegment.replace(/\b\w/g, char => char.toUpperCase())) {
                    sidebar.setActiveLink(sub.name);
                    openedItems.value[index] = true;
                }
            });
        }
    });
});
</script>