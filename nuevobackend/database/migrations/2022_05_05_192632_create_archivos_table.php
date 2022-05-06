<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateArchivosTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('archivos', function (Blueprint $table) {
            $table->id();
            $table->string('url')->unique();// direccion unica con nombre unico
            $table->string('nombre')->nullable();
            $table->string('detalle')->nullable();
            $table->string('tipo')->nullable();
            $table->integer('tamanio')->default();
            //polimorfica
            $table->unsignedBigInteger('archivotable_id');
            $table->string('archivotable_type');
            //relaciones
            $table->unsignedBigInteger('user_id')->nullable();
            $table->foreign('user_id')->references('id')->on('users')->onDelete('set null')->onUpdate('cascade');
            $table->unsignedBigInteger('categoria_id')->nullable();
            $table->foreign('categoria_id')
                          ->references('id')
                          ->on('categorias')
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
        Schema::dropIfExists('archivos');
    }
}
