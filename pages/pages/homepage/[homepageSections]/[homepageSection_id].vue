<template>
    <div class="relative flex flex-col justify-start p-[16px] mb-[32px] w-full gap-y-[16px] overflow-y-auto">
        <Form v-if="sectionData && formattedTitle" id="form" @submit="submit()" @invalid-submit="onInvalidSubmit"
            class="w-full gap-[16px] flex flex-col">
            <div class="bg-white p-[16px] flex flex-col gap-[16px] rounded-[10px] w-full">
                <h2 class="font-semibold text-xl text-start w-full">{{ `${formattedTitle} Information` }}</h2>
                <TextField v-model="formData.title" name="title" :label="`${formattedTitle} Header Title`"
                    placeholder="Enter title" :rules="'required|max:60'" :hasErrors="hasErrors" />
                <label for="description" class="text-base font-medium text-black/70">Page Description </label>
                <textarea v-if="sectionData && (sectionData.name === 'Top Banner' || sectionData.name === 'Payment Channel CTA' || sectionData.name === 'Get a Quote CTA')"
                    class="outline-none border-[1px] border-gray rounded-[10px] p-[16px] text-base font-normal placeholder:text-black/40 focus:border-ui-color bg-white h-[150px]"
                    v-model="formData.description" name="description" :label="`${formattedTitle} Header Description`"
                    placeholder="Enter description" :rules="'required|max:500'" :hasErrors="hasErrors"></textarea>
                <!-- <TextField v-if="
                    sectionData &&
                    (sectionData.name === 'Top Banner' || sectionData.name === 'Payment Channel CTA')"
                    v-model="formData.description" name="description" :label="`${formattedTitle} Header Description`"
                    placeholder="Enter description" :rules="'required|max:60'" :hasErrors="hasErrors" /> -->
                <!-- <TextInput v-model="formData.title" name="title" :label="`${formattedTitle} Header Copy`" max="50" placeholder="Enter banner title"/> -->
                <!-- <HowToAdd
                    v-if="sectionData && (sectionData.name === 'Featured House & Lots' || sectionData.name === 'Featured Condominiums')"
                    :title="formattedTitle"
                    :link="`/properties/${sectionData.name === 'Featured House & Lots' ? 'house-and-lots' : 'condominiums'}`" /> -->
            </div>
            <div v-if="
                sectionData &&
                (sectionData.name === 'Top Banner' ||
                    sectionData.name === 'About Us' ||
                    sectionData.name === 'Payment Channel CTA')
            " class="bg-white p-[16px] flex flex-col gap-[16px] rounded-[10px] w-full">
                <h2 class="font-semibold text-xl text-start w-full">
                    {{ `${formattedTitle} Image` }}
                </h2>
                <ImageHandler label="Desktop Images" :data="main_image" max="5" size="5"
                    :dimension="sectionData.name === 'Payment Channel CTA' ? { width: 432, height: 290 } : { width: 1280, height: 728 }"
                    :input_payload="{
                        identifier: 'main_image',
                        id: 'main_image_id',
                        category: 'main_image_category',
                        category_value: 'main_image',
                        alt: 'main_image_alt',
                    }" :required="true" ref="imageHandler0" v-model="formData.main_image"
                    @update:file="handleFileUpdate('main_image', $event)" />

                <hr class="h-[1px] w-full border-gray" />
                <ImageHandler v-if="
                    sectionData &&
                    (
                        sectionData.name !== 'Payment Channel CTA')
                " label="Mobile Image" :max="sectionData.name === 'Top Banner' ? '5' : '1'" size="5"
                    :data="mobile_image"
                    :dimension="sectionData.name === 'Payment Channel CTA' ? { width: 432, height: 290 } : { width: 375, height: 508 }"
                    :input_payload="{
                        identifier: 'mobile_image',
                        id: 'mobile_image_id',
                        category: 'mobile_image_category',
                        category_value: 'mobile_image',
                        alt: 'mobile_image_alt',
                    }" :required="sectionData.name === 'Payment Channel CTA' ? false : true" ref="imageHandler1"
                    v-model="formData.mobile_image[0]" @update:file="handleFileUpdate('mobile_image', $event)" />
            </div>
            <div v-if="sectionData && sectionData.order !== 4"
                class="bg-white p-[16px] flex flex-col gap-[16px] rounded-[10px] w-full">
                <h2 class="font-semibold text-xl text-start w-full" v-if="
                    sectionData &&
                    (
                        sectionData.name !== 'Payment Channel CTA')
                ">
                    Banner Button
                </h2>
                <div class="flex flex-col gap-[8px]" v-if="
                    sectionData &&
                    (
                        sectionData.name !== 'Payment Channel CTA')
                ">
                    <!-- <h3 class="font-normal text-base text-ui-color">Has Button <span class="text-sm font-normal text-black/40">This banner will have 2 CTA Button</span></h3> -->
                    <h3 class="font-normal text-base text-ui-color" v-if="
                        sectionData &&
                        (
                            sectionData.name !== 'Payment Channel CTA')
                    ">
                        Has Button
                    </h3>
                    <div class="pr-[16px] py-[12px] justify-start gap-[8px] flex">
                        <div @click="formData.has_button = !formData.has_button"
                            class="cursor-pointer w-[40px] h-[24px] rounded-[12px] flex items-center hover:border hover:border-black p-[3px]"
                            :class="{
                                'bg-ui-color justify-end': formData.has_button,
                                'bg-light-gray justify-start':
                                    !formData.has_button,
                            }">
                            <div class="w-[20px] h-[20px] bg-white rounded-full"></div>
                        </div>
                        {{ formData.has_button === 1 ? 'Yes' : 'No' }}
                    </div>
                </div>
                <div v-if="formData.has_button" v-for="(button, index) in formData.buttons" :key="index" class="">
                    <Button v-if="formData.has_button" :name="`button`" :button="button" :showLink="false"
                        :index="index" />
                </div>
            </div>
            <ModuleId v-if="sectionData" :id="sectionData.id" />
            <HistoryLog v-if="sectionData && sectionData.logs.length" :log="sectionData.logs[0]" />

            <button type="submit"
                class="px-[24px] py-[12px] bg-ui-color text-white text-center rounded-[10px] self-end">
                Publish Update
            </button>
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
    name: 'homepageSection_id',
    middleware: 'authenticator',
});

const TextInput = defineAsyncComponent(() => {
    return import('@/components/form-fields/TextInput.vue');
});
const ImageHandler = defineAsyncComponent(() => {
    return import('@/components/form-fields/ImageHandler.vue');
});
const Button = defineAsyncComponent(() => {
    return import('@/components/form-fields/Button.vue');
});

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

    formattedTitle.value = secondLastSegment.value
        .replace(/-/g, ' ') // Replace dashes with spaces
        .replace(/\b\w/g, char => char.toUpperCase()); // Capitalize the first letter of each word

    // console.log(formattedTitle); // Output: 'Featured House & Lots'
    pageTitle.setTitle(`Edit ${formattedTitle.value}`);
    pageTitle.setBreadcrumbs([
        'Pages',
        sidebar.activeLink,
        formattedTitle.value,
    ]);

    pageTitle.setPageFrom('Pages');
    pageTitle.setPageFromRoute('/pages');

    // populateData(sectionData.value);
});
const id = route.params.homepageSection_id;

const formData = reactive({
    title: '',
    description: '',
    has_button: 0,
    buttons: [],
    main_image: [],
    mobile_image: [],
});

const main_image = ref([]);
const mobile_image = ref([]);

const handleFileUpdate = (field, file) => {
    formData[field] = file; // Updates the specific image field
};

const imageHandler0 = ref(null);
const imageHandler1 = ref(null);

const hasErrors = ref({});
const onInvalidSubmit = ({ values, errors, results }) => {
    hasErrors.value = errors;
    // console.log(hasErrors.value)
    let isFormValid = true;
    if (imageHandler0.value?.validate && !imageHandler0.value.validate()) {
        isFormValid = false;
        // console.log(isFormValid)
    }
    if (imageHandler1.value?.validate && !imageHandler1.value.validate()) {
        isFormValid = false;
    }
    nuxtApp.$toast.error('There are fields that require your attention. Kindly review the form.')
}
const submit = async () => {
    let isValid = true;
    if (imageHandler0.value?.validate && !imageHandler0.value.validate() && main_image.value.length == 0) {
        isValid = false;
        console.log('isvalid: ' + isValid)
    }
    if (imageHandler1.value?.validate && !imageHandler1.value.validate() && mobile_image.value.length == 0) {
        isValid = false;
    }
    const formElement = document.getElementById('form');
    const form_data = new FormData(formElement);
    // console.log(main_image.value.length);

    formData.main_image.forEach((file, index) => {
        form_data.append(`main_image[]`, file);
    });
    formData.mobile_image.forEach((file, index) => {
        form_data.append(`mobile_image[]`, file);
    });
    form_data.append('has_button', formData.has_button ? 1 : 0);
    form_data.append('_method', 'PATCH');

    if (isValid) {
        try {
            const response = await nuxtApp.$axios
                .post(`/cms/page-section/${id}`, form_data, {
                    headers: {
                        'Content-Type': 'multipart/form-data',
                    },
                })
                .then(response => {
                    sectionData.value = response.data.record;
                    console.log(sectionData.value);
                    nuxtApp.$toast.success('Page updated successfully!');
                });

        } catch (error) {
            console.error('Error:', error);
        }
    } else {
        nuxtApp.$toast.error('There are fields that require your attention. Kindly review the form.')
    }
}

const populateData = (newData) => {
    if (newData) {
        formData.title = newData.title
        formData.description = newData.description
        formData.has_button = Number(newData.has_button) ? 1 : 0
        formData.buttons = newData.buttons.length ? newData.buttons : [{
            button_name: '',
            link: '',
            id: '',
            is_link_out: 0
        }]
        main_image.value = newData.images.filter(image => image.category === 'main_image');
        mobile_image.value = newData.images.filter(image => image.category === 'mobile_image');
    }
}

const sectionData = ref(null);

const fetchRecords = async () => {
    try {
        // Use Axios to make the GET request
        const res = await nuxtApp.$axios.get(`/cms/page-section/${id}`);

        // Axios automatically parses JSON, so we just need to return the record
        sectionData.value = res.data.record; // Assuming 'record' is the field you need
    } catch (err) {
        console.error('Error fetching section data:', err);
        throw new Error('Failed to fetch data');
    }
}

watch(sectionData, newData => {
    populateData(newData);
});
</script>
