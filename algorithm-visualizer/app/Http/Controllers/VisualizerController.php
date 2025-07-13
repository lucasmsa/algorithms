<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Inertia\Inertia;

class VisualizerController extends Controller
{
    /**
     * Display the algorithm visualizer page.
     */
    public function show()
    {
        return Inertia::render('Visualizer/Index');
    }
}
