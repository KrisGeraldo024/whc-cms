<template>
    <div class="w-full flex flex-col justify-center items-start gap-[8px] px-[16px]">
        <h2 class="font-normal text-base text-black/70">Module ID <span class="text-sm font-normal text-black/40">This is auto-generated upon publishing</span></h2>
        <div class="flex justify-start items-center gap-[8px] px-[16px] py-[8px] bg-[#F6FAFF] rounded-[10px] text-black/70 w-full">
            {{ id }}
        </div>
    </div>
</template>

<script setup>
    const props = defineProps({
        id: String
    })
</script>