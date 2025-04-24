<template>
    <div class="flex flex-col gap-[8px] w-full">
      <label class="text-base font-medium text-black/70">{{ label }} <span v-if="max" class="text-sm font-normal text-black/40">{{ `Maximum ${max} characters` }}</span></label>
      <input type="text" :name="name" v-model="localValue" @input="updateValue($event.target.value)" 
        class="p-[16px] border-[1px] border-gray rounded-[10px] text-base font-normal placeholder:text-black/40 focus:border-ui-color  bg-white outline-none" :placeholder="placeholder"/>
    </div>
</template>
<script setup>
    const props = defineProps({
        modelValue: String,
        label: String,
        max: String,
        placeholder: String,
        name: String
    });
    const emit = defineEmits(['update:modelValue']);

    const localValue = ref(props.modelValue);

    watch(() => props.modelValue, (newVal) => {
    localValue.value = newVal;
    });

    const updateValue = (value) => {
        emit('update:modelValue', value);
    };
</script>