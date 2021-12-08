<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateProyectosTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('proyectos', function (Blueprint $table) {
            $table->id();
            $table->string('codigo')->nullable();
            $table->string('nombre')->unique();
            $table->date('fecha')->nullable();
            $table->time('hora')->nullable();
            $table->string('link')->nullable();
            $table->decimal('precio',20,2)->default(0);
            $table->integer('plazo')->default(0);
            $table->integer('lotes')->default(1);
            
            $table->unsignedBigInteger('departamento_id')->nullable();
            $table->unsignedBigInteger('programa_id')->nullable();
            $table->unsignedBigInteger('tipo_id')->nullable();
            $table->foreign('departamento_id')->references('id')->on('departamentos')->onDelete('set null');
            $table->foreign('programa_id')->references('id')->on('programas')->onDelete('set null');
            $table->foreign('tipo_id')->references('id')->on('tipos')->onDelete('set null');
            

            
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
        Schema::dropIfExists('proyectos');
    }
}
