<template>
    <div class="relative w-full p-[16px] bg-offwhite flex flex-col gap-[16px] overflow-y-auto mb-[32px]">
        <Form v-if="landmarkData" id="form" @submit="submit()" @invalid-submit="onInvalidSubmit" class="w-full gap-[16px] flex flex-col">
            <div class="bg-white p-[16px] flex flex-col gap-[16px] rounded-[10px] w-full">
                <h2 class="font-semibold text-xl text-start w-full">Landmark Information</h2>
                <div class="grid grid-cols-1 gap-[16px]">
                    <TextField
                    label="Landmark Name"
                    name="title"
                    v-model="formData.name"
                    placeholder="e.g. Landmark ABC"
                    :rules="'required|max:100'"
                    optionalMessage="Max 100 characters" 
                    :hasErrors="hasErrors"/>
                </div> 
                <hr class="h-[1px] w-full border-gray">
                <ImageHandler 
                    label="Landmark Icon" 
                    :max="'1'"
                    :data="icon"
                    :dimension="{width: 70, height: 70}"
                    size="5"
                    :input_payload="{
                        identifier: 'icon',
                        id: 'icon_id',
                        category: 'icon_category',
                        category_value: 'icon',
                        alt: 'icon_alt',
                    }"
                    ref="imageHandler0"
                    :required="true"
                    v-model="formData.icon[0]"
                    @update:file="handleFileUpdate('icon', $event)"
                />
            </div>
            <div class="bg-white p-[16px] flex flex-col gap-[16px] rounded-[10px] w-full">
                <h2 class="font-semibold text-xl text-start w-full">{{ `List of Locations` }} <span class="text-base font-normal text-black/40">Minimum of 3 of 6</span></h2>
                <div class="flex flex-row justify-between items-center w-full">
                    <DraggableComponent />
                    <button @click="addVicinity()" type="button" class="p-[16px] border border-ui-color/20 rounded-[10px] flex items-center gap-[4px] text-ui-color text-base font-medium">
                        <span class="w-[21px] h-[21px]">
                            <svg xmlns="http://www.w3.org/2000/svg" width="21" height="22" viewBox="0 0 21 22" fill="none">
                            <path fill-rule="evenodd" clip-rule="evenodd" d="M10.5 19.9521C5.42587 19.9521 1.3125 15.8375 1.3125 10.7646C1.3125 5.69184 5.42587 1.57715 10.5 1.57715C15.5741 1.57715 19.6875 5.69184 19.6875 10.7646C19.6875 15.8375 15.5741 19.9521 10.5 19.9521ZM10.5 0.264648C4.70072 0.264648 0 4.9634 0 10.7646C0 16.5659 4.70072 21.2646 10.5 21.2646C16.2993 21.2646 21 16.5659 21 10.7646C21 4.9634 16.2993 0.264648 10.5 0.264648ZM14.4375 10.1084H11.1562V6.82715C11.1562 6.46621 10.8629 6.1709 10.5 6.1709C10.1371 6.1709 9.84375 6.46621 9.84375 6.82715V10.1084H6.5625C6.19959 10.1084 5.90625 10.4037 5.90625 10.7646C5.90625 11.1256 6.19959 11.4209 6.5625 11.4209H9.84375V14.7021C9.84375 15.0631 10.1371 15.3584 10.5 15.3584C10.8629 15.3584 11.1562 15.0631 11.1562 14.7021V11.4209H14.4375C14.8004 11.4209 15.0938 11.1256 15.0938 10.7646C15.0938 10.4037 14.8004 10.1084 14.4375 10.1084Z" fill="#00A651"/>
                            </svg>
                        </span>
                        Add Another Location
                    </button>
                </div>
                <Draggable v-if="formData.vicinities" v-model="formData.vicinities" handle=".handle" item-key="id"  @update:modelValue="onReorder"  class="flex flex-col gap-[16px]">
                    <template #item="{element: vicinity, index: vicinityIndex}">
                        <div  class="cursor-pointer bg-offwhite flex flex-col gap-[16px] rounded-[10px] w-full overflow-hidden" :class="{'h-[58px]' : !isOpen[vicinityIndex], 'h-auto' : isOpen[vicinityIndex]}">
                            <div  @click="isOpen[vicinityIndex] = !isOpen[vicinityIndex]" class="p-[16px] rounded-t-[10px] flex justify-between items-center" 
                            :class="{'bg-offwhite' : !isOpen[vicinityIndex], 'bg-[#E8F1FF] border border-ui-color' : isOpen[vicinityIndex]}">
                                <div class="flex gap-[10px] text-lg font-semibold" :class="{'text-black' : !isOpen[vicinityIndex], 'text-ui-color' : isOpen[vicinityIndex]}">
                                    <span class="w-[24px] h-[24px] handle">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="25" viewBox="0 0 24 25" fill="none">
                                        <g opacity="0.4" clip-path="url(#clip0_4060_26170)">
                                            <path fill-rule="evenodd" clip-rule="evenodd" d="M8.57757 2.47894V2.47722L9.43472 2.47894H8.57757ZM8.57757 21.3361C9.52214 21.3361 10.2919 22.1058 10.2919 23.0504C10.2919 23.9949 9.52214 24.7646 8.57757 24.7646C7.63129 24.7646 6.86329 23.9949 6.86329 23.0504C6.86329 22.1058 7.63129 21.3361 8.57757 21.3361ZM15.4347 21.3361C16.3793 21.3361 17.149 22.1058 17.149 23.0504C17.149 23.9949 16.3793 24.7646 15.4347 24.7646C14.4884 24.7646 13.7204 23.9949 13.7204 23.0504C13.7204 22.1058 14.4884 21.3361 15.4347 21.3361ZM8.57756 14.4789C9.52213 14.4789 10.2918 15.2486 10.2918 16.1932C10.2918 17.1378 9.52213 17.9075 8.57756 17.9075C7.63128 17.9075 6.86328 17.1378 6.86328 16.1932C6.86328 15.2486 7.63128 14.4789 8.57756 14.4789ZM15.4347 14.4789C16.3793 14.4789 17.149 15.2486 17.149 16.1932C17.149 17.1378 16.3793 17.9075 15.4347 17.9075C14.4884 17.9075 13.7204 17.1378 13.7204 16.1932C13.7204 15.2486 14.4884 14.4789 15.4347 14.4789ZM8.57756 7.62177C9.52213 7.62177 10.2918 8.3915 10.2918 9.33606C10.2918 10.2806 9.52213 11.0503 8.57756 11.0503C7.63128 11.0503 6.86328 10.2806 6.86328 9.33606C6.86328 8.3915 7.63128 7.62177 8.57756 7.62177ZM15.4347 7.62177C16.3793 7.62177 17.149 8.3915 17.149 9.33606C17.149 10.2806 16.3793 11.0503 15.4347 11.0503C14.4884 11.0503 13.7204 10.2806 13.7204 9.33606C13.7204 8.3915 14.4884 7.62177 15.4347 7.62177ZM8.57756 0.764648C9.52213 0.764648 10.2918 1.53436 10.2918 2.47894C10.2918 3.42351 9.52213 4.19322 8.57756 4.19322C7.63128 4.19322 6.86328 3.42351 6.86328 2.47894C6.86328 1.53436 7.63129 0.764648 8.57756 0.764648ZM15.4338 0.764648C16.3784 0.764648 17.1481 1.53436 17.1481 2.47894C17.1481 3.42351 16.3784 4.19322 15.4338 4.19322C14.4893 4.19322 13.7196 3.42351 13.7196 2.47894C13.7196 1.53436 14.4893 0.764648 15.4338 0.764648Z" fill="#2A2A2A"/>
                                        </g>
                                        <defs>
                                            <clipPath id="clip0_4060_26170">
                                            <rect width="24" height="24" fill="white" transform="translate(0 0.764648)"/>
                                            </clipPath>
                                        </defs>
                                        </svg>
                                    </span>
                                    {{`Location  ${vicinityIndex < 9 ? '0' : ''}${vicinityIndex + 1}`}}
                                </div>
                                <span class="w-[24px] h-[24px]">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="25" viewBox="0 0 24 25" fill="none" :class="{'rotate-180': !isOpen[vicinityIndex]}">
                                    <path fill-rule="evenodd" clip-rule="evenodd" d="M12.3982 9.5612C12.1785 9.34153 11.8224 9.34153 11.6027 9.5612L5.86788 15.2961C5.64821 15.5158 5.64821 15.8719 5.86788 16.0915L6.13305 16.3567C6.35271 16.5764 6.70887 16.5764 6.92854 16.3567L12.0005 11.2848L17.0724 16.3567C17.2921 16.5764 17.6482 16.5764 17.8679 16.3567L18.1331 16.0915C18.3527 15.8719 18.3527 15.5158 18.1331 15.2961L12.3982 9.5612Z" fill="#2A2A2A"/>
                                    </svg>
                                </span>
                            </div>
                            <div class="w-full h-auto p-[16px] gap-y-[16px] flex flex-col">
                                <TextField
                                label="Location Name"
                                :name="`location_name[${vicinityIndex}]`"
                                v-model="vicinity.content"
                                placeholder="Enter location name"
                                :rules="'required|max:100'"
                                optionalMessage="Max 100 characters"
                                    :hasErrors="hasErrors" />
                                <TextField
                                label="Distance"
                                :name="`distance[${vicinityIndex}]`"
                                v-model="vicinity.distance"
                                placeholder="Enter distance"
                                :rules="'required|max:50'"
                                optionalMessage="Max 50 characters" 
                                    :hasErrors="hasErrors" />
                                <input type="hidden" :name="`location_order[${vicinityIndex}]`" :value="vicinity.order ? vicinity.order : vicinityIndex + 1">
                                <input type="hidden" :name="`location_id[${vicinityIndex}]`" v-model="vicinity.id">
                                <DeleteItem v-if="vicinity.id || formData.vicinities.length > 1" :id="vicinity.id" :model="'Vicinity'" :index="vicinityIndex" @removeItem="removeVicinity(vicinityIndex)" class="self-end"/>
                            </div>
                        </div>
                    </template>
                </Draggable>    
                <div class="w-full justify-center flex">
                    <button  @click="addVicinity()" type="button" class="p-[16px] border border-ui-color/20 rounded-[10px] flex items-center gap-[4px] text-ui-color text-base font-medium">
                        <span class="w-[21px] h-[21px]">
                            <svg xmlns="http://www.w3.org/2000/svg" width="21" height="22" viewBox="0 0 21 22" fill="none">
                            <path fill-rule="evenodd" clip-rule="evenodd" d="M10.5 19.9521C5.42587 19.9521 1.3125 15.8375 1.3125 10.7646C1.3125 5.69184 5.42587 1.57715 10.5 1.57715C15.5741 1.57715 19.6875 5.69184 19.6875 10.7646C19.6875 15.8375 15.5741 19.9521 10.5 19.9521ZM10.5 0.264648C4.70072 0.264648 0 4.9634 0 10.7646C0 16.5659 4.70072 21.2646 10.5 21.2646C16.2993 21.2646 21 16.5659 21 10.7646C21 4.9634 16.2993 0.264648 10.5 0.264648ZM14.4375 10.1084H11.1562V6.82715C11.1562 6.46621 10.8629 6.1709 10.5 6.1709C10.1371 6.1709 9.84375 6.46621 9.84375 6.82715V10.1084H6.5625C6.19959 10.1084 5.90625 10.4037 5.90625 10.7646C5.90625 11.1256 6.19959 11.4209 6.5625 11.4209H9.84375V14.7021C9.84375 15.0631 10.1371 15.3584 10.5 15.3584C10.8629 15.3584 11.1562 15.0631 11.1562 14.7021V11.4209H14.4375C14.8004 11.4209 15.0938 11.1256 15.0938 10.7646C15.0938 10.4037 14.8004 10.1084 14.4375 10.1084Z" fill="#00A651"/>
                            </svg>
                        </span>
                        Add Another Location
                    </button>
                </div>
            </div>
            <!-- <div class="bg-white p-[16px] flex flex-col gap-[16px] rounded-[10px] w-full">
                <h2 class="font-semibold text-xl text-start w-full">Landmark Status</h2>
                <div class="flex flex-col gap-[8px] min-w-[91px]">
                    <h3 class="font-normal text-base text-ui-color">Has Button <span class="text-sm font-normal text-black/40">This banner will have 2 CTA Button</span></h3>
                    <h3 class="font-normal text-base text-black/70">Published</h3>
                    <div class="pr-[16px] py-[12px] justify-start gap-[8px] flex">
                        <div @click="formData.enabled = !formData.enabled" class="cursor-pointer w-[40px] h-[24px] rounded-[12px] flex  items-center hover:border hover:border-black p-[3px]" :class="{'bg-ui-color justify-end' : formData.enabled, 'bg-light-gray justify-start' : !formData.enabled}">
                            <div class="w-[20px] h-[20px] bg-white rounded-full"></div>
                        </div>
                        {{ formData.enabled ? 'Yes' : 'No' }}
                    </div>
                </div>
            </div> -->
    
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
    import { useAsyncData } from 'nuxt/app';
    import Draggable from 'vuedraggable';
    import DraggableComponent from '~/components/Draggable.vue';
    
    definePageMeta({
        middleware: 'authenticator'
    })
     
    const ImageHandler = defineAsyncComponent(() => {
            return import('@/components/form-fields/ImageHandler.vue')
        })
    
    const nuxtApp = useNuxtApp();
        
    const route = useRoute();
    const pageTitle = usePageTitleStore();
    
    const propertyType = route.params.propertyType; 
    const property = ref(null);
    const id = route.params.landmark_id;
    
    const formattedTitle = ref('');
    const secondLastSegment = ref('');
    
    
    const formData = reactive({
        name: '',
        vicinities: [
            {
                name: '',
                distance: '',
            }   
        ],
        icon: []
    })

    const icon = ref(null)
    
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
    
    
        pageTitle.setTitle(`Edit Landmark`);
        pageTitle.setBreadcrumbs(['Properties', property_type, propertyData.value.name, 'Landmarks', 'Edit Landmark']);
    
        pageTitle.setPageFrom('Landmarks');
        pageTitle.setPageFromRoute('/properties/' + propertyType + '/' + route.params.id + '/landmarks');
        fetchRecords();
        // populateData(sectionData.value);
    });

    
    const landmarkData = ref(null);
    const fetchRecords = async () => {
        formData.vicinities = [];
        try {

            const landmark_response = await nuxtApp.$axios.get(`/cms/landmarks/${id}`); 
            landmarkData.value = landmark_response.data.record;

            populateData(landmarkData.value);
        } catch (error) {
            console.error('Error:', error);
        }
    };
    
    const isOpen = ref([]);

    const onReorder = async (newOrder) => {
        console.log(newOrder);
        const form_data = ref([]);

        newOrder.forEach((data, index) => {
            // Ensure form_data.value[index] is an object
            if (!form_data.value[index]) {
                form_data.value[index] = {};
            }

            form_data.value[index].order = index + 1; // Set the new order
            form_data.value[index].id = data.id;     // Assign the ID from newOrder
        });
        try {
            const response = await nuxtApp.$axios.post(`/cms/re-order`, {
                model: 'Vicinity',
                data: form_data.value
            } , {
                headers: {
                    'Content-Type': 'multipart/form-data',
                },
            }).then((response) => {
                fetchRecords();
                nuxtApp.$toast.success('Locations reordered successfully!');
            }); 

        } catch (error) {
            console.error('Error:', error);
        }
    }
    
    const addVicinity = () => {
        formData.vicinities.push({    
            name: '',  
            distance: '',
        });
    }
    
    const removeVicinity = (index) => {
        formData.vicinities.splice(index, 1);
        fetchRecords();
    }
    const handleFileUpdate = (field, file) => {
        const idx = parseInt(field.match(/\d+$/), 10); // Get the number from the field string
        const fieldName = field.replace(/\d+$/, ""); // Remove the number to get the base field name
    
        if (!Number.isNaN(idx)) {
    
            // if (!icons.value[idx]) {
            //     icons.value[idx] = {}; 
            // }
            formData[fieldName][idx] = file;
            console.log(formData[fieldName]);
        } else {
            
            formData[fieldName] = file; // Updates the specific image field
            
            console.log(field);
        }
    };
    
    
    const imageHandler0 = ref(null);

    const hasErrors = ref({});
    const onInvalidSubmit = ({ values, errors, results }) => {
        hasErrors.value = errors;
        // console.log(hasErrors.value)
        let isFormValid = true;
        if (imageHandler0.value?.validate && !imageHandler0.value.validate()) {
            isFormValid = false;
            console.log(isFormValid)
        }
        nuxtApp.$toast.error('There are fields that require your attention. Kindly review the form.')
    }
    const submit = async () => {
        let isValid = true;
        if (imageHandler0.value?.validate && !imageHandler0.value.validate()) {
            isValid = false;
            console.log('isvalid: ' + isValid)
        }
        const formElement = document.getElementById('form');
        const form_data = new FormData(formElement);

        
        form_data.append('parent_id', route.params.id);
        formData.icon.forEach((file, index) => {
            form_data.append(`icon[]`, file)
        });
        form_data.append('_method', 'PATCH');

        if (isValid) {
            try {
                const response = await nuxtApp.$axios.post(`/cms/landmarks/${id}`, form_data , {
                    headers: {
                        'Content-Type': 'multipart/form-data',
                    },
                }).then((response) => {
                    const record = response.data.record;
                    populateData(record);
                    // useRouter().push(`/properties/${propertyType}/${id}/landmarks/${record.id}`);
                    nuxtApp.$toast.success('Landmark updated successfully!');
                }); 

            } catch (error) {
                console.error('Error:', error);
            }
        } else {
            nuxtApp.$toast.error('There are fields that require your attention. Kindly review the form.')
        }
    }
    const populateData = (data) => {
        formData.name = data.name;
        formData.vicinities = data.vicinities;
        icon.value = data.images.filter(image => image.category === 'icon');
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

    
    watch(landmarkData, (newData) => {
        populateData(newData);
    })
    
    </script>