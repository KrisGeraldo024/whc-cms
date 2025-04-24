<template>
    <div class="flex justify-center items-center bg-[#07a554] h-svh w-full">
        <div class="w-[444px] h-auto bg-white flex flex-col items-center p-[32px] gap-y-[24px] rounded-[10px]">
            <div class="flex justify-center w-full">
                <img src="/images/logo-whc.webp" class="w-[150px] h-[150px] " />
            </div>
            <div class="flex flex-col gap-[16px] w-full">
                <h1 class="text-[24px] text-center font-semibold text-[#2A2A2A]">CMS Login</h1>
                <form @submit.prevent="onSubmit" class="w-full flex flex-col gap-[16px]">
                    <div class="flex flex-col w-full gap-y-[8px]">
                        <label for="email" class="text-base font-[500] text-black/70">Email</label>
                        <Field name="email" type="email" 
                            class="border border-black/20 border-[1px] rounded-[10px] p-[16px] outline-none focus:border-ui-color"
                            :class="{
                                'border-red-500': errors.email,
                                'border-gray-300': !errors.email
                            }"
                            v-model="email"  
                            placeholder="Enter your email"/>
                        <ErrorMessage name="email" class="text-red-500 mt-1 text-sm"/>
                    </div>

                    <div class="flex flex-col w-full gap-y-[8px] relative">
                        <label for="password" class="text-base font-[500]  text-black/70">Password</label>
                        <Field 
                            name="password" 
                            :type="passwordFieldType" 
                            v-model="password" 
                            placeholder="Enter your password"
                            :class="{
                                'border-red-500': errors.password,
                                'border-gray-300': !errors.password
                            }"
                            class="border border-black/20 border-[1px] rounded-[10px] p-[16px] outline-none focus:border-ui-color" 
                        />
                        <ErrorMessage name="password" class="text-red-500 mt-1 text-sm" />
                        
                        <!-- Password Toggle SVG -->
                        <span @click="togglePasswordVisibility" class="absolute top-1/2 transform translate-y-1/2 right-[16px] flex items-center cursor-pointer">
                        <svg xmlns="http://www.w3.org/2000/svg" width="27" height="19" viewBox="0 0 27 19" fill="none">
                            <path d="M0.229542 9.13756C0.268696 9.04918 1.21619 6.94724 3.32261 4.84081C6.12931 2.03411 9.67432 0.550781 13.5762 0.550781C17.478 0.550781 21.0231 2.03411 23.8298 4.84081C25.9362 6.94724 26.8881 9.05254 26.9228 9.13756C26.9737 9.25201 27 9.37587 27 9.50112C27 9.62637 26.9737 9.75023 26.9228 9.86468C26.8837 9.95305 25.9362 12.0539 23.8298 14.1603C21.0231 16.9659 17.478 18.4492 13.5762 18.4492C9.67432 18.4492 6.12931 16.9659 3.32261 14.1603C1.21619 12.0539 0.268696 9.95305 0.229542 9.86468C0.178658 9.75023 0.152365 9.62637 0.152365 9.50112C0.152365 9.37587 0.178658 9.25201 0.229542 9.13756ZM13.5762 16.6594C17.0194 16.6594 20.0275 15.4076 22.5176 12.9399C23.5393 11.9238 24.4086 10.7651 25.0983 9.5C24.4087 8.23474 23.5395 7.07608 22.5176 6.06014C20.0275 3.5924 17.0194 2.34063 13.5762 2.34063C10.133 2.34063 7.12492 3.5924 4.6348 6.06014C3.61108 7.07583 2.73992 8.23449 2.04847 9.5C2.85502 11.0057 6.36871 16.6594 13.5762 16.6594ZM13.5762 4.13047C14.6382 4.13047 15.6763 4.44539 16.5593 5.0354C17.4423 5.62541 18.1306 6.46402 18.537 7.44517C18.9434 8.42632 19.0497 9.50596 18.8425 10.5475C18.6354 11.5891 18.124 12.5459 17.373 13.2968C16.6221 14.0478 15.6653 14.5592 14.6237 14.7664C13.5821 14.9735 12.5025 14.8672 11.5214 14.4608C10.5402 14.0544 9.70159 13.3662 9.11158 12.4832C8.52157 11.6001 8.20665 10.562 8.20665 9.5C8.20813 8.07637 8.77432 6.71147 9.78098 5.7048C10.7876 4.69814 12.1525 4.13195 13.5762 4.13047ZM13.5762 13.0797C14.2842 13.0797 14.9763 12.8697 15.5649 12.4764C16.1536 12.0831 16.6124 11.524 16.8834 10.8699C17.1543 10.2158 17.2252 9.49603 17.0871 8.80164C16.949 8.10725 16.608 7.46941 16.1074 6.96878C15.6068 6.46815 14.9689 6.12722 14.2745 5.9891C13.5802 5.85097 12.8604 5.92186 12.2063 6.1928C11.5522 6.46374 10.9931 6.92256 10.5998 7.51123C10.2064 8.09991 9.9965 8.792 9.9965 9.5C9.9965 10.4494 10.3736 11.3599 11.045 12.0312C11.7163 12.7025 12.6268 13.0797 13.5762 13.0797Z" fill="black"/>
                        </svg>
                        </span>
                    </div>
                    <button type="submit" 
                        class="rounded-[10px] w-full px-[24px] py-[12px] text-white bg-[#00A651] text-base text-center">
                        Login
                    </button>
                    <div v-if="errorMessage" class="text-red-500 mt-4">{{ errorMessage }}</div>
                </form>
            </div>
        </div>
    </div>
</template>

<script setup>
import { useForm, Field, ErrorMessage } from 'vee-validate';
import * as yup from 'yup';
import { useAuth } from '#imports'; // Access to @sidebase/nuxt-auth
import { ref } from 'vue'; 
import { useRouter } from 'vue-router';

const auth = useAuth();
const router = useRouter();

const { handleSubmit, errors } = useForm({
    validationSchema: yup.object({
        email: yup.string().required().email(),
        password: yup.string().required(),
    })
});

const email = ref('');
const password = ref('');
const errorMessage = ref('');
const passwordFieldType = ref('password'); // Track the password field type

const togglePasswordVisibility = () => {
    passwordFieldType.value = passwordFieldType.value === 'password' ? 'text' : 'password';
};

// Submit function
const onSubmit = async () => {
    try {
        await auth.signIn({
            email: email.value,
            password: password.value,
        },  { redirect: false });

        navigateTo('/dashboard'); // Manually redirect to dashboard
    } catch (error) {
        console.error('Error:', error);
        errorMessage.value = error.response?.data?.message || 'Login failed';
    }
};

definePageMeta({
    name: 'login',
    middleware: 'authenticator'
})
</script>
