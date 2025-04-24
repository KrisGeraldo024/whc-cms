<template>
    <div class="p-4 overflow-y-scroll relative">
        <Form
            @submit="onSubmit"
            v-slot="{ values }"
            id="form"
            :initial-values="initialValues">
            <div class="bg-white p-4 mb-4 rounded-lg">
                <p class="text-xl font-semibold mb-4">
                    Payment Platform Information
                </p>
                <div class="grid grid-cols-[1fr,133px] gap-[16px]">
                    <TextField
                        name="title"
                        rules="required|max:50"
                        class="mb-4 border-b border-[#E9E9E9] pb-4"
                        label="Payment Platform Name"
                        placeholder="e.g. Payment Platform ABC"
                        optionalMessage="Max 50 characters" />

                    <TextField
                        name="sequence"
                        class="mb-4 border-b border-[#E9E9E9] pb-4"
                        label="Seq. Number"
                        placeholder="1"
                        :disabled="true"
                        rules="" />
                </div>

                <form-fieldsImageHandler
                    label="Payment Platform Icon"
                    max="1"
                    size="2"
                    :dimension="{ width: 24, height: 24 }"
                    :input_payload="{
                        identifier: 'main_image',
                        id: 'main_image_id',
                        category: 'main_image_category',
                        category_value: 'main_image',
                        alt: 'main_image_alt',
                    }"
                    @update:file="handleFileUpdate('main_image', $event)" />

                <ImageTips class="mt-4" />

                <!-- <form-fieldsImageHandler
                    label="Logo"
                    max="1"
                    size="2"
                    :data="mobile_image"
                    :input_payload="{
                        identifier: 'mobile_image',
                        id: 'mobile_image_id',
                        category: 'mobile_image_category',
                        category_value: 'mobile_image',
                        alt: 'mobile_image_alt',
                    }"
                    @update:file="handleFileUpdate('mobile_image', $event)" /> -->
            </div>
            <!-- here  -->
            <div
                class="bg-white p-[16px] flex flex-col gap-[16px] rounded-[10px] w-full">
                <h2 class="font-semibold text-xl text-start w-full">
                    Popup Steps Content
                </h2>

                <div class="flex flex-row justify-between items-center w-full">
                    <!-- info  -->
                    <div
                        class="bg-[#EAF5FF] rounded-[10px] p-[16px] w-[587px] h-auto flex flex-col gap-[8px]">
                        <div
                            class="flex flex-row gap-[8px] text-ui-color text-sm font-semibold">
                            <span class="w-[24px] h-[24px]">
                                <svg
                                    xmlns="http://www.w3.org/2000/svg"
                                    width="24"
                                    height="25"
                                    viewBox="0 0 24 25"
                                    fill="none">
                                    <path
                                        d="M16.1916 6.4212C16.5821 6.03067 16.5821 5.39751 16.1916 5.00698L13.3632 2.17856C12.5821 1.39751 11.3158 1.39751 10.5347 2.17856L7.70633 5.00698C7.3158 5.39751 7.3158 6.03067 7.70633 6.4212C8.09685 6.81172 8.73001 6.81172 9.12054 6.4212L10.9992 4.54249V11.8147H3.72706L5.60577 9.93594C5.99629 9.54541 5.99629 8.91225 5.60577 8.52172C5.21524 8.1312 4.58208 8.1312 4.19156 8.52172L1.36313 11.3502C0.582084 12.1312 0.58208 13.3976 1.36313 14.1786L4.19156 17.007C4.58208 17.3976 5.21525 17.3976 5.60577 17.007C5.99629 16.6165 5.99629 15.9834 5.60577 15.5928L3.82762 13.8147H10.9992V20.9863L9.12054 19.1076C8.73001 18.717 8.09685 18.717 7.70632 19.1076C7.3158 19.4981 7.3158 20.1313 7.70632 20.5218L10.5347 23.3502C11.3158 24.1313 12.5821 24.1313 13.3632 23.3502L16.1916 20.5218C16.5821 20.1313 16.5821 19.4981 16.1916 19.1076C15.8011 18.717 15.1679 18.717 14.7774 19.1076L12.9992 20.8857V13.8147H20.0702L18.2921 15.5928C17.9016 15.9834 17.9016 16.6165 18.2921 17.007C18.6826 17.3976 19.3158 17.3976 19.7063 17.007L22.5347 14.1786C23.3158 13.3976 23.3158 12.1312 22.5347 11.3502L19.7063 8.52172C19.3158 8.1312 18.6826 8.1312 18.2921 8.52172C17.9016 8.91225 17.9016 9.54541 18.2921 9.93594L20.1708 11.8147H12.9992V4.64304L14.7774 6.4212C15.1679 6.81172 15.8011 6.81172 16.1916 6.4212Z"
                                        fill="#00A651" />
                                </svg>
                            </span>
                            DRAG TO REORDER
                        </div>
                        <p class="text-sm text-black font-normal flex">
                            Drag the
                            <svg
                                xmlns="http://www.w3.org/2000/svg"
                                width="16"
                                height="17"
                                viewBox="0 0 16 17"
                                fill="none">
                                <g clip-path="url(#clip0_4060_26163)">
                                    <path
                                        fill-rule="evenodd"
                                        clip-rule="evenodd"
                                        d="M5.71708 1.90751V1.90637L6.28851 1.90751H5.71708ZM5.71708 14.4789C6.34679 14.4789 6.85994 14.9921 6.85994 15.6218C6.85994 16.2515 6.34679 16.7646 5.71708 16.7646C5.08623 16.7646 4.57423 16.2515 4.57423 15.6218C4.57423 14.9921 5.08623 14.4789 5.71708 14.4789ZM10.2885 14.4789C10.9182 14.4789 11.4314 14.9921 11.4314 15.6218C11.4314 16.2515 10.9182 16.7646 10.2885 16.7646C9.65765 16.7646 9.14565 16.2515 9.14565 15.6218C9.14565 14.9921 9.65765 14.4789 10.2885 14.4789ZM5.71707 9.90751C6.34679 9.90751 6.85993 10.4206 6.85993 11.0504C6.85993 11.6801 6.34679 12.1932 5.71707 12.1932C5.08622 12.1932 4.57422 11.6801 4.57422 11.0504C4.57422 10.4206 5.08622 9.90751 5.71707 9.90751ZM10.2885 9.90751C10.9182 9.90751 11.4314 10.4206 11.4314 11.0504C11.4314 11.6801 10.9182 12.1932 10.2885 12.1932C9.65764 12.1932 9.14564 11.6801 9.14564 11.0504C9.14564 10.4206 9.65764 9.90751 10.2885 9.90751ZM5.71707 5.33607C6.34679 5.33607 6.85993 5.84922 6.85993 6.47892C6.85993 7.10864 6.34679 7.62178 5.71707 7.62178C5.08622 7.62178 4.57422 7.10864 4.57422 6.47892C4.57422 5.84922 5.08622 5.33607 5.71707 5.33607ZM10.2885 5.33607C10.9182 5.33607 11.4314 5.84922 11.4314 6.47892C11.4314 7.10864 10.9182 7.62178 10.2885 7.62178C9.65764 7.62178 9.14564 7.10864 9.14564 6.47892C9.14564 5.84922 9.65764 5.33607 10.2885 5.33607ZM5.71707 0.764648C6.34679 0.764648 6.85993 1.27779 6.85993 1.90751C6.85993 2.53722 6.34679 3.05037 5.71707 3.05037C5.08622 3.05037 4.57422 2.53722 4.57422 1.90751C4.57422 1.27779 5.08623 0.764648 5.71707 0.764648ZM10.2879 0.764648C10.9176 0.764648 11.4308 1.27779 11.4308 1.90751C11.4308 2.53722 10.9176 3.05037 10.2879 3.05037C9.65822 3.05037 9.14507 2.53722 9.14507 1.90751C9.14507 1.27779 9.65823 0.764648 10.2879 0.764648Z"
                                        fill="#2A2A2A" />
                                </g>
                                <defs>
                                    <clipPath id="clip0_4060_26163">
                                        <rect
                                            width="16"
                                            height="16"
                                            fill="white"
                                            transform="translate(0 0.764648)" />
                                    </clipPath>
                                </defs>
                            </svg>
                            handle to re-order Buyer’s Guide sections.
                        </p>
                    </div>
                    <!-- Add Step top  -->
                    <button
                        @click="addStep()"
                        type="button"
                        class="p-[16px] border border-ui-color/20 rounded-[10px] flex items-center gap-[4px] text-ui-color text-base font-medium">
                        <span class="w-[21px] h-[21px]">
                            <svg
                                xmlns="http://www.w3.org/2000/svg"
                                width="21"
                                height="22"
                                viewBox="0 0 21 22"
                                fill="none">
                                <path
                                    fill-rule="evenodd"
                                    clip-rule="evenodd"
                                    d="M10.5 19.9521C5.42587 19.9521 1.3125 15.8375 1.3125 10.7646C1.3125 5.69184 5.42587 1.57715 10.5 1.57715C15.5741 1.57715 19.6875 5.69184 19.6875 10.7646C19.6875 15.8375 15.5741 19.9521 10.5 19.9521ZM10.5 0.264648C4.70072 0.264648 0 4.9634 0 10.7646C0 16.5659 4.70072 21.2646 10.5 21.2646C16.2993 21.2646 21 16.5659 21 10.7646C21 4.9634 16.2993 0.264648 10.5 0.264648ZM14.4375 10.1084H11.1562V6.82715C11.1562 6.46621 10.8629 6.1709 10.5 6.1709C10.1371 6.1709 9.84375 6.46621 9.84375 6.82715V10.1084H6.5625C6.19959 10.1084 5.90625 10.4037 5.90625 10.7646C5.90625 11.1256 6.19959 11.4209 6.5625 11.4209H9.84375V14.7021C9.84375 15.0631 10.1371 15.3584 10.5 15.3584C10.8629 15.3584 11.1562 15.0631 11.1562 14.7021V11.4209H14.4375C14.8004 11.4209 15.0938 11.1256 15.0938 10.7646C15.0938 10.4037 14.8004 10.1084 14.4375 10.1084Z"
                                    fill="#00A651" />
                            </svg>
                        </span>
                        Add Another Step
                    </button>
                </div>
                <div
                    v-for="(accordion, index) in formData.accordions"
                    :key="index"
                    class="cursor-pointer bg-offwhite flex flex-col gap-[16px] rounded-[10px] w-full overflow-hidden"
                    :class="{
                        'h-[58px]': !isOpen[index],
                        'h-auto': isOpen[index],
                    }">
                    <div
                        @click="isOpen[index] = !isOpen[index]"
                        class="p-[16px] rounded-t-[10px] flex justify-between items-center"
                        :class="{
                            'bg-offwhite': !isOpen[index],
                            'bg-[#E8F1FF] border border-ui-color':
                                isOpen[index],
                        }">
                        <div
                            class="flex gap-[10px] text-lg font-semibold"
                            :class="{
                                'text-black': !isOpen[index],
                                'text-ui-color': isOpen[index],
                            }">
                            <span class="w-[24px] h-[24px]">
                                <svg
                                    xmlns="http://www.w3.org/2000/svg"
                                    width="24"
                                    height="25"
                                    viewBox="0 0 24 25"
                                    fill="none">
                                    <g
                                        opacity="0.4"
                                        clip-path="url(#clip0_4060_26170)">
                                        <path
                                            fill-rule="evenodd"
                                            clip-rule="evenodd"
                                            d="M8.57757 2.47894V2.47722L9.43472 2.47894H8.57757ZM8.57757 21.3361C9.52214 21.3361 10.2919 22.1058 10.2919 23.0504C10.2919 23.9949 9.52214 24.7646 8.57757 24.7646C7.63129 24.7646 6.86329 23.9949 6.86329 23.0504C6.86329 22.1058 7.63129 21.3361 8.57757 21.3361ZM15.4347 21.3361C16.3793 21.3361 17.149 22.1058 17.149 23.0504C17.149 23.9949 16.3793 24.7646 15.4347 24.7646C14.4884 24.7646 13.7204 23.9949 13.7204 23.0504C13.7204 22.1058 14.4884 21.3361 15.4347 21.3361ZM8.57756 14.4789C9.52213 14.4789 10.2918 15.2486 10.2918 16.1932C10.2918 17.1378 9.52213 17.9075 8.57756 17.9075C7.63128 17.9075 6.86328 17.1378 6.86328 16.1932C6.86328 15.2486 7.63128 14.4789 8.57756 14.4789ZM15.4347 14.4789C16.3793 14.4789 17.149 15.2486 17.149 16.1932C17.149 17.1378 16.3793 17.9075 15.4347 17.9075C14.4884 17.9075 13.7204 17.1378 13.7204 16.1932C13.7204 15.2486 14.4884 14.4789 15.4347 14.4789ZM8.57756 7.62177C9.52213 7.62177 10.2918 8.3915 10.2918 9.33606C10.2918 10.2806 9.52213 11.0503 8.57756 11.0503C7.63128 11.0503 6.86328 10.2806 6.86328 9.33606C6.86328 8.3915 7.63128 7.62177 8.57756 7.62177ZM15.4347 7.62177C16.3793 7.62177 17.149 8.3915 17.149 9.33606C17.149 10.2806 16.3793 11.0503 15.4347 11.0503C14.4884 11.0503 13.7204 10.2806 13.7204 9.33606C13.7204 8.3915 14.4884 7.62177 15.4347 7.62177ZM8.57756 0.764648C9.52213 0.764648 10.2918 1.53436 10.2918 2.47894C10.2918 3.42351 9.52213 4.19322 8.57756 4.19322C7.63128 4.19322 6.86328 3.42351 6.86328 2.47894C6.86328 1.53436 7.63129 0.764648 8.57756 0.764648ZM15.4338 0.764648C16.3784 0.764648 17.1481 1.53436 17.1481 2.47894C17.1481 3.42351 16.3784 4.19322 15.4338 4.19322C14.4893 4.19322 13.7196 3.42351 13.7196 2.47894C13.7196 1.53436 14.4893 0.764648 15.4338 0.764648Z"
                                            fill="#2A2A2A" />
                                    </g>
                                    <defs>
                                        <clipPath id="clip0_4060_26170">
                                            <rect
                                                width="24"
                                                height="24"
                                                fill="white"
                                                transform="translate(0 0.764648)" />
                                        </clipPath>
                                    </defs>
                                </svg>
                            </span>
                            {{ `Step ${index + 1}` }}
                        </div>
                        <span class="w-[24px] h-[24px]">
                            <svg
                                xmlns="http://www.w3.org/2000/svg"
                                width="24"
                                height="25"
                                viewBox="0 0 24 25"
                                fill="none"
                                :class="{ 'rotate-180': !isOpen[index] }">
                                <path
                                    fill-rule="evenodd"
                                    clip-rule="evenodd"
                                    d="M12.3982 9.5612C12.1785 9.34153 11.8224 9.34153 11.6027 9.5612L5.86788 15.2961C5.64821 15.5158 5.64821 15.8719 5.86788 16.0915L6.13305 16.3567C6.35271 16.5764 6.70887 16.5764 6.92854 16.3567L12.0005 11.2848L17.0724 16.3567C17.2921 16.5764 17.6482 16.5764 17.8679 16.3567L18.1331 16.0915C18.3527 15.8719 18.3527 15.5158 18.1331 15.2961L12.3982 9.5612Z"
                                    fill="#2A2A2A" />
                            </svg>
                        </span>
                    </div>
                    <div
                        class="w-full h-auto p-[16px] gap-y-[16px] flex flex-col">
                        <TextField
                            v-model="accordion.title"
                            :name="`accordion_title[${index}]`"
                            :label="`Step Title`"
                            :placeholder="`Enter title`"
                            :rules="'required|max:100'"
                            optionalMessage="Max 100 characters" />

                        <!-- <form-fieldsTextInput
                            v-model="accordion.title"
                            :name="`accordion_title[${index}]`"
                            :label="`Step Title`"
                            max="50"
                            :placeholder="`Enter title`" /> -->
                        <form-fieldsQuill
                            v-model="accordion.description"
                            :modelValue="accordion.description"
                            :name="`accordion_description[${index}]`"
                            :label="`Step Description`"
                            :max="400"
                            :placeholder="`Start typing...`" />
                        <input
                            type="hidden"
                            :name="`accordion_id[${index}]`"
                            v-model="accordion.id" />
                        <DeleteItem
                            v-if="
                                accordion.id || formData.accordions.length > 1
                            "
                            :id="accordion.id"
                            :model="'Accordion'"
                            :index="index"
                            @removeItem="removeStep"
                            class="self-end" />
                    </div>
                </div>
                <!-- add step bottom -->
                <div class="w-full justify-center flex">
                    <button
                        @click="addStep()"
                        type="button"
                        class="p-[16px] border border-ui-color/20 rounded-[10px] flex items-center gap-[4px] text-ui-color text-base font-medium">
                        <span class="w-[21px] h-[21px]">
                            <svg
                                xmlns="http://www.w3.org/2000/svg"
                                width="21"
                                height="22"
                                viewBox="0 0 21 22"
                                fill="none">
                                <path
                                    fill-rule="evenodd"
                                    clip-rule="evenodd"
                                    d="M10.5 19.9521C5.42587 19.9521 1.3125 15.8375 1.3125 10.7646C1.3125 5.69184 5.42587 1.57715 10.5 1.57715C15.5741 1.57715 19.6875 5.69184 19.6875 10.7646C19.6875 15.8375 15.5741 19.9521 10.5 19.9521ZM10.5 0.264648C4.70072 0.264648 0 4.9634 0 10.7646C0 16.5659 4.70072 21.2646 10.5 21.2646C16.2993 21.2646 21 16.5659 21 10.7646C21 4.9634 16.2993 0.264648 10.5 0.264648ZM14.4375 10.1084H11.1562V6.82715C11.1562 6.46621 10.8629 6.1709 10.5 6.1709C10.1371 6.1709 9.84375 6.46621 9.84375 6.82715V10.1084H6.5625C6.19959 10.1084 5.90625 10.4037 5.90625 10.7646C5.90625 11.1256 6.19959 11.4209 6.5625 11.4209H9.84375V14.7021C9.84375 15.0631 10.1371 15.3584 10.5 15.3584C10.8629 15.3584 11.1562 15.0631 11.1562 14.7021V11.4209H14.4375C14.8004 11.4209 15.0938 11.1256 15.0938 10.7646C15.0938 10.4037 14.8004 10.1084 14.4375 10.1084Z"
                                    fill="#00A651" />
                            </svg>
                        </span>
                        Add Another Step
                    </button>
                </div>
            </div>
            <!-- here  -->

            <div class="bg-white p-4 flex flex-col gap-4 rounded-lg">
                <div class="flex w-max gap-[8px] items-center">
                    <h2 class="text-xl text-start font-[500] text-ui-color">
                        Has Button
                    </h2>
                    <span
                        class="text-[14px] opacity-40 flex items-center gap-[8px]"
                        >This Popup will have a Button</span
                    >
                </div>
                <div class="flex flex-col gap-2">
                    <Field
                        name="isPublished"
                        type="checkbox"
                        v-slot="{ field }">
                        <div class="flex items-center gap-2">
                            <button
                                type="button"
                                @click="togglePublished"
                                class="w-10 h-6 rounded-xl flex items-center p-0.5 transition-colors hover:border hover:border-black"
                                :class="[
                                    isPublished
                                        ? 'bg-ui-color justify-end'
                                        : 'bg-light-gray justify-start',
                                ]">
                                <div
                                    class="w-5 h-5 bg-white rounded-full"></div>
                            </button>
                            {{ isPublished ? 'Yes' : 'No' }}
                        </div>
                    </Field>
                </div>
                <div class="grid grid-cols-2 gap-[16px]">
                    <Field
                        v-slot="{ field }"
                        name="button_name">
                        <TextField
                            :rules="isPublished ? 'required|max:50' : ''"
                            v-bind="field"
                            :disabled="!isPublished"
                            class="mb-4 border-b border-[#E9E9E9] pb-4"
                            label="Button Text"
                            placeholder="Sample Button" />
                    </Field>

                    <div class="relative">
                        <Field
                            v-slot="{ field }"
                            name="link">
                            <TextField
                                :rules="isPublished ? 'required' : ''"
                                v-bind="field"
                                :disabled="!isPublished"
                                class="mb-4 border-b border-[#E9E9E9] pb-4"
                                label="Button Link"
                                placeholder="https:" />

                            <div
                                class="absolute top-0 right-0 flex items-center gap-2">
                                <button
                                    type="button"
                                    @click="toggleLinkOut"
                                    class="w-10 h-6 rounded-xl flex items-center p-0.5 transition-colors hover:border hover:border-black"
                                    :class="[
                                        isLinkOut
                                            ? 'bg-ui-color justify-end'
                                            : 'bg-light-gray justify-start',
                                    ]">
                                    <div
                                        class="w-5 h-5 bg-white rounded-full"></div>
                                </button>
                                <span>Link Out</span>
                            </div>
                        </Field>
                    </div>
                </div>
            </div>
        </Form>
    </div>
    <div class="w-full flex items-center justify-between bg-white px-4 py-3">
        <NuxtLink
            :to="`/payment-channels/payment-methods/${route.params.methodId}/payment-platforms`"
            class="flex gap-2 items-center">
            <svg
                width="32"
                height="32"
                viewBox="0 0 32 32"
                fill="none"
                xmlns="http://www.w3.org/2000/svg">
                <path
                    d="M6.6665 16H25.3332M6.6665 16L14.6665 8M6.6665 16L14.6665 24"
                    stroke="#00A651"
                    stroke-width="3"
                    stroke-linecap="round"
                    stroke-linejoin="round" />
            </svg>
            <span class="text-ui-color">Back to Payment Platforms</span>
        </NuxtLink>

        <button
            class="main-button"
            form="form">
            Save Payment Platform
        </button>
    </div>
</template>

<script setup>
import { Form, Field } from 'vee-validate';
import { usePageTitleStore } from '~/stores/pageTitle';
import { ref, onMounted } from 'vue';
import { useRoute } from 'vue-router';

const route = useRoute();
const initialValues = {
    paymentMethodName: '',
    isPublished: false,
    buttonText: '',
    buttonLink: '',
    isLinkOut: false,
};
const isPublished = ref(initialValues.isPublished);
const isLinkOut = ref(initialValues.isLinkOut);
const pageTitle = usePageTitleStore();
const main_image = ref([]);
const handleFileUpdate = (field, file) => {
    main_image.value = file;
};

const togglePublished = () => {
    isPublished.value = !isPublished.value;
};

const toggleLinkOut = () => {
    isLinkOut.value = !isLinkOut.value;
};

// Initialize with at least one step
onMounted(() => {
    pageTitle.reset();
    pageTitle.setTitle('Payment Platform');
    pageTitle.setBreadcrumbs([
        'Payment Channels',
        'Payment Methods',
        'Add Payment Platform',
    ]);

    pageTitle.setPageFrom('Payment Channels');
    pageTitle.setPageFromRoute(
        `/payment-channels/payment-methods/${route.params.methodId}/payment-platforms`
    );

    // Add initial step if none exist
    if (formData.accordions.length === 0) {
        addStep();
    }

    // Initialize isOpen array to match accordion length
    isOpen.value = new Array(formData.accordions.length).fill(true);
});
// console.log(payload);

// await nuxtApp.$axios.post('/cms/payment-methods', payload);

// await navigateTo({
//     path: '/payment-channels/payment-methods',
//     query: {
//         toast: 'save-success',
//     },
// });
const nuxtApp = useNuxtApp();
// Update onSubmit to include isLinkOut in the payload
const onSubmit = async values => {
    try {
        const formElement = document.getElementById('form');
        const form_data = new FormData(formElement);

        formData.accordions.forEach((a, index) => {
            form_data.append(
                `accordion_description[${index}]`,
                formData.accordions[index].description
            );
            form_data.append(`accordion_order[${index}]`, index + 1);
        });

        main_image.value.forEach((file, index) => {
            form_data.append(`main_image[]`, file);
        });

        values.isPublished = isPublished.value;
        values.isLinkOut = isLinkOut.value; // Add this to the values

            form_data.append('is_link_out', isLinkOut.value ? 1 : 0);
            form_data.append('payment_method_id', route.params.methodId);
            form_data.append('isPublished', isPublished.value);
        
        // for (let pair of form_data.entries()) {
        //     console.log(pair[0], pair[1]);
        // }
        // Get all step data from formData.accordions
        // const steps = formData.accordions.map((accordion, index) => ({
        //     id: accordion.id || null,
        //     title: accordion.title,
        //     description: accordion.description,
        //     order: index + 1,
        // }));

        // const payload = {
        //     parent_id: route.params.methodId,
        //     name: values.paymentMethodName,
        //     isPublished: values.isPublished,
        //     buttonText: values.buttonText,
        //     buttonLink: values.buttonLink,
        //     isLinkOut: values.isLinkOut, // Add this to the payload
        //     steps: steps,
        //     sequence: values.sequence,
        // };

        // console.log(payload);

        // console.log('Form submission payload:', payload);
        // payment-methods.payment-platforms
        // Uncomment when ready to make the API call
        await nuxtApp.$axios.post(
            `/cms/payment-methods/${route.params.methodId}/payment-platforms`,
            form_data,
            {
                headers: {
                    'Content-Type': 'multipart/form-data',
                },
            }
        );
        await navigateTo({
            path: `/payment-channels/payment-methods/${route.params.methodId}/payment-platforms`,
            query: {
                toast: 'save-success',
            },
        });
    } catch (error) {
        console.error('Error submitting form:', error);
        nuxtApp.$toast.error(
            error.response?.data?.message ||
                'An error occurred while saving the payment platform'
        );
    }
};

const formData = reactive({
    title: '',
    accordions: [],
});

const isOpen = ref([]);

// Add new step
const addStep = () => {
    formData.accordions.push({
        title: '',
        description: '',
        order: formData.accordions.length + 1,
        icon: [],
    });
};

// Remove step
const removeStep = index => {
    formData.accordions.splice(index, 1);
};

// Handle file updates for steps
// const handleFileUpdate = (field, file) => {
//     const idx = parseInt(field.match(/\d+$/), 10);
//     const fieldName = field.replace(/\d+$/, "");

//     if (!icons.value[idx]) {
//         icons.value[idx] = {};
//     }
//     icons.value[idx][fieldName] = file;
// };

definePageMeta({
    middleware: 'authenticator',
});
</script>

<style scoped>
th {
    padding-block: 8px;
}

th,
td {
    text-align: left;
}
th:first-child,
td:first-child {
    padding-left: 24px;
}

th:last-child,
td:last-child {
    padding-right: 24px;
}
</style>
