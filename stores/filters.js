import { defineStore } from 'pinia'

export const useFilterStore = defineStore('filter', {
    state: () => {
        return {
            name: '',
            value: '',
            keyword: ''
        }
    },
    actions: {
        setName(name) {
            this.name = name
        },
        setValue(value) {
            this.value = value
        },
        setKeyword(keyword) {
            this.keyword = keyword
        },
        reset() {
            this.name = ''
            this.value = ''
            this.keyword = ''
        }
    }
})