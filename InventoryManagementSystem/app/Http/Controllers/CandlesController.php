<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Candle;

class CandlesController extends Controller
{
    public function index()
    {
        $candles = Candle::all(); 
        return view('candles', compact('candles')); 
    }
}
