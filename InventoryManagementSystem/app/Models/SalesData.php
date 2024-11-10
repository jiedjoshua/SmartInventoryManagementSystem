<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class SalesData extends Model
{
    use HasFactory;

    protected $table = 'sales_data';

    protected $fillable = [
        'product_id',
        'product_type',
        'quantity_sold',
        'year',
        'month',
        'sale_date',
    ];

    public function product()
    {
        return $this->morphTo();
    }
}
