// https://nuxt.com/docs/api/configuration/nuxt-config
export default defineNuxtConfig({
    compatibilityDate: '2024-04-03',
    devtools: { enabled: true },

    modules: ['@sidebase/nuxt-auth', '@nuxtjs/tailwindcss', '@pinia/nuxt'],
    runtimeConfig: {
        public: {
            apiURL: 'http://api.whc.local/api/v1',
            baseURL: 'http://api.whc.local/api/v1',
        },
    },

    nitro: {
        routeRules: {
        '/**': {
          headers: {
            'X-Frame-Options': 'DENY',
            'Content-Security-Policy': "frame-ancestors 'none';",
          },
        },
      },
    },
    auth: {
        baseURL:
            'http://api.whc.local/api/v1',
        provider: {
            type: 'local',
            endpoints: {
                signIn: { path: `global/user/login`, method: 'post' }, // Login endpoint
                signOut: { path: `global/user/logout`, method: 'post' }, // Logout endpoint
                // user: { path: `global/user/check-token`, method: 'get' }, // User token check endpoint
                getSession: { path: `global/user/check-token`, method: 'get' },
            },
            token: {
                signInResponseTokenPointer: '/token',
                type: 'Bearer',
                cookieName: 'auth.token',
                maxAgeInSeconds: 60 * 60 * 24,
                sameSiteAttribute: 'none', // or 'none' for cross-site requests over HTTPS
                secureCookieAttribute: true, // Set to true if using HTTPS
            },
        },
    },

    plugins: [
        '~/plugins/toast.js',
        '~/plugins/vee-validate.js',
        '~/plugins/axios.js',
    ],

    css: [
        '~/assets/css/main.css', // adjust the path as necessary
    ],
});
