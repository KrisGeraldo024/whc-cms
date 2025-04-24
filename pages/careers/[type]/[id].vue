<template>
    <div class="relative w-full p-[16px] bg-offwhite flex flex-col gap-[16px] overflow-y-auto mb-[32px]">
        <Form v-if="careerData" id="form" @submit="submit()" class="w-full gap-[16px] flex flex-col">
            <div class="bg-white p-[16px] flex flex-col gap-[16px] rounded-[10px] w-full">
                <h2 class="font-semibold text-xl text-start w-full">{{formattedTitle}} Information</h2>
                <div class="grid grid-cols-1 gap-[16px]">
                    <TextField
                    label="Job Title"
                    name="title"
                    v-model="formData.title"
                    placeholder="e.g. Job ABC"
                    :rules="'required|max:50'"
                    optionalMessage="Max 50 characters" />
                </div>
                <div class="grid grid-cols-2 gap-[16px]" v-if="route.params.type === 'job-listings'">
                    <SelectField v-if="locations"
                    label="Location"
                    name="location_id"
                    v-model="formData.location_id"
                    placeholder="Choose a Location"
                    :options="locations"
                    rules="required"/>

                    <SelectField v-if="employment"
                    label="Employment Type"
                    name="employment_type_id"
                    v-model="formData.employment_type_id"
                    placeholder="Choose an Employment Type"
                    :options="employment"
                    rules="required"
                    optionalMessage="Full time, Contractual, Part time"/>
                </div>
                <hr class="h-[1px] w-full border-gray">
                <Quill v-if="isClient && route.params.type === 'job-listings'" v-model="formData.description" :modelValue="formData.description" :name="`description`" :label="`Job Description`"  :placeholder="`Example Job Description...`"/>
            </div>
            <div class="bg-white p-[16px] flex flex-col gap-[16px] rounded-[10px] w-full">
                <h2 class="font-semibold text-xl text-start w-full">Job Qualifications</h2>
                <Quill v-if="isClient" v-model="formData.qualification" :modelValue="formData.qualification" :name="`description`" :label="`Qualification`"  :placeholder="`Example Job Qualifications...`"/>
            </div>
            <div class="bg-white p-[16px] flex flex-col gap-[16px] rounded-[10px] w-full">
                <h2 class="font-semibold text-xl text-start w-full">Job Opening Status</h2>
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
            <Metadata />
            <Tracking />
    
            <div class="flex self-end gap-[16px]">
    
                <!-- <button type="button" @click="submit(0)" class="px-[24px] py-[12px] bg-white border border-ui-color text-ui-color text-center rounded-[10px]">Save for Later</button> -->
                <button type="submit" class="px-[24px] py-[12px] bg-ui-color text-white text-center rounded-[10px]">Save {{ formattedTitle.slice(0, formattedTitle.length - 1)  }}</button>
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
    const Quill = defineAsyncComponent(() => {
        return import('@/components/form-fields/Quill.vue')
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
        description: '',
        qualification: '',
        title: '',
        location_id: '',
        employment_type_id: '',
    })
    
    onMounted(async () => {
        const currentPath = route.path; // Get the current path
        const pathSegments = route.path.split('/'); 
    
        const firstPathSegment = currentPath.split('/')[1]; // Split by '/' and get the first segment after the base
        
        if (pathSegments.length > 2) {
            secondLastSegment.value = pathSegments[pathSegments.length - 2];
        }
    
        formattedTitle.value = secondLastSegment.value
            .replace(/-/g, ' ') // Replace dashes with spaces
            .replace(/\b\w/g, char => char.toUpperCase()); // Capitalize the first letter of each word
    
    
        pageTitle.setTitle(`Edit Career`);
        pageTitle.setBreadcrumbs(['Careers', formattedTitle.value, 'Edit Career']);
    
        pageTitle.setPageFrom('Careers');
        pageTitle.setPageFromRoute('/careers/' + route.params.type );
        isClient.value = true;
        await fetchRecords();
    });

    const locations = ref([]);
    const employment = ref([]);
    const careerData = ref(null);

    const fetchRecords = async () => {
        try {
            const location_response = await nuxtApp.$axios.get(`/cms/taxonomies/job-locations?all=true`); 
            const employment_response = await nuxtApp.$axios.get(`/cms/taxonomies/employment-types?all=true`); 
            // const properties = await nuxtApp.$axios.get(`/cms/properties?page=${pagination.page}
            // &propertyType=${properyType}
            // &location=${filter.value}
            // &sortBy=${sortBy.value}
            // &sortDirection=${sortDirection.value}`); 
            locations.value = location_response.data.map((record) => ({
                value: record.id,
                label: record.name
            }));

            employment.value = employment_response.data.map((record) => ({
                value: record.id,
                label: record.name
            }));

            const career_response = await nuxtApp.$axios.get(`/cms/careers/${id}`);
            careerData.value = career_response.data.record;
            populateData(careerData.value);
            // properties.value = properties.data.records;
        } catch (error) {
            console.error('Error:', error);
        }
    };
    
    const submit = async () => {
        const formElement = document.getElementById('form');
        const form_data = new FormData(formElement);

        form_data.append('parent_id', id);
        form_data.append('enabled', formData.enabled ? 1 : 0);
        form_data.append('description', formData.description);
        form_data.append('qualification', formData.qualification);
        form_data.append('job_type', route.params.type);

        form_data.append('_method', 'PATCH');

        try {
            const response = await nuxtApp.$axios.post(`/cms/careers/${route.params.id}`, form_data , {
                headers: {
                    'Content-Type': 'multipart/form-data',
                },
            }).then((response) => {
                const record = response.data.record;
                populateData(record);
                nuxtApp.$toast.success('Career updated successfully!');
            }); 

        } catch (error) {
            console.error('Error:', error);
        }
    }

    const populateData = (data) => {
        formData.description = data.description;
        formData.title = data.title;
        formData.location_id = data.location_id;
        formData.employment_type_id = data.employment_type_id;
        formData.qualification = data.qualifications;
        formData.enabled =  Number(data.enabled);
    }

</script>