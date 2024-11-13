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
        Schema::create('candles', function (Blueprint $table) {
            $table->id();
            $table->string('name'); 
            $table->integer('quantity'); // Quantity in stock
            $table->decimal('price', 8, 2); // Price of the flower
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('candles');
    }
};
