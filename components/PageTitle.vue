<template>
    <router-link v-if="pageTitle.pageFrom" :to="pageTitle.pageFromRoute" class="relative w-full bg-white h-auto p-[16px] mt-[64px] flex justify-start items-center text-base text-ui-color font-medium">
        <span class="w-[32px] h-[32px]">
            <svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" viewBox="0 0 32 32" fill="none">
            <path d="M6.66797 16H25.3346M6.66797 16L14.668 8M6.66797 16L14.668 24" stroke="#00A651" stroke-width="3" stroke-linecap="round" stroke-linejoin="round"/>
            </svg>
        </span>
        {{`Back to ${pageTitle.pageFrom}`}}
    </router-link>
    <div class="relative flex justify-start items-center border-y-[1px] border-gray px-[16px] bg-white w-full h-fit" :class="{'mt-[108px]' : pageTitle.pageFrom === ''}">
        <div class="min-w-[239px] max-w-[480px] border-r-[1px] border-gray flex items-center font-semibold text-[30px] p-[16px]">{{ pageTitle.title }}</div>
        <div class="flex justify-start items-center gap-x-[8px] p-[16px] w-auto">
            <ul class="text-base font-normal text-black/40 w-full flex gap-[8px]">
                <li v-for="(crumb, index) in pageTitle.breadcrumbs" :key="index">
                    <!-- If it's not the last breadcrumb, display as normal -->
                    <span v-if="index !== pageTitle.breadcrumbs.length - 1">
                    {{ crumb }} <span class="text-black/100">/</span>
                    </span>
                    <!-- If it's the last breadcrumb, apply highlight class -->
                    <span v-else class="text-ui-color/100 font-medium">
                    {{ crumb }}
                    </span>
                </li>
            </ul>
        </div>
    </div>
</template>
<script setup>
    import { usePageTitleStore } from '~/stores/pageTitle';
    import { useRoute } from 'vue-router';

    const pageTitle = usePageTitleStore();
    const route = useRoute();

    // watch(() => route.path, (newValue, oldValue) => {
    //     const formattedTitle = ref('');
    //     const pathSegments = oldValue.split('/');
    //     console.log(pathSegments[1]);
    //     formattedTitle.value = pathSegments[pathSegments.length - 1]
    //         .replace(/-/g, ' ') // Replace dashes with spaces
    //         .replace(/\b\w/g, char => char.toUpperCase()); 
    //     pageTitle.setPageFrom(formattedTitle.value);
    //     pageTitle.setPageFromRoute(oldValue);
    // })
</script>