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
            $table->string("codigo")->unique();
            $table->string("interno")->nullable();
            $table->string("nombre");// nombre
            $table->string("cite");// cite
            $table->date('fecha')->nullable();

            // evaluacion
            $table->decimal('monto1',10,2)->default(0);
            $table->decimal('monto2',10,2)->default(0);
            $table->decimal('monto3',10,2)->default(0);
            $table->decimal('total',10,2)->default(0);

            $table->string("municipio")->nullable();
            $table->string("comunidades")->nullable();
            $table->string("presentado_por")->nullable();
            $table->string("firmado_por")->nullable();
            $table->string("autoridad")->nullable();
            $table->string("url")->nullable();  //pdf
            $table->string("status")->nullable();  //activo
            $table->string("observacion")->nullable();

            //carta
            $table->string("carta_a")->nullable();
            $table->string("carta_via")->nullable();
            $table->string("carta_de")->nullable();
            $table->string("carta_ref")->nullable();
            $table->date('carta_fecha')->nullable();
            $table->string('carta_cite')->nullable();
            $table->string('cumple')->nullable();


            //pie de pagina
            $table->string('mosca')->nullable();
            $table->string('copia')->nullable();
            $table->string('adjunto')->nullable();
            $table->string('vinculo')->nullable();
                ///asignado a
            $table->unsignedBigInteger("user_id")->nullable();
            $table->foreign('user_id')->references('id')->on('users')->onDelete('set null')->onUpdate('cascade');
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
