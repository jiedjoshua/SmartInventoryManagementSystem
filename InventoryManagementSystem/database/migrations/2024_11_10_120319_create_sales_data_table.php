<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('sales_data', function (Blueprint $table) {
            $table->id('sales_id'); // Primary Key
            $table->unsignedBigInteger('product_id'); // Product ID (flower or candle)
            $table->string('product_type'); // Product type (flower or candle model)
            $table->integer('quantity_sold'); // Quantity sold
            $table->integer('year'); // Year of sale
            $table->string('month'); // Month of sale
            $table->timestamps();

            // Index for polymorphic relationship
            $table->index(['product_id', 'product_type']);
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('sales_data');
    }
};
