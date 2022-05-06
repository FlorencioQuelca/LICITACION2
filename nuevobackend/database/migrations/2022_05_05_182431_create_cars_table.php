<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCarsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('cars', function (Blueprint $table) {
            $table->id();
            $table->string('codigo')->unique();    
            $table->string('descripcion')->nullable();
            $table->date('fechaingreso')->nullable();
            $table->string('tipo')->nullable();
            $table->string('estado')->nullable();
            $table->string('marca')->nullable();
            $table->string('modelo')->nullable();
            $table->string('placa')->nullable();
            $table->string('chofer')->nullable();
            $table->string('asignado')->nullable();
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
        Schema::dropIfExists('cars');
    }
}
