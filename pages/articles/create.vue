<template>
    <div class="relative w-full p-[16px] bg-offwhite flex flex-col gap-[16px] overflow-y-auto mb-[32px]">
        <Form id="form" @submit="submit()" class="w-full gap-[16px] flex flex-col">
            <div class="bg-white p-[16px] flex flex-col gap-[16px] rounded-[10px] w-full">
                <h2 class="font-semibold text-xl text-start w-full">Article Information</h2>
                <div class="grid grid-cols-2 gap-[16px]">
                    <TextField
                    label="Article Name"
                    name="title"
                    placeholder="e.g. Article ABC"
                    :rules="'required|max:100'"
                    optionalMessage=""
                     />
                    <SelectField v-if="categories"
                    label="Article Category"
                    name="category_id"
                    placeholder="Choose a Category"
                    :options="categories"
                    rules="required"/>
                    <DateField
                    label="Publishing Date"
                    name="date"
                    placeholder="MM / DD / YY"
                    rules="required"/>
                </div>
                <hr class="h-[1px] w-full border-gray"/>
                <ImageHandler 
                    label="Main Article Image"
                    max="1"
                    size="5"
                    :dimension="{width:664, height:400}"
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
            <div class="bg-white p-[16px] flex flex-col gap-[16px] rounded-[10px] w-full">
                <h2 class="font-semibold text-xl text-start w-full">Article Content</h2>
                <Quill v-if="isClient" v-model="formData.description" :modelValue="formData.description" :name="`description`" :label="`Article Content`"  :placeholder="`Enter your description here...`"/>
            </div>
            <div class="bg-white p-[16px] flex flex-col gap-[16px] rounded-[10px] w-full">
                <h2 class="font-semibold text-xl text-start w-full">Image Gallery <span class="text-base font-normal text-black/40">Optional</span></h2>
                <ImageHandler 
                    label="Upload an Image"
                    max="7"
                    size="5"
                    type="amenity_gallery"
                    :dimension="{width:812, height:440}"
                    :input_payload="{
                        identifier: 'gallery',
                        id: 'gallery_id',
                        category: 'gallery_category',
                        category_value: 'gallery',
                        alt: 'gallery_alt',
                    }"
                    @update:file="handleFileUpdate(`gallery`, $event)"
                />
            </div>
            <div class="bg-white p-[16px] flex flex-col gap-[16px] rounded-[10px] w-full">
                <h2 class="font-semibold text-xl text-start w-full">Article Status</h2>
                <div class="flex gap-[8px]">
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
                    <div class="flex flex-col gap-[8px] min-w-[91px]">
                        <!-- <h3 class="font-normal text-base text-ui-color">Has Button <span class="text-sm font-normal text-black/40">This banner will have 2 CTA Button</span></h3> -->
                        <h3 class="font-normal text-base text-black/70">Featured</h3>
                        <div class="pr-[16px] py-[12px] justify-start gap-[8px] flex">
                            <div @click="formData.featured = !formData.featured" class="cursor-pointer w-[40px] h-[24px] rounded-[12px] flex  items-center hover:border hover:border-black p-[3px]" :class="{'bg-ui-color justify-end' : formData.featured, 'bg-light-gray justify-start' : !formData.featured}">
                                <div class="w-[20px] h-[20px] bg-white rounded-full"></div>
                            </div>
                            {{ formData.featured ? 'Yes' : 'No' }}
                        </div>
                    </div>
                </div>
            </div>
            <Metadata />
            <Tracking />
            <div class="flex self-end gap-[16px]" v-if="!isSubmitting">
    
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

    const ImageHandler = defineAsyncComponent(() => {
        return import('@/components/form-fields/ImageHandler.vue')
    })
    const Quill = defineAsyncComponent(() => {
        return import('@/components/form-fields/Quill.vue')
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
        title: '',
        description: '',
        date: '',
        enabled: 0,
        featured: 0,
        main_image: [],
        gallery: []
    })
    
    onMounted(() => {
        // const currentPath = route.path; // Get the current path
        // const pathSegments = route.path.split('/'); 
    
        // const firstPathSegment = currentPath.split('/')[1]; // Split by '/' and get the first segment after the base
        
        // if (pathSegments.length > 2) {
        //     secondLastSegment.value = pathSegments[pathSegments.length - 2];
        // }
    
        // formattedTitle.value = secondLastSegment.value
        //     .replace(/-/g, ' ') // Replace dashes with spaces
        //     .replace(/\b\w/g, char => char.toUpperCase()); // Capitalize the first letter of each word
    
        // const property_type = propertyType.replace(/-/g, ' ') // Replace dashes with spaces
        // .replace(/\band\b/gi, '&') // Replace 'and' with '&'
        // .replace(/\b\w/g, char => char.toUpperCase());
    
    
        pageTitle.setTitle(`Add Article`);
        pageTitle.setBreadcrumbs(['News & Articles', 'Articles', 'Add Article']);
    
        pageTitle.setPageFrom('Articles List');
        pageTitle.setPageFromRoute('/articles' );
        fetchRecords();
        // populateData(sectionData.value);
        isClient.value = true;
    });

    const categories = ref([]);

    const fetchRecords = async () => {
        try {
            const type_response = await nuxtApp.$axios.get(`/cms/taxonomies/article-categories?all=true`); 
            categories.value = type_response.data.map((record) => ({
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
    const isSubmitting = ref(false);
    
    const submit = async () => {
            isSubmitting.value = true;
            const formElement = document.getElementById('form');
            const form_data = new FormData(formElement);
    
            
            // form_data.append('parent_id', id);
            form_data.append('enabled', formData.enabled ? 1 : 0);
            form_data.append('featured', formData.featured ? 1 : 0);
            form_data.append('content', formData.description);
    
            formData.main_image.forEach((file, index) => {
                form_data.append(`main_image[]`, file)
            });
            formData.gallery.forEach((file, index) => {
                form_data.append(`gallery[]`, file)
            });
            try {
                const response = await nuxtApp.$axios.post(`/cms/articles`, form_data , {
                    headers: {
                        'Content-Type': 'multipart/form-data',
                    },
                }).then((response) => {
                    const record = response.data.record;
                    isSubmitting.value = false;
                    useRouter().push(`/articles/${record.id}`);
                    nuxtApp.$toast.success('Article created successfully!');
                }); 
    
            } catch (error) {
                console.error('Error:', error);
                isSubmitting.value = false;
                nuxtApp.$toast.error(error.response.data.errors[0]);
            }
        }
    
    
    // const { data: propertyData, error, status: isLoading } = useAsyncData(`property-${useRoute().params.id}`, async () => {
    //     try {
    //         // Use Axios to make the GET request
    //         const res = await nuxtApp.$axios.get(`/cms/properties/${useRoute().params.id}`);
    
    //         // Axios automatically parses JSON, so we just need to return the record
    //         return res.data.record; // Assuming 'record' is the field you need
    //     } catch (err) {
    //         console.error('Error fetching data:', err);
    //         throw new Error('Failed to fetch data');
    //     }
    // })
    
    </script>