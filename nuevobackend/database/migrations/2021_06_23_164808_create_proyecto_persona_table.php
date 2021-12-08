<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateProyectoPersonaTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('proyectoPersonas', function (Blueprint $table) {
            $table->id();
            $table->string('codigo')->nullable();
            $table->string('nombre')->nullable();
            $table->date('fecha')->nullable();
            $table->time('hora')->nullable();
            $table->string('link')->nullable();
            $table->decimal('precio',20,2)->default(0);
            $table->integer('plazoEntrega')->nullable();
            $table->string('programa')->nullable();
            $table->integer('lote')->default(1);
            $table->string('departamento')->default('LA PAZ');
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
        Schema::dropIfExists('proyectoPersonas');
    }
}
