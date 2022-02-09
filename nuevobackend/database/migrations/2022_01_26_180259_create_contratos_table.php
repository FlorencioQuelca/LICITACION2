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
            $table->string('url')->nullable();
            $table->date('fecha')->nullable();
            $table->time('hora')->nullable();

            
            $table->unsignedBigInteger('user_id')->nullable();
            $table->foreign('user_id')
                          ->references('id')
                          ->on('users')
                          ->onDelete('set null')->onUpdate('cascade');
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
        Schema::dropIfExists('contratos');
    }
}
