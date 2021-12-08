<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateEmpresaTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('empresas', function (Blueprint $table) {
            $table->id();
            $table->string('nombreEmpresa')->nullable();   
            $table->string('nit',20)->unique();    
            $table->string('nombreLegal')->nullable();
            $table->text('direccion')->nullable();
            $table->integer('fono1')->nullable();
            $table->integer('fono2')->nullable();
            $table->string('email')->nullabe();
            $table->string('departamento',20)->nullable();
            $table->text('observacion',100)->nullable();
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
        Schema::dropIfExists('empresas');
    }
}
