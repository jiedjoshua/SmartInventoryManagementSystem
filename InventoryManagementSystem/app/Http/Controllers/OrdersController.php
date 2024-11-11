<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Carbon\Carbon;
use Symfony\Component\Process\Process;
use Symfony\Component\Process\Exception\ProcessFailedException;

class OrdersController extends Controller
{
    public function index()
    {
        // Get the current date and add 1 month to it
        $nextMonth = Carbon::now()->addMonth()->format('F');

        // Set up the command to execute the Python script
        $process = new Process(['python3', base_path('scripts/predict_orders.py')]);

        // Run the process (Python script)
        $process->run();

        // Check for errors
        if (!$process->isSuccessful()) {
            throw new ProcessFailedException($process);
        }

        // Get the output from Python script
        $output = $process->getOutput();

        // Decode the JSON output
        $predictedOrders = json_decode($output, true);

        // Pass the next month's name and the predicted data to the view
        return view('orders', compact('nextMonth', 'predictedOrders'));
    }


}
