<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateFichasTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('fichas', function (Blueprint $table) {
            $table->id();
            $table->string("nombre")->nullable();// nombre
            $table->string("ubicacion")->nullable();// nombre
            $table->string("zona")->nullable();
            $table->string("circunscripcion")->nullable();
            $table->string("distrito")->nullable();
            $table->string("direccion")->nullable();
            $table->string("coordenadas")->nullable();
            $table->string("observacion4")->nullable();
            $table->string("observacion5a")->nullable();
            $table->string("observacion5b")->nullable();
            $table->string("observacion5c")->nullable();
            $table->string("observacion5d")->nullable();
            $table->string("observacion6")->nullable();
            $table->string("priorizado")->nullable();
            $table->string("planimetria")->nullable();
            $table->string("status")->nullable();
            $table->string("observacion")->nullable();
            $table->string("inspeccionado")->nullable();
            $table->string("aprobado")->nullable();
            $table->string("foto1")->nullable();
            $table->string("foto2")->nullable();
            $table->string("foto3")->nullable();
            $table->string("foto4")->nullable();
            $table->date('fecha')->nullable();
            $table->integer("dias")->default(0);
            //
            $table->decimal('agua',10,2)->default(0);
            $table->decimal('alcantarillado',10,2)->default(0);
            $table->decimal('electricidad',10,2)->default(0);
            $table->decimal('gasnatural',10,2)->default(0);
            $table->decimal('tierra',10,2)->default(0);
            $table->decimal('empedrado',10,2)->default(0);
            $table->decimal('otro',10,2)->default(0);
            $table->decimal('ejecutado',10,2)->default(0);
            $table->decimal('porejecutar',10,2)->default(0);
            $table->decimal('longitudporejecutar',10,2)->default(0);
            $table->decimal('longitud',10,2)->default(0);
            $table->decimal('ancho',10,2)->default(0);
            $table->decimal('area',10,2)->default(0);

            $table->unsignedBigInteger('registro_id')->unique()->nullable();
            $table->foreign('registro_id')->references('id')->on('registros')->onDelete('set null')->onUpdate('cascade');


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
        Schema::dropIfExists('fichas');
    }
}
