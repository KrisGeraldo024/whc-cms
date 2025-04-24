<template>
    <div class="fixed top-0 left-[260px] flex justify-end items-center px-[16px] h-16 w-[calc(100vw-260px)] bg-white border-y-[1px] border-gray z-30">
        <!-- <form @submit="onSubmit">
            <Search v-model="keyword" />
        </form> -->
        <div class="flex justify-end items-center gap-x-[12px]">
            <!-- <svg width="34" height="34" viewBox="0 0 34 34" fill="none" xmlns="http://www.w3.org/2000/svg">
                <g id="Icon / bell">
                <path id="icon" d="M24 18.586V15C24 11.783 21.815 9.073 18.855 8.258C18.562 7.52 17.846 7 17 7C16.154 7 15.438 7.52 15.145 
                8.258C12.185 9.074 10 11.783 10 15V18.586L8.293 20.293C8.19996 20.3857 8.12617 20.4959 8.07589 20.6172C8.0256 20.7386 7.99981 
                20.8687 8 21V23C8 23.2652 8.10536 23.5196 8.29289 23.7071C8.48043 23.8946 8.73478 24 9 24H25C25.2652 24 25.5196 23.8946 25.7071 
                23.7071C25.8946 23.5196 26 23.2652 26 23V21C26.0002 20.8687 25.9744 20.7386 25.9241 20.6172C25.8738 20.4959 25.8 20.3857 25.707 
                20.293L24 18.586ZM24 22H10V21.414L11.707 19.707C11.8 19.6143 11.8738 19.5041 11.9241 19.3828C11.9744 19.2614 12.0002 19.1313 12 
                19V15C12 12.243 14.243 10 17 10C19.757 10 22 12.243 22 15V19C22 19.266 22.105 19.52 22.293 19.707L24 21.414V22ZM17 27C17.6193 
                27.0008 18.2235 26.8086 18.7285 26.4502C19.2335 26.0917 19.6143 25.5849 19.818 25H14.182C14.3857 25.5849 14.7665 26.0917 15.2715 
                26.4502C15.7765 26.8086 16.3807 27.0008 17 27Z" fill="black"/>
                <circle v-if="notif.length" id="Ellipse 114" cx="23" cy="11" r="4" fill="#F15A22"/>
                </g>
            </svg> -->
            <div @click="toggled()" class="flex justify-center gap-x-[8px] items-center py-[4px] px-[12px] relative cursor-pointer" :class="{'bg-ui-hover rounded-[10px]' : isToggled}">
                <img :src="user?.images?.length ? user.images[0].path : '/avatar.png'" class="w-[40px] h-[40px] rounded-full" alt="avatar"/>
                <h1 v-if="user" class="text-base" :class="{'text-ui-color' : isToggled, 'text-black' : !isToggled}">{{ user.user_detail.full_name }}</h1>
                <p v-else>Loading user data...</p>
                <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg" :class="{'rotate-180 transition' : isToggled, 'rotate-0 transition' : !isToggled}">
                    <g id="Chevron Down">
                    <path id="Vector" fill-rule="evenodd" clip-rule="evenodd" d="M12.3982 15.6634C12.1785 15.8831 11.8224 15.8831 11.6027 15.6634L5.86788 9.92853C5.64821 9.70886 
                    5.64821 9.35276 5.86788 9.13308L6.13305 8.86788C6.35271 8.64821 6.70887 8.64821 6.92854 8.86788L12.0005 13.9398L17.0724 8.86788C17.2921 8.64821 17.6482 8.64821 
                    17.8679 8.86788L18.1331 9.13308C18.3527 9.35276 18.3527 9.70886 18.1331 9.92853L12.3982 15.6634Z" :class="{'fill-ui-color' : isToggled, 'fill-black' : !isToggled}"/>
                    </g>
                </svg>

                <div v-show="isToggled" class="w-full h-auto absolute top-[56px] right-0 bg-white border border-gray rounded-[10px] z-20 p-[8px] flex flex-col gap-y-[8px]">
                    <router-link :to="`/admin-settings/cms-editors/${user?.id}/update`" class="flex items-center gap-x-[12px] px-[8px]">
                        <svg width="26" height="26" viewBox="0 0 26 26" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <g id="edit-profile_svgrepo.com">
                            <path id="Vector" d="M2.16732 22.75H8.66732C8.95464 22.75 9.23018 22.6359 9.43335 22.4327C9.63651 22.2296 9.75065 21.954 9.75065 
                            21.6667C9.75065 21.3794 9.63651 21.1038 9.43335 20.9007C9.23018 20.6975 8.95464 20.5834 8.66732 20.5834H3.32757C3.59045 18.7794 
                            4.49338 17.1302 5.8715 15.9369C7.24963 14.7435 9.01099 14.0856 10.834 14.0834C12.1096 14.0944 13.3489 13.6589 14.337 12.8521C15.3252 
                            12.0454 16 10.9184 16.2444 9.66639C16.4889 8.41438 16.2876 7.1163 15.6755 5.99712C15.0633 4.87794 14.0789 4.00819 12.8929 
                            3.53861C11.7068 3.06903 10.3938 3.02921 9.18146 3.42605C7.96911 3.8229 6.93381 4.63139 6.25498 5.71143C5.57615 6.79146 5.29658 
                            8.07495 5.46471 9.33947C5.63285 10.604 6.2381 11.7698 7.17557 12.635C5.37746 13.3644 3.83757 14.6132 2.75254 16.2219C1.66752 17.8307 
                            1.0866 19.7263 1.08398 21.6667C1.08398 21.954 1.19812 22.2296 1.40129 22.4327C1.60445 22.6359 1.88 22.75 2.16732 22.75ZM10.834 
                            5.4167C11.4768 5.4167 12.1051 5.60731 12.6396 5.96443C13.174 6.32154 13.5906 6.82912 13.8366 7.42298C14.0826 8.01684 14.1469 8.67031 
                            14.0215 9.30075C13.8961 9.93118 13.5866 10.5103 13.1321 10.9648C12.6776 11.4193 12.0985 11.7289 11.468 11.8543C10.8376 11.9797 10.1841 
                            11.9153 9.59026 11.6693C8.9964 11.4233 8.48882 11.0068 8.13171 10.4723C7.77459 9.93785 7.58398 9.30949 7.58398 8.6667C7.58398 7.80475 
                            7.92639 6.9781 8.53589 6.36861C9.14538 5.75911 9.97203 5.4167 10.834 5.4167ZM21.8916 10.0675C21.6884 9.86436 21.4129 9.75027 21.1256 
                            9.75027C20.8384 9.75027 20.5629 9.86436 20.3597 10.0675L13.5889 16.8383C13.4705 16.9576 13.3812 17.1025 13.3278 17.2619L11.9737 
                            21.3244C11.9194 21.4871 11.9047 21.6605 11.9305 21.8301C11.9564 21.9997 12.0222 22.1607 12.1225 22.2999C12.2227 22.4391 12.3547 
                            22.5525 12.5073 22.6308C12.66 22.709 12.8291 22.7499 13.0007 22.75C13.117 22.7499 13.2325 22.7312 13.343 22.6948L17.4055 21.3406C17.5651 
                            21.2873 17.7102 21.1976 17.8291 21.0785L24.5999 14.3076C24.803 14.1045 24.9171 13.829 24.9171 13.5417C24.9171 13.2544 24.803 12.9789 
                            24.5999 12.7758L21.8916 10.0675ZM16.4749 19.3657L14.7102 19.954L15.2984 18.1892L21.1256 12.3652L22.3021 13.5417L16.4749 19.3657Z" fill="#2A2A2A"/>
                            </g>
                        </svg>
                        <h1 class="text-base text-black">Edit My Profile</h1>
                    </router-link>
                    <!-- <div class="flex items-center gap-x-[12px]  px-[8px]">
                        <svg width="26" height="26" viewBox="0 0 26 26" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <g id="setting-2_svgrepo.com">
                            <path id="Vector" d="M13 16.25C14.795 16.25 16.25 14.795 16.25 13C16.25 11.205 14.795 9.75 13 9.75C11.205 9.75 9.75 11.205 9.75 13C9.75 
                            14.795 11.205 16.25 13 16.25Z" stroke="#2A2A2A" stroke-width="2" stroke-miterlimit="10" stroke-linecap="round" stroke-linejoin="round"/>
                            <path id="Vector_2" d="M2.16602 13.9532V12.0465C2.16602 10.9198 3.08685 9.98822 4.22435 9.98822C6.18518 9.98822 6.98685 8.60156 6.00102 
                            6.90072C5.43768 5.92572 5.77352 4.65822 6.75935 4.09489L8.63351 3.02239C9.48935 2.51322 10.5943 2.81656 11.1035 3.67239L11.2227 3.87822C12.1977 
                            5.57906 13.801 5.57906 14.7868 3.87822L14.906 3.67239C15.4152 2.81656 16.5202 2.51322 17.376 3.02239L19.2502 4.09489C20.236 4.65822 20.5718 
                            5.92572 20.0085 6.90072C19.0227 8.60156 19.8243 9.98822 21.7852 9.98822C22.9118 9.98822 23.8435 10.909 23.8435 12.0465V13.9532C23.8435 15.0798 
                            22.9227 16.0115 21.7852 16.0115C19.8243 16.0115 19.0227 17.3982 20.0085 19.099C20.5718 20.0848 20.236 21.3415 19.2502 21.9048L17.376 
                            22.9773C16.5202 23.4865 15.4152 23.1832 14.906 22.3273L14.7868 22.1215C13.8118 20.4207 12.2085 20.4207 11.2227 22.1215L11.1035 22.3273C10.5943 
                            23.1832 9.48935 23.4865 8.63351 22.9773L6.75935 21.9048C5.77352 21.3415 5.43768 20.074 6.00102 19.099C6.98685 17.3982 6.18518 16.0115 4.22435 
                            16.0115C3.08685 16.0115 2.16602 15.0798 2.16602 13.9532Z" stroke="#2A2A2A" stroke-width="2" stroke-miterlimit="10" stroke-linecap="round" 
                            stroke-linejoin="round"/>
                            </g>
                        </svg>
                        <h1 class="text-base text-black">Account Settings</h1>
                    </div> -->
                    <hr class="bg-[#000000] bg-opacity-20 h-[1px] w-full">
                    <div @click="logout()" class="flex items-center gap-x-[12px]  px-[8px]">
                        <svg width="26" height="26" viewBox="0 0 26 26" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <g id="log-out_svgrepo.com">
                            <g id="Interface / Log_Out">
                            <path id="Vector" d="M12.6667 16.2499L15.9167 12.9999M15.9167 12.9999L12.6667 9.74992M15.9167 12.9999H4M9.41667 7.85256V7.80014C9.41667 6.58668 
                            9.41667 5.97951 9.65282 5.51604C9.86054 5.10834 10.1918 4.77713 10.5994 4.56941C11.0629 4.33325 11.6701 4.33325 12.8836 4.33325H17.8669C19.0803 
                            4.33325 19.6862 4.33325 20.1497 4.56941C20.5573 4.77713 20.8897 5.10834 21.0974 5.51604C21.3333 5.97905 21.3333 6.58549 21.3333 
                            7.79657V18.2038C21.3333 19.4149 21.3333 20.0205 21.0974 20.4835C20.8897 20.8911 20.5573 21.223 20.1497 21.4306C19.6867 21.6666 19.0811 21.6666 
                            17.87 21.6666H12.88C11.6689 21.6666 11.0625 21.6666 10.5994 21.4306C10.1918 21.223 9.86054 20.8908 9.65282 20.4832C9.41667 20.0197 9.41667 
                            19.4134 9.41667 18.1999V18.1458" stroke="#2A2A2A" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
                            </g>
                            </g>
                        </svg>
                        <h1 class="text-base text-black">Log out</h1>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>
<script setup>
import { ref } from 'vue'; 
import { useAuth } from '#imports';
import { useAuthStore } from '~/stores/auth';

const auth = useAuth();

const user = ref(null);

onMounted(async () => {
  const session = await auth.getSession(); // Fetch session data
  if (session) {
    user.value = session.user; // Access the user from the session
  }
});

const keyword = ref('');
const notif = ref([]);

const onSubmit = () => {};

const isToggled = ref(false);
const toggled = () => {
    return  isToggled.value = !isToggled.value;
};

const authStore = useAuthStore();
const logout = async () => {
  try {
    await auth.signOut({ redirect: false });
    authStore.resetUser();

    await navigateTo('/');
  } catch (error) {
    console.error('Logout failed:', error);
  }
};

</script>