// ~/server/middleware/security-headers.ts
import  crypto  from 'crypto';
export default defineEventHandler(event => {
    const apiURL = useRuntimeConfig().public.apiURL;
    const nonce = crypto.randomBytes(16).toString('base64');
    setResponseHeaders(event, {
        // HTTP Strict Transport Security (HSTS)
        // Tells browsers to always use HTTPS
        'Strict-Transport-Security':
            'max-age=31536000; includeSubDomains; preload',

        // Content Security Policy
        // Restricts sources of content to prevent XSS and other injections
        'Content-Security-Policy': [
            // "default-src 'self'",
            // `script-src 'self' 'nonce-${nonce}'`,
            // `style-src 'self' 'nonce-${nonce}'`,
            // "img-src 'self' data: http://api.suntrust.local;",
            // "font-src 'self'",
            // `connect-src 'self' http://api.suntrust.local;`,
            "frame-ancestors 'none'",
            "form-action 'self'",
            `base-uri 'none';` 
        ].join('; '),

        // Prevents rendering in iframes
        'X-Frame-Options': 'DENY',

        // Prevents MIME type sniffing
        'X-Content-Type-Options': 'nosniff',

        // Controls referrer information sent with requests
        'Referrer-Policy': 'strict-origin-when-cross-origin',

        // Controls browser features and APIs
        'Permissions-Policy': [
            'camera=(),',
            'microphone=(),',
            'geolocation=(),',
            'payment=(),',
            'usb=(),',
            'vr=()',
        ].join(''),
    });

    event.context.nonce = nonce;
});
