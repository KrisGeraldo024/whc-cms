<template>
    <div class="flex p-[16px] justify-between items-center bg-[#EAF5FF]">
        <div class="flex flex-col gap-[10.5px]">
            <div class="gap-[8px] flex text-ui-color font-semibold text-sm tracking-[2.24px]">
                <span class="w-[22px] h-[22px]">
                    <svg xmlns="http://www.w3.org/2000/svg" width="22" height="22" viewBox="0 0 22 22" fill="none">
                    <path d="M11 2.75L12.8661 7.4814C13.0383 7.91816 13.1244 8.13653 13.2563 8.32067C13.3732 8.4839 13.5161 8.62681 13.6793 8.74371C13.8635 8.87558 14.0818 8.96171 14.5186 9.13396L19.25 11L14.5186 12.8661C14.0818 13.0383 13.8635 13.1244 13.6793 13.2563C13.5161 13.3732 13.3732 13.5161 13.2563 13.6793C13.1244 13.8635 13.0383 14.0818 12.8661 14.5186L11 19.25L9.13396 14.5186C8.96171 14.0818 8.87558 13.8635 8.74371 13.6793C8.62681 13.5161 8.4839 13.3732 8.32067 13.2563C8.13653 13.1244 7.91816 13.0383 7.4814 12.8661L2.75 11L7.4814 9.13396C7.91816 8.96171 8.13653 8.87558 8.32067 8.74371C8.4839 8.62681 8.62681 8.4839 8.74371 8.32067C8.87558 8.13653 8.96171 7.91816 9.13396 7.4814L11 2.75Z" stroke="#00A651" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
                    </svg>
                </span>
                {{ `HOW TO ADD ${title.toLocaleUpperCase()}` }}
            </div>
            <p class="text-black font-normal text-sm">
                {{`To add new  ${title}, please add them on the ${title} module by clicking on the button:`}}
            </p>
        </div>
        <router-link :to="link" class="px-[24px] py-[12px] bg-ui-color text-white text-center rounded-[10px] self-end">{{ `Add ${title}` }}</router-link>
    </div>
</template>
<script setup>
const props = defineProps({
    title: String,
    link: String     
})

</script>