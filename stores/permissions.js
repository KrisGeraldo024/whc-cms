import { defineStore } from 'pinia';

export const usePermissionStore = defineStore('permissions', {
    // arrow function recommended for full type inference
    state: () => {
        return {
            permissions: [
                {
                    name: 'Homepage',
                    unique: 'pages-homepage',
                    route_name: ['homepageSection_id', 'metadata_id']
                },
                {
                    name: 'Page Our Properties',
                    unique: 'pages-our-properties',
                    route_name: ['condoSection_id', 'houseSection_id', 'metadata_id']
                },
                {
                    name: "Page Homebuyer's Guide",
                    unique: 'pages-homebuyers-guide',
                    route_name: ['buyerSection_id', 'steps_id', 'metadata_id']
                },
                {
                    name: 'Page About Us',
                    unique: 'pages-about-us',
                    route_name: ['aboutUsSection_id', 'otherProperty_id', 'officers_id', 'metadata_id']
                },
                {
                    name: "Page Seller's Guide",
                    unique: 'pages-sellers-guide',
                    route_name: ['sellersGuideSection_id', 'metadata_id']
                },
                {
                    name: 'Page Payment Channel',
                    unique: 'pages-payment-channel',
                    route_name: ['paymentChannelSection_id', 'metadata_id']
                },
                {
                    name: 'Page News & Articles',
                    unique: 'pages-news-and-articles',
                    route_name: ['newsSection_id', 'metadata_id']
                },
                {
                    name: 'Page Careers',
                    unique: 'pages-careers',
                    route_name: ['careersSection_id', 'metadata_id']
                },
                {
                    name: 'Page Contact Us',
                    unique: 'pages-contact-us',
                    route_name: ['contactUsSection_id', 'metadata_id']
                },
                {
                    name: 'Page Get a Quote',
                    unique: 'pages-get-a-quote',
                    route_name: ['getQuoteSection_id', 'metadata_id']
                },
                {
                    name: 'Page Privacy Policy',
                    unique: 'pages-privacy-policy',
                    route_name: ['policySection_id', 'metadata_id']
                },
                {
                    name: 'Page Terms and Conditions',
                    unique: 'pages-terms-and-conditions',
                    route_name: ['termsSection_id', 'metadata_id']
                },
                {
                    name: 'Properties',
                    unique: 'properties',
                    route_name: [
                        'properties-propertyType', 
                        'properties-propertyType-id-amenities-amenity_id', 
                        'properties-propertyType-id-amenities-create',
                        'properties-propertyType-id-amenities',
                        'properties-propertyType-id-landmarks-landmark_id',
                        'properties-propertyType-id-landmarks-create',
                        'properties-propertyType-id-landmarks',
                        'properties-propertyType-id-units-unit_id',
                        'properties-propertyType-id-units-create',
                        'properties-propertyType-id-units',
                        'properties-propertyType-id-update',
                        'properties-propertyType-create'
                    ],
                },
                {
                    name: 'News and Articles',
                    unique: 'news-and-articles',
                    route_name: [
                        'articles',
                        'articles-id',
                        'articles-create'
                    ],
                },
                {
                    name: 'Payment Channels',
                    unique: 'payment-channels',
                    route_name: [
                        'payment-channels-payment-methods',
                        'payment-channels-payment-methods-methodId-edit',
                        'payment-channels-payment-methods-methodId-payment-platforms-platformId-edit',
                        'payment-channels-payment-methods-methodId-payment-platforms-platformId',
                        'payment-channels-payment-methods-methodId-payment-platforms-create',
                        'payment-channels-payment-methods-methodId-payment-platforms',
                        'payment-channels-payment-methods-create'
                    ]
                },
                {
                    name: 'Awards',
                    unique: 'awards',
                    route_name: [
                        'awards',
                        'awards-id',
                        'awards-create'
                    ]
                },
                {
                    name: 'Careers',
                    unique: 'careers',
                    route_name: [
                        'careers-type',
                        'careers-type-id',
                        'careers-type-create',
                    ]
                },
                {
                    name: 'Inquiries',
                    unique: 'inquiries',
                    route_name: [
                        'inquiries',
                        'inquiries-business-partner-network',
                        'inquiries-contact-us',
                        'inquiries-corporate-careers',
                        'inquiries-get-quote',
                        'inquiries-in-house-sales-group'
                    ]
                },
                {
                    name: 'Taxonomies',
                    unique: 'taxonomies',
                    route_name: [
                        'taxonomies',
                        'taxonomies-id',
                        'taxonomies-careers-employment-types',
                        'taxonomies-careers-job-locations',
                        'taxonomies-contact-us-after-sales-officers',
                        'taxonomies-contact-us-inquiry-types-id',
                        'taxonomies-contact-us-inquiry-types-create',
                        'taxonomies-contact-us-inquiry-types',
                        'taxonomies-contact-us-office-locations',
                        'taxonomies-contact-us-referral-types',
                        'taxonomies-media-center-article-categories',
                        'taxonomies-properties-property-locations',
                        'taxonomies-properties-property-statuses',
                        'taxonomies-properties-brands',
                        'taxonomies-sellers-priority-locations'
                    ]
                },
                {
                    name: 'Admin Setting',
                    unique: 'admin-settings',
                    route_name: [
                        'admin-settings',
                        'admin-settings-cms-editors-id-change-password',
                        'admin-settings-cms-editors-id-update',
                        'admin-settings-cms-editors-create',
                        'admin-settings-cms-editors',
                        'admin-settings-roles-id',
                        'admin-settings-roles-create',
                        'admin-settings-roles',
                        'admin-settings-website-settings',
                    ]
                },
            ],
        };
    },

});
