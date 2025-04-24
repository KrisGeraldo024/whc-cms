<template>
    <div class="relative w-full flex flex-col gap-y-[15px] bg-offwhite overflow-y-auto">
        <div class="bg-white flex flex-col p-[16px] gap-[16px] w-full ">
            <div class="relative w-full flex justify-between items-center bg-white">
                <div class="gap-y-[8px]">
                    <label for="search" class="text-base font-medium text-black/70">
                        Search by Product Code or Series
                    </label>
                    <Search v-model="keyword" />
                </div>
                <div class="gap-y-[8px]">
                    <label for="filter" class="text-base font-medium text-black/70">
                        Filter by Series
                    </label>
                    <Filter v-if="locations" :options="locations" :placeholder="'Choose a Location'" :filterBy="'Location'"/>
                </div>
            </div>
            <div v-if="filter.value" class="flex justify-start items-center w-full">
                <div class="py-[4px] px-[16px] rounded-[60px] bg-ui-color flex justify-center items-center  gap-x-[8px]">
                    <p class="text-sm font-normal text-white/40">{{ filter.name }}</p>
                    <p class="text-sm font-medium text-white">{{ filter.value }}</p>
                    <span class="w-[10px] h-[10px] cursor-pointer" @click="filter.reset()">
                        <svg xmlns="http://www.w3.org/2000/svg" width="10" height="11" viewBox="0 0 10 11" fill="none">
                        <path d="M8.75011 0.500488L4.99956 4.25016L1.24989 0.500488L0 1.75038L3.74967 5.50005L0 9.24971L1.24989 10.4996L4.99956 6.74994L8.75011 10.4996L10 9.24971L6.25033 5.50005L10 1.75038L8.75011 0.500488Z" fill="white"/>
                        </svg>
                    </span>
                </div>
                <div class="ml-[56px] text-danger/40 text-base font-medium leading-normal cursor-pointer flex justify-center items-center  " @click="filter.reset()">
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
                    <span class="ml-[4px]">Clear All Filters</span>
                </div>
            </div>
        </div>
        
        <div class="p-[16px] gap-y-[20px] overflow-y-auto  gap-[16px] flex flex-col">
            <div class="flex justify-between items-center w-full">
                <p v-if="properties && properties.data" class="text-black font-medium text-base">
                    <span class="text-black/60">Displaying </span> 
                    {{ properties.total > 0 ? properties.from : 0 }} {{ properties.total > 0 ? ' - ' +  properties.to : '' }} 
                    <span class="text-black/60">of</span> 
                    {{ properties.total }} 
                    <span class="text-black/60">items</span>
                </p>
                <p v-else class=""></p>
                <div class="flex gap-[16px] items-center">
                    <!-- <button type="button" @click="openPopup" class="px-[16px] py-[10px] rounded-[10px] border border-ui-color text-ui-color text-base font-medium transition
                    hover:bg-dark-ui-color hover:text-white">
                        Batch Import    
                    </button> -->
                    <router-link :to="`/properties/${propertyType}/create`" class="px-[16px] py-[10px] rounded-[10px] bg-ui-color border border-ui-color text-white text-base font-medium transition
                    hover:bg-dark-ui-color flex gap-[4px]">
                    <span class="w-[21px] h-[21px]">
                        <svg xmlns="http://www.w3.org/2000/svg" width="21" height="21" viewBox="0 0 21 21" fill="none">
                        <path fill-rule="evenodd" clip-rule="evenodd" d="M10.5 19.6875C5.42587 19.6875 1.3125 15.5728 1.3125 10.5C1.3125 5.42719 5.42587 1.3125 10.5 1.3125C15.5741 1.3125 19.6875 5.42719 19.6875 10.5C19.6875 15.5728 15.5741 19.6875 10.5 19.6875ZM10.5 0C4.70072 0 0 4.69875 0 10.5C0 16.3012 4.70072 21 10.5 21C16.2993 21 21 16.3012 21 10.5C21 4.69875 16.2993 0 10.5 0ZM14.4375 9.84375H11.1562V6.5625C11.1562 6.20156 10.8629 5.90625 10.5 5.90625C10.1371 5.90625 9.84375 6.20156 9.84375 6.5625V9.84375H6.5625C6.19959 9.84375 5.90625 10.1391 5.90625 10.5C5.90625 10.8609 6.19959 11.1562 6.5625 11.1562H9.84375V14.4375C9.84375 14.7984 10.1371 15.0938 10.5 15.0938C10.8629 15.0938 11.1562 14.7984 11.1562 14.4375V11.1562H14.4375C14.8004 11.1562 15.0938 10.8609 15.0938 10.5C15.0938 10.1391 14.8004 9.84375 14.4375 9.84375Z" fill="#FCFCFC"/>
                        </svg>
                    </span>
                        Add an Item    
                    </router-link>
                </div>
            </div>
            <table class="min-w-full border-collapse rounded-[10px] overflow-hidden bg-off-white border-separate border-spacing-0 pb-[140px]">
                <thead>
                    <tr class="h-[40px] bg-white text-black/60 font-medium text-base text-left">
                        <th class="px-[24px] py-[8px] rounded-[10px]">Product Code</th>
                        <th class="px-[24px] py-[8px]">Series</th>
                        <th class="px-[24px] py-[8px] ">Edit Modules</th>
                        <th class="px-[24px] py-[8px] flex gap-[8px] cursor-pointer"  @click="toggleSort('updated_at')">
                            Date Edited
                            <svg
                                xmlns="http://www.w3.org/2000/svg"
                                width="18"
                                height="18"
                                viewBox="0 0 18 18"
                                fill="none">
                                <!-- Upward triangle -->
                                <path
                                    d="M5.22216 7.34717L8.57972 3.1633C8.87841 2.7763 9.37059 2.7763 9.66985 3.1633L13.0274 7.34717C13.3261 7.73417 13.1855 8.0503 12.6758 8.0503H5.57428C5.06466 8.0503 4.92403 7.73361 5.22272 7.34717H5.22216Z"
                                    :fill="
                                        sortBy === 'updated_at' &&
                                        sortDirection === 'asc'
                                            ? '#4B545B'
                                            : '#A6A8AB'
                                    " />
                                <!-- Downward triangle -->
                                <path
                                    d="M13.0268 10.6519L9.66928 14.8357C9.3706 15.2227 8.87841 15.2227 8.57916 14.8357L5.2216 10.6519C4.92291 10.2649 5.06353 9.94873 5.57316 9.94873H12.6747C13.1843 9.94873 13.325 10.2654 13.0263 10.6519H13.0268Z"
                                    :fill="
                                        sortBy === 'updated_at' &&
                                        sortDirection === 'desc'
                                            ? '#4B545B'
                                            : '#A6A8AB'
                                    " />
                            </svg>
                        </th>
                        <th class="px-[24px] py-[8px] rounded-tr-[10px]">Featured</th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                    <template v-if="properties && properties.data" v-for="(property, index) in properties.data" :key="property.id">
                        <tr class="h-3"> <!-- Adjust the height as needed -->
                            <td colspan="5"></td> <!-- Empty cell to occupy space -->
                        </tr>
                        <tr class="h-[40px] bg-white text-black font-normal text-base text-left font-light">
                            <td class="p-[24px] text-base font-semibold">{{ property.name }}</td>
                            <td class="p-[24px]">{{ property.locations.name }}</td>
                            <td class="p-[24px] gap-[8px] flex justify-start items-center flex-wrap">
                                <router-link :to="`/properties/${propertyType}/${property.id}/units`" class="px-[12px] py-[4px] bg-ui-hover text-black text-base font-normal rounded-[10px] 
                                flex justify-center items-center gap-x-[4px] w-auto cursor-pointer">
                                    <span class="w-[12px] h-[12.6px]">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 14 14" fill="none">
                                        <path d="M12.0032 1.0851L12.0032 1.08509C11.2922 0.338564 10.1358 0.338561 9.42478 1.08509L9.55096 1.20527L9.42478 1.08509L1.66647 9.23134C1.41323 9.49724 1.24149 9.8349 1.1717 10.2013L1.34344 10.234L1.1717 10.2013L0.849983 11.8903C0.675922 12.8041 1.44463 13.6381 2.34751 13.4485L3.95605 13.1107C4.30986 13.0364 4.63357 12.854 4.88689 12.588L12.6452 4.44179C13.3516 3.70009 13.3516 2.50092 12.6452 1.75921L12.0032 1.0851ZM11.6168 2.81432L11.6168 2.81434C11.7664 2.97145 11.7664 3.22955 11.6168 3.38667L11.6168 3.38668L10.2795 4.79084L9.10417 3.55674L10.4532 2.14022C10.4532 2.14021 10.4532 2.14021 10.4532 2.1402C10.5983 1.98791 10.8297 1.98792 10.9748 2.14022L11.6168 2.81432ZM2.31765 11.9235L2.59023 10.4925C2.6053 10.4134 2.64215 10.3418 2.6949 10.2864L2.56818 10.1658L2.6949 10.2864L8.08748 4.62422L9.26282 5.85833L3.85846 11.5329C3.80581 11.5882 3.73979 11.6248 3.66921 11.6397L3.6692 11.6397L2.31765 11.9235Z" fill="#2A2A2A" stroke="#2A2A2A" stroke-width="0.35"/>
                                        </svg>
                                    </span>
                                    Units
                                </router-link>
                                <router-link :to="`/properties/${propertyType}/${property.id}/amenities`" class="px-[12px] py-[4px] bg-ui-hover text-black text-base font-normal rounded-[10px] 
                                flex justify-center items-center gap-x-[4px] w-auto cursor-pointer">
                                    <span class="w-[12px] h-[12.6px]">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 14 14" fill="none">
                                        <path d="M12.0032 1.0851L12.0032 1.08509C11.2922 0.338564 10.1358 0.338561 9.42478 1.08509L9.55096 1.20527L9.42478 1.08509L1.66647 9.23134C1.41323 9.49724 1.24149 9.8349 1.1717 10.2013L1.34344 10.234L1.1717 10.2013L0.849983 11.8903C0.675922 12.8041 1.44463 13.6381 2.34751 13.4485L3.95605 13.1107C4.30986 13.0364 4.63357 12.854 4.88689 12.588L12.6452 4.44179C13.3516 3.70009 13.3516 2.50092 12.6452 1.75921L12.0032 1.0851ZM11.6168 2.81432L11.6168 2.81434C11.7664 2.97145 11.7664 3.22955 11.6168 3.38667L11.6168 3.38668L10.2795 4.79084L9.10417 3.55674L10.4532 2.14022C10.4532 2.14021 10.4532 2.14021 10.4532 2.1402C10.5983 1.98791 10.8297 1.98792 10.9748 2.14022L11.6168 2.81432ZM2.31765 11.9235L2.59023 10.4925C2.6053 10.4134 2.64215 10.3418 2.6949 10.2864L2.56818 10.1658L2.6949 10.2864L8.08748 4.62422L9.26282 5.85833L3.85846 11.5329C3.80581 11.5882 3.73979 11.6248 3.66921 11.6397L3.6692 11.6397L2.31765 11.9235Z" fill="#2A2A2A" stroke="#2A2A2A" stroke-width="0.35"/>
                                        </svg>
                                    </span>
                                    Amenities
                                </router-link>
                                <router-link :to="`/properties/${propertyType}/${property.id}/landmarks`" class="px-[12px] py-[4px] bg-ui-hover text-black text-base font-normal rounded-[10px] 
                                flex justify-center items-center gap-x-[4px] w-auto cursor-pointer">
                                    <span class="w-[12px] h-[12.6px]">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 14 14" fill="none">
                                        <path d="M12.0032 1.0851L12.0032 1.08509C11.2922 0.338564 10.1358 0.338561 9.42478 1.08509L9.55096 1.20527L9.42478 1.08509L1.66647 9.23134C1.41323 9.49724 1.24149 9.8349 1.1717 10.2013L1.34344 10.234L1.1717 10.2013L0.849983 11.8903C0.675922 12.8041 1.44463 13.6381 2.34751 13.4485L3.95605 13.1107C4.30986 13.0364 4.63357 12.854 4.88689 12.588L12.6452 4.44179C13.3516 3.70009 13.3516 2.50092 12.6452 1.75921L12.0032 1.0851ZM11.6168 2.81432L11.6168 2.81434C11.7664 2.97145 11.7664 3.22955 11.6168 3.38667L11.6168 3.38668L10.2795 4.79084L9.10417 3.55674L10.4532 2.14022C10.4532 2.14021 10.4532 2.14021 10.4532 2.1402C10.5983 1.98791 10.8297 1.98792 10.9748 2.14022L11.6168 2.81432ZM2.31765 11.9235L2.59023 10.4925C2.6053 10.4134 2.64215 10.3418 2.6949 10.2864L2.56818 10.1658L2.6949 10.2864L8.08748 4.62422L9.26282 5.85833L3.85846 11.5329C3.80581 11.5882 3.73979 11.6248 3.66921 11.6397L3.6692 11.6397L2.31765 11.9235Z" fill="#2A2A2A" stroke="#2A2A2A" stroke-width="0.35"/>
                                        </svg>
                                    </span>
                                    Landmarks
                                </router-link>
                            </td>
                            <td class="p-[24px]">
                                {{ $moment(property.updated_at ? property.updated_at : property.created_at).format('MMM DD, YYYY') }}<br>
                                <span class="text-sm text-black"> <!-- Adjust styling as needed -->
                                    {{ $moment(property.updated_at ? property.updated_at : property.created_at).format('hh:mm A') }}
                                </span>
                            </td>
                            <td class="p-[24px]  gap-[8px] flex items-center"
                                :class="{'text-success' : property.featured, 'text-orange' : !property.featured}">
                                <svg xmlns="http://www.w3.org/2000/svg" width="7" height="8" viewBox="0 0 7 8" 
                                :class="{'fill-success' : property.featured, 'fill-orange' : !property.featured}">
                                <circle cx="3.5" cy="4" r="3.5" />
                                </svg>
                                {{ property.featured ? 'Yes' : 'No' }}
                            </td>
                            <td class="p-[24px] relative w-[150px]">
                                <button @click.stop="toggleMenu(index)">
                                    <svg
                                        width="40"
                                        height="20"
                                        viewBox="0 0 40 20"
                                        fill="none"
                                        xmlns="http://www.w3.org/2000/svg">
                                        <rect
                                            width="40"
                                            height="20"
                                            rx="10"
                                            fill="#E9E9E9" />
                                        <circle
                                            cx="10"
                                            cy="10"
                                            r="2"
                                            fill="#2A2A2A" />
                                        <circle
                                            cx="20"
                                            cy="10"
                                            r="2"
                                            fill="#2A2A2A" />
                                        <circle
                                            cx="30"
                                            cy="10"
                                            r="2"
                                            fill="#2A2A2A" />
                                    </svg>
                                </button>
                                <div
                                    v-if="activeMenuIndex === index"
                                    class="absolute bottom-0 left-0 z-50 bg-white flex flex-col p-[10px] gap-[10px] rounded-[10px] translate-y-[70%] font-[600] border border-gray z-50">
                                    <router-link :to="`/properties/${propertyType}/${property.id}/update`"
                                        class="flex items-center gap-[10px] pb-[10px] border-b border-black/30">
                                        <svg
                                            width="22px"
                                            height="22px"
                                            viewBox="0 0 24 24"
                                            fill="none"
                                            xmlns="http://www.w3.org/2000/svg">
                                            <!-- Edit icon SVG path -->
                                            <path
                                                fill-rule="evenodd"
                                                clip-rule="evenodd"
                                                d="M20.8477 1.87868C19.6761 0.707109 17.7766 0.707105 16.605 1.87868L2.44744 16.0363C2.02864 16.4551 1.74317 16.9885 1.62702 17.5692L1.03995 20.5046C0.760062 21.904 1.9939 23.1379 3.39334 22.858L6.32868 22.2709C6.90945 22.1548 7.44285 21.8693 7.86165 21.4505L22.0192 7.29289C23.1908 6.12132 23.1908 4.22183 22.0192 3.05025L20.8477 1.87868ZM18.0192 3.29289C18.4098 2.90237 19.0429 2.90237 19.4335 3.29289L20.605 4.46447C20.9956 4.85499 20.9956 5.48815 20.605 5.87868L17.9334 8.55027L15.3477 5.96448L18.0192 3.29289ZM13.9334 7.3787L3.86165 17.4505C3.72205 17.5901 3.6269 17.7679 3.58818 17.9615L3.00111 20.8968L5.93645 20.3097C6.13004 20.271 6.30784 20.1759 6.44744 20.0363L16.5192 9.96448L13.9334 7.3787Z"
                                                fill="#0F0F0F" />
                                        </svg>
                                        <span>Edit Item</span>
                                    </router-link>
                                    <button
                                        class="flex items-center gap-[10px] text-[#F12222]"
                                        @click="
                                            openDeletePopup(
                                                `/cms/properties/${property.id}`
                                            )
                                        ">
                                        <svg
                                            xmlns="http://www.w3.org/2000/svg"
                                            width="20"
                                            height="23"
                                            viewBox="0 0 20 23"
                                            fill="none">
                                            <!-- Delete icon SVG path -->
                                            <path
                                                d="M7.77778 17.7778C8.07246 17.7778 8.35508 17.6607 8.56345 17.4523C8.77183 17.244 8.88889 16.9614 8.88889 16.6667V10C8.88889 9.70531 8.77183 9.4227 8.56345 9.21433C8.35508 9.00595 8.07246 8.88889 7.77778 8.88889C7.48309 8.88889 7.20048 9.00595 6.9921 9.21433C6.78373 9.4227 6.66667 9.70531 6.66667 10V16.6667C6.66667 16.9614 6.78373 17.244 6.9921 17.4523C7.20048 17.6607 7.48309 17.7778 7.77778 17.7778ZM18.8889 4.44444H14.4444V3.33333C14.4444 2.44928 14.0933 1.60143 13.4681 0.976311C12.843 0.35119 11.9952 0 11.1111 0H8.88889C8.00483 0 7.15699 0.35119 6.53187 0.976311C5.90674 1.60143 5.55556 2.44928 5.55556 3.33333V4.44444H1.11111C0.816426 4.44444 0.533811 4.56151 0.325437 4.76988C0.117063 4.97825 0 5.26087 0 5.55556C0 5.85024 0.117063 6.13286 0.325437 6.34123C0.533811 6.5496 0.816426 6.66667 1.11111 6.66667H2.22222V18.8889C2.22222 19.7729 2.57341 20.6208 3.19853 21.2459C3.82365 21.871 4.6715 22.2222 5.55556 22.2222H14.4444C15.3285 22.2222 16.1763 21.871 16.8015 21.2459C17.4266 20.6208 17.7778 19.7729 17.7778 18.8889V6.66667H18.8889C19.1836 6.66667 19.4662 6.5496 19.6746 6.34123C19.8829 6.13286 20 5.85024 20 5.55556C20 5.26087 19.8829 4.97825 19.6746 4.76988C19.4662 4.56151 19.1836 4.44444 18.8889 4.44444ZM7.77778 3.33333C7.77778 3.03865 7.89484 2.75603 8.10322 2.54766C8.31159 2.33929 8.5942 2.22222 8.88889 2.22222H11.1111C11.4058 2.22222 11.6884 2.33929 11.8968 2.54766C12.1052 2.75603 12.2222 3.03865 12.2222 3.33333V4.44444H7.77778V3.33333ZM15.5556 18.8889C15.5556 19.1836 15.4385 19.4662 15.2301 19.6746C15.0217 19.8829 14.7391 20 14.4444 20H5.55556C5.26087 20 4.97826 19.8829 4.76988 19.6746C4.56151 19.4662 4.44444 19.1836 4.44444 18.8889V6.66667H15.5556V18.8889ZM12.2222 17.7778C12.5169 17.7778 12.7995 17.6607 13.0079 17.4523C13.2163 17.244 13.3333 16.9614 13.3333 16.6667V10C13.3333 9.70531 13.2163 9.4227 13.0079 9.21433C12.7995 9.00595 12.5169 8.88889 12.2222 8.88889C11.9275 8.88889 11.6449 9.00595 11.4365 9.21433C11.2282 9.4227 11.1111 9.70531 11.1111 10V16.6667C11.1111 16.9614 11.2282 17.244 11.4365 17.4523C11.6449 17.6607 11.9275 17.7778 12.2222 17.7778Z"
                                                fill="#F12222" />
                                        </svg>
                                        <span>Delete Item</span>
                                    </button>
                                </div>
                            </td>
                        </tr>
                    </template>
                </tbody>
            </table> 
        </div>
    </div>
    <PopupForm
        v-model:show="showPopup"
        :title=" 'Batch Import'">
        <Form
            id="form"
            @submit="onSubmit">
        
            <div class="flex flex-col gap-[8px] mt-[8px]">
                <form-fieldsImageHandler
                label="Batch Upload"
                max="1"
                size="5"
                acceptedFormats="xlsx|csv|pdf|jpg|jpeg|png|gif|bmp|webp"
                :input_payload="{
                    identifier: 'file',
                    id: 'file_id',
                    category: 'file_category',
                    category_value: 'file',
                    alt: 'file_alt',
                }"
                @update:file="handleFileUpdate('file', $event)" />
            </div>
            

            <div class="flex gap-[24px] mt-[16px] ml-auto max-w-max">
                <button
                    @click="closePopup"
                    type="button">
                    Cancel
                </button>
                <button
                    class="px-[16px] py-[10px] bg-ui-color rounded-[10px] text-white">
                    Import
                </button>
            </div>
        </Form>
    </PopupForm>
    <PopupDelete
        v-model:show="showDeletePopup"
        :deletePath="deletePath"
        @delete-success="fetchRecords(1)" />
    <Pagination />
</template>
<script setup>
    import { usePageTitleStore } from '~/stores/pageTitle';
    import { usePaginationStore } from '~/stores/pagination';
    import { useFilterStore } from '~/stores/filters';
    import { useSidebarStore } from '~/stores/sidebar';
    import { useRoute } from 'vue-router';
    import { useAsyncData } from 'nuxt/app'
    import { Form } from 'vee-validate';

    definePageMeta({
        // name: 'properties',
        middleware: 'authenticator'
    })

    const pageTitle = usePageTitleStore();
    const pagination = usePaginationStore();
    const filter = useFilterStore();
    const sidebar = useSidebarStore();
    const route = useRoute();
    
    const propertyType = route.params.propertyType; 

    
    const formattedTitle = ref('');
    const secondLastSegment = ref('');

    onMounted(() => {
        pagination.reset();
        filter.reset();
        document.addEventListener('click', handleClickOutside);
        const currentPath = route.path; // Get the current path
        // const pathSegments = route.path.split('/'); 

        // const firstPathSegment = currentPath.split('/')[1]; // Split by '/' and get the first segment after the base
        
        // if (pathSegments.length > 2) {
        //     secondLastSegment.value = pathSegments[pathSegments.length - 1];
        // }

        // formattedTitle.value = secondLastSegment.value
        //     .replace(/-/g, ' ') // Replace dashes with spaces
        //     .replace(/\band\b/gi, '&') // Replace 'and' with '&'
        //     .replace(/\b\w/g, char => char.toUpperCase()); // Capitalize the first letter of each word

        pageTitle.setTitle(`Tiles Directory`);
        pageTitle.setBreadcrumbs(['Menu', `Tiles Directory`]);

        pageTitle.setPageFrom('');
        pageTitle.setPageFromRoute('');
        fetchRecords();
    });
    
    const nuxtApp = useNuxtApp();
    const locations = ref(null);
    const properties = ref(null);

    const fetchRecords = async () => {
        try {
            const location_response = await nuxtApp.$axios.get(`/cms/taxonomies/property-locations?all=true`); 
            const properties_response = await nuxtApp.$axios.get(`/cms/properties?page=${pagination.page}
            &propertyType=${propertyType}
            &location=${filter.value}
            &sortBy=${sortBy.value}
            &sortDirection=${sortDirection.value}
            &keyword=${keyword.value}`); 
            locations.value = location_response.data.map((record) => record.name);
            properties.value = properties_response.data.records;

            pagination.setTotalPages(properties_response.data.records.last_page);

        } catch (error) {
            console.error('Error:', error);
        }
    };

    
    const sortBy = ref('updated_at');
    const sortDirection = ref('desc');

    const toggleSort = async column => {
        if (sortBy.value === column) {
            sortDirection.value = sortDirection.value === 'asc' ? 'desc' : 'asc';
        } else {
            sortBy.value = column;
            sortDirection.value = 'asc';
        }

        await fetchRecords();
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

    const formData = reactive({
        file: []
    });
    const showPopup = ref(false);
    const showDeletePopup = ref(false);
    const deletePath = ref('');
    const activeMenuIndex = ref(null);

    const openDeletePopup = url => {
        showDeletePopup.value = true;
        deletePath.value = url;
        activeMenuIndex.value = null;
    };

    const openPopup = (record = null) => {
        showPopup.value = true;
        activeMenuIndex.value = null;
    };

    const closePopup = () => {
        showPopup.value = false;
        editingRecord.value = null;
    };
    
    const toggleMenu = index => {
        activeMenuIndex.value = activeMenuIndex.value === index ? null : index;
    };

    const handleClickOutside = event => {
        if (!event.target.closest('button')) {
            activeMenuIndex.value = null;
        }
    };


    const keyword = ref('');
    const onSubmit = async () => {
        let form_data = new FormData(document.getElementById('form'));

        formData.file.forEach((file) => {
            form_data.append('file[]', file);
        })

        try {
                const response = await nuxtApp.$axios.post(`/cms/batch-upload?query=properties`, form_data , {
                    headers: {
                        'Content-Type': 'multipart/form-data',
                    },
                }).then((response) => {
                    const record = response.data.record;
                    nuxtApp.$toast.success('Properties imported successfully!');
                    fetchRecords();
                    closePopup();
                }); 
    
            } catch (error) {
                // console.error('Error:', error.response);
                nuxtApp.$toast.error(error.response.data.message);
            }
    };
    onUnmounted(() => {
    document.removeEventListener('click', handleClickOutside);
});

    watch(keyword, () => {
        fetchRecords();
    });
    
    watch(() => filter.value, (newPage) => {
        fetchRecords(); // Call the API whenever the page changes
    });

    watch(() => pagination.page, (newPage) => {
        fetchRecords(); // Call the API whenever the page changes
    });
</script>