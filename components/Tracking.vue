<template>
    <div class="relative bg-white p-[16px] flex flex-col gap-[16px] rounded-[10px] w-full">
        <h2 class="font-semibold text-xl text-start w-full">Tracking  <span class="text-sm font-normal text-black/40">For tracking of this product on Google Analytics</span></h2>
        <div class="w-full">
            <TextField
            v-model="props.tracking_code"
            name="tracking_code"
            placeholder=""
            label="UTM Tracking Code"
            :rules="''"
            optionalMessage="Optional" />
        </div>
    </div>
</template>

<script setup>  
    const props = defineProps({
        tracking_code: {
            type: String,
            default: ''
        }
    })
</script>