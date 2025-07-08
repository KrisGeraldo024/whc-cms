<template>
    <div class="relative w-full p-[16px] bg-offwhite flex flex-col gap-[16px] overflow-y-auto mb-[32px]">
        <Form v-if="awardData" id="form" @submit="submit()" class="w-full gap-[16px] flex flex-col">
            <div class="bg-white p-[16px] flex flex-col gap-[16px] rounded-[10px] w-full">
                <h2 class="font-semibold text-xl text-start w-full">Testimonial Information</h2>
                <div class="grid grid-cols-1 gap-[16px]">
                    <TextField label="Name" name="name" v-model="formData.name" placeholder="e.g. Testimonial ABC"
                        :rules="'required|max:100'" optionalMessage="Max 100 characters" />
                </div>
                <div class="grid grid-cols-1 gap-[16px]">
                    <TextField label="Designation" name="position" v-model="formData.position" placeholder="e.g. e.g Homeowner, Architect" :rules="'required|max:100'"
                        optionalMessage="Max 100 characters" />
                </div>
                <div class="grid grid-cols-1 gap-[16px]">
                    <TextField class="col-span-3" label="Testimonial" name="description" v-model="formData.description"
                        placeholder="e.g. Testimonial Content goes here" :rules="'required|max:255'"
                        optionalMessage="Max 255 characters" />
                </div>
            </div>

            <div class="flex self-end gap-[16px]">

                <!-- <button type="button" @click="submit(0)" class="px-[24px] py-[12px] bg-white border border-ui-color text-ui-color text-center rounded-[10px]">Save for Later</button> -->
                <button type="submit" class="px-[24px] py-[12px] bg-ui-color text-white text-center rounded-[10px]">Save
                    Changes</button>
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
const id = route.params.id;

const formattedTitle = ref('');
const secondLastSegment = ref('');
const isClient = ref(false);

const formData = reactive({
    enabled: 1,
    name: '',
    position: '',
    description: '',
})

const main_image = ref([]);

onMounted(() => {

    pageTitle.setTitle(`Edit Testimonial`);
    pageTitle.setBreadcrumbs(['Testimonials', 'Testimonials List', 'Edit Testimonial']);

    pageTitle.setPageFrom('Testimonials List');
    pageTitle.setPageFromRoute('/testimonials');
    isClient.value = true;
    fetchRecords();
    // populateData(sectionData.value);
});

const awardData = ref(null);

const fetchRecords = async () => {
    try {
        const award_response = await nuxtApp.$axios.get(`/cms/testimonials/${id}`);
        awardData.value = award_response.data.record;
        populateData(awardData.value);
        // properties.value = properties.data.records;
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

const submit = async () => {
    const formElement = document.getElementById('form');
    const form_data = new FormData(formElement);
    form_data.append('enabled', formData.enabled ? 1 : 0);
    form_data.append('_method', 'PATCH');

    try {
        const response = await nuxtApp.$axios.post(`/cms/testimonials/${id}`, form_data, {
            headers: {
                'Content-Type': 'multipart/form-data',
            },
        }).then((response) => {
            const record = response.data.record;
            populateData(record);
            // useRouter().push(`/testimonials/${record.id}`);
            nuxtApp.$toast.success('Testimonial updated successfully!');
        });

    } catch (error) {
        console.error('Error:', error);
    }
}

const populateData = (data) => {
    formData.name = data.name;
    formData.position = data.position;
    formData.description = data.description;
    formData.enabled = Number(data.enabled) ? 1 : 0;
}

</script>