<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Carbon\Carbon;

class OrdersController extends Controller
{
    public function index()
    {
        // Get the current date and add 1 month to it
        $nextMonth = Carbon::now()->addMonth()->format('F');  
        
        // Pass the next month's name to the view
        return view('orders', compact('nextMonth'));
    }


}
