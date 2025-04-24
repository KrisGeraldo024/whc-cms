<template>
    <div @click="isOpen = !isOpen" class="p-[12px] flex items-center justify-between gap-[6px] border-dark-ui-color border-[2px] group
    hover:bg-dark-ui-color  rounded-[10px] cursor-pointer transition">
        <span class="w-[20px] h-[20px]">
            <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 20 20" fill="none">
            <path fill-rule="evenodd" clip-rule="evenodd" d="M9.14622 6.73688C9.99934 5.50155 9.82997 3.82963 8.74622 2.79063C7.64734 1.73508 5.96671 1.5741 4.68744 2.40188C4.16226 2.74135 3.75013 3.22963 3.50369 3.80438C3.26081 4.37352 3.19714 5.00315 3.32119 5.60938C3.44578 6.2184 3.75064 6.77589 4.19619 7.20938C4.65023 7.64825 5.22229 7.94538 5.84244 8.06438C6.46688 8.18625 7.11324 8.12513 7.70372 7.88813C8.28722 7.65463 8.78897 7.25413 9.14622 6.73688Z" 
            class="stroke-[#00A651] group-hover:stroke-white" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
            <path fill-rule="evenodd" clip-rule="evenodd" d="M10.2288 16.7369C9.37555 15.5015 9.54505 13.8296 10.6288 12.7906C11.7277 11.7351 13.4083 11.5741 14.6875 12.4019C15.2128 12.7414 15.6248 13.2296 15.8713 13.8044C16.1142 14.3735 16.1778 15.0031 16.0538 15.6094C15.9292 16.2184 15.6243 16.7759 15.1788 17.2094C14.7248 17.6482 14.1527 17.9454 13.5325 18.0644C12.9092 18.1851 12.2643 18.1235 11.675 17.8869C11.0903 17.6542 10.5872 17.2542 10.2288 16.7369Z" 
            class="stroke-[#00A651] group-hover:stroke-white" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
            <mask id="path-3-inside-1_5790_41981" fill="white">
                <path d="M9.6875 4.06348C9.16975 4.06348 8.75 4.4832 8.75 5.00098C8.75 5.51874 9.16975 5.93848 9.6875 5.93848V4.06348ZM18.4375 5.93848C18.9552 5.93848 19.375 5.51874 19.375 5.00098C19.375 4.4832 18.9552 4.06348 18.4375 4.06348V5.93848ZM3.25875 5.93848C3.77651 5.93848 4.19625 5.51874 4.19625 5.00098C4.19625 4.4832 3.77651 4.06348 3.25875 4.06348V5.93848ZM0.9375 4.06348C0.419738 4.06348 0 4.4832 0 5.00098C0 5.51874 0.419738 5.93848 0.9375 5.93848V4.06348ZM9.6875 15.9385C10.2052 15.9385 10.625 15.5187 10.625 15.001C10.625 14.4832 10.2052 14.0635 9.6875 14.0635V15.9385ZM0.9375 14.0635C0.419738 14.0635 0 14.4832 0 15.001C0 15.5187 0.419738 15.9385 0.9375 15.9385V14.0635ZM16.1162 14.0635C15.5985 14.0635 15.1787 14.4832 15.1787 15.001C15.1787 15.5187 15.5985 15.9385 16.1162 15.9385V14.0635ZM18.4375 15.9385C18.9552 15.9385 19.375 15.5187 19.375 15.001C19.375 14.4832 18.9552 14.0635 18.4375 14.0635V15.9385ZM9.6875 5.93848H18.4375V4.06348H9.6875V5.93848ZM3.25875 4.06348H0.9375V5.93848H3.25875V4.06348ZM9.6875 14.0635H0.9375V15.9385H9.6875V14.0635ZM16.1162 15.9385H18.4375V14.0635H16.1162V15.9385Z"/>
            </mask>
            <path d="M9.6875 4.06348C9.16975 4.06348 8.75 4.4832 8.75 5.00098C8.75 5.51874 9.16975 5.93848 9.6875 5.93848V4.06348ZM18.4375 5.93848C18.9552 5.93848 19.375 5.51874 19.375 5.00098C19.375 4.4832 18.9552 4.06348 18.4375 4.06348V5.93848ZM3.25875 5.93848C3.77651 5.93848 4.19625 5.51874 4.19625 5.00098C4.19625 4.4832 3.77651 4.06348 3.25875 4.06348V5.93848ZM0.9375 4.06348C0.419738 4.06348 0 4.4832 0 5.00098C0 5.51874 0.419738 5.93848 0.9375 5.93848V4.06348ZM9.6875 15.9385C10.2052 15.9385 10.625 15.5187 10.625 15.001C10.625 14.4832 10.2052 14.0635 9.6875 14.0635V15.9385ZM0.9375 14.0635C0.419738 14.0635 0 14.4832 0 15.001C0 15.5187 0.419738 15.9385 0.9375 15.9385V14.0635ZM16.1162 14.0635C15.5985 14.0635 15.1787 14.4832 15.1787 15.001C15.1787 15.5187 15.5985 15.9385 16.1162 15.9385V14.0635ZM18.4375 15.9385C18.9552 15.9385 19.375 15.5187 19.375 15.001C19.375 14.4832 18.9552 14.0635 18.4375 14.0635V15.9385ZM9.6875 5.93848H18.4375V4.06348H9.6875V5.93848ZM3.25875 4.06348H0.9375V5.93848H3.25875V4.06348ZM9.6875 14.0635H0.9375V15.9385H9.6875V14.0635ZM16.1162 15.9385H18.4375V14.0635H16.1162V15.9385Z" 
            class="fill-white group-hover:stroke-[#00A651]"/>
            <path d="M10.9375 5.93848V4.06348H8.4375V5.93848H10.9375ZM17.1875 4.06348V5.93848H19.6875V4.06348H17.1875ZM2.00875 4.06348V5.93848H4.50875V4.06348H2.00875ZM2.1875 5.93848V4.06348H-0.3125V5.93848H2.1875ZM8.4375 14.0635V15.9385H10.9375V14.0635H8.4375ZM2.1875 15.9385V14.0635H-0.3125V15.9385H2.1875ZM17.3662 15.9385V14.0635H14.8662V15.9385H17.3662ZM17.1875 14.0635V15.9385H19.6875V14.0635H17.1875ZM9.6875 1.56348C7.78908 1.56348 6.25 3.10245 6.25 5.00098H11.25C11.25 5.86396 10.5504 6.56348 9.6875 6.56348V1.56348ZM6.25 5.00098C6.25 6.89947 7.78906 8.43848 9.6875 8.43848V3.43848C10.5504 3.43848 11.25 4.13801 11.25 5.00098H6.25ZM18.4375 8.43848C20.3359 8.43848 21.875 6.89947 21.875 5.00098H16.875C16.875 4.13801 17.5746 3.43848 18.4375 3.43848V8.43848ZM21.875 5.00098C21.875 3.10245 20.3359 1.56348 18.4375 1.56348V6.56348C17.5746 6.56348 16.875 5.86396 16.875 5.00098H21.875ZM3.25875 8.43848C5.15722 8.43848 6.69625 6.89945 6.69625 5.00098H1.69625C1.69625 4.13803 2.3958 3.43848 3.25875 3.43848V8.43848ZM6.69625 5.00098C6.69625 3.10247 5.1572 1.56348 3.25875 1.56348V6.56348C2.39582 6.56348 1.69625 5.86394 1.69625 5.00098H6.69625ZM0.9375 1.56348C-0.960953 1.56348 -2.5 3.10247 -2.5 5.00098H2.5C2.5 5.86394 1.80043 6.56348 0.9375 6.56348V1.56348ZM-2.5 5.00098C-2.5 6.89945 -0.960974 8.43848 0.9375 8.43848V3.43848C1.80045 3.43848 2.5 4.13803 2.5 5.00098H-2.5ZM9.6875 18.4385C11.586 18.4385 13.125 16.8995 13.125 15.001H8.125C8.125 14.138 8.82454 13.4385 9.6875 13.4385V18.4385ZM13.125 15.001C13.125 13.1025 11.586 11.5635 9.6875 11.5635V16.5635C8.82454 16.5635 8.125 15.864 8.125 15.001H13.125ZM0.9375 11.5635C-0.960996 11.5635 -2.5 13.1025 -2.5 15.001H2.5C2.5 15.8639 1.80047 16.5635 0.9375 16.5635V11.5635ZM-2.5 15.001C-2.5 16.8994 -0.960996 18.4385 0.9375 18.4385V13.4385C1.80047 13.4385 2.5 14.138 2.5 15.001H-2.5ZM16.1162 11.5635C14.2178 11.5635 12.6787 13.1025 12.6787 15.001H17.6787C17.6787 15.864 16.9792 16.5635 16.1162 16.5635V11.5635ZM12.6787 15.001C12.6787 16.8995 14.2178 18.4385 16.1162 18.4385V13.4385C16.9792 13.4385 17.6787 14.138 17.6787 15.001H12.6787ZM18.4375 18.4385C20.336 18.4385 21.875 16.8995 21.875 15.001H16.875C16.875 14.138 17.5745 13.4385 18.4375 13.4385V18.4385ZM21.875 15.001C21.875 13.1025 20.336 11.5635 18.4375 11.5635V16.5635C17.5745 16.5635 16.875 15.864 16.875 15.001H21.875ZM9.6875 8.43848H18.4375V3.43848H9.6875V8.43848ZM18.4375 1.56348H9.6875V6.56348H18.4375V1.56348ZM3.25875 1.56348H0.9375V6.56348H3.25875V1.56348ZM0.9375 8.43848H3.25875V3.43848H0.9375V8.43848ZM9.6875 11.5635H0.9375V16.5635H9.6875V11.5635ZM0.9375 18.4385H9.6875V13.4385H0.9375V18.4385ZM16.1162 18.4385H18.4375V13.4385H16.1162V18.4385ZM18.4375 11.5635H16.1162V16.5635H18.4375V11.5635Z" 
            class="fill-[#00A651] group-hover:fill-white" mask="url(#path-3-inside-1_5790_41981)"/>
            </svg>
        </span>
        <p class="group-hover:text-white w-[100px] text-base
    text-ui-color">Open Filters</p>
    </div>
    <div v-if="isOpen" class="fixed z-50 w-screen h-screen top-0 left-0 flex">
        <div @click="isOpen = false" class="w-[80%] h-full bg-black/50"></div>
        <div class="w-[20%] h-full p-[16px] rounded-l-xl bg-cream flex flex-col">
            <span @click="isOpen = false" class="w-[25px] h-[25px] cursor-pointer self-end flex items-center justify-center">
                <svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12" fill="none">
                <path d="M11 11L6 6M6 6L1 1M6 6L11 1M6 6L1 11" stroke="#2A2A2A" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
                </svg>
            </span>
            <div class="flex flex-col justify-between h-full">
                <div class="flex flex-col gap-y-[24px] px-[16px]">
                    <div v-for="(filter, index) in filters" class="gap-y-[8px] w-full flex flex-col">
                        <label for="filter" class="text-base font-medium text-black/70">
                            {{ !sortDate ? 'Filter by' : ''}} {{filter.title}}
                        </label>
                        <div v-if="!sortDate" class="relative h-[44px] w-full px-[12px] py-[10px] gap-[8px] flex items-center border rounded-[10px] text-black/60 transition hover:text-black"
                        :class="{'border-ui-color' : isToggled[index], 'border-[#2A2A2A33]/20' : !isToggled[index]}">
                            <!-- <input type="text" v-model="props.keyword" class="border-none focus:outline-none bg-transparent" :placeholder="props.placeholder"> -->
                            {{ localValue[filter.name] ? localValue[filter.name] :  filter.placeholder }}
                            <span class="w-[36px] h-[36px] absolute right-[48px] p-[6px] border-r-[1px] border-black/20 flex justify-center items-center" 
                            :class="{'hidden' : !isToggled[index], 'block': isToggled[index]}"  @click="localValue[filter.name] = ''">
                                <svg xmlns="http://www.w3.org/2000/svg" width="13" height="13" viewBox="0 0 13 13" fill="none">
                                <path d="M0.921875 0.961426L11.9995 12.0391" stroke="#2A2A2A" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
                                <path d="M0.921875 12.0391L11.9995 0.961426" stroke="#2A2A2A" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
                                </svg>
                            </span>
                            <span class="w-[24px] h-[24px] absolute right-4 cursor-pointer"   @click="toggleSelect(index)">
                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" :class="{'rotate-180' : isToggled[index], 'rotate-0' : !isToggled[index]}">
                                <path fill-rule="evenodd" clip-rule="evenodd" d="M12.3982 15.203C12.1785 15.4226 11.8224 15.4226 11.6027 15.203L5.86788 9.46808C5.64821 9.24841 
                                5.64821 8.89231 5.86788 8.67263L6.13305 8.40743C6.35271 8.18776 6.70887 8.18776 6.92854 8.40743L12.0005 13.4794L17.0724 8.40743C17.2921 8.18776 
                                17.6482 8.18776 17.8679 8.40743L18.1331 8.67263C18.3527 8.89231 18.3527 9.24841 18.1331 9.46808L12.3982 15.203Z" fill="#2A2A2A"/>
                                </svg>
                            </span>
                            <div class="absolute mt-[8px] top-full left-0 h-auto max-h-[280px] overflow-y-auto rounded-[10px] w-full bg-white border border-ui-color z-20 text-black" 
                            :class="{'hidden' : !isToggled[index], 'block': isToggled[index]}"
                            >
                            <div class="h-full overflow-y-auto w-full">
                                <ul>
                                    <li v-for="option in filter.options" :key="option" 
                                    @click="select(option, filter.name, index)" 
                                    class="p-[16px] cursor-pointer hover:bg-ui-hover hover:border-ui-color">
                                        {{ option.name }}
                                    </li>  
                                </ul>
                            </div>
                            </div>
                        </div>
                        <div v-else class="relative h-[44px] w-full px-[12px] py-[10px] gap-[8px] flex items-center rounded-[10px] text-black/60 transition hover:text-black">
                        <DateField class="w-full"
                            label=""
                            name="date"
                            v-model="localValue[filter.name]"
                            @change="select($event.srcElement.value, filter.name, index)"
                            placeholder="MM / DD / YY"
                            rules="required"/>
                        </div>
                    </div>
                </div>
                <div class="flex items-center justify-center gap-[26px]">
                    <p class="cursor-pointer text-black text-base" @click="close()">Close Filters</p>
                    <button class="cursor-pointer text-white bg-ui-color rounded-[10px] px-[24px] py-[16px] text-base flex items-center justify-center" @click="updateValue(localValue)">Apply Filters</button>
                </div>
            </div>
        </div>
    </div>
</template>

<script setup>
    const props = defineProps({
        filters: Array,
        modelValue: Object,
        sortDate: Boolean
    })

    const isOpen = ref(false);
    const isToggled = reactive([]);

    const localValue = ref(props.modelValue);
    const emit = defineEmits(['update:modelValue']);

    watch(() => props.modelValue, (newVal) => {
        localValue.value = newVal;
    });

    const updateValue = (value) => {
        console.log(value);
        emit('update:modelValue', value);
    };

    const select = (option, name, index) => {
        localValue.value[name] = option.name ? option.name : option;
        isToggled[index] = false;
    }

    const close = () => {
        isOpen.value = false;
        emit('update:modelValue', null);
    }

    const toggleSelect = (index) => {
        isToggled[index] = !isToggled[index];
        isToggled.forEach((value, i) => {
            if (i !== index && value) {
                isToggled[i] = false;
            }
        })
    }

</script>

<style>
    .filter::-webkit-scrollbar {
        width: 4px;
        height: 48px !important;
        /* Adjust the scrollbar width as needed */
    }

    .filter::-webkit-scrollbar-thumb {
        background-color: #00A651;
        /* Color of the scrollbar thumb */
        border-radius: 30px;
        /* Rounded corners for the thumb */
    }

    .filter::-webkit-scrollbar-track {
        background-color: #fff;
        /* Color of the scrollbar track */
        border-radius: 30px;
        /* Rounded corners for the track */
        margin: 6px;
    }

    .filter ::-webkit-scrollbar {
        padding: 6px 0; /* Space on the top/bottom */
    }

    .filter ::-webkit-scrollbar-thumb {
        margin: 0 6px; /* Space on the left/right */
    } 

</style>