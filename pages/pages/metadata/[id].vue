<template>
    <div class="relative flex flex-col justify-start p-[16px] mb-[32px] w-full h-full gap-y-[16px] overflow-y-auto bg-white">
        <Form v-if="pageData" id="form" @submit="submit()" class="w-full gap-[16px] flex flex-col">
            <h2 class="font-semibold text-xl text-start w-full">Metadata <span class="text-base font-normal text-black/40"></span></h2>
                <TextField
                    label="Meta Title"
                    name="meta_title"
                    v-model="formData.meta_title"
                    placeholder="Enter meta title"
                    :rules="'max:50'"
                    optionalMessage="Max 50 characters" />
            <div class="flex flex-col gap-[8px] relative">
                <label for="description" class="text-base font-medium text-black/70">Meta Descrption <span class="text-sm font-normal text-black/40">{{ `Maximum 400 characters` }}</span></label>
                <textarea
                id="description"
                v-model="description"
                name="meta_description"
                rows="5"
                cols="40"
                placeholder="Enter your description here..."
                class="outline-none border-[1px] border-gray rounded-[10px] p-[16px] text-base font-normal placeholder:text-black/40 focus:border-ui-color bg-white"
                > </textarea>
                <div class="absolute bottom-[32px] right-[32px] text-black/40 text-sm">
                    <span>{{ formData.meta_description.length }} / {{ maxCharacters }}</span>
                </div>
            </div>
            <TextField
                label="Link Rel"
                name="link_rel"
                v-model="formData.link_rel"
                :rules="'max:50'"
                placeholder="Enter link rel"
                optionalMessage="Max 50 characters" />
            <input type="hidden" name="parent_id" v-model="formData.parent_id" />

            <button type="submit" class="px-[24px] py-[12px] bg-ui-color text-white text-center rounded-[10px] absolute bottom-[16px] right-[16px]">Publish Update</button>
        </Form>
    </div>
</template>
<script setup>
    import { Form } from 'vee-validate';
    import { usePageTitleStore } from '~/stores/pageTitle';
    import { useSidebarStore } from '~/stores/sidebar';
    import { useRoute } from 'vue-router';
    import { onMounted } from 'vue';

    definePageMeta({
        name: 'metadata_id',
        middleware: 'authenticator'
    })

    const TextInput = defineAsyncComponent(() => {
        return import('@/components/form-fields/TextInput.vue')
    })

    const pageTitle = usePageTitleStore();
    const sidebar = useSidebarStore();
    const route = useRoute();

    const nuxtApp = useNuxtApp();

    const id = route.params.id;

    const formData = reactive({
        parent_id: '',
        meta_title: '',
        meta_description: '',
        link_rel: 'Canonical',
    });
    const maxCharacters = 400;

    const description = ref('');
    // Watcher to ensure character limit is enforced
    watch(description, (newValue) => {
        if (newValue.length > maxCharacters) {
            formData.meta_description = newValue.slice(0, maxCharacters);
        } else {
            formData.meta_description = newValue;
        }
    });


    onMounted(() => {
        populateData(pageData.value);
        pageTitle.setTitle(`${pageData.value.name} Metadata`);
        pageTitle.setBreadcrumbs(['Pages', pageData.value.name + ' Metadata']);

        pageTitle.setPageFrom('Pages');
        pageTitle.setPageFromRoute('/pages');
    })

    const populateData = (data) => {
        formData.parent_id = data.metadata?.parent_id;
        formData.meta_title = data.metadata?.meta_title;
        formData.meta_description = data.metadata?.meta_description ? data.metadata.meta_description : '';
        description.value = data.metadata?.meta_description ? data.metadata.meta_description : '';
        formData.link_rel = data.metadata?.link_rel.length ? data.metadata.link_rel : 'Canonical';
        console.log(formData);
    }

    const submit = async () => {
        const formElement = document.getElementById('form');
        const form_data = new FormData(formElement);
        form_data.append('_method', 'PATCH'); 

        try {
            const response = await nuxtApp.$axios.post(`/cms/page/update/${id}`, form_data , {
                headers: {
                    'Content-Type': 'multipart/form-data',
                },
            }).then((response) => {
                pageData.value = response.data.record;
                nuxtApp.$toast.success('Page updated successfully!');
            }); 

        } catch (error) {
            console.error('Error:', error);
        }
    }

    const { data: pageData, error, status: isLoading } = useAsyncData(`page-${id}`, async () => {
        try {
            // Use Axios to make the GET request
            const res = await nuxtApp.$axios.get(`/cms/page/show/${id}`);

            // Axios automatically parses JSON, so we just need to return the record
            return res.data.record; // Assuming 'record' is the field you need
        } catch (err) {
            console.error('Error fetching section data:', err);
            throw new Error('Failed to fetch data');
        }
    })

    watch(pageData, (newData) => {
        populateData(newData);
    })
</script>