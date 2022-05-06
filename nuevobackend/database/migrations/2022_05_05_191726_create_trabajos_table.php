<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateTrabajosTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('trabajos', function (Blueprint $table) {
            $table->id();
            $table->string('nombre')->nullable();
            $table->string('repuesto')->nullable();
            $table->string('detalle')->nullable();
            $table->integer('costo')->nullable();
            $table->string('factura')->nullable();
            $table->integer('total')->nullable();
            $table->string('descripcion')->nullable();
            $table->string("status")->default("activo");    
            $table->unsignedBigInteger('solicitud_id')->nullable();
            $table->foreign('solicitud_id')->references('id')->on('solicituds')->onDelete('set null')->onUpdate('cascade');
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
        Schema::dropIfExists('trabajos');
    }
}
