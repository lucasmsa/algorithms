<script setup>
// Define the events that this component can emit to its parent
const emit = defineEmits(['generate-new-array']);
</script>

<template>
    <div class="bg-gray-800 p-4 rounded-lg shadow-lg w-full max-w-4xl">
        <div class="flex items-center justify-between">
            <h2 class="text-xl font-bold text-white">Controls</h2>
            <div class="flex items-center space-x-4">
                <button @click="emit('generate-new-array')"
                    class="bg-blue-500 hover:bg-blue-600 text-white font-bold py-2 px-4 rounded">
                    New Array
                </button>
                <button class="bg-green-500 hover:bg-green-600 text-white font-bold py-2 px-4 rounded">
                    Sort!
                </button>
            </div>
        </div>
    </div>
</template>
