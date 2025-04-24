<template> 
    <div class="flex justify-start items-center">
        <!-- <div class="w-full flex flex-col justify-center items-start gap-[8px] px-[16px]">
            <h2 class="font-normal text-base text-black/70">Date Created</h2>
            <div class="flex justify-start items-center gap-[8px]">
                <img :src="log.user?.images?.length ? log.user.images.path : '/avatar.png'" class="w-[40px] h-[40px] rounded-full" alt="avatar"/>
                <div class="flex flex-col gap-[4px]">
                    <h2 class="font-medium text-base text-black">{{ $moment(log.created_at).format('MMM DD, YYYY') }} /  {{ $moment(log.created_at).format('hh:mm A') }}</h2>
                    <h2 class="font-normal text-sm text-black"><span class="text-black/40">by </span>{{ log.user.user_detail.full_name }}</h2>
                </div>
            </div>
        </div> -->
        <div class="w-full flex flex-col justify-center items-start gap-[8px] px-[16px]">
            <h2 class="font-normal text-base text-black/70">Last Edited</h2>
            <div class="flex justify-start items-center gap-[8px]">
                <img :src="log.user?.images?.length > 0 ? log.user.images[0].path : '/avatar.png'" class="w-[40px] h-[40px] rounded-full" alt="avatar"/>
                <div class="flex flex-col gap-[4px]">
                    <h2 class="font-medium text-base text-black">{{ $moment(log.updated_at).format('MMM DD, YYYY') }} /  {{ $moment(log.updated_at).format('hh:mm A') }}</h2>
                    <h2 class="font-normal text-sm text-black"><span class="text-black/40">by </span>{{ log.user.user_detail.full_name }}</h2>
                </div>
            </div>
        </div>
    </div>
</template>

<script setup>
    const props = defineProps({
        log: Object
    })
</script>