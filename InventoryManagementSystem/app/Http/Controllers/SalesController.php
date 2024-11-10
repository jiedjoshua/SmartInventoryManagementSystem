<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Sale;

class SalesController extends Controller
{
    public function index()
    {
        $monthlySales = Sale::select('month', 'total_sales', 'flowers_sold', 'candles_sold')
                             ->whereNotNull('month')
                             ->get();

        $yearlySales = Sale::select('year', 'total_sales', 'flowers_sold', 'candles_sold')
                            ->whereNotNull('year')
                            ->get();

        return view('sales', compact('monthlySales', 'yearlySales'));
    }
}
