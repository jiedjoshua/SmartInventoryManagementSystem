<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Flower;

class FlowersController extends Controller
{
    public function index()
    {
        $flowers = Flower::all(); 
        return view('flowers', compact('flowers')); 
    }
}
