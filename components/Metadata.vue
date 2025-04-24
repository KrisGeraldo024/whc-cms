<template>
    <div class="relative bg-white p-[16px] flex flex-col gap-[16px] rounded-[10px] w-full">
        <h2 class="font-semibold text-xl text-start w-full">Metadata <span class="text-base font-normal text-black/40">Optional</span></h2>
        <TextField
            v-model="props.meta_title"
            name="meta_title"
            label="Meta Title"
            max="50"
            :rules="'max:50'"
            placeholder="Enter meta title"
            optionalMessage="Max 50 characters" />
        <div class="flex flex-col gap-[8px] relative">
            <label for="description" class="text-base font-medium text-black/70">Meta Descrption <span class="text-sm font-normal text-black/40">{{ `Maximum 400 characters` }}</span></label>
            <textarea
            id="description"
            v-model="description"
            name="meta_description"
            rows="5"
            cols="40"
            placeholder="Enter your description here..."
            class="outline-none border-[1px] border-gray rounded-[10px] p-[16px] text-base font-normal placeholder:text-black/40 focus:border-ui-color bg-white"
            > </textarea>
            <div class="absolute bottom-[32px] right-[32px] text-black/40 text-sm">
                <span>{{ description.length }} / {{ maxCharacters }}</span>
            </div>
        </div>
        <TextField
            v-model="props.link_rel"
            name="link_rel"
            label="Link Rel"
            :rules="'max:50'"
            placeholder="Enter link rel"
            optionalMessage="Max 50 characters" />
    </div>
</template>

<script setup>
    const props = defineProps({
        meta_title: {
            type: String,
            default: ''
        },
        meta_description: {
            type: String,
            default: ''
        },
        link_rel: {
            type: String,
            default: 'Canonical'
        }
    })

    onMounted(() => {
        if (props.meta_description) {
            description.value = props.meta_description
        }
    })
    const maxCharacters = 400;

    const description = ref('');
    // Watcher to ensure character limit is enforced
    watch(description, (newValue) => {
        if (newValue.length > maxCharacters) {
            description.value = newValue.slice(0, maxCharacters);
        } else {
            description.value = newValue;
        }
    });
</script>