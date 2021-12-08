<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateAsociadosTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('asociados', function (Blueprint $table) {
            $table->id();
            $table->integer('num')->nullable();
            $table->integer('participacion');
            $table->unsignedBigInteger('empresa_id')->nullable();
            $table->unsignedBigInteger('sociedad_id')->nullable();
            $table->foreign('empresa_id')
                            ->references('id')
                            ->on('empresas')
                            ->onDelete('set null');                   
          $table->foreign('sociedad_id')
                          ->references('id')
                          ->on('sociedads')
                          ->onDelete('set null');
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
        Schema::dropIfExists('asociados');
    }
}
