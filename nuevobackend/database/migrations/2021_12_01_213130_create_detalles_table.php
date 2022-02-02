<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateDetallesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('detalles', function (Blueprint $table) {
            $table->id();
            $table->integer('tiempo')->default(0);
            $table->integer('num')->default(0);
            $table->string('descripcion')->default('NINGUNA');
            $table->string('tipo')->default('NINGULA');            
            $table->decimal('monto',10,2)->default(0);
            $table->string('observacion')->default('INGUNA');    
            $table->unsignedBigInteger('detalle_id');
            $table->string('detalle_type');
            $table->unsignedBigInteger('proyecto_id')->nullable();
            $table->foreign('proyecto_id')->references('id')->on('proyectos')->onDelete('set null')->onUpdate('cascade');
            
            
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
        Schema::dropIfExists('detalles');
    }
}
