<?php

use App\Http\Controllers\ProfileController;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\FlowersController;
use App\Http\Controllers\CandlesController;
use App\Http\Controllers\OrdersController;
use App\Http\Controllers\DashboardController;

Route::get('/', function () {
    return redirect()->route('login');
});

Route::get('/flowers', [FlowersController::class, 'index'])->name('flowers');
Route::get('/candles', [CandlesController::class, 'index'])->name('candles');
Route::get('/orders', [OrdersController::class, 'index'])->name('orders');


Route::get('/dashboard', [DashboardController::class, 'index'])->name('dashboard');



Route::middleware('auth')->group(function () {
    Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');
});

require __DIR__.'/auth.php';
