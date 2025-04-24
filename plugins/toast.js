import { toast } from 'vue3-toastify';
import 'vue3-toastify/dist/index.css';

export default defineNuxtPlugin(() => {
    return {
        provide: {
            toast: {
                success: message => {
                    toast.success(message, {
                        autoClose: 3000,
                        position: toast.POSITION.TOP_RIGHT,
                        theme: 'colored',
                    });
                },
                error: message => {
                    toast.error(message, {
                        autoClose: 3000,
                        position: toast.POSITION.TOP_RIGHT,
                        theme: 'colored',
                    });
                },
                warning: message => {
                    toast.warning(message, {
                        autoClose: 3000,
                        position: toast.POSITION.TOP_RIGHT,
                        theme: 'colored',
                    });
                },
                info: message => {
                    toast.info(message, {
                        autoClose: 3000,
                        position: toast.POSITION.TOP_RIGHT,
                        theme: 'colored',
                    });
                },
            },
        },
    };
});
