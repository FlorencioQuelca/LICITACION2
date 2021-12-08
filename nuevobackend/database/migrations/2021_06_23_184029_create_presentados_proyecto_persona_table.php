<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreatePresentadosProyectoPersonaTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('presentadosProyectopersonas', function (Blueprint $table) {
            $table->id();
            $table->integer('num')->nullable();
            $table->unsignedBigInteger('proyectoPersona_id');
            $table->foreign('proyectoPersona_id')
                            ->references('id')
                            ->on('proyectoPersonas')
                            ->onUpdate('cascade')
                            ->onDelete('cascade');

            $table->unsignedBigInteger('persona_id');
            $table->foreign('persona_id')
                            ->references('id')
                            ->on('personas')
                            ->onUpdate('cascade')
                            ->onDelete('cascade');
              //fiscal
            $table->unsignedBigInteger('user_id');
            $table->foreign('user_id')
                            ->references('id')
                            ->on('users')
                            ->onUpdate('cascade')
                            ->onDelete('cascade'); 

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
        Schema::dropIfExists('presentadosProyectopersonas');
    }
}
