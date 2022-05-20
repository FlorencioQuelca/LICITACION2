<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateContratosTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('contratos', function (Blueprint $table) {
            $table->id();
            $table->string('nombre')->unique();
            $table->string('codigos')->nullable();
            $table->string('departamento')->nullable();
            $table->string('seguimiento')->nullable();
            $table->string('programa')->nullable();
            $table->string('numero')->nullable();
            $table->date('fechaini')->nullable();
            $table->date('fechafin')->nullable();
            $table->integer('duracion')->nullable();
            $table->integer('plus')->nullable();
            $table->decimal('montobs',10,2)->nullable();
            $table->decimal('montosus',10,2)->nullable();
            $table->string("status")->default("activo");
            $table->string("observacion")->nullable();
            $table->unsignedBigInteger('proyecto_id')->nullable();
            $table->foreign('proyecto_id')
                          ->references('id')
                          ->on('proyectos')
                          ->onDelete('set null')->onUpdate('cascade');


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
        Schema::dropIfExists('contratos');
    }
}
