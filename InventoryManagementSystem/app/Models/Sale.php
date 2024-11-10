<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Sale extends Model
{
    use HasFactory;

    protected $fillable = [
        'month', 
        'total_sales', 
        'flowers_sold', 
        'candles_sold', 
        'year'
    ];
}
