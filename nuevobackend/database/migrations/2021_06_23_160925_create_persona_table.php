<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreatePersonaTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('personas', function (Blueprint $table) {
            $table->id();
            $table->string('ci',20)->unique();    
            $table->string('paterno')->nullable();
            $table->string('materno')->nullable();
            $table->string('nombres')->nullable();
            $table->string('datosp')->nullable();
            $table->string('nit')->nullable();
            $table->string('grado',10)->nullable();
            $table->string('direccion')->nullable();
            $table->date('fechaNacimiento')->nullable();
            $table->string('fono1')->nullable();
            $table->string('fono2')->nullable();
            $table->string('email')->nullable();
            $table->string('genero')->nullable();
            $table->string('observacion',200)->default('NATURAL');
            $table->string('departamento')->nullable();
            $table->string('status')->default('ACTIVO');

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
        Schema::dropIfExists('personas');
    }
}
