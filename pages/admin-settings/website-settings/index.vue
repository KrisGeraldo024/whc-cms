<template>
    <div class="relative w-full p-[16px] bg-offwhite flex flex-col gap-[16px] overflow-y-auto mb-[32px]">
        <Form v-if="settingsData" id="form" @submit="submit()" class="w-full justify-between flex flex-col h-auto min-h-[600px]">
            <div class="w-full gap-[16px] flex flex-col">
                <div class="bg-white p-[16px] flex flex-col gap-[16px] rounded-[10px] w-full">
                    <h2 class="font-semibold text-xl text-start w-full">Website Information</h2>
                    <div class="grid grid-cols-1 gap-[16px]">
                        <TextField
                        label="Address"
                        name="address"
                        v-model="formData.address"
                        placeholder="e.g. Address"
                        :rules="'required'"
                        />
                    </div>
                </div>
                <div class="bg-white p-[16px] flex flex-col gap-[16px] rounded-[10px] w-full">
                    <h2 class="font-semibold text-xl text-start w-full">Socials Information</h2>
                    <div class="grid grid-cols-2 gap-[16px]">
                        <TextField
                        label="Facebook"
                        name="facebook"
                        v-model="formData.facebook"
                        placeholder="e.g. Facebook Link"
                        :rules="'required|https'"
                        />
                        <TextField
                        label="Youtube"
                        name="youtube"
                        v-model="formData.youtube"
                        placeholder="e.g. Youtube Link"
                        :rules="'required|https'"
                        />
                        <TextField
                        label="Instagram"
                        name="instagram"
                        v-model="formData.instagram"
                        placeholder="e.g. Instagram Link"
                        :rules="'required|https'"
                        />
                    </div>
                </div>
                
            </div>
            <div class="flex self-end justify-self-end gap-[16px]">
                <button type="submit" class="px-[24px] py-[12px] bg-ui-color text-white text-center rounded-[10px]">Save Changes</button>
            </div>
        </Form>
    </div>
</template>
    
<script setup>
    
    import { useAuthStore } from '~/stores/auth'; // Adjust path as necessary
    import { usePageTitleStore } from '~/stores/pageTitle';
    import { usePermissionStore } from '~/stores/permissions';
    import { Form, Field, ErrorMessage } from 'vee-validate';
    import { useRoute } from 'vue-router';
    import { useAsyncData } from 'nuxt/app'
    
    definePageMeta({
        middleware: 'authenticator'
    })
    
    
    const nuxtApp = useNuxtApp();
        
    const authStore = useAuthStore();
    const route = useRoute();
    const pageTitle = usePageTitleStore();
    
    const permissionStore = usePermissionStore();
    // const propertyType = route.params.propertyType; 
    // const property = ref(null);
    // const id = route.params.id;
    
    const isClient = ref(false);
    // const formattedTitle = ref('');
    // const secondLastSegment = ref('');
    
    
    const formData = reactive({
        address: '',
        facebook: '',
        youtube: '',
        instagram: ''
    })
    
    onMounted(() => {
    
    
        pageTitle.setTitle(`Website Settings`);
        pageTitle.setBreadcrumbs(['Admin Settings', 'Website Settings']);
    
        // pageTitle.setPageFrom('Roles');
        // pageTitle.setPageFromRoute('/admin-settings/roles' );
        // populateData(sectionData.value);
        isClient.value = true;

        fetchRecords();
    });

    const submit = async () => {
        try {
            
            const formElement = document.getElementById('form');
            const form_data = new FormData(formElement);

            const response = await nuxtApp.$axios.post(`/cms/setting/manage`, form_data);
            populateData(response.data.record);
            nuxtApp.$toast.success('Website Settings updated successfully!');
        } catch (error) {
            console.error('Error:', error);
            nuxtApp.$toast.error(error.response.data.message);
        }
    }

    const settingsData = ref(null);
    const fetchRecords = async () => {
        try {
            const response = await nuxtApp.$axios.get(`/cms/setting/show`);
            settingsData.value =  response.data.record;
            populateData(response.data.record);
        } catch (error) {
            console.error('Error:', error);
        }
    }

    const populateData = (data) => {
        formData.address = data.address;
        formData.facebook = data.facebook;
        formData.youtube = data.youtube;
        formData.instagram = data.instagram;
    }
    
</script>