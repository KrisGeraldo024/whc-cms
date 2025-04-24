<template>
    <div id="filter" class="relative h-[44px] w-[404px] px-[12px] py-[10px] gap-[8px] flex items-center border rounded-[10px] text-black/60 transition hover:text-black"
    :class="{'border-ui-color' : isToggled, 'border-[#2A2A2A33]/20' : !isToggled}">
        <!-- <input type="text" v-model="props.keyword" class="border-none focus:outline-none bg-transparent" :placeholder="props.placeholder"> -->
        {{ filter.value ? filter.value :  props.placeholder }}
        <span class="w-[36px] h-[36px] absolute right-[48px] p-[6px] border-r-[1px] border-black/20 flex justify-center items-center" 
        :class="{'hidden' : !isToggled, 'block': isToggled}"  @click="filter.reset">
            <svg xmlns="http://www.w3.org/2000/svg" width="13" height="13" viewBox="0 0 13 13" fill="none">
            <path d="M0.921875 0.961426L11.9995 12.0391" stroke="#2A2A2A" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
            <path d="M0.921875 12.0391L11.9995 0.961426" stroke="#2A2A2A" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
            </svg>
        </span>
        <span class="w-[24px] h-[24px] absolute right-4 cursor-pointer"   @click="isToggled = !isToggled">
            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" :class="{'rotate-180' : isToggled, 'rotate-0' : !isToggled}">
            <path fill-rule="evenodd" clip-rule="evenodd" d="M12.3982 15.203C12.1785 15.4226 11.8224 15.4226 11.6027 15.203L5.86788 9.46808C5.64821 9.24841 
            5.64821 8.89231 5.86788 8.67263L6.13305 8.40743C6.35271 8.18776 6.70887 8.18776 6.92854 8.40743L12.0005 13.4794L17.0724 8.40743C17.2921 8.18776 
            17.6482 8.18776 17.8679 8.40743L18.1331 8.67263C18.3527 8.89231 18.3527 9.24841 18.1331 9.46808L12.3982 15.203Z" fill="#2A2A2A"/>
            </svg>
        </span>
        <div class="absolute mt-[8px] top-full left-0 h-auto max-h-[280px] overflow-y-auto rounded-[10px] w-full bg-white border border-ui-color z-20 text-black" 
        :class="{'hidden' : !isToggled, 'block': isToggled}"
        >
        <div class="h-full overflow-y-auto w-full">
            <ul>
                <li v-for="option in props.options" :key="option" @click="select(option)" class="p-[16px] cursor-pointer hover:bg-ui-hover hover:border-ui-color">
                    {{ option }}
                </li>  
            </ul>
        </div>
        </div>
    </div>
</template>

<script setup>
import { useFilterStore } from '~/stores/filters';
import { useSidebarStore } from '~/stores/sidebar';
    const props = defineProps({
        placeholder: {
            type: String,
            required: true,
        },
        options: {
            type: Array,
            required: true,
        },
        filterBy: {
            type: String,
            default: ''
        }
    });

    const isToggled = ref(false);
    const filter = useFilterStore();
    const sidebar = useSidebarStore();

    const select = (option) => {
        filter.setName(props.filterBy);
        filter.setValue (option);
        isToggled.value = false;
        if (filter.name === 'Category') {
            sidebar.setActiveLink(option);
        }
    }
</script>

<style>
    #filter ::-webkit-scrollbar {
        width: 4px;
        height: 48px !important;
        /* Adjust the scrollbar width as needed */
    }

    #filter ::-webkit-scrollbar-thumb {
        background-color: #00A651;
        /* Color of the scrollbar thumb */
        border-radius: 30px;
        /* Rounded corners for the thumb */
    }

    #filter ::-webkit-scrollbar-track {
        background-color: #fff;
        /* Color of the scrollbar track */
        border-radius: 30px;
        /* Rounded corners for the track */
        margin: 6px;
    }

    #filter ::-webkit-scrollbar {
        padding: 6px 0; /* Space on the top/bottom */
    }

    #filter ::-webkit-scrollbar-thumb {
        margin: 0 6px; /* Space on the left/right */
    }
</style>