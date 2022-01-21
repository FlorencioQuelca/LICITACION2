<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateEmpresaSociedadTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('empresa_sociedad', function (Blueprint $table) {
            $table->id();
            $table->integer('participacion');
            $table->unsignedBigInteger('empresa_id')->nullable();
            $table->unsignedBigInteger('sociedad_id')->nullable();
            $table->foreign('empresa_id')
                            ->references('id')
                            ->on('empresas')
                            ->onDelete('set null')->onUpdate('cascade');                   
          $table->foreign('sociedad_id')
                          ->references('id')
                          ->on('sociedads')
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
        Schema::dropIfExists('empresa_sociedad');
    }
}
