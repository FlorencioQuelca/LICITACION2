<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateRegistrosTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('registros', function (Blueprint $table) {
            $table->id();
                   //secretaria
            $table->string("codigo")->nullable(); //BOL 34
            $table->string("interno")->nullable();  /// HR
            $table->integer("nro")->nullable();
            $table->string("nombre")->nullable();// nombre
            $table->string("cite")->nullable();// cite
            $table->date('fecha')->nullable();  //

            // evaluacion
            $table->decimal('monto1',10,2)->default(0);
            $table->decimal('monto2',10,2)->default(0);
            $table->decimal('monto3',10,2)->default(0); //area de enlosetado
            $table->decimal('total',10,2)->default(0);
            $table->decimal('puntaje',10,2)->default(0);//FAMILIAS BENEFICIARIAS
            $table->decimal('puntaje1',10,2)->default(0); //inspeccion en campo 50%
            $table->decimal('puntaje2',10,2)->default(0);
            $table->decimal('puntaje3',10,2)->default(0);
            $table->decimal('puntaje4',10,2)->default(0);

            $table->string("municipio")->nullable();
            $table->string("provincia")->nullable();   //LIBRE
            $table->string("comunidades")->nullable();//LIBRE
            $table->string("presentado_por")->nullable();// GAM/GAIOC/JV/OS
            $table->string("firmado_por")->nullable();  //ITEMS
            $table->string("autoridad")->nullable(); //categoria municipal
            $table->string("url")->nullable();  //pdf
            $table->string("status")->nullable();  // GENERADO /RECIVIDO
            $table->string("observacion")->nullable();  // RECOMENDACIONES

            //carta
            $table->string("carta_a")->nullable(); //fecha de la carta
            $table->string("carta_via")->nullable();
            $table->string("carta_de")->nullable();
            $table->string("carta_ref")->nullable();
            $table->date('carta_fecha')->nullable(); //fecha de la ficha tecnica
            $table->string('carta_cite')->nullable();
            $table->string('cumple')->nullable();


            //pie de pagina
            $table->string('mosca')->nullable();  ///asignado a municipio caso excepcional
            $table->string('copia')->nullable();// fecha desinfeccion
            $table->string('adjunto')->nullable();  //tiene se usa
            $table->string('vinculo')->nullable();//  INSPECION si/no
                ///asignado a
               ///  asignado al departamento de
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
        Schema::dropIfExists('registros');
    }
}
