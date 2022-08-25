<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateMunicipiosTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('municipios', function (Blueprint $table) {
            $table->id();
            $table->integer("cod_municipio");
            $table->string("municipio");
            $table->integer("id_area");

            $table->string("municipio_codigo",2)->nullable();
            $table->string("observacion")->nullable();
            $table->unsignedBigInteger("departamento_id")->nullable();
            $table->foreign('departamento_id')->references('id')->on('departamentos')->onDelete('set null')->onUpdate('cascade');
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
        Schema::dropIfExists('municipios');
    }
}
