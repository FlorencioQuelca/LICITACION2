<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateLotesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('lotes', function (Blueprint $table) {
            $table->id();
            $table->integer('nro')->nullable();
            $table->string('nombre')->unique();
            $table->string('lote')->nullable();
            $table->string('codigo')->nullable();
            $table->integer('nrolote')->nullable();
            $table->string("status")->nullable();
            $table->decimal('precio',10,2)->nullable()->default(0);
            $table->decimal('total',10,2)->nullable()->default(0);
            $table->decimal('monto',10,2)->nullable()->default(0);
            $table->integer('plazo')->nullable()->default(0);
            $table->integer('cantidad')->nullable()->default(1);
            $table->string("observacion")->nullable();
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
        Schema::dropIfExists('lotes');
    }
}
