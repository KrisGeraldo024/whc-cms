import { defineStore } from 'pinia';

export const useSidebarStore = defineStore('sidebar', {
    // arrow function recommended for full type inference
    state: () => {
        return {
            links: [
                {
                    name: 'Dashboard',
                    slug: '/dashboard',
                    unique: 'dashboard',
                    icon: `<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none">
            <path d="M18.7219 3.1875H15.8419C14.7815 3.1875 13.9219 4.04711 13.9219 5.1075V7.9875C13.9219 9.04789 14.7815 9.90749 15.8419 9.90749H18.7219C19.7823 9.90749 20.6419 9.04789 20.6419 7.9875V5.1075C20.6419 4.04711 19.7823 3.1875 18.7219 3.1875Z" stroke="#2A2A2A" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
            <path d="M8.15938 3.1875H5.27938C4.21899 3.1875 3.35938 4.04711 3.35938 5.1075V7.9875C3.35938 9.04789 4.21899 9.90749 5.27938 9.90749H8.15938C9.21976 9.90749 10.0794 9.04789 10.0794 7.9875V5.1075C10.0794 4.04711 9.21976 3.1875 8.15938 3.1875Z" stroke="#2A2A2A" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
            <path d="M18.7219 13.7471H15.8419C14.7815 13.7471 13.9219 14.6067 13.9219 15.6671V18.5471C13.9219 19.6075 14.7815 20.4671 15.8419 20.4671H18.7219C19.7823 20.4671 20.6419 19.6075 20.6419 18.5471V15.6671C20.6419 14.6067 19.7823 13.7471 18.7219 13.7471Z" stroke="#2A2A2A" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
            <path d="M8.15938 13.7471H5.27938C4.21899 13.7471 3.35938 14.6067 3.35938 15.6671V18.5471C3.35938 19.6075 4.21899 20.4671 5.27938 20.4671H8.15938C9.21976 20.4671 10.0794 19.6075 10.0794 18.5471V15.6671C10.0794 14.6067 9.21976 13.7471 8.15938 13.7471Z" stroke="#2A2A2A" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
            </svg>`,
                },
                {
                    name: 'Pages',
                    slug: '/pages',
                    unique: 'pages',
                    icon: `<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none">
            <path fill-rule="evenodd" clip-rule="evenodd" d="M14 7C13.4477 7 13 7.44772 13 8V16C13 16.5523 13.4477 17 14 17H18C18.5523 17 19 16.5523 19 16V8C19 7.44772 18.5523 7 18 7H14ZM17 9H15V15H17V9Z" fill="#2A2A2A"/>
            <path d="M6 7C5.44772 7 5 7.44772 5 8C5 8.55228 5.44772 9 6 9H10C10.5523 9 11 8.55228 11 8C11 7.44772 10.5523 7 10 7H6Z" fill="#2A2A2A"/>
            <path d="M6 11C5.44772 11 5 11.4477 5 12C5 12.5523 5.44772 13 6 13H10C10.5523 13 11 12.5523 11 12C11 11.4477 10.5523 11 10 11H6Z" fill="#2A2A2A"/>
            <path d="M5 16C5 15.4477 5.44772 15 6 15H10C10.5523 15 11 15.4477 11 16C11 16.5523 10.5523 17 10 17H6C5.44772 17 5 16.5523 5 16Z" fill="#2A2A2A"/>
            <path fill-rule="evenodd" clip-rule="evenodd" d="M4 3C2.34315 3 1 4.34315 1 6V18C1 19.6569 2.34315 21 4 21H20C21.6569 21 23 19.6569 23 18V6C23 4.34315 21.6569 3 20 3H4ZM20 5H4C3.44772 5 3 5.44772 3 6V18C3 18.5523 3.44772 19 4 19H20C20.5523 19 21 18.5523 21 18V6C21 5.44772 20.5523 5 20 5Z" fill="#2A2A2A"/>
            </svg>`,
                    subs: [],
                },
                {
                    name: 'Tiles Directory',
                    slug: '/properties/house-and-lots',
                    unique: 'properties',
                    icon: `<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none">
            <path fill-rule="evenodd" clip-rule="evenodd" d="M14 7C13.4477 7 13 7.44772 13 8V16C13 16.5523 13.4477 17 14 17H18C18.5523 17 19 16.5523 19 16V8C19 7.44772 18.5523 7 18 7H14ZM17 9H15V15H17V9Z" fill="#2A2A2A"/>
            <path d="M6 7C5.44772 7 5 7.44772 5 8C5 8.55228 5.44772 9 6 9H10C10.5523 9 11 8.55228 11 8C11 7.44772 10.5523 7 10 7H6Z" fill="#2A2A2A"/>
            <path d="M6 11C5.44772 11 5 11.4477 5 12C5 12.5523 5.44772 13 6 13H10C10.5523 13 11 12.5523 11 12C11 11.4477 10.5523 11 10 11H6Z" fill="#2A2A2A"/>
            <path d="M5 16C5 15.4477 5.44772 15 6 15H10C10.5523 15 11 15.4477 11 16C11 16.5523 10.5523 17 10 17H6C5.44772 17 5 16.5523 5 16Z" fill="#2A2A2A"/>
            <path fill-rule="evenodd" clip-rule="evenodd" d="M4 3C2.34315 3 1 4.34315 1 6V18C1 19.6569 2.34315 21 4 21H20C21.6569 21 23 19.6569 23 18V6C23 4.34315 21.6569 3 20 3H4ZM20 5H4C3.44772 5 3 5.44772 3 6V18C3 18.5523 3.44772 19 4 19H20C20.5523 19 21 18.5523 21 18V6C21 5.44772 20.5523 5 20 5Z" fill="#2A2A2A"/>
            </svg>`,
                    // subs: [
                    //     {
                    //         name: 'House & Lots',
                    //         slug: '/properties/house-and-lots',
                    //         unique: 'house-and-lots',
                    //     },
                    //     {
                    //         name: 'Condominiums',
                    //         slug: '/properties/condominiums',
                    //         unique: 'condominiums',
                    //     },
                    // ],
                },
                {
                    name: 'News and Articles',
                    slug: '/news-and-articles',
                    unique: 'news-and-articles',
                    icon: `<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none">
            <g clip-path="url(#clip0_4336_79)">
              <mask id="mask0_4336_79" style="mask-type:luminance" maskUnits="userSpaceOnUse" x="0" y="0" width="24" height="24">
                <path d="M24 0H0V24H24V0Z" fill="white"/>
              </mask>
              <g mask="url(#mask0_4336_79)">
                <path d="M3 4V18C3 19.1046 3.89543 20 5 20H17H19C20.1046 20 21 19.1046 21 18V8H17" stroke="#292929" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
                <path d="M3 4H17V18C17 19.1046 17.8954 20 19 20" stroke="#292929" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
                <path d="M13 8H7" stroke="#292929" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
                <path d="M13 12H9" stroke="#292929" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
              </g>
            </g>
            <defs>
              <clipPath id="clip0_4336_79">
                <rect width="24" height="24" fill="white"/>
              </clipPath>
            </defs>
          </svg>`,
                    subs: [
                        {
                            name: 'Articles',
                            slug: '/articles',
                            unique: 'articles',
                        },
                    ],
                },
            //     {
            //         name: 'Payment Channels',
            //         slug: '/payment-channels',
            //         unique: 'payment-channels',
            //         icon: `<svg xmlns="http://www.w3.org/2000/svg" width="24" height="25" viewBox="0 0 24 25" fill="none">
            //   <path d="M6.76367 15.8123C6.04711 15.8123 5.33055 15.8123 4.62017 15.8123C4.13834 15.8123 3.79859 15.4973 3.80477 15.0649C3.80477 14.6386 4.13834 14.3359 4.61399 14.3359C6.04711 14.3359 7.47405 14.3359 8.90717 14.3359C9.389 14.3359 9.72875 14.6448 9.72257 15.0834C9.72257 15.5096 9.38282 15.8123 8.91335 15.8123C8.19679 15.8123 7.48023 15.8123 6.76985 15.8123H6.76367Z" fill="black"/>
            //   <path d="M5.65568 12.8523C5.2974 12.8523 4.93294 12.8523 4.57466 12.8523C4.1299 12.8523 3.8025 12.5249 3.80868 12.1049C3.80868 11.691 4.13607 11.3822 4.57466 11.376C5.2974 11.376 6.02013 11.376 6.74287 11.376C7.18763 11.376 7.51503 11.7034 7.50885 12.1234C7.50885 12.5311 7.17528 12.8462 6.74287 12.8523C6.38459 12.8523 6.02013 12.8523 5.66185 12.8523H5.65568Z" fill="black"/>
            //   <path d="M23.0324 4.86588C23.0324 3.43276 22.0996 2.5 20.6603 2.5C14.8476 2.5 9.0286 2.5 3.21581 2.5C1.78269 2.5 0.84375 3.43276 0.84375 4.86588C0.84375 8.70813 0.84375 12.5504 0.84375 16.3988C0.84375 17.8319 1.77651 18.7709 3.20963 18.7709C5.24812 18.7709 7.29279 18.7709 9.33128 18.7709C9.94901 18.7709 10.5606 18.7709 11.1783 18.7709C11.5118 18.7709 11.7836 18.5794 11.8887 18.2829C12.0678 17.7825 11.7033 17.2945 11.135 17.2945C8.49118 17.2945 5.85349 17.2945 3.20963 17.2945C2.59809 17.2945 2.32011 17.0227 2.32011 16.405C2.32011 13.5758 2.32011 10.7528 2.32011 7.92362C2.32011 7.73213 2.351 7.67035 2.56102 7.67035C5.68053 7.67653 8.80004 7.67035 11.9195 7.67035C15.0391 7.67035 18.1709 7.67035 21.3028 7.67035C21.519 7.67035 21.5622 7.73213 21.556 7.93597C21.5437 8.81932 21.556 9.70884 21.556 10.5922C21.556 10.9381 21.729 11.2037 22.0193 11.3211C22.5197 11.525 23.0324 11.1481 23.0324 10.5737C23.0324 8.67107 23.0324 6.76848 23.0324 4.86588ZM21.3275 6.20017C18.4674 6.20017 15.6135 6.20017 12.7535 6.20017H11.9195C8.80004 6.20017 5.68053 6.20017 2.56102 6.20017C2.35717 6.20017 2.30158 6.15693 2.31393 5.95308C2.33247 5.58245 2.31393 5.21181 2.31393 4.84735C2.31393 4.25434 2.59191 3.98254 3.19728 3.98254C7.00246 3.98254 10.8076 3.98254 14.6128 3.98254C18.418 3.98254 18.6651 3.98254 20.6912 3.98254C21.2595 3.98254 21.5437 4.27287 21.5499 4.82882C21.5499 5.21181 21.5375 5.60098 21.5499 5.98397C21.556 6.17546 21.4943 6.20635 21.3213 6.20635L21.3275 6.20017Z" fill="black"/>
            //   <path d="M17.8686 11.376C15.0085 11.3698 12.6797 13.6863 12.6797 16.5463C12.6797 19.3941 14.99 21.7229 17.8377 21.729C20.6978 21.7352 23.0266 19.4126 23.0266 16.5587C23.0266 13.7048 20.7163 11.3822 17.8686 11.376ZM17.8562 20.2527C15.8177 20.2527 14.156 18.5972 14.156 16.5525C14.156 14.514 15.8115 12.8523 17.8562 12.8523C19.8947 12.8523 21.5564 14.5079 21.5564 16.5525C21.5564 18.591 19.9009 20.2527 17.8562 20.2527Z" fill="black"/>
            //   <path d="M16.0739 15.818C16.2283 15.818 16.4013 15.9044 16.5496 16.0527C16.809 16.3121 17.0808 16.5654 17.3279 16.8434C17.4576 16.9855 17.5256 16.9607 17.6429 16.8372C18.1247 16.343 18.6189 15.855 19.1131 15.367C19.4652 15.0149 19.9038 14.9902 20.2188 15.2929C20.5401 15.6018 20.5153 16.0527 20.1509 16.4171C19.4529 17.1152 18.761 17.8132 18.0568 18.5112C17.6862 18.8819 17.2723 18.8819 16.9017 18.5112C16.426 18.0418 15.9504 17.5661 15.4809 17.0905C15.2523 16.8557 15.1967 16.5407 15.3265 16.2627C15.4438 15.9971 15.7156 15.8241 16.0677 15.8303L16.0739 15.818Z" fill="black"/>
            // </svg>`,
            //         subs: [
            //             {
            //                 name: 'Payment Methods',
            //                 slug: '/payment-channels/payment-methods',
            //                 unique: 'payment-methods',
            //             },
            //         ],
            //     },
                {
                    name: 'Awards',
                    slug: '/awards',
                    unique: 'awards',
                    icon: `<svg xmlns="http://www.w3.org/2000/svg" width="24" height="25" viewBox="0 0 24 25" fill="none">
              <path d="M12.3636 15.2273C15.8782 15.2273 18.7273 12.3782 18.7273 8.86363C18.7273 5.3491 15.8782 2.5 12.3636 2.5C8.8491 2.5 6 5.3491 6 8.86363C6 12.3782 8.8491 15.2273 12.3636 15.2273Z" stroke="#2A2A2A" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
              <path d="M8.91836 14.2181L7.81836 22.4999L12.3638 19.7726L16.9093 22.4999L15.8093 14.209" stroke="#2A2A2A" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
            </svg>`,
                    subs: [
                        {
                            name: 'Awards',
                            slug: '/awards',
                            unique: 'awards',
                        },
                    ],
                },
        //         {
        //             name: 'Careers',
        //             slug: '/careers',
        //             unique: 'careers',
        //             icon: `<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none">
        //     <path d="M16 7V6.2C16 5.0799 16 4.51984 15.782 4.09202C15.5903 3.71569 15.2843 3.40973 14.908 3.21799C14.4802 3 13.9201 3 12.8 3H11.2C10.0799 3 9.51984 3 9.09202 3.21799C8.71569 3.40973 8.40973 3.71569 8.21799 4.09202C8 4.51984 8 5.0799 8 6.2V7M3.02721 10.0263C3.38776 10.3719 7.28572 14 12 14C16.7143 14 20.6122 10.3719 20.9728 10.0263M3.02721 10.0263C3 10.493 3 11.0665 3 11.8V16.2C3 17.8802 3 18.7202 3.32698 19.362C3.6146 19.9265 4.07354 20.3854 4.63803 20.673C5.27976 21 6.11984 21 7.8 21H16.2C17.8802 21 18.7202 21 19.362 20.673C19.9265 20.3854 20.3854 19.9265 20.673 19.362C21 18.7202 21 17.8802 21 16.2V11.8C21 11.0665 21 10.493 20.9728 10.0263M3.02721 10.0263C3.06233 9.4241 3.14276 8.99959 3.32698 8.63803C3.6146 8.07354 4.07354 7.6146 4.63803 7.32698C5.27976 7 6.11984 7 7.8 7H16.2C17.8802 7 18.7202 7 19.362 7.32698C19.9265 7.6146 20.3854 8.07354 20.673 8.63803C20.8572 8.99959 20.9377 9.4241 20.9728 10.0263" stroke="#2A2A2A" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
        //   </svg>`,
        //             subs: [
        //                 {
        //                     name: 'Job Listings',
        //                     slug: '/careers/job-listings',
        //                     unique: 'job-listings',
        //                 },
        //                 {
        //                     name: 'In house sales group',
        //                     slug: '/careers/in-house-sales-groups',
        //                     unique: 'in-house-sales-groups',
        //                 },
        //                 // {
        //                 //   name: 'Business Partner Network',
        //                 //   slug: '/careers/business-partner-network',
        //                 //   unique: 'business-partner-network',
        //                 // }
        //             ],
        //         },
                {
                    name: 'Inquiries',
                    slug: '/inquiries',
                    unique: 'inquiries',
                    icon: `<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none">
              <path d="M16 7V6.2C16 5.0799 16 4.51984 15.782 4.09202C15.5903 3.71569 15.2843 3.40973 14.908 3.21799C14.4802 3 13.9201 3 12.8 3H11.2C10.0799 3 9.51984 3 9.09202 3.21799C8.71569 3.40973 8.40973 3.71569 8.21799 4.09202C8 4.51984 8 5.0799 8 6.2V7M3.02721 10.0263C3.38776 10.3719 7.28572 14 12 14C16.7143 14 20.6122 10.3719 20.9728 10.0263M3.02721 10.0263C3 10.493 3 11.0665 3 11.8V16.2C3 17.8802 3 18.7202 3.32698 19.362C3.6146 19.9265 4.07354 20.3854 4.63803 20.673C5.27976 21 6.11984 21 7.8 21H16.2C17.8802 21 18.7202 21 19.362 20.673C19.9265 20.3854 20.3854 19.9265 20.673 19.362C21 18.7202 21 17.8802 21 16.2V11.8C21 11.0665 21 10.493 20.9728 10.0263M3.02721 10.0263C3.06233 9.4241 3.14276 8.99959 3.32698 8.63803C3.6146 8.07354 4.07354 7.6146 4.63803 7.32698C5.27976 7 6.11984 7 7.8 7H16.2C17.8802 7 18.7202 7 19.362 7.32698C19.9265 7.6146 20.3854 8.07354 20.673 8.63803C20.8572 8.99959 20.9377 9.4241 20.9728 10.0263" stroke="#2A2A2A" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
            </svg>`,
                    subs: [
                        // {
                        //     name: 'Get a Quote',
                        //     slug: '/inquiries/get-quote',
                        //     unique: 'get-quote',
                        // },
                        // {
                        //     name: 'In House Sales Group',
                        //     slug: '/inquiries/in-house-sales-group',
                        //     unique: 'in-house-sales-group',
                        // },
                        // {
                        //     name: 'Business Partner Network',
                        //     slug: '/inquiries/business-partner-network',
                        //     unique: 'business-partner-network',
                        // },
                        // {
                        //     name: 'Corporate Careers',
                        //     slug: '/inquiries/corporate-careers',
                        //     unique: 'corporate-careers',
                        // },
                        {
                            name: 'Contact Us',
                            slug: '/inquiries/contact-us',
                            unique: 'contact-us',
                        },
                        // {
                        //   name: 'Business Partner Network',
                        //   slug: '/careers/business-partner-network',
                        //   unique: 'business-partner-network',
                        // }
                    ],
                },
                {
                    name: 'Taxonomies',
                    slug: '/taxonomies',
                    unique: 'taxonomies',
                    icon: `<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none">
            <path d="M8 6.00067L21 6.00139M8 12.0007L21 12.0015M8 18.0007L21 18.0015M3.5 6H3.51M3.5 12H3.51M3.5 18H3.51M4 6C4 6.27614 3.77614 6.5 3.5 6.5C3.22386 6.5 3 6.27614 3 6C3 5.72386 3.22386 5.5 3.5 5.5C3.77614 5.5 4 5.72386 4 6ZM4 12C4 12.2761 3.77614 12.5 3.5 12.5C3.22386 12.5 3 12.2761 3 12C3 11.7239 3.22386 11.5 3.5 11.5C3.77614 11.5 4 11.7239 4 12ZM4 18C4 18.2761 3.77614 18.5 3.5 18.5C3.22386 18.5 3 18.2761 3 18C3 17.7239 3.22386 17.5 3.5 17.5C3.77614 17.5 4 17.7239 4 18Z" stroke="#2A2A2A" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
            </svg>`,
                    subs: [
                        {
                            name: 'Tile Categories',
                            subs: [
                                {
                                    name: 'Brands',
                                    slug: '/taxonomies/categories/brands',
                                },
                                {
                                    name: 'Materials',
                                    slug: '/taxonomies/categories/material',
                                },
                                {
                                    name: 'Types',
                                    slug: '/taxonomies/categories/types',
                                },
                                {
                                    name: 'Purpose',
                                    slug: '/taxonomies/categories/purpose',
                                },
                                {
                                    name: 'Sizes',
                                    slug: '/taxonomies/categories/size',
                                },
                                {
                                    name: 'Finish',
                                    slug: '/taxonomies/categories/finish',
                                },
                                {
                                    name: 'Shade',
                                    slug: '/taxonomies/categories/shade',
                                },
                                {
                                    name: 'Features',
                                    slug: '/taxonomies/categories/features',
                                },
                                {
                                    name: 'Color',
                                    slug: '/taxonomies/categories/color',
                                },
                                {
                                    name: 'Application',
                                    slug: '/taxonomies/categories/application',
                                },
                            ],
                        },
                        {
                            name: 'Media Center',
                            subs: [
                                {
                                    name: 'Article Categories',
                                    slug: '/taxonomies/media-center/article-categories',
                                },
                            ],
                        },
                        // {
                        //     name: 'Careers',
                        //     subs: [
                        //         {
                        //             name: 'Job Locations',
                        //             slug: '/taxonomies/careers/job-locations',
                        //         },
                        //         {
                        //             name: 'Employment Types',
                        //             slug: '/taxonomies/careers/employment-types',
                        //         },
                        //     ],
                        // },
                        {
                            name: 'Contact Us',
                            subs: [
                                {
                                    name: 'Inquiry Types & Emails',
                                    slug: '/taxonomies/contact-us/inquiry-types',
                                },
                                {
                                    name: 'After Sales Officers',
                                    slug: '/taxonomies/contact-us/after-sales-officers',
                                },
                                {
                                    name: 'Office Locations',
                                    slug: '/taxonomies/contact-us/office-locations',
                                },
                                {
                                    name: 'Platform Names',
                                    slug: '/taxonomies/contact-us/referral-types',
                                },
                            ],
                        },
                        {
                            name: 'Sellers',
                            subs: [
                                {
                                    name: 'Business Partner - Priority Locations',
                                    slug: '/taxonomies/sellers/priority-locations',
                                },
                            ],
                        },
                        {
                            name: 'Email Recipients',
                            subs: [
                                {
                                    name: 'Form Pages',
                                    slug: '/taxonomies/email-recipients/form-pages',
                                },
                            ],
                        },
                    ],
                },
                {
                    name: 'Settings',
                    slug: '/admin-settings',
                    unique: 'admin-settings',
                    icon: `<svg xmlns="http://www.w3.org/2000/svg" width="23" height="23" viewBox="0 0 23 23" fill="none">
            <path d="M11.5 14.375C13.0879 14.375 14.375 13.0879 14.375 11.5C14.375 9.91214 13.0879 8.625 11.5 8.625C9.91214 8.625 8.625 9.91214 8.625 11.5C8.625 13.0879 9.91214 14.375 11.5 14.375Z" stroke="#2A2A2A" stroke-width="2" stroke-miterlimit="10" stroke-linecap="round" stroke-linejoin="round"/>
            <path d="M1.91797 12.344V10.6573C1.91797 9.66065 2.73255 8.83652 3.7388 8.83652C5.47339 8.83652 6.18255 7.60986 5.31047 6.10527C4.81214 5.24277 5.10922 4.12153 5.9813 3.62319L7.63922 2.67444C8.3963 2.22403 9.3738 2.49236 9.82422 3.24944L9.92964 3.43153C10.7921 4.93611 12.2105 4.93611 13.0826 3.43153L13.188 3.24944C13.6384 2.49236 14.6159 2.22403 15.373 2.67444L17.0309 3.62319C17.903 4.12153 18.2001 5.24277 17.7017 6.10527C16.8296 7.60986 17.5388 8.83652 19.2734 8.83652C20.2701 8.83652 21.0942 9.65107 21.0942 10.6573V12.344C21.0942 13.3407 20.2796 14.1648 19.2734 14.1648C17.5388 14.1648 16.8296 15.3915 17.7017 16.8961C18.2001 17.7682 17.903 18.8798 17.0309 19.3782L15.373 20.3269C14.6159 20.7773 13.6384 20.509 13.188 19.7519L13.0826 19.5698C12.2201 18.0652 10.8017 18.0652 9.92964 19.5698L9.82422 19.7519C9.3738 20.509 8.3963 20.7773 7.63922 20.3269L5.9813 19.3782C5.10922 18.8798 4.81214 17.7586 5.31047 16.8961C6.18255 15.3915 5.47339 14.1648 3.7388 14.1648C2.73255 14.1648 1.91797 13.3407 1.91797 12.344Z" stroke="#2A2A2A" stroke-width="2" stroke-miterlimit="10" stroke-linecap="round" stroke-linejoin="round"/>
            </svg>`,
                    subs: [
                        {
                            name: 'CMS Editors',
                            slug: '/admin-settings/cms-editors',
                            unique: 'cms-editors',
                        },
                        {
                            name: 'Roles',
                            slug: '/admin-settings/roles',
                            unique: 'roles',
                        },
                        {
                            name: 'Website Settings',
                            slug: '/admin-settings/website-settings',
                            unique: 'website-settings',
                        },
                    ],
                },
            ],
            toggled: false,
            activeLink: 'Dashboard',
        };
    },

    actions: {
        hasToggled(toggled) {
            this.toggled = toggled;
        },
        setPages(pages) {
            const pageLink = this.links.find(link => link.unique === 'pages');
            if (pageLink) {
                pageLink.subs = pages; // Assign the new pages to subs
            }
        },
        setActiveLink(activeLink) {
            this.activeLink = activeLink;
        },
    },
});
