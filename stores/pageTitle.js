import { defineStore } from 'pinia'

export const usePageTitleStore = defineStore('pageTitle', {
    state: () => {
        return {
            title: '',
            breadcrumbs: [],
            pageFrom: '',
            pageFromRoute: ''
        }
    },
    actions: {
        setTitle(title) {
            this.title = title
        },
        setBreadcrumbs(breadcrumbs) {
            this.breadcrumbs = breadcrumbs
        },
        setPageFrom(pageFrom) {
            this.pageFrom = pageFrom
        },
        setPageFromRoute(pageFromRoute) {
            this.pageFromRoute = pageFromRoute
        },
        reset() {
            this.title = ''
            this.breadcrumbs = [],
            this.pageFrom = '',
            this.pageFromRoute = ''
        }
    }
})