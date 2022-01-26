<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreatePersonaProyectoTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('persona_proyecto', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('persona_id')->nullable();
            $table->unsignedBigInteger('proyecto_id')->nullable();
            $table->foreign('proyecto_id')
                            ->references('id')
                            ->on('proyectos')
                            ->onDelete('set null')->onUpdate('cascade');                   
          $table->foreign('persona_id')
                          ->references('id')
                          ->on('personas')
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
        Schema::dropIfExists('persona_proyecto');
    }
}
