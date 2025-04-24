<template>
<div class="relative w-full p-[16px] bg-offwhite flex flex-col gap-[16px] overflow-y-auto mb-[32px]">
    <Form id="form" @submit="submit()" class="w-full gap-[16px] flex flex-col">
        <div class="bg-white p-[16px] flex flex-col gap-[16px] rounded-[10px] w-full">
            <h2 class="font-semibold text-xl text-start w-full">Amenity Information</h2>
            <div class="grid grid-cols-1 gap-[16px]">
                <TextField
                label="Amenity Name"
                name="title"
                placeholder="e.g. Amenity ABC"
                :rules="'required|max:100'"
                optionalMessage="Max 100 characters" />
            </div>
        </div>
        <div class="bg-white p-[16px] flex flex-col gap-[16px] rounded-[10px] w-full">
            <h2 class="font-semibold text-xl text-start w-full">Amenity Status</h2>
            <div class="flex flex-col gap-[8px] min-w-[91px]">
                <!-- <h3 class="font-normal text-base text-ui-color">Has Button <span class="text-sm font-normal text-black/40">This banner will have 2 CTA Button</span></h3> -->
                <h3 class="font-normal text-base text-black/70">Published</h3>
                <div class="pr-[16px] py-[12px] justify-start gap-[8px] flex">
                    <div @click="formData.enabled = !formData.enabled" class="cursor-pointer w-[40px] h-[24px] rounded-[12px] flex  items-center hover:border hover:border-black p-[3px]" :class="{'bg-ui-color justify-end' : formData.enabled, 'bg-light-gray justify-start' : !formData.enabled}">
                        <div class="w-[20px] h-[20px] bg-white rounded-full"></div>
                    </div>
                    {{ formData.enabled ? 'Yes' : 'No' }}
                </div>
            </div>
        </div>

        <div class="flex self-end gap-[16px]">

            <!-- <button type="button" @click="submit(0)" class="px-[24px] py-[12px] bg-white border border-ui-color text-ui-color text-center rounded-[10px]">Save for Later</button> -->
            <button type="submit" class="px-[24px] py-[12px] bg-ui-color text-white text-center rounded-[10px]">Publish Update</button>
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


const nuxtApp = useNuxtApp();
    
const route = useRoute();
const pageTitle = usePageTitleStore();

const propertyType = route.params.propertyType; 
const property = ref(null);
const id = route.params.id;

const formattedTitle = ref('');
const secondLastSegment = ref('');


const formData = reactive({
    enabled: 0
})

onMounted(() => {
    const currentPath = route.path; // Get the current path
    const pathSegments = route.path.split('/'); 

    const firstPathSegment = currentPath.split('/')[1]; // Split by '/' and get the first segment after the base
    
    if (pathSegments.length > 2) {
        secondLastSegment.value = pathSegments[pathSegments.length - 2];
    }

    formattedTitle.value = secondLastSegment.value
        .replace(/-/g, ' ') // Replace dashes with spaces
        .replace(/\b\w/g, char => char.toUpperCase()); // Capitalize the first letter of each word

    const property_type = propertyType.replace(/-/g, ' ') // Replace dashes with spaces
    .replace(/\band\b/gi, '&') // Replace 'and' with '&'
    .replace(/\b\w/g, char => char.toUpperCase());


    pageTitle.setTitle(`Add Amenity`);
    pageTitle.setBreadcrumbs(['Properties', property_type, propertyData.value.name, 'Amenities', 'Add Amenity']);

    pageTitle.setPageFrom('Amenities');
    pageTitle.setPageFromRoute('/properties/' + propertyType + '/' + id + '/amenities');
    // fetchRecords();
    // populateData(sectionData.value);
});

const submit = async () => {
        const formElement = document.getElementById('form');
        const form_data = new FormData(formElement);

        
        form_data.append('parent_id', id);
        form_data.append('enabled', formData.enabled ? 1 : 0);

        try {
            const response = await nuxtApp.$axios.post(`/cms/amenities`, form_data , {
                headers: {
                    'Content-Type': 'multipart/form-data',
                },
            }).then((response) => {
                const record = response.data.record;
                
                nuxtApp.$toast.success('Amenity created successfully!');
                setTimeout(() => {
                useRouter().push(`/properties/${propertyType}/${id}/amenities/${record.id}`);
                }, 2000);
            }); 

        } catch (error) {
            console.error('Error:', error);
            nuxtApp.$toast.error(error.response.data.errors[0]);
        }
    }


const { data: propertyData, error, status: isLoading } = useAsyncData(`property-${useRoute().params.id}`, async () => {
    try {
        // Use Axios to make the GET request
        const res = await nuxtApp.$axios.get(`/cms/properties/${useRoute().params.id}`);

        // Axios automatically parses JSON, so we just need to return the record
        return res.data.record; // Assuming 'record' is the field you need
    } catch (err) {
        console.error('Error fetching data:', err);
        throw new Error('Failed to fetch data');
    }
})

</script>