<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateTallersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('tallers', function (Blueprint $table) {
            $table->id();
            $table->string('nit')->unique(); 
            $table->string('nombre')->nullable(); 
            $table->string('representante')->nullable();
            $table->string('direccion')->nullable();
            $table->string('fono1')->nullable();
            $table->string('fono2')->nullable();
            $table->string('status')->nullable();
            $table->string('url')->nullable();
            $table->string('observacion')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('tallers');
    }
}
