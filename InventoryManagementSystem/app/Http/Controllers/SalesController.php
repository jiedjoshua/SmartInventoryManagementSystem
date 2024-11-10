<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Flower;
use App\Models\Candle;

class SalesController extends Controller
{
    public function showSalesData()
{
    $flowerSales = Flower::with('salesData')->has('salesData')->get();
    $candleSales = Candle::with('salesData')->has('salesData')->get();

    return view('sales', compact('flowerSales', 'candleSales'));
}

public function filterSales(Request $request)
{
    $month = $request->input('month');

    // Fetch flower sales for the month in 2024
    $flowerSales = Flower::whereHas('salesData', function ($query) use ($month) {
        $query->where('month', $month)
              ->where('year', 2024);  // Ensure the year is 2024
    })->with(['salesData' => function ($query) use ($month) {
        $query->where('month', $month)
              ->where('year', 2024);  // Ensure the year is 2024
    }])->get();

    // Fetch candle sales for the month in 2024
    $candleSales = Candle::whereHas('salesData', function ($query) use ($month) {
        $query->where('month', $month)
              ->where('year', 2024);  // Ensure the year is 2024
    })->with(['salesData' => function ($query) use ($month) {
        $query->where('month', $month)
              ->where('year', 2024);  // Ensure the year is 2024
    }])->get();

    // Return the data as JSON
    return response()->json([
        'flowerSales' => $flowerSales->map(function ($flower) {
            return $flower->salesData->map(function ($sale) use ($flower) {
                return [
                    'product_name' => $flower->name,
                    'quantity_sold' => $sale->quantity_sold,
                ];
            });
        })->flatten(1),
        'candleSales' => $candleSales->map(function ($candle) {
            return $candle->salesData->map(function ($sale) use ($candle) {
                return [
                    'product_name' => $candle->name,
                    'quantity_sold' => $sale->quantity_sold,
                ];
            });
        })->flatten(1),
    ]);
}



public function getSalesOverview()
{
    // Initialize the sales array
    $sales = [];

    // Fetch flower sales data for the year 2024, grouped by month
    $flowerSales = Flower::with(['salesData' => function ($query) {
        $query->where('year', 2024); // Filter by year 2024
    }])->get();

    foreach ($flowerSales as $flower) {
        foreach ($flower->salesData as $sale) {
            // Directly use the 'Month' value from the sales data
            $month = $sale->month; // Assuming 'month' column holds the month name (e.g., 'January')

            // Ensure the month key exists in the sales array
            if (!isset($sales[$month])) {
                $sales[$month] = 0; // Initialize to 0 if it doesn't exist
            }

            // Add the quantity sold for this sale to the corresponding month
            $sales[$month] += $sale->quantity_sold;
        }
    }

    // Fetch candle sales data for the year 2024, grouped by month
    $candleSales = Candle::with(['salesData' => function ($query) {
        $query->where('year', 2024); // Filter by year 2024
    }])->get();

    foreach ($candleSales as $candle) {
        foreach ($candle->salesData as $sale) {
           
            $month = $sale->month;

          
            if (!isset($sales[$month])) {
                $sales[$month] = 0;
            }

          
            $sales[$month] += $sale->quantity_sold;
        }
    }

    // Sort the months in the correct order
    $months = [
        "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"
    ];

    // Ensure the months are in the correct order, even if there are missing months
    $salesData = [];
    foreach ($months as $month) {
        $salesData['months'][] = $month;
        $salesData['sales'][] = isset($sales[$month]) ? $sales[$month] : 0;  // Default to 0 if no sales for the month
    }

    // Return the data as JSON to be used in the frontend
    return response()->json($salesData);
}







  
}
