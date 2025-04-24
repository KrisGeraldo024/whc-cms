// /plugins/vee-validate.js
import { defineRule } from 'vee-validate';
import * as yup from 'yup';

export default defineNuxtPlugin(nuxtApp => {
    defineRule('required', (value, [], { field }) => {
        if (!value || !value.length) {
            const fieldName = field
                .replace(/([a-z])([A-Z])|_/g, '$1 $2') // Add space between lowercase and uppercase letters
                .split(' ')
                .map(
                    word =>
                        word.charAt(0).toUpperCase() +
                        word.slice(1).toLowerCase()
                )
                .join(' ');

            // Check if the first character of the fieldName is a vowel (A, E, I, O, U)
            const firstChar = fieldName.charAt(0).toLowerCase();
            const vowels = ['a', 'e', 'i', 'o', 'u'];
            const article = vowels.includes(firstChar) ? 'an' : 'a';

            return `Please enter ${article} ${fieldName}`;
        }
        return true;
    });

    defineRule('max', (value, [limit]) => {
        if (value && value.length > limit) {
            return `This field must not exceed ${limit} characters`;
        }
        return true;
    });

    defineRule('email', value => {
        const emailSchema = yup.string().email();
        try {
            emailSchema.validateSync(value);
            return true;
        } catch (error) {
            return error.message || 'Invalid email address';
        }
    });

    defineRule('min', (value, [limit]) => {
        if (!value || value.length < limit) {
            return `This field must be at least ${limit} characters`;
        }
        return true;
    });

    defineRule('password', value => {
        const passwordSchema = yup
            .string()
            .min(8)
            .matches(/[A-Z]/, 'Password must include an uppercase letter')
            .matches(/[0-9]/, 'Password must include a number');

        try {
            passwordSchema.validateSync(value);
            return true;
        } catch (error) {
            return error.message || 'Invalid password';
        }
    });

    defineRule('confirmed', (value, [target]) => {
        if (value !== target) {
            console.log(value, target);
            return 'Passwords do not match';
        }
        return true;
    });

    defineRule('googleMap', value => {
        const googleMapRegex =
            /<iframe[^>]*src="https:\/\/www\.google\.com\/maps\/embed\?pb=.*?"[^>]*><\/iframe>/;
        if (!value || !googleMapRegex.test(value)) {
            return 'Please enter a valid Google Maps iframe code';
        }
        return true;
    });

    defineRule('https', value => {
        if (value && !value.startsWith('https://')) {
            return 'Please enter a valid URL';
        }
        return true;
    });

    defineRule('imageDimensions', (file, [width, height]) => {
        return new Promise((resolve) => {
            if (!file || !(file instanceof File)) {
                return resolve('Please upload an image file');
            }
            const img = new Image();
            img.onload = () => {
                if (img.width === width && img.height === height) {
                    resolve(true);
                } else {
                    resolve(`Image dimensions should be ${width}x${height}px`);
                }
            };
            img.onerror = () => resolve('Invalid image file');
            img.src = URL.createObjectURL(file);
        });
    });

    defineRule('fileSize', (file, [maxSize]) => {
        if (!file) return 'File is required';
        const sizeInMB = maxSize * 1024 * 1024;
        return file.size <= sizeInMB || `File must not exceed ${maxSize} MB`;
    });

    defineRule('fileRequired', file => {
        return file ? true : 'A file is required';
    });

    defineRule('acceptedFormats', (file, [formats]) => {
        if (!file) return 'File is required';
        const acceptedFormats = formats.split(',').map(f => f.trim().toLowerCase());
        const fileFormat = file.type.split('/').pop().toLowerCase();
        return acceptedFormats.includes(fileFormat) || `Accepted formats are: ${formats}`;
    });
});
