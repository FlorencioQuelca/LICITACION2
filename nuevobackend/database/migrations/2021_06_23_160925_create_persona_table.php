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
            $table->integer('nit')->nullable();
            $table->string('grado',10)->nullable();
            $table->text('direccion')->nullable();
            $table->date('fechaNacimiento')->nullable();
            $table->integer('fono1')->nullable();
            $table->integer('fono2')->nullable();
            $table->string('email')->nullable();
            $table->string('genero',10)->nullable();
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
        Schema::dropIfExists('personas');
    }
}
