<template>
    <div class="relative w-full p-[16px] bg-offwhite flex flex-col gap-[16px] overflow-y-auto mb-[32px]">
        <Form id="form" @submit="submit()" class="w-full gap-[16px] flex flex-col">
            <div class="bg-white p-[16px] flex flex-col gap-[16px] rounded-[10px] w-full">
                <h2 class="font-semibold text-xl text-start w-full">Editor Information</h2>
                <div class="grid grid-cols-2 gap-[16px]">
                    <TextField
                    label="First Name"
                    name="first_name"
                    placeholder="e.g. Juan"
                    :rules="'required|max:50'"
                    optionalMessage=""
                     />
                     <TextField
                    label="Last Name"
                    name="last_name"
                    placeholder="e.g. Dela Cruz"
                    :rules="'required|max:50'"
                    optionalMessage=""
                     />
                     <TextField
                    label="Email"
                    name="email"
                    placeholder="e.g. juandelacruz@email.com"
                    :rules="'required|email'"
                    optionalMessage="The confirmation will be sent via email"
                     />
                     <SelectField v-if="roles"
                    label="Role"
                    name="role_id"
                    placeholder="Choose a role"
                    :options="roles"
                    rules="required"/>
                </div>
                <hr class="h-[1px] w-full border-gray"/>
                <ImageHandler 
                    label="Profile Image"
                    max="1"
                    size="5"
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
            </div>
            <div class="p-[16px] bg-[#EAF5FF] flex flex-col gap-[8px] w-1/2">
                <div class="flex gap-[8px] text-ui-color text-base">
                    <span class="w-[20px] h-[20px]">
                        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 20 20" fill="none">
                        <path fill-rule="evenodd" clip-rule="evenodd" d="M18.3333 10C18.3333 14.6023 14.6023 18.3333 10 18.3333C5.39762 18.3333 1.66667 14.6023 1.66667 10C1.66667 5.39762 5.39762 1.66667 10 1.66667C14.6023 1.66667 18.3333 5.39762 18.3333 10ZM20 10C20 15.5229 15.5229 20 10 20C4.47716 20 0 15.5229 0 10C0 4.47716 4.47716 0 10 0C15.5229 0 20 4.47716 20 10ZM9.16667 11.6667V5.83333H10.8333V11.6667H9.16667ZM9.16667 14.1667V12.5H10.8333V14.1667H9.16667Z" fill="#00A651"/>
                        </svg>
                    </span>
                    <span class="font-medium">NOTE</span>
                </div>
                <p class="text-sm text-black font-normal">A system generated email will be sent to your newly added editors. <br> This will contain a pre-generated password for them to use on their initial sign in.</p>
            </div>
            <div class="flex self-end gap-[16px]">
                <button type="submit" class="px-[24px] py-[12px] bg-ui-color text-white text-center rounded-[10px]">Add Editor</button>
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
    
    // const propertyType = route.params.propertyType; 
    // const property = ref(null);
    // const id = route.params.id;
    
    const isClient = ref(false);
    // const formattedTitle = ref('');
    // const secondLastSegment = ref('');
    
    
    const formData = reactive({
        profile_image: [],
        enabled: 1
    })
    
    onMounted(() => {
    
    
        pageTitle.setTitle(`Add CMS Editor`);
        pageTitle.setBreadcrumbs(['Admin Settings', 'CMS Editors', 'Add CMS Editor']);
    
        pageTitle.setPageFrom('Editors List');
        pageTitle.setPageFromRoute('/admin-settings/cms-editors' );
        fetchRecords();
        // populateData(sectionData.value);
        isClient.value = true;
    });

    const roles = ref([]);

    const fetchRecords = async () => {
        try {
            const type_response = await nuxtApp.$axios.get(`/cms/roles?all=true`); 
            roles.value = type_response.data.records.map((record) => ({
                value: record.id,
                label: record.name
            }));
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

            const generateRandomPassword = () => {
                const randomNum = Math.floor(Math.random() * 1000000); // generates a number between 0 and 999999
                return String(randomNum).padStart(6, '0'); // ensures the number is 6 digits long
            };
            
            const default_password = generateRandomPassword();
            
            form_data.append('enabled', formData.enabled)
            form_data.append('password', default_password)
            form_data.append('confirm_password', default_password)
            try {
                const response = await nuxtApp.$axios.post(`/cms/users`, form_data , {
                    headers: {
                        'Content-Type': 'multipart/form-data',
                    },
                }).then((response) => {
                    const record = response.data.record;
                    
                    useRouter().push(`/admin-settings/cms-editors/${record.id}/update`);
                    nuxtApp.$toast.success('CMS Editor created successfully!');
                }); 
    
            } catch (error) {
                console.error('Error:', error);
                nuxtApp.$toast.error(error.response.data.errors[0]);
            }
        }
    

    
    </script>