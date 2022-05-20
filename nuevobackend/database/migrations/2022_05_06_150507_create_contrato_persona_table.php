<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateContratoPersonaTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('contrato_persona', function (Blueprint $table) {
            $table->id();
            /*
            $table->unsignedBigInteger('persona_id')->nullable();
            $table->unsignedBigInteger('contrato_id')->nullable();
            $table->foreign('contrato_id')
                            ->references('id')
                            ->on('contratos')
                            ->onDelete('set null')->onUpdate('cascade');
          $table->foreign('persona_id')
                          ->references('id')
                          ->on('personas')
                          ->onDelete('set null')->onUpdate('cascade');
                          */
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
        Schema::dropIfExists('contrato_persona');
    }
}
