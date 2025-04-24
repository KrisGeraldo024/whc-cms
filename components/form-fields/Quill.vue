<template>
    <div class="relative w-full h-[280px] pb-[16px] overflow-hidden border-b-[1px] border-gray">
      <label :for="name" class="text-base font-medium text-black/70">
        {{ label }} <span class="text-sm font-normal text-black/40" v-if="max">{{ `Maximum ${max} characters` }}</span>
      </label>
      <QuillEditor
        :name="name"
        toolbar="full"
        :placeholder="placeholder"
        contentType="html"
        @update:content="handleContentChange"
        @ready="onEditorReady"
      />
      <div v-if="max > 0" class="character-counter">
        {{ characterCount }}/{{ max }} characters
      </div>
    </div>
  </template>
  
  <script setup>
  import { ref, computed, watch } from 'vue';
  import { QuillEditor } from '@vueup/vue-quill';
  
  const props = defineProps({
    name: String,
    modelValue: String,
    placeholder: String,
    max: {
      type: Number,
      default: 0,
    },
    label: String,
  });
  
  const emit = defineEmits(['update:modelValue']);
  const localValue = ref(props.modelValue || '');
  let quillInstance = null;
  
  const characterCount = ref(0);
  
  // Watch for changes in modelValue and update localValue accordingly
  watch(() => props.modelValue, (newVal) => {
    localValue.value = newVal;
  });
  
  // Handle content change and enforce character limit
  const handleContentChange = (value) => {
    localValue.value = value;

  
    // Check the plain text length
    const currentTextLength = quillInstance.getText().length - 1;
    characterCount.value = currentTextLength;
    // If the length exceeds the max limit, remove excess characters
    if (props.max && currentTextLength > props.max) {
        console.log('Current Text Length:', currentTextLength);
      // Use Quill's deleteText method to remove excess characters
      const excessLength = currentTextLength - props.max;
      const startIndex = (quillInstance.getLength() - 1) - excessLength;
      
      quillInstance.deleteText(startIndex, excessLength); // Remove excess characters
  
      // Update localValue with the new content
      localValue.value = quillInstance.root.innerHTML; // Ensure it has the updated HTML content
    }
  
    // Emit the updated value
    emit('update:modelValue', localValue.value);
  };
  
  // Store the Quill instance when it is ready
  const onEditorReady = (editor) => {
    quillInstance = editor;
    // Initialize the editor with existing content
    quillInstance.setContents(quillInstance.clipboard.convert(localValue.value));
  };
  </script>
  
  <style scoped>
  .quill-editor-container {
    position: relative;
  }
  .character-counter {
    position: absolute;
    bottom: 8px;
    right: 12px;
    font-size: 0.875rem;
    color: #888;
  }
  </style>
  