<template>
  <div class="flex bg-offwhite h-screen overflow-hidden">
    <Sidebar v-if="authStore.user" />
    <Topbar v-if="authStore.user" />
    <div class="flex flex-col w-full overflow-x-auto">

      <PageTitle v-if="route.name !== 'dashboard' && pageTitle.title && authStore.user" />
      <slot />
    </div>
  </div>
</template>
<script setup>
import { useAuthStore } from '~/stores/auth'; // Adjust path as necessary
import { useSidebarStore } from '~/stores/sidebar'; // Adjust path as necessary
import { useRoute } from 'vue-router';
import { usePageTitleStore } from '~/stores/pageTitle';
import { useAuth } from '#imports'; // Access to @sidebase/nuxt-auth
import { navigateTo } from 'nuxt/app'; // Ensure navigateTo is imported
import { onMounted, onBeforeUnmount } from 'vue';

const authStore = useAuthStore();
const sidebar = useSidebarStore();
const route = useRoute();
const pageTitle = usePageTitleStore();
const auth = useAuth();

// Timeout duration (e.g., 10 minutes = 600000 milliseconds)
const inactivityTimeout = 1000 * 60 * 60 * 2;
let timeoutId = null;
let lastActivityTime = null;

const signOutUser = async () => {
  try {
    await auth.signOut({ redirect: false });
    authStore.resetUser();
    await navigateTo('/'); // Redirect to home page or login page after logout
  } catch (error) {
    console.error('Logout failed:', error);
  }
};

// Reset the inactivity timeout when user interacts with the page
const resetTimeout = () => {
  clearTimeout(timeoutId);
  lastActivityTime = new Date().getTime(); // Record the time of the last activity
  startInactivityTimer();
};

// Start the inactivity timer
const startInactivityTimer = () => {
  timeoutId = setTimeout(() => {
    const currentTime = new Date().getTime();
    const timeElapsed = currentTime - lastActivityTime;

    // If the time elapsed is greater than the inactivity timeout, log the user out
    if (timeElapsed >= inactivityTimeout) {
      signOutUser();
    } else {
      // Restart the timer if it hasn't passed the timeout yet
      startInactivityTimer();
    }
  }, inactivityTimeout);
};

// Handle system sleep/hibernate by checking time difference on resume
const checkForSleep = () => {
  const currentTime = new Date().getTime();
  const timeElapsed = currentTime - lastActivityTime;

  if (timeElapsed >= inactivityTimeout) {
    // Auto-logout if the time passed during sleep/hibernate exceeds the timeout
    signOutUser();
  } else {
    // Otherwise, reset the timer and continue tracking activity
    resetTimeout();
  }
};

const handleBeforeUnload = (event) => {
  // Use the new PerformanceNavigationTiming API to check for a reload
  const [navigationEntry] = performance.getEntriesByType('navigation');

  if (navigationEntry && navigationEntry.type === 'reload') {
    // If it's a reload, don't trigger the logout
    return;
  }

  // Optionally, cancel the event as stated by the standard.
  event.preventDefault();

  // Set a flag indicating that a close attempt was made
  const closeAttempt = true;

  // Chrome requires returnValue to show the warning dialog
  event.returnValue = '';

  // Listen for the unload event which actually fires when the page is closed
  window.addEventListener('unload', () => {
    if (closeAttempt) {
      // Only log the user out if the unload event is triggered
      signOutUser();
    }
  });
};


onMounted(() => {
  fetchRecords();

  lastActivityTime = new Date().getTime(); // Set initial time of activity
  startInactivityTimer(); // Start the timer when the component is mounted

  // Listen for user activity and reset the timer
  window.addEventListener('mousemove', resetTimeout);
  window.addEventListener('keydown', resetTimeout);
  window.addEventListener('scroll', resetTimeout);

  // Listen for when the page regains focus after sleep or hibernate
  window.addEventListener('focus', checkForSleep);


  // Listen for browser/tab close or refresh event
  window.addEventListener('beforeunload', handleBeforeUnload);
});

onBeforeUnmount(() => {
  // Clean up listeners and timeout when the component is destroyed
  clearTimeout(timeoutId);
  window.removeEventListener('mousemove', resetTimeout);
  window.removeEventListener('keydown', resetTimeout);
  window.removeEventListener('scroll', resetTimeout);

  // Remove event listener for focus
  window.removeEventListener('focus', checkForSleep);

  // Remove beforeunload event listener
  window.removeEventListener('beforeunload', handleBeforeUnload);
});


const nuxtApp = useNuxtApp()

const records = ref(null);

const fetchRecords = async () => {
  try {
    const response = await nuxtApp.$axios.get(`/cms/page-categories`); // Add your endpoint
    records.value = response.data.record;

    if (records.value.length > 0) {
      const all_pages = records.value.map((record) => ({
        name: record.category,
        slug: `/pages`,
        unique: `pages-${record.category.toLowerCase()
          .replace(/&/g, 'and') // Replace "&" with "and"
          .replace(/'/g, '')    // Remove apostrophes
          .replace(/ /g, '-')}`,
      }));

      const permissions = JSON.parse(authStore.user.role.permissions);
      // console.log(permissions);
      // if (!permissions.find(item => 
      //     Array.isArray(permissions) 
      //       ? permissions.includes(to.name) 
      //   ))
      let isValid = 0;
      all_pages.forEach((page) => {
        if (permissions.find(item => item.unique === page.unique)) {
          isValid++;
        }
      })
      console.log(isValid, all_pages.length)
      let pages = isValid === all_pages.length ? [
        {
          name: 'All Pages',
          slug: '/pages',
          unique: 'pages-all',
        },
      ] : [];
      pages.push(...all_pages);

      sidebar.setPages(pages);
      // console.log(sidebar.links);
    } else {
      console.log('No pages found');
    }
  } catch (error) {
    console.error('Error:', error);
  }
};

watch(authStore, () => {
  if (authStore.user) {
    fetchRecords();
  }
});

useSeoMeta({
  title: 'White Horse Ceramic | CMS',
  ogTitle: 'White Horse Ceramic | CMS',
  description: 'This is the content management system for White Horse Ceramic ',
  ogDescription: 'This is the content management system for White Horse Ceramic ',
  // ogImage: '/suntrust_logo.png',
  twitterCard: 'summary_large_image',
});

</script>