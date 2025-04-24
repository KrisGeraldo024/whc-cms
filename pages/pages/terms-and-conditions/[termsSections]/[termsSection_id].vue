<template>
    <div class="relative flex justify-start p-[16px] mb-[32px] w-full overflow-y-auto">
        <Form v-if="sectionData && formattedTitle" id="form" @submit="submit()" @invalid-submit="onInvalidSubmit" class="w-full gap-[16px] flex flex-col">
            <div class="bg-white p-[16px] flex flex-col gap-[16px] rounded-[10px] w-full">
                <h2 class="font-semibold text-xl text-start w-full">{{ `${sectionData ? sectionData.name : formattedTitle} Information` }}</h2>
                <TextField
                        v-model="formData.title" name="title" :label="`${formattedTitle} Header Copy`"  placeholder="Enter title"
                        :rules="'required|max:60'"
                        :hasErrors="hasErrors"
                        /> 
                <!-- <TextInput v-model="formData.title" name="title" label="Banner Header" max="50" placeholder="Enter banner title"/> -->
            </div>
            <div v-if="sectionData && sectionData.order === 2" class="bg-white p-[16px] flex flex-col gap-[16px] rounded-[10px] w-full">
                <h2 class="font-semibold text-xl text-start w-full">Content</h2>
                <Quill v-model="formData.description" :name="`description`" :label="``" :placeholder="`Start typing...`"/>
            </div>
            <ModuleId v-if="sectionData" :id="sectionData.id"/>
            <HistoryLog v-if="sectionData && sectionData.logs.length" :log="sectionData.logs[0]" />

            <button type="submit" class="px-[24px] py-[12px] bg-ui-color text-white text-center rounded-[10px] self-end">Publish Update</button>
        </Form>
    </div>
</template>
<script setup>
    import { usePageTitleStore } from '~/stores/pageTitle';
    import { useSidebarStore } from '~/stores/sidebar';
    import { useRoute } from 'vue-router';
    import { useAsyncData } from 'nuxt/app';
    import { Form } from 'vee-validate';

    definePageMeta({
        name: 'termsSection_id',
        middleware: 'authenticator'
    })

    
    const Quill = defineAsyncComponent(() => {
        return import('@/components/form-fields/Quill.vue')
    })

    const pageTitle = usePageTitleStore();
    const sidebar = useSidebarStore();
    const route = useRoute();
    
    
    const nuxtApp = useNuxtApp();

    const formattedTitle = ref('');
    const secondLastSegment = ref('');
    onMounted(async () => {
        await fetchRecords();
        const currentPath = route.path; // Get the current path
        const pathSegments = route.path.split('/'); 

        const firstPathSegment = currentPath.split('/')[1]; // Split by '/' and get the first segment after the base
        
        if (pathSegments.length > 2) {
            secondLastSegment.value = pathSegments[pathSegments.length - 2];
        }

        formattedTitle.value = sectionData.value.name || '';

        // console.log(formattedTitle); // Output: 'Featured House & Lots'
        pageTitle.setTitle(`Edit ${formattedTitle.value}`);
        pageTitle.setBreadcrumbs(['Pages', sidebar.activeLink, formattedTitle.value]);

        pageTitle.setPageFrom('Pages');
        pageTitle.setPageFromRoute('/pages');
        
        // populateData(sectionData.value);
    });
    const id = route.params.termsSection_id; 

    const formData = reactive({
        title: '',
        description: '',
    });

    const handleFileUpdate = (field, file) => {
        formData[field] = file; // Updates the specific image field
    };


    const hasErrors = ref({});
    const onInvalidSubmit = ({ values, errors, results }) => {
        hasErrors.value = errors;
        nuxtApp.$toast.error('There are fields that require your attention. Kindly review the form.')
    }
    const submit = async () => {
        const formElement = document.getElementById('form');
        const form_data = new FormData(formElement);
       
        form_data.append('description', formData.description);
        form_data.append('_method', 'PATCH'); 

        try {
            const response = await nuxtApp.$axios.post(`/cms/page-section/${id}`, form_data , {
                headers: {
                    'Content-Type': 'multipart/form-data',
                },
            }).then((response) => {
                sectionData.value = response.data.record;
                nuxtApp.$toast.success('Page updated successfully!');
            }); 

        } catch (error) {
            console.error('Error:', error);
        }
    }

    const populateData = (newData) => {
        if (newData) {
            formData.title = newData.title
            formData.description = newData.description
        }
    }

    const sectionData = ref(null);

    const fetchRecords = async () => {
        try {
            // Use Axios to make the GET request
            const res = await nuxtApp.$axios.get(`/cms/page-section/${id}`);

            // Axios automatically parses JSON, so we just need to return the record
            sectionData.value =  res.data.record; // Assuming 'record' is the field you need
        } catch (err) {
            console.error('Error fetching section data:', err);
            throw new Error('Failed to fetch data');
        }
    }
    watch(sectionData, (newData) => {
        populateData(newData);
    })

</script>