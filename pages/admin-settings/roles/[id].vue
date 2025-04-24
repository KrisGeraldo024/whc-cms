<template>
    <div class="relative w-full p-[16px] bg-offwhite flex flex-col gap-[16px] overflow-y-auto mb-[32px]">
        <Form v-if="roleData" id="form" @submit="submit()" class="w-full justify-between flex flex-col h-auto min-h-[600px]">
            <div class="w-full gap-[16px] flex flex-col">
                <div class="bg-white p-[16px] flex flex-col gap-[16px] rounded-[10px] w-full">
                    <h2 class="font-semibold text-xl text-start w-full">Role Information</h2>
                    <div class="grid grid-cols-1 gap-[16px]">
                        <TextField
                        label="Role Name"
                        name="name"
                        v-model="formData.name"
                        placeholder="e.g. Role ABC"
                        :rules="'required|max:50'"
                        optionalMessage="Max 50 characters"
                        />
                    </div>
                </div>
                <div class="bg-white p-[16px] flex flex-col gap-[16px] rounded-[10px] w-full">
                    <h2 class="font-semibold text-xl text-start w-full">Role Permissions</h2>
                    <div class="relative">
                        <!-- Label and Instructions -->
                        <div class="flex gap-[8px] items-end mb-[8px]">
                        <p class="text-[#2a2a2a] opacity-70">Editable Site Sections</p>
                        <p class="text-[14px] opacity-40">You may select more than one</p>
                        </div>

                        <!-- Dropdown Input -->     
                        <div
                        class="w-full p-[16px] border border-[#2A2A2A]/20 rounded-[10px] bg-white flex items-center justify-between cursor-pointer"
                        @click="toggleDropdown">
                        <!-- Display selected items or placeholder -->
                        <div class="flex flex-wrap gap-[8px]">
                            <span v-if="!selectedItems.length" class="text-gray-400">Choose site sections</span>
                            <span
                            v-for="item in selectedItems"
                            :key="item.unique"
                            class="bg-ui-color px-3 py-1 rounded-[8px] text-sm text-white">
                            {{ item.name }}
                            <button
                            type="button"
                            @click="removeItem(item)"
                            class="ml-2 text-white">
                            &times;
                            </button>
                            </span>
                        </div>

                        <!-- Toggle Icon -->
                        <svg
                            xmlns="http://www.w3.org/2000/svg"
                            :class="{'rotate-180': dropdownOpen}"
                            class="w-5 h-5 text-gray-500 transition-transform"
                            fill="none"
                            viewBox="0 0 24 24"
                            stroke="currentColor"
                            stroke-width="2">
                            <path stroke-linecap="round" stroke-linejoin="round" d="M19 9l-7 7-7-7" />
                        </svg>
                        </div>

                        <!-- Dropdown Options -->
                        <ul
                        v-if="dropdownOpen"
                        class="absolute left-0 mt-2 w-full border border-gray-200 bg-white rounded-[10px] shadow-md z-10 max-h-[200px] overflow-y-auto">
                        <li
                            v-for="option in filteredOptions"
                            :key="option.unique"
                            @click.stop="addItem(option)"
                            class="px-4 py-2 hover:bg-gray-100 cursor-pointer">
                            {{ option.name }}
                        </li>
                        </ul>
                        <div class="text-danger/40 text-base font-medium leading-normal cursor-pointer flex justify-end items-center" @click="clearSelections">
                            <span class="w-[25px] h-[25px]">
                                <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" viewBox="0 0 25 25" class="fill-danger/40">
                                <path d="M8.33333 7.2915C8.05707 7.2915 7.79211 7.40125 7.59676 7.5966C7.40141 7.79195 7.29167 8.0569 7.29167 8.33317C7.29167 8.60944 7.40141 
                                8.87439 7.59676 9.06974C7.79211 9.26509 8.05707 9.37484 8.33333 9.37484H20.8333C21.1096 9.37484 21.3746 9.26509 21.5699 9.06974C21.7653 8.87439 
                                21.875 8.60944 21.875 8.33317C21.875 8.0569 21.7653 7.79195 21.5699 7.5966C21.3746 7.40125 21.1096 7.2915 20.8333 7.2915H8.33333ZM5.20833 
                                12.4998C5.20833 12.2236 5.31808 11.9586 5.51343 11.7633C5.70878 11.5679 5.97373 11.4582 6.25 11.4582H18.75C19.0263 11.4582 19.2912 11.5679 
                                19.4866 11.7633C19.6819 11.9586 19.7917 12.2236 19.7917 12.4998C19.7917 12.7761 19.6819 13.0411 19.4866 13.2364C19.2912 13.4318 19.0263 
                                13.5415 18.75 13.5415H6.25C5.97373 13.5415 5.70878 13.4318 5.51343 13.2364C5.31808 13.0411 5.20833 12.7761 5.20833 12.4998ZM3.125 16.6665C3.125 
                                16.3902 3.23475 16.1253 3.4301 15.9299C3.62545 15.7346 3.8904 15.6248 4.16667 15.6248H16.6667C16.9429 15.6248 17.2079 15.7346 17.4032 15.9299C17.5986 
                                16.1253 17.7083 16.3902 17.7083 16.6665C17.7083 16.9428 17.5986 17.2077 17.4032 17.4031C17.2079 17.5984 16.9429 17.7082 16.6667 17.7082H4.16667C3.8904 
                                17.7082 3.62545 17.5984 3.4301 17.4031C3.23475 17.2077 3.125 16.9428 3.125 16.6665Z"/>
                                </svg>
                            </span>
                            <span class="ml-[4px]">Clear All Selections</span>
                        </div>

                        <!-- Validation Error -->
                        <ErrorMessage name="permission" class="text-[#F12222] font-[500]" />
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
        name: '',
        permissions: [],
    })
    
    onMounted(() => {
    
    
        pageTitle.setTitle(`Edit Role`);
        pageTitle.setBreadcrumbs(['Admin Settings', 'Roles', 'Edit Role']);
    
        pageTitle.setPageFrom('Roles');
        pageTitle.setPageFromRoute('/admin-settings/roles' );
        fetchRecords();
        // populateData(sectionData.value);
        isClient.value = true;
    });

    const roles = ref([]);
    const roleData = ref(null);

    const fetchRecords = async () => {
        try {
            const user_response = await nuxtApp.$axios.get(`/cms/roles/${route.params.id}`);
            roleData.value = user_response.data.record;

            populateData(roleData.value);
        } catch (error) {
            console.error('Error:', error);
        }
    };

    const isPageRelated = (item) => item.unique.startsWith('pages-');

    // Filter to get all page-related permissions
    const pageRelatedPermissions = permissionStore.permissions.filter(isPageRelated);
    
    const submit = async (isEnabled = 1) => {
        if (selectedItems.value.length > 0) {
            
            const formElement = document.getElementById('form');
            const form_data = new FormData(formElement);
    
            const allPagesSelected = pageRelatedPermissions.every((permission) =>
                selectedItems.value.some((selected) => selected.unique === permission.unique)
            );

            // Add "All Pages" if all page-related permissions are selected
            if (allPagesSelected && !selectedItems.value.some((selected) => selected.unique === 'pages-all')) {
                selectedItems.value.push({ name: 'All Pages', unique: 'pages-all', route_name: ['pages'] });
            } else {
                selectedItems.value = selectedItems.value.filter((selected) => selected.unique !== 'pages-all');
            }
            form_data.append('permissions', JSON.stringify(selectedItems.value));
            form_data.append('_method', 'PATCH')

            try {
                const response = await nuxtApp.$axios.post(`/cms/roles/${route.params.id}`, form_data , {
                    headers: {
                        'Content-Type': 'multipart/form-data',
                    },
                }).then((response) => {
                    const record = response.data.record;
                    populateData(record);
                    nuxtApp.$toast.success('Role updated successfully!');
                }); 
    
            } catch (error) {
                console.error('Error:', error);
                nuxtApp.$toast.error(error.response.data.errors[0])
            }
            
        } else {
            nuxtApp.$toast.error('Please select at least one permission');
        }
    }
        
        const populateData = (data) => {
            formData.name = data.name;
            selectedItems.value = JSON.parse(data.permissions);
        };

        const dropdownOpen = ref(false);
        const selectedItems = ref([]);

        // Compute options excluding already selected ones
        const filteredOptions = computed(() => {
        return permissionStore.permissions.filter(
            (option) => !selectedItems.value.some((item) => item.unique === option.unique)
        );
        });

        // Toggle Dropdown
        const toggleDropdown = () => {
        dropdownOpen.value = !dropdownOpen.value;
        };

        // Add selected item
        const addItem = (item) => {
        selectedItems.value.push(item);
        dropdownOpen.value = false; // Close dropdown after selection
        };

        // Remove item from selected list
        const removeItem = (item) => {
            selectedItems.value = selectedItems.value.filter((selected) => selected.unique !== item.unique);
        };

        // Clear all selections
        const clearSelections = () => {
            selectedItems.value = [];
        };
    

    
    </script>