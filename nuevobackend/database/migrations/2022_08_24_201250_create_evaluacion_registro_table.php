<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateEvaluacionRegistroTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('evaluacion_registro', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('evaluacion_id')->nullable();
            $table->foreign('evaluacion_id')->references('id')->on('evaluacions')->onDelete('set null')->onUpdate('cascade');
            $table->unsignedBigInteger('registro_id')->nullable();
            $table->foreign('registro_id')->references('id')->on('registros')->onDelete('set null')->onUpdate('cascade');
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
        Schema::dropIfExists('evaluacion_registro');
    }
}
