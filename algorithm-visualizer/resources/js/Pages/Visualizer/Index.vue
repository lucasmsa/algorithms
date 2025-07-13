<script setup>
import { ref, onMounted } from 'vue';
import { Head } from '@inertiajs/vue3';
import ControlPanel from '@/Components/ControlPanel.vue';
import VisualizerCanvas from '@/Components/VisualizerCanvas.vue';

// Reactive state for array of numbers
const arrayData = ref([]);

// Function to generate a new random array
const generateArray = () => {
    const newArray = [];
    const size = 50; // We can make this dynamic later
    for (let i = 0; i < size; i++) {
        // Generate random numbers between 5 and 100
        newArray.push(Math.floor(Math.random() * 95) + 5);
    }
    arrayData.value = newArray;
};

// Generate an initial array when the component is first loaded
onMounted(() => {
    generateArray();
});

</script>

<template>

    <Head title="Algorithm Visualizer" />

    <div class="bg-gray-900 text-white min-h-screen flex flex-col items-center justify-center p-4">
        <h1 class="text-4xl font-bold mb-8">Algorithm Visualizer</h1>

        <ControlPanel @generate-new-array="generateArray" />
        <VisualizerCanvas :array="arrayData" />

    </div>
</template>