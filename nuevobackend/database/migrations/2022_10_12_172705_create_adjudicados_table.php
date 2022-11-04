<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateAdjudicadosTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('adjudicados', function (Blueprint $table) {
            $table->id();
            $table->string('nombre')->nullable();
            $table->string('codigos')->nullable();
            $table->string('cite')->nullable();
            $table->string('seguimiento')->nullable();
            $table->string('programa')->nullable();
            $table->string('numero')->nullable();
            $table->string('literal')->nullable();
            $table->string('rpc')->nullable();
            $table->string('rpa')->nullable();
            $table->string('mosca')->nullable();
            $table->string('programa')->nullable();
            $table->string('resolucion')->nullable();
            $table->string('adjudicado')->nullable();
            $table->date('fecha1')->nullable();
            $table->date('fecha2')->nullable();
            $table->integer('nro')->nullable();
            $table->integer('gestion')->nullable();
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
        Schema::dropIfExists('adjudicados');
    }
}
