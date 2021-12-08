<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateSociedadAccidentalTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('sociedadAccidentals', function (Blueprint $table) {
            $table->id();
            $table->string('nombre')->nullable();
            $table->integer('codigo')->unique();
            $table->string('nombreLegal')->nullable();
            $table->text('direccion')->nullable();
            $table->integer('fono1')->nullable();
            $table->integer('fono2')->nullable();
            $table->string('email')->nullable();
            $table->string('departamento')->nullable();
            $table->text('observacion',100)->nullable(); 

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
        Schema::dropIfExists('sociedadAccidentals');
    }
}
