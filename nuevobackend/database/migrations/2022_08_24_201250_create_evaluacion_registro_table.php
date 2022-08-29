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
            $table->string('nombre')->nullable();
            $table->string('presenta')->nullable();
            $table->string('tipo')->nullable();
            $table->string('valor')->nullable();
            $table->text('descripcion')->nullable();
            $table->integer('numero')->default(1);
            $table->decimal('puntaje',10,2)->default(0);
            $table->decimal('puntaje2',10,2)->default(0);
            $table->string('observacion')->nullable();

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
