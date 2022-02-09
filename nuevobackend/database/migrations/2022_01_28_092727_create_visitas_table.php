<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateVisitasTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('visitas', function (Blueprint $table) {
            $table->id();
           
            $table->date('fecha')->nullable();
            $table->time('hora')->nullable();
            $table->time('hora_salida')->nullable();
            $table->integer('motivo')->nullable();
            $table->integer('num')->nullable();
            $table->string('empresa')->nullable();
            $table->string('funcionario')->nullable();
            $table->string('observacion')->nullable();
            $table->unsignedBigInteger('persona_id')->nullable();
            $table->foreign('persona_id')->references('id')->on('personas')->onDelete('set null')->onUpdate('cascade');
            
            
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
        Schema::dropIfExists('visitas');
    }
}