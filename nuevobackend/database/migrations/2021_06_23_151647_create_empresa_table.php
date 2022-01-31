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
            $table->string('nit')->unique();    
            $table->string('nombreLegal')->nullable();
            $table->string('direccion')->nullable();
            $table->string('fono1')->nullable();
            $table->string('fono2')->nullable();
            $table->string('email')->nullabe();
            $table->string('departamento',20)->nullable();
            $table->string('observacion',100)->default("NINGUNA");
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
