<script setup>
// Define the props this component accepts from its parent
defineProps({
    array: {
        type: Array,
        required: true,
    },
});
</script>

<template>
    <div
        class="bg-gray-800 p-4 rounded-lg shadow-lg w-full max-w-4xl mt-4 flex items-end justify-center h-[300px] space-x-1">
        <!-- Iterate over the array and create a bar for each number -->
        <div v-for="(value, index) in array" :key="index" class="bg-cyan-500 w-full" :style="{ height: `${value}%` }">
        </div>
    </div>
</template>
