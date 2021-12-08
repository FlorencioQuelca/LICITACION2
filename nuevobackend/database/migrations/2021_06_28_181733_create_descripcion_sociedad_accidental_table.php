<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateDescripcionSociedadAccidentalTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('descripcionSociedadAccidentals', function (Blueprint $table) {
            $table->id();
            $table->integer('num')->nullable();
            $table->unsignedBigInteger('empresa_id');
            $table->unsignedBigInteger('sociedadAccidental_id');
            $table->integer('participacion');
            
            $table->foreign('empresa_id')
                            ->references('id')
                            ->on('empresas')
                            ->onUpdate('cascade')
                            ->onDelete('cascade');                   
            $table->foreign('sociedadAccidental_id')
                            ->references('id')
                            ->on('sociedadAccidentals')
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
        Schema::dropIfExists('descripcionSociedadAccidentals');
    }
}
