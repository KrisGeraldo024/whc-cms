<template>
  <div class="w-full border border-gray h-[60px] flex justify-end items-center fixed bottom-0 left-0 z-10 bg-[#FDFDFD]">
    <div class="h-6 pr-6 justify-end items-start gap-1 inline-flex">
      <div class="justify-start items-center inline-flex">
        <div class="justify-start items-center flex group relative">
          <div v-if="toggled" class="absolute bottom-full mb-2 h-auto max-h-[180px] overflow-y-auto rounded-[5px] w-full bg-white border border-ui-color z-20 p-[6px] flex flex-col gap-y-[8px]">
            <div @click="pagination.setPage(page)" v-for="page in Array.from({ length: pagination.totalPages }, (_, i) => i + 1)" :key="page" class="cursor-pointer">
              {{ page }}
            </div>
          </div>
          <div class="text-black text-base font-medium leading-normal group-hover:text-ui-color transition">{{pagination.page}}</div>
          <div @click="toggled = !toggled" class="w-5 h-5 relative cursor-pointer">
            <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 20 20" class="fill-black group-hover:fill-ui-color transition" :class="{'rotate-180' : toggled, 'rotate-0' : !toggled}">
            <path fill-rule="evenodd" clip-rule="evenodd" d="M10.3331 12.6694C10.1501 12.8524 9.85331 12.8524 9.67025 12.6694L4.8912 7.89031C4.70814 7.70725 4.70814 7.4105 4.8912 7.22744L5.11217 7.00644C5.29523 6.82338 5.59202 6.82338 5.77509 7.00644L10.0017 11.2331L14.2283 7.00644C14.4114 6.82338 14.7081 6.82338 14.8912 7.00644L15.1122 7.22744C15.2952 7.4105 15.2952 7.70725 15.1122 7.89031L10.3331 12.6694Z"/>
            </svg>
          </div>
        </div>
      </div>
      <div class="opacity-60 text-black text-base font-medium leading-normal">of</div>
      <div class="opacity-60 text-black text-base font-medium leading-normal">{{pagination.totalPages}} pages</div>
    </div>
    <div @click="prevPage()" class="border border-gray p-[10px] h-[60px] w-[60px] justify-center items-center flex group hover:bg-ui-hover cursor-pointer">
      <svg xmlns="http://www.w3.org/2000/svg" width="12" height="22" viewBox="0 0 12 22" class="fill-black group-hover:fill-ui-color transition">
      <path fill-rule="evenodd" clip-rule="evenodd" d="M0.277483 11.6947C-0.0924939 11.311 -0.0924939 10.689 0.277483 10.3052L9.93617 0.287781C10.3061 -0.095927 10.9059 -0.095927 11.2759 0.287781L11.7225 0.750971C12.0925 1.13468 12.0925 1.7568 11.7225 2.14052L3.18033 11L11.7225 19.8595C12.0925 20.2432 12.0925 20.8652 11.7225 21.249L11.2759 21.7122C10.9059 22.0959 10.3061 22.0959 9.93617 21.7122L0.277483 11.6947Z"/>
      </svg>
    </div>
    <div @click="nextPage()" class="border border-gray p-[10px] h-[60px] w-[60px] justify-center items-center flex group hover:bg-ui-hover cursor-pointer">
      <svg xmlns="http://www.w3.org/2000/svg" width="12" height="22" viewBox="0 0 12 22" class="fill-black group-hover:fill-ui-color transition">
      <path fill-rule="evenodd" clip-rule="evenodd" d="M11.7225 11.6947C12.0925 11.311 12.0925 10.689 11.7225 10.3052L2.06383 0.287781C1.69385 -0.095927 1.09411 -0.095927 0.724132 0.287781L0.277483 0.750971C-0.0924943 1.13468 -0.0924943 1.7568 0.277483 2.14052L8.81967 11L0.277483 19.8595C-0.0924945 20.2432 -0.0924945 20.8652 0.277483 21.249L0.724132 21.7122C1.09411 22.0959 1.69385 22.0959 2.06383 21.7122L11.7225 11.6947Z"/>
      </svg>
    </div>
  </div>
</template>

<script setup>
import { usePaginationStore } from '~/stores/pagination';

  const pagination = usePaginationStore();

  const prevPage = () => {
    pagination.page > 1 ? pagination.setPage(pagination.page - 1) : pagination.setPage(1);
  }

  const nextPage = () => {
    pagination.page < pagination.totalPages ? pagination.setPage(pagination.page + 1) : pagination.setPage(pagination.totalPages);
  }

  const toggled = ref(false);
</script>