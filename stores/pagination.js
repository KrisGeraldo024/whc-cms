import { defineStore } from 'pinia'

export const usePaginationStore = defineStore('pagination', {
    state: () => {
        return {
            limit: 10,
            totalPages: 1,
            page: 1
        }
    },
    actions: {
        setLimit(limit) {
            this.limit = limit
        },
        setTotalPages(totalPages) {
            this.totalPages = totalPages
        },
        setPage(page) {
            this.page = page
        },
        reset() {
            this.limit = 10
            this.totalPages = 0
            this.page = 1
        }
    }
})