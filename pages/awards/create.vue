<template>
    <div class="relative w-full p-[16px] bg-offwhite flex flex-col gap-[16px] overflow-y-auto mb-[32px]">
        <Form id="form" @submit="submit()" class="w-full gap-[16px] flex flex-col">
            <div class="bg-white p-[16px] flex flex-col gap-[16px] rounded-[10px] w-full">
                <h2 class="font-semibold text-xl text-start w-full">Award Information</h2>
                <div class="grid grid-cols-1 gap-[16px]">
                    <TextField
                    label="Award Name"
                    name="name"
                    placeholder="e.g. Award ABC"
                    :rules="'required|max:100'"
                    optionalMessage="Max 100 characters" />
                </div>
                <div class="grid grid-cols-4 gap-[16px]">
                    <TextField class="col-span-3"
                    label="Awarding Body"
                    name="awarding_body"
                    placeholder="e.g. Awarding Body ABC"
                    :rules="'required|max:100'"
                    optionalMessage="Max 100 characters" />

                    <DateField class="col-span-1"
                    label="Awarding Date"
                    name="date"
                    placeholder="MM / DD / YY"
                    rules="required"/>
                </div>

                <hr class="h-[1px] w-full border-gray">
                <ImageHandler 
                    label="Award Image"
                    max="1"
                    size="5"
                    :dimension="{width: 125, height: 90}"
                    :input_payload="{
                        identifier: 'main_image',
                        id: 'main_image_id',
                        category: 'main_image_category',
                        category_value: 'main_image',
                        alt: 'main_image_alt',
                    }"
                    @update:file="handleFileUpdate(`main_image`, $event)"
                />
            </div>
    
            <div class="flex self-end gap-[16px]">
    
                <!-- <button type="button" @click="submit(0)" class="px-[24px] py-[12px] bg-white border border-ui-color text-ui-color text-center rounded-[10px]">Save for Later</button> -->
                <button type="submit" class="px-[24px] py-[12px] bg-ui-color text-white text-center rounded-[10px]">Save Changes</button>
            </div>
        </Form>
    </div>
</template>

<script setup>
import { usePageTitleStore } from '~/stores/pageTitle';
import { Form } from 'vee-validate';
import { useRoute } from 'vue-router';
import { useAsyncData } from 'nuxt/app'

definePageMeta({
    middleware: 'authenticator'
})

    const ImageHandler = defineAsyncComponent(() => {
        return import('@/components/form-fields/ImageHandler.vue')
    })

const nuxtApp = useNuxtApp();
    
const route = useRoute();
const pageTitle = usePageTitleStore();
const id = route.params.id;

const formattedTitle = ref('');
const secondLastSegment = ref('');
const isClient = ref(false);

const formData = reactive({
    enabled: 0,
    main_image: []
})

onMounted(() => {

    pageTitle.setTitle(`Add Award`);
    pageTitle.setBreadcrumbs(['Awards', 'Awards List', 'Add Award']);

    pageTitle.setPageFrom('Awards List');
    pageTitle.setPageFromRoute('/awards');
    isClient.value = true;
    // populateData(sectionData.value);
});

    const handleFileUpdate = (field, file) => {
        const idx = parseInt(field.match(/\d+$/), 10); // Get the number from the field string
        const fieldName = field.replace(/\d+$/, ""); // Remove the number to get the base field name

        if (!Number.isNaN(idx)) {
            formData[fieldName][idx] = file;
            console.log(formData[fieldName]);
        } else {
            
            formData[fieldName] = file; // Updates the specific image field
            
            console.log(field);
        }
    };

    const submit = async () => {
        const formElement = document.getElementById('form');
        const form_data = new FormData(formElement);

        formData.main_image.forEach((file, index) => {
            form_data.append(`main_image[]`, file)
        });
        form_data.append('enabled', formData.enabled ? 1 : 0)

        try {
            const response = await nuxtApp.$axios.post(`/cms/awards`, form_data , {
                headers: {
                    'Content-Type': 'multipart/form-data',
                },
            }).then((response) => {
                const record = response.data.record;
                
                nuxtApp.$toast.success('Award created successfully!');
                useRouter().push(`/awards/${record.id}`);
            }); 

        } catch (error) {
            console.error('Error:', error);
        }
    }

</script>