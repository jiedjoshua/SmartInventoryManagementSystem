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
    
        // Fetch flower names and quantities
        $flowers = Flower::select('name', 'quantity')->get();
        $flowerNames = $flowers->pluck('name'); // Extract flower names
        $flowerQuantities = $flowers->pluck('quantity'); // Extract flower quantities
    
        // Fetch candle names and quantities
        $candles = Candle::select('name', 'quantity')->get();
        $candleNames = $candles->pluck('name'); // Extract candle names
        $candleQuantities = $candles->pluck('quantity'); // Extract candle quantities
    
        // Pass all data to the dashboard view
        return view('dashboard', compact(
            'lowStockFlowers', 'lowStockCandles', 'outOfStockFlowers', 'outOfStockCandles', 
            'flowerNames', 'flowerQuantities', 'candleNames', 'candleQuantities'
        ));
    }
    
    

}
