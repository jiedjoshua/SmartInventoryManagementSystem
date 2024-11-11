<?php

use App\Http\Controllers\ProfileController;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\FlowersController;
use App\Http\Controllers\CandlesController;
use App\Http\Controllers\OrdersController;

Route::get('/', function () {
    return redirect()->route('login');
});

Route::get('/flowers', [FlowersController::class, 'index'])->name('flowers');
Route::get('/candles', [CandlesController::class, 'index'])->name('candles');
Route::get('/orders', [OrdersController::class, 'index'])->name('orders');


Route::get('/dashboard', function () {
    return view('dashboard');
})->middleware(['auth', 'verified'])->name('dashboard');

// In your `web.php` routes file
Route::get('/api/predict-orders', 'PredictionController@getPredictedOrders')->name('predict.orders');


Route::middleware('auth')->group(function () {
    Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');
});

require __DIR__.'/auth.php';
