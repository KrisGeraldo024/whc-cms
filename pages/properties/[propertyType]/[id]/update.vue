<template>
    <div class="relative w-full p-[16px] bg-offwhite flex flex-col gap-[16px] overflow-y-auto mb-[32px]">
        <Form v-if="sectionData" id="form" @submit="submit()" @invalid-submit="onInvalidSubmit" class="w-full gap-[16px] flex flex-col" >
            <div class="bg-white p-[16px] flex flex-col gap-[16px] rounded-[10px] w-full">
                <h2 class="font-semibold text-xl text-start w-full">{{ `Community Information` }}</h2>
                <div class="grid grid-cols-2 gap-[16px]">
                    <TextField
                    v-model="formData.title"
                    label="Community Name"
                    name="title"
                    placeholder="e.g. Community ABC"
                    :rules="'required|max:50'"
                    optionalMessage="Max 50 characters" 
                    :hasErrors="hasErrors"/>

                    <SelectField v-if="locations"
                    v-model="formData.location_id"
                    label="Location"
                    name="location_id"
                    placeholder="Choose a Location"
                    :options="locations"
                    rules="required"
                    :hasErrors="hasErrors"/>

                    <TextField
                    v-model="formData.address"
                    label="Community Address"
                    name="address"
                    placeholder="e.g. Community ABC address"
                    :rules="'max:100'"
                    optionalMessage="" 
                    :hasErrors="hasErrors"/>

                    <TextField
                    v-model="formData.gmap_url"
                    label="Google Maps URL"
                    name="gmap_url"
                    placeholder="Paste Google Maps Link"
                    :rules="''"
                    optionalMessage="PLease paste the Google Maps link here." 
                    :hasErrors="hasErrors"/>

                    
                </div>
                <div class="grid gap-[16px]" :class='{"grid-cols-3" : propertyType === "condominiums", "grid-cols-2" : propertyType === "house-and-lots"}'>
                        <TextField v-if="propertyType === 'condominiums'"
                        label="No. of Towers"
                        name="towers"
                        v-model="formData.towers"
                        placeholder="e.g. 1"
                        :rules="'max:50'"
                        optionalMessage="" 
                        :hasErrors="hasErrors"/>

                        <TextField
                        v-model="formData.property_size"
                        label="Property Size"
                        name="property_size"
                        placeholder="e.g. 100 sqm"
                        :rules="'max:50'"
                        optionalMessage="" 
                        :hasErrors="hasErrors"/>

                        <TextField
                        v-model="formData.starts_at"
                        label="Price"
                        name="starts_at"
                        placeholder="e.g. 100 sqm"
                        :rules="'required|max:50'"
                        optionalMessage="Separate with a comma (,)" 
                        :hasErrors="hasErrors"/>
                    </div>
                
                <hr class="h-[1px] w-full border-gray">

                <!-- <div class="bg-white p-[16px] flex flex-col gap-[16px] rounded-[10px] w-full"> -->
                    <!-- <h2 class="font-semibold text-xl text-start w-full">{{`Main Community Banner Image`}}</h2> -->
                    <ImageHandler 
                        label="Main Community Banner Image" 
                        :data="main_image"
                        :max="'1'"
                        :dimension="{width: 1280, height: 728}"
                        size="5"
                        :input_payload="{
                            identifier: 'main_image',
                            id: 'main_image_id',
                            category: 'main_image_category',
                            category_value: 'main_image',
                            alt: 'main_image_alt',
                        }"
                    ref="imageHandler0"
                    :required="true"
                        v-model="formData.main_image[0]"
                        @update:file="handleFileUpdate('main_image', $event)"
                    />
                    <ImageTips />
                <!-- </div> -->

                <hr class="h-[1px] w-full border-gray">

                <Quill v-if="isClient" v-model="formData.description" :modelValue="formData.description" :name="`description`" :label="`Short Community Summary`" 
                :max="2500" :placeholder="`Enter your description here...`"/>
            </div>
            <div class="bg-white p-[16px] flex flex-col gap-[16px] rounded-[10px] w-full">
                <h2 class="font-semibold text-xl text-start w-full">Video Walkthrough (Optional)</h2>
                <TextField
                    v-model="formData.yt_url"
                    label="Youtube URL"
                    name="yt_url"
                    placeholder="Paste YouTube Link"
                    :rules="'https'"
                    optionalMessage="Please paste the YouTube link of your video here." 
                    :hasErrors="hasErrors"/>
                <hr class="h-[1px] w-full border-gray">
                <ImageHandler 
                    label="Upload an image thumbnail" 
                    :data="thumbnail"
                    :max="'1'"
                    :dimension="{width: 956, height: 546}"
                    size="5"
                    :input_payload="{
                        identifier: 'thumbnail',
                        id: 'thumbnail_id',
                        category: 'thumbnail_category',
                        category_value: 'thumbnail',
                        alt: 'thumbnail_alt',
                    }"
                    @update:file="handleFileUpdate('thumbnail', $event)"
                />
                <hr class="h-[1px] w-full border-gray">
                <TextField
                    v-model="formData.yt_title"
                    label="Video Walkthrough Header Copy"
                    name="yt_title"
                    placeholder="e.g. See what’s around Community ABC"
                    :rules="'max:100'"
                    optionalMessage="Max 100 characters" 
                        :hasErrors="hasErrors"/>
            </div>
            <div class="bg-white p-[16px] flex flex-col gap-[16px] rounded-[10px] w-full">
                <h2 class="font-semibold text-xl text-start w-full">Vicinity Map</h2>
                <ImageHandler 
                    label="Upload an image" 
                    :data="vicinity_image"
                    :max="'1'"
                    :dimension="{width: 530, height: 528}"
                    size="5"
                    :input_payload="{
                        identifier: 'vicinity_image',
                        id: 'vicinity_image_id',
                        category: 'vicinity_image_category',
                        category_value: 'vicinity_image',
                        alt: 'vicinity_image_alt',
                    }"
                    ref="imageHandler1"
                    :required="true"
                    v-model="formData.vicinity_image[0]"
                    @update:file="handleFileUpdate('vicinity_image', $event)"
                />
                <TextField
                    v-model="formData.vicinity_title"
                    label="Vicinity Map Header Copy (Optional)"
                    name="vicinity_title"
                    placeholder="e.g. See what’s around Community ABC"
                    :rules="'max:50'"
                    optionalMessage="Max 50 characters" 
                        :hasErrors="hasErrors"/>
            </div>
            <div class="bg-white p-[16px] flex flex-col gap-[16px] rounded-[10px] w-full">
                <h2 class="font-semibold text-xl text-start w-full">Units List</h2>
                <TextField
                    v-model="formData.unit_list_title"
                    label="Units List Header Copy (Optional)"
                    name="unit_list_title"
                    placeholder="e.g. See what’s around Community ABC"
                    :rules="'max:50'"
                    optionalMessage="Max 50 characters" 
                        :hasErrors="hasErrors"/>
                <HowToAdd :title="`Units`" :link="`/properties/${propertyType}/${route.params.id}/units`"/>
            </div>
            <div class="bg-white p-[16px] flex flex-col gap-[16px] rounded-[10px] w-full">
                <h2 class="font-semibold text-xl text-start w-full">{{ `${formattedTitle} Features` }} <span class="text-base font-normal text-black/40">Minimum of 3</span></h2>
                <div class="flex flex-row justify-between items-center w-full">
                    <DraggableComponent />
                    <button @click="addFeature()" type="button" class="p-[16px] border border-ui-color/20 rounded-[10px] flex items-center gap-[4px] text-ui-color text-base font-medium">
                        <span class="w-[21px] h-[21px]">
                            <svg xmlns="http://www.w3.org/2000/svg" width="21" height="22" viewBox="0 0 21 22" fill="none">
                            <path fill-rule="evenodd" clip-rule="evenodd" d="M10.5 19.9521C5.42587 19.9521 1.3125 15.8375 1.3125 10.7646C1.3125 5.69184 5.42587 1.57715 10.5 1.57715C15.5741 1.57715 19.6875 5.69184 19.6875 10.7646C19.6875 15.8375 15.5741 19.9521 10.5 19.9521ZM10.5 0.264648C4.70072 0.264648 0 4.9634 0 10.7646C0 16.5659 4.70072 21.2646 10.5 21.2646C16.2993 21.2646 21 16.5659 21 10.7646C21 4.9634 16.2993 0.264648 10.5 0.264648ZM14.4375 10.1084H11.1562V6.82715C11.1562 6.46621 10.8629 6.1709 10.5 6.1709C10.1371 6.1709 9.84375 6.46621 9.84375 6.82715V10.1084H6.5625C6.19959 10.1084 5.90625 10.4037 5.90625 10.7646C5.90625 11.1256 6.19959 11.4209 6.5625 11.4209H9.84375V14.7021C9.84375 15.0631 10.1371 15.3584 10.5 15.3584C10.8629 15.3584 11.1562 15.0631 11.1562 14.7021V11.4209H14.4375C14.8004 11.4209 15.0938 11.1256 15.0938 10.7646C15.0938 10.4037 14.8004 10.1084 14.4375 10.1084Z" fill="#00A651"/>
                            </svg>
                        </span>
                        Add Another Feature
                    </button>
                </div>
                <Draggable v-if="formData.features && formData.features.length && formData.feature_icon.length > 0" v-model="formData.features" handle=".handle" item-key="id"  @update:modelValue="onReorder"  class="flex flex-col gap-[16px]">
                    <template #item="{element: feature, index: featureIndex}">
                        <div class="cursor-pointer bg-offwhite flex flex-col gap-[16px] rounded-[10px] w-full overflow-hidden" 
                        :class="{'h-[58px]' : !isOpen[featureIndex], 'h-auto' : isOpen[featureIndex]}">
                            <div  @click="isOpen[featureIndex] = !isOpen[featureIndex]" class="p-[16px] rounded-t-[10px] flex justify-between items-center" 
                            :class="{'bg-offwhite' : !isOpen[featureIndex], 'bg-[#E8F1FF] border border-ui-color' : isOpen[featureIndex]}">
                                <div class="flex gap-[10px] text-lg font-semibold" :class="{'text-black' : !isOpen[featureIndex], 'text-ui-color' : isOpen[featureIndex]}">
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
                                    {{`Property Features ${featureIndex < 9 ? '0' : ''}${featureIndex + 1}`}}
                                </div>
                                <span class="w-[24px] h-[24px]">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="25" viewBox="0 0 24 25" fill="none" :class="{'rotate-180': !isOpen[featureIndex]}">
                                    <path fill-rule="evenodd" clip-rule="evenodd" d="M12.3982 9.5612C12.1785 9.34153 11.8224 9.34153 11.6027 9.5612L5.86788 15.2961C5.64821 15.5158 5.64821 15.8719 5.86788 16.0915L6.13305 16.3567C6.35271 16.5764 6.70887 16.5764 6.92854 16.3567L12.0005 11.2848L17.0724 16.3567C17.2921 16.5764 17.6482 16.5764 17.8679 16.3567L18.1331 16.0915C18.3527 15.8719 18.3527 15.5158 18.1331 15.2961L12.3982 9.5612Z" fill="#2A2A2A"/>
                                    </svg>
                                </span>
                            </div>
                            <div class="w-full h-auto p-[16px] gap-y-[16px] flex flex-col">
                                <ImageHandler 
                                    label="Feature Icon"
                                    :data="feature_icon[featureIndex]"
                                    max="1"
                                    size="5"
                                    :dimension="{width:79, height:79}"
                                    :input_payload="{
                                        identifier: `feature_icon${featureIndex}`,
                                        id: `feature_icon${featureIndex}_id`,
                                        category: `feature_icon${featureIndex}_category`,
                                        category_value: 'feature_icon',
                                        alt: `feature_icon${featureIndex}_alt`,
                                    }"
                                    :required="true"
                                    :ref="(el) => (imageHandlers[featureIndex] = el)"
                                    v-model="formData.feature_icon[featureIndex][0]"
                                    @update:file="handleFileUpdate(`feature_icon${featureIndex}`, $event)"
                                />
                                <TextField
                                v-model="feature.content"
                                label="Feature Title"
                                :name="`feature_title[${featureIndex}]`"
                                placeholder="Enter feature title"
                                :rules="'required|max:100'"
                                optionalMessage="Max 100 characters" 
                                :hasErrors="hasErrors"/>
                                <input type="hidden" :name="`feature_order[${featureIndex}]`" :value="featureIndex + 1">
                                <input type="hidden" :name="`feature_id[${featureIndex}]`" :value="feature.id">
                                
                                <DeleteItem v-if="feature.id || formData.features.length > 1" :id="feature.id" :model="'Feature'" :index="featureIndex" 
                                    @removeItem="removeFeature(featureIndex)" class="self-end"/>
                            </div>
                        </div>
                    </template>
                </Draggable>
                <div class="w-full justify-center flex">
                    <button  @click="addFeature()" type="button" class="p-[16px] border border-ui-color/20 rounded-[10px] flex items-center gap-[4px] text-ui-color text-base font-medium">
                        <span class="w-[21px] h-[21px]">
                            <svg xmlns="http://www.w3.org/2000/svg" width="21" height="22" viewBox="0 0 21 22" fill="none">
                            <path fill-rule="evenodd" clip-rule="evenodd" d="M10.5 19.9521C5.42587 19.9521 1.3125 15.8375 1.3125 10.7646C1.3125 5.69184 5.42587 1.57715 10.5 1.57715C15.5741 1.57715 19.6875 5.69184 19.6875 10.7646C19.6875 15.8375 15.5741 19.9521 10.5 19.9521ZM10.5 0.264648C4.70072 0.264648 0 4.9634 0 10.7646C0 16.5659 4.70072 21.2646 10.5 21.2646C16.2993 21.2646 21 16.5659 21 10.7646C21 4.9634 16.2993 0.264648 10.5 0.264648ZM14.4375 10.1084H11.1562V6.82715C11.1562 6.46621 10.8629 6.1709 10.5 6.1709C10.1371 6.1709 9.84375 6.46621 9.84375 6.82715V10.1084H6.5625C6.19959 10.1084 5.90625 10.4037 5.90625 10.7646C5.90625 11.1256 6.19959 11.4209 6.5625 11.4209H9.84375V14.7021C9.84375 15.0631 10.1371 15.3584 10.5 15.3584C10.8629 15.3584 11.1562 15.0631 11.1562 14.7021V11.4209H14.4375C14.8004 11.4209 15.0938 11.1256 15.0938 10.7646C15.0938 10.4037 14.8004 10.1084 14.4375 10.1084Z" fill="#00A651"/>
                            </svg>
                        </span>
                        Add Another Feature
                    </button>
                </div>
            </div>
            <div class="bg-white p-[16px] flex flex-col gap-[16px] rounded-[10px] w-full">
                <h2 class="font-semibold text-xl text-start w-full">Amenities Gallery</h2>
                <TextField
                v-model="formData.amenities_title"
                label="Amenities Header Copy (Optional)"
                :name="`amenities_title`"
                placeholder="Enter amenity title"
                :rules="'max:50'"
                optionalMessage="Max 50 characters" 
                        :hasErrors="hasErrors"/>
                <ImageHandler 
                    label="Upload Images"
                    :data="amenity_gallery"
                            :dimension="{width:812, height:440}"
                    max="100"
                    size="5"
                    :type="'amenity_gallery'"
                    :input_payload="{
                        identifier: 'amenity_gallery',
                        id: 'amenity_gallery_id',
                        category: 'amenity_gallery_category',
                        category_value: 'amenity_gallery',
                        alt: 'amenity_gallery_alt',
                    }"
                    @update:file="handleFileUpdate(`amenity_gallery`, $event)"
                />
                <HowToAdd :title="`Amenities`" :link="`/properties/${propertyType}/${id}/amenities`"/>
            </div>
            <div class="bg-white p-[16px] flex flex-col gap-[16px] rounded-[10px] w-full">
                <h2 class="font-semibold text-xl text-start w-full">Digital Brochure Banner (Optional)</h2>
                <TextField
                v-model="formData.digital_brochure.title"
                @input="handleDigitalBrochureTitle"
                label="Digital Brochure Header Copy"
                :name="`digital_brochure[title]`"
                placeholder="Enter digital brochure title"
                :rules="'max:50'"
                optionalMessage="Max 50 characters" 
                        :hasErrors="hasErrors"/>
                <ImageHandler 
                    label="Upload Images"
                    :data="digital_brochure_image"
                    :dimension="{width:79, height:79}"
                    max="1"
                    size="5"
                    :type="'digital_brochure'"
                    :input_payload="{
                        identifier: 'digital_brochure_image',
                        id: 'digital_brochure_image_id',
                        category: 'digital_brochure_image_category',
                        category_value: 'digital_brochure_image',
                        alt: 'digital_brochure_image_alt',
                    }"
                    @update:file="handleFileUpdate(`digital_brochure_image`, $event)"
                />
                <div class="bg-white p-[16px] flex flex-col gap-[16px] rounded-[10px] w-full">
                    <h2 class="font-semibold text-xl text-start w-full">Banner Button</h2>
                    <div class="flex flex-col gap-[8px]">
                        <!-- <h3 class="font-normal text-base text-ui-color">Has Button <span class="text-sm font-normal text-black/40">This banner will have 2 CTA Button</span></h3> -->
                        <h3 class="font-normal text-base text-ui-color">Has Button</h3>
                        <div class="pr-[16px] py-[12px] justify-start gap-[8px] flex">
                            <div  class="cursor-pointer w-[40px] h-[24px] rounded-[12px] flex  items-center hover:border hover:border-black p-[3px]" 
                            :class="{'bg-ui-color justify-end' : formData.digital_brochure.has_button, 'bg-light-gray justify-start' : !formData.digital_brochure.has_button}">
                                <div class="w-[20px] h-[20px] bg-white rounded-full"></div>
                            </div>
                            {{ formData.digital_brochure.has_button ? 'Yes' : 'No' }}
                        </div>
                    </div>
                    <!-- <div v-for="(button, index) in formData.buttons" :key="index" class=""> -->
                        <Button v-if="formData.digital_brochure.has_button" :name="`digital_brochure`" :button="formData.digital_brochure.buttons ? formData.digital_brochure.buttons[0] : {}" />
                    <!-- </div> -->
                </div>
            </div>
            <div class="bg-white p-[16px] flex flex-col gap-[16px] rounded-[10px] w-full">
                <h2 class="font-semibold text-xl text-start w-full">Community Status</h2>
                <div class="flex gap-[16px] justify-start">
                    <div class="w-1/2">
                        <SelectField v-if="locations"
                        label="Property Label"
                        v-model="formData.status_id"
                        name="status_id"
                        placeholder="Choose a Label"
                        :options="status"
                        rules="required"
                        :hasErrors="hasErrors"/>
                    </div>
                    <div class="flex gap-[16px]">
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
            </div>
            <Metadata :meta_title="formData.meta_title" :meta_description="formData.meta_description" :link_rel="formData.link_rel" />
            <Tracking :tracking_code="formData.tracking_code"/>
            <button type="submit" class="px-[24px] py-[12px] bg-ui-color text-white text-center rounded-[10px] self-end">Publish Update</button>
        </Form>
    </div>
</template>
<script setup>
    import { Form } from 'vee-validate';
    import { usePageTitleStore } from '~/stores/pageTitle';
    import { usePaginationStore } from '~/stores/pagination';
    import { useFilterStore } from '~/stores/filters';
    import { useSidebarStore } from '~/stores/sidebar';
    import { useRoute } from 'vue-router';
    import { onMounted } from 'vue';
    import Draggable from 'vuedraggable';
    import DraggableComponent from '~/components/Draggable.vue';

    definePageMeta({
        middleware: 'authenticator'
    })

    const id = useRoute().params.id;

    const isClient = ref(false);

    
    const ImageHandler = defineAsyncComponent(() => {
        return import('@/components/form-fields/ImageHandler.vue')
    })
    const Quill = defineAsyncComponent(() => {
        return import('@/components/form-fields/Quill.vue')
    })
    const Button = defineAsyncComponent(() => {
        return import('@/components/form-fields/Button.vue')
    })

    const pageTitle = usePageTitleStore();
    const pagination = usePaginationStore();
    const route = useRoute();

    const propertyType = route.params.propertyType; 

    
    const formattedTitle = ref('');
    const secondLastSegment = ref('');

    onMounted(() => {
        isClient.value = true;
        const currentPath = route.path; // Get the current path
        const pathSegments = route.path.split('/'); 

        const firstPathSegment = currentPath.split('/')[1]; // Split by '/' and get the first segment after the base
        
        if (pathSegments.length > 3) {
            secondLastSegment.value = pathSegments[pathSegments.length - 3];
        }

        formattedTitle.value = secondLastSegment.value
            .replace(/-/g, ' ') // Replace dashes with spaces
            .replace(/\b\w/g, char => char.toUpperCase()); // Capitalize the first letter of each word


        // console.log(formattedTitle); // Output: 'Featured House & Lots'
        pageTitle.setTitle(`Edit ${formattedTitle.value}`);
        pageTitle.setBreadcrumbs(['Properties', formattedTitle.value, 'Edit Community']);

        pageTitle.setPageFrom(formattedTitle.value);
        pageTitle.setPageFromRoute('/properties/' + propertyType);
        fetchRecords();
        if (sectionData.value) {
            populateData(sectionData.value);
        }
    });

    const nuxtApp = useNuxtApp();
    const locations = ref(null);
    const status = ref(null);

    const sectionData = ref(null);
    
    const fetchRecords = async () => {
        formData.features = [];
        try {
            const location_response = await nuxtApp.$axios.get(`/cms/taxonomies/property-locations?all=true`); 
            const status_response = await nuxtApp.$axios.get(`/cms/taxonomies/property-statuses?all=true`); 
            // const properties = await nuxtApp.$axios.get(`/cms/properties?page=${pagination.page}
            // &propertyType=${properyType}
            // &location=${filter.value}
            // &sortBy=${sortBy.value}
            // &sortDirection=${sortDirection.value}`); 
            locations.value = location_response.data.map((record) => ({
                value: record.id,
                label: record.name
            }));
            status.value = status_response.data.map((record) => ({
                value: record.id,
                label: record.name
            }));

            const res = await nuxtApp.$axios.get(`/cms/properties/${id}`);
            sectionData.value = res.data.record;
            // properties.value = properties.data.records;
        } catch (error) {
            console.error('Error:', error);
        }
    };

    const handleDigitalBrochureTitle = (e) => {
        if (e.target.value != '') {
            formData.digital_brochure.has_button = 1;
        } else {
            formData.digital_brochure.has_button = 0;
        }
    }

    const formData = reactive({
        title: '',
        description: '',
        address: '',
        gmap_url: '',
        property_size: '',
        starts_at: '',
        towers: '',
        featured: 0,
        enabled: 1,
        location_id: '',
        status_id: '',
        features: [],
        digital_brochure: {
            has_button: 0,
            title: '',
        },
        vicinity_title: '',
        amenities_title: '',
        unit_list_title : '',

        yt_url: '',
        yt_title: '',

        meta_title: '',
        meta_description: '',
        link_rel: 'Canonical',

        tracking_code: '',

        main_image: [],
        thumbnail: [],
        vicinity_image: [],
        digital_brochure_image: [],
        amenity_gallery: [],
        feature_icon: [],
    });

    const main_image = ref([]);
    const thumbnail = ref([]);
    const vicinity_image = ref([]);
    const digital_brochure_image = ref([]);
    const feature_icon = ref([]);
    const amenity_gallery = ref([]);

    const isOpen = ref([]);
    const isEnabled = ref(true);

    const addFeature = () => {
        formData.features.push({    
            title: '',  
        });
        
        formData.features.forEach((_, index) => {
            if (!formData.feature_icon[index]) {
                formData.feature_icon[index] = []; // Initialize each accordion index as an array
            }
        });
    }
    
    const removeFeature = (index) => {
        formData.features.splice(index, 1);
        fetchRecords();
    }

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
                model: 'Feature',
                data: form_data.value
            } , {
                headers: {
                    'Content-Type': 'multipart/form-data',
                },
            }).then((response) => {
                formData.features = [];
                fetchRecords();
                nuxtApp.$toast.success('Steps reordered successfully!');
            }); 

        } catch (error) {
            console.error('Error:', error);
        }
    }

    const handleFileUpdate = (field, file) => {
        const idx = parseInt(field.match(/\d+$/), 10); // Get the number from the field string
        const fieldName = field.replace(/\d+$/, ""); // Remove the number to get the base field name

        if (!Number.isNaN(idx)) {

            // if (!icons.value[idx]) {
            //     icons.value[idx] = {}; 
            // }
            formData[fieldName][idx] = file;
            // console.log(formData[fieldName][idx]);
        } else {
            
            formData[fieldName] = file; // Updates the specific image field
            // console.log(formData[fieldName]);
            
        }
    };
    
    const imageHandler0 = ref(null);
    const imageHandler1 = ref(null);
    const imageHandlers = ref([]);

    const hasErrors = ref({});
    const onInvalidSubmit = ({ values, errors, results }) => {
        hasErrors.value = errors;
        // console.log(hasErrors.value)
        let isFormValid = true;
        if (imageHandler0.value?.validate && !imageHandler0.value.validate() && main_image.value.length == 0) {
            isFormValid = false;
            console.log(isFormValid)
        }
        if (imageHandler1.value?.validate && !imageHandler1.value.validate() && vicinity_image.value.length == 0) {
            isFormValid = false;
        }
        imageHandlers.value.forEach((handler, index) => {
            if (handler?.validate && !handler.validate()) {
                isFormValid = false;
            console.error(`Validation failed for image at index ${index}`);
            }
        });
        nuxtApp.$toast.error('There are fields that require your attention. Kindly review the form.')
    }

    const submit = async () => {
        let isValid = true;
        if (imageHandler0.value?.validate && !imageHandler0.value.validate() && main_image.value.length == 0) {
            isValid = false;
            console.log('isvalid: ' + isValid)
        }
        if (imageHandler1.value?.validate && !imageHandler1.value.validate() && vicinity_image.value.length == 0) {
            isValid = false;
        }
        imageHandlers.value.forEach((handler, index) => {
            if (handler?.validate && !handler.validate()) {
            isValid = false;
            console.error(`Validation failed for image at index ${index}`);
            }
        });

        const formElement = document.getElementById('form');
        const form_data = new FormData(formElement);
       
        formData.main_image.forEach((file, index) => {
            form_data.append(`main_image[]`, file)
        })
        formData.thumbnail.forEach((file, index) => {
            form_data.append(`thumbnail[]`, file)
        })
        formData.vicinity_image.forEach((file, index) => {
            form_data.append(`vicinity_image[]`, file)
        })
        formData.digital_brochure_image.forEach((file, index) => {
            form_data.append(`digital_brochure_image[]`, file)
        })
        formData.amenity_gallery.forEach((file, index) => {
            form_data.append(`amenity_gallery[]`, file)
        })

        formData.feature_icon.forEach((file, index) => {
            // accd.icon.forEach((file, index) => {
                form_data.append(`feature_icon${index}[]`, file[0])
            // })
        })
        form_data.append('digital_brochure[has_button]', formData.digital_brochure.has_button ? 1 : 0); 
        form_data.append('enabled', formData.enabled ? 1 : 0); 
        form_data.append('featured', formData.featured ? 1 : 0); 
        form_data.append('description', formData.description); 
        form_data.append('propertyType', propertyType); 
        form_data.append('_method', 'PATCH'); 

        if (isValid) {
            try {
                isEnabled.value = false;
                const response = await nuxtApp.$axios.post(`/cms/properties/${id}`, form_data , {
                    headers: {
                        'Content-Type': 'multipart/form-data',
                    },
                }).then((response) => {
                    sectionData.value = response.data.record;
                    nuxtApp.$toast.success('Property updated successfully!');
                    isEnabled.value = true;
                }); 

            } catch (error) {
                isEnabled.value = true;
                console.error('Error:', error);
                nuxtApp.$toast.error(
                    error.response?.data?.errors || 'An error occurred while saving the property'
                );
            }
        } else {
            nuxtApp.$toast.error('There are fields that require your attention. Kindly review the form.')
        }
    }

    const populateData = (data) => {
        if (data) {
            formData.title = data.name;
            formData.description = data.description;
            formData.address = data.address;
            formData.gmap_url = data.gmaps_link;
            formData.property_size = data.property_size;
            formData.starts_at = data.starts_at;
            formData.towers = String(data.towers);
            formData.featured = Number(data.featured);
            formData.enabled = Number(data.enabled);
            formData.location_id = data.location_id;
            formData.status_id = data.status_id;

            formData.features = data.features;
            formData.yt_url = data.videos?.yt_url || '';
            formData.yt_title = data.videos?.title || '';


            formData.meta_title = data.metadata?.meta_title || '';
            formData.meta_description = data.metadata?.meta_description || '';
            formData.link_rel = data.metadata?.link_rel || 'Canonical';

            formData.tracking_code = data.tracking_code;

            formData.vicinity_title = data.page_sections.find(section => section.name === 'Vicinity Maps')?.title || '';
            formData.amenities_title = data.page_sections.find(section => section.name === 'Amenities Gallery')?.title || '';
            formData.unit_list_title = data.page_sections.find(section => section.name === 'Units List')?.title || '';
            // formData.digital_brochure_title = data.page_sections.find(section => section.name === 'Digital Brochure')?.title;
            // formdata.digital_brochure.has_button = data.page_sections.find(section => section.name === 'Digital Brochure')?.has_button;
            formData.digital_brochure = data.page_sections?.find(section => section.name === 'Digital Brochure')? 
            data.page_sections.find(section => section.name === 'Digital Brochure') : {has_button: 0, title: ''};
            // console.log(formData.digital_brochure);

            main_image.value = data.images?.filter(image => image.category === 'main_image') || [];
            thumbnail.value = data.images?.filter(image => image.category === 'thumbnail') || [];
            vicinity_image.value = data.page_sections.find(section => section.name === 'Vicinity Maps')?.images || [];
            digital_brochure_image.value = data.page_sections.find(section => section.name === 'Digital Brochure')?.images.filter(image => image.category === 'digital_brochure_image')|| [];
            feature_icon.value = data.features?.map(feature => feature.images) || [];
            amenity_gallery.value =  data.page_sections?.find(section => section.name === 'Amenities Gallery')?.images || []; 

            
            formData.features.forEach((_, index) => {
                if (!formData.feature_icon[index]) {
                    formData.feature_icon[index] = []; // Initialize each accordion index as an array
                }
            });
            console.log(formData.feature_icon);
        }
    }

    watch(sectionData, (newData) => {
        populateData(newData);
    })
</script>