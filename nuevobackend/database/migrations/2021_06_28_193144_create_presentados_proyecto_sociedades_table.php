<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreatePresentadosProyectoSociedadesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('presentadosProyectoSociedades', function (Blueprint $table) {
            $table->id();
            $table->integer('num')->nullable();
            $table->decimal('monto',10,2)->default(0);         
            $table->unsignedBigInteger('sociedadAccidental_id');
            $table->unsignedBigInteger('proyectoEmpresa_id');
            $table->unsignedBigInteger('user_id');
            
            $table->foreign('sociedadAccidental_id')
                            ->references('id')
                            ->on('sociedadAccidentals')
                            ->onUpdate('cascade');
                            
            
            $table->foreign('proyectoEmpresa_id')
                            ->references('id')
                            ->on('proyectoEmpresas')
                            ->onUpdate('cascade');         
            //fiscal
            
            $table->foreign('user_id')
                            ->references('id')
                            ->on('users')
                            ->onUpdate('cascade'); 
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
        Schema::dropIfExists('presentadosProyectoSociedades');
    }
}
