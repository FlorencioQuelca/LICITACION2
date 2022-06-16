<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreatePersonaVisitaTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('persona_visita', function (Blueprint $table) {
            $table->id();
            $table->string('observacion')->nullable();
            $table->string('mochila')->nullable();
            $table->string('tipo')->nullable();
            $table->string('status')->nullable();
            $table->unsignedBigInteger('persona_id')->nullable();
            $table->unsignedBigInteger('visita_id')->nullable();
            $table->foreign('visita_id')
                            ->references('id')
                            ->on('visitas')
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
        Schema::dropIfExists('persona_visita');
    }
}
