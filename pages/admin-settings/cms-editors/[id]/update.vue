<template>
    <div class="relative w-full p-[16px] bg-offwhite flex flex-col gap-[16px] overflow-y-auto mb-[32px]">
        <Form v-if="userData" id="form" @submit="submit()" class="w-full gap-[16px] flex flex-col">
            <div class="bg-white p-[16px] flex flex-col gap-[16px] rounded-[10px] w-full">
                <h2 class="font-semibold text-xl text-start w-full">Editor Information</h2>
                <div class="grid grid-cols-2 gap-[16px]">
                    <TextField
                    label="First Name"
                    name="first_name"
                    v-model="formData.first_name"
                    placeholder="e.g. Juan"
                    :rules="'required|max:50'"
                    optionalMessage=""
                     />
                     <TextField
                    label="Last Name"
                    name="last_name"
                    v-model="formData.last_name"
                    placeholder="e.g. Dela Cruz"
                    :rules="'required|max:50'"
                    optionalMessage=""
                     />
                     <TextField
                    label="Email"
                    name="email"
                    v-model="formData.email"
                    placeholder="e.g. juandelacruz@email.com"
                    :rules="'required|email'"
                    optionalMessage="The confirmation will be sent via email"
                     />
                     <SelectField v-if="roles && authStore.user.role.name === 'Admin'"
                    label="Role"
                    name="role_id"
                    v-model="formData.role_id"
                    placeholder="Choose a role"
                    :options="roles"
                    rules="required"/>
                </div>
                <hr class="h-[1px] w-full border-gray"/>
                <ImageHandler 
                    label="Profile Image"
                    max="1"
                    size="5"
                    :data="main_image"
                    :dimension="{width: 100, height: 100}"
                    :input_payload="{
                        identifier: 'profile_image',
                        id: 'profile_image_id',
                        category: 'profile_image_category',
                        category_value: 'profile_image',
                        alt: 'profile_image_alt',
                    }"
                    @update:file="handleFileUpdate(`profile_image`, $event)"
                />

                <hr class="h-[1px] w-full border-gray">

                <div v-if="authStore.user.id === route.params.id" class="flex flex-col gap-[8px]">
                    <h2 class="font-normal text-base text-start w-full text-black/70">Update Password <span class="text-sm font-normal text-black/40">The confirmation will be sent to this email</span></h2>
                    <router-link :to="`/admin-settings/cms-editors/${route.params.id}/change-password`" class="px-[24px] py-[12px] w-fit bg-white border border-ui-color text-ui-color text-center rounded-[10px]">Change Editor's Password</router-link>
                </div>
            </div>
            <div class="flex self-end gap-[16px]">
                <button type="submit" class="px-[24px] py-[12px] bg-ui-color text-white text-center rounded-[10px]">Save Changes</button>
            </div>
        </Form>
    </div>
    </template>
    
    <script setup>
    
    import { useAuthStore } from '~/stores/auth'; // Adjust path as necessary
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
        
    const authStore = useAuthStore();
    const route = useRoute();
    const pageTitle = usePageTitleStore();
    
    // const propertyType = route.params.propertyType; 
    // const property = ref(null);
    // const id = route.params.id;
    
    const isClient = ref(false);
    // const formattedTitle = ref('');
    // const secondLastSegment = ref('');
    
    
    const formData = reactive({
        profile_image: [],
        enabled: 1,
        first_name: '',
        last_name: '',
        email: '',
        role_id: '',
    })

    const main_image = ref([]);
    
    onMounted(() => {
    
    
        pageTitle.setTitle(`Edit Editor`);
        pageTitle.setBreadcrumbs(['Admin Settings', 'CMS Editors', 'Edit Editor']);
    
        pageTitle.setPageFrom('Editors List');
        pageTitle.setPageFromRoute('/admin-settings/cms-editors' );
        fetchRecords();
        // populateData(sectionData.value);
        isClient.value = true;
    });

    const roles = ref([]);
    const userData = ref(null);

    const fetchRecords = async () => {
        try {
            const type_response = await nuxtApp.$axios.get(`/cms/roles?all=true`); 
            roles.value = type_response.data.records.map((record) => ({
                value: record.id,
                label: record.name
            }));

            const user_response = await nuxtApp.$axios.get(`/cms/users/${route.params.id}`);
            userData.value = user_response.data.record;

            populateData(userData.value);
        } catch (error) {
            console.error('Error:', error);
        }
    };

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
    
    const submit = async (isEnabled = 1) => {
            const formElement = document.getElementById('form');
            const form_data = new FormData(formElement);
    
            
            // form_data.append('parent_id', id);
    
            formData.profile_image.forEach((file, index) => {
                form_data.append(`profile_image[]`, file)
            });     

            
            form_data.append('enabled', formData.enabled)
            form_data.append('_method', 'PATCH')

            try {
                const response = await nuxtApp.$axios.post(`/cms/users/${route.params.id}`, form_data , {
                    headers: {
                        'Content-Type': 'multipart/form-data',
                    },
                }).then((response) => {
                    const record = response.data.record;
                    nuxtApp.$toast.success('CMS Editor updated successfully!');
                    populateData(record);
                }); 
    
            } catch (error) {
                console.error('Error:', error);
                nuxtApp.$toast.error(error.response.data.errors[0])
            }
        }
        
        const populateData = (data) => {
            main_image.value = data.images.filter(image => image.category === 'profile_image');
            formData.enabled = data.enabled;
            formData.first_name = data.user_detail.first_name;
            formData.last_name = data.user_detail.last_name;
            formData.email = data.email;
            formData.role_id = data.role_id;
        };
    

    
    </script>