<template>
    <div class="grid grid-cols-2 gap-[16px]">
        <div class="flex flex-col gap-[8px]">
            <!-- <label class="text-base font-medium text-black/70">Button Label <span class="text-sm font-normal text-black/40">{{ `Maximum 20 characters` }}</span></label> -->
            <TextField
            v-model="button.button_name" :name="`${name}_name[${index}]`" :label="`Button Label`" placeholder="Enter button label"
                        :rules="'required|max:50'"
                        /> 
            <!-- <input type="text" v-model="button.button_name" :name="`${name}_name[]`" -->
            <!-- class="p-[16px] border-[1px] border-gray rounded-[10px] text-base font-normal placeholder:text-black/40 focus:border-ui-color  bg-white outline-none" placeholder="Enter button label"/> -->
        </div>
        <div class="flex flex-col" v-show="showLink">
            <div class="flex justify-between items-center">
                <label class="text-base font-medium text-black/70">Button Link <span class="text-sm font-normal text-black/40">{{ `Maximum 20 characters` }}</span></label>
                <div class="flex flex-col gap-[8px]">
                    <div class="pr-[16px] justify-start gap-[8px] flex text-black/70">
                        Link out
                        <div @click="showLink ? button.is_link_out = true : setLinkOut()" class="cursor-pointer w-[40px] h-[24px] rounded-[12px] flex  items-center hover:border hover:border-black p-[3px]" :class="{'bg-ui-color justify-end' : button.is_link_out, 'bg-light-gray justify-start' : !button.is_link_out}">
                            <div class="w-[20px] h-[20px] bg-white rounded-full"></div>
                        </div>
                        <!-- {{ button.is_link_out ? 'Yes' : 'No' }} -->
                    </div>
                    <!-- <h3 class="font-normal text-base text-gray">Link out</h3> -->
                </div>
            </div>
            <TextField v-model="button.link" :name="`${name}_link[${index}]`" label="" placeholder="Enter button link"/> 
            <!-- <input type="text" v-model="button.link" :name="`${name}_link[]`"
            class="p-[16px] border-[1px] border-gray rounded-[10px] text-base font-normal placeholder:text-black/40 focus:border-ui-color  bg-white outline-none" placeholder="https://"/> -->
        </div>
        <input type="text" v-model="button.id" @input="updateValue('id', $event.target.value)" :name="`${name}_id[${index}]`" hidden>
        <input type="text" v-model="button.is_link_out"  :name="`${name}_link_out[${index}]`" hidden>
    </div>
</template>

<script setup>
    const props = defineProps({
        name: String,
        button: Object,
        showLink: {
            type: Boolean,
            default: true
        },
        index: {
            type: Number,
            default: 0
        }
    });

    const setLinkOut = () => {
        props.button.is_link_out = Number(props.button.is_link_out) ? 0 : 1
    }

</script>
