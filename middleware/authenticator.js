// middleware/authenticator.js
import { defineNuxtRouteMiddleware, useAuth, useRouter } from '#imports'
import { useAuthStore } from '~/stores/auth'; // Adjust the path as necessary
import { useFilterStore } from '~/stores/filters';

export default defineNuxtRouteMiddleware(async (to, from) => {
  const auth = useAuth()
  if (!auth) {
    console.error('Auth composable is not available')
    return
  }
  try {
    const token = auth.getSession ? await auth.getSession() : auth.token
    // console.log(token)

    const authStore = useAuthStore();
    const filter = useFilterStore();
    if (token) {
      if (to.name === 'login') {
        return navigateTo('/dashboard')
      }

      const session = await auth.getSession();
      authStore.setUser(session.user);

      const permissions = JSON.parse(authStore.user.role.permissions);
      if (
        (to.name !== 'dashboard' && (to.name !== 'pages' || (to.name === 'pages' && filter.value === '') )) && 
        !permissions.find(item => 
          Array.isArray(item.route_name) 
            ? item.route_name.includes(to.name) 
            : item.route_name === to.name
        )
      ) {
        return navigateTo('/dashboard');
      }

      if (session && session.user) {
          
        return true
      }
    } else {
      // If the user is not authenticated, redirect to login
      if (to.name !== 'login') {
        return navigateTo('/')
      }
    }
  } catch (err) {
    console.error('Error handling middleware:', err)
  }
})
