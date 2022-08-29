<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateComunidadRegistroTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('comunidad_registro', function (Blueprint $table) {
            $table->id();

            $table->string("provincia")->nullable();
            $table->unsignedBigInteger('comunidad_id')->nullable();
            $table->foreign('comunidad_id')->references('id')->on('comunidads')->onDelete('set null')->onUpdate('cascade');

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
        Schema::dropIfExists('comunidad_registro');
    }
}
