<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Flower;
use App\Models\Candle;

class DashboardController extends Controller
{
        public function index()
    {
        // Low stock counts
        $lowStockFlowers = Flower::where('quantity', '<', 20)->where('quantity', '>', 1)->count();
        $lowStockCandles = Candle::where('quantity', '<', 20)->where('quantity', '>', 1)->count();
        
        // Out of stock counts
        $outOfStockFlowers = Flower::where('quantity', '=', 0)->count();
        $outOfStockCandles = Candle::where('quantity', '=', 0)->count();

        // Pass data to the dashboard view
        return view('dashboard', compact('lowStockFlowers', 'lowStockCandles', 'outOfStockFlowers', 'outOfStockCandles'));
    }
    

}
