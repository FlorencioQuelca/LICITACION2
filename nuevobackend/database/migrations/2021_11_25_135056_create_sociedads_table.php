<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateSociedadsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('sociedads', function (Blueprint $table) {
            $table->id();
            $table->string('nombreEmpresa')->nullable();
            $table->string('codigo')->unique();
            $table->string('nombreLegal')->nullable();
            $table->string('direccion')->nullable();
            $table->string('fono1')->nullable();
            $table->string('fono2')->nullable();
            $table->string('email')->nullable();
            $table->string('departamento')->nullable();
            $table->string('observacion')->default("NINGUNA");
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
        Schema::dropIfExists('sociedads');
    }
}
