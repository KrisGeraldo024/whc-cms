// stores/auth.js
import { defineStore } from 'pinia';

export const useAuthStore = defineStore('auth', {
  state: () => ({
    user: null, // Store user data
  }),
  actions: {
    setUser(userData) {
      this.user = userData; // Set user data
    },
    resetUser() {
      this.user = null; // Reset user data
    },
    async checkSession(auth) {
        try {
            const session = await auth.getSession();
            if (!session || !session.user) {
            this.resetUser(); // Reset user if session is invalid
            }
        } catch (error) {
            console.error('Session check failed:', error);
            this.resetUser(); // Reset user on error
        }
    },
  },
});
