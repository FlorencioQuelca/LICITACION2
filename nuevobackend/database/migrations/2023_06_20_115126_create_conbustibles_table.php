<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateConbustiblesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('conbustibles', function (Blueprint $table) {
            $table->id();
            $table->date('fecha')->nullable();
            $table->time('hora')->nullable();
            $table->string('empresa')->nullable();
            $table->string('tipo')->nullable();
            $table->string('motivo')->nullable();
            $table->string('razon')->nullable();
            $table->string('proyecto')->nullable();
            $table->string('ruta')->nullable();
            $table->string('km')->nullable();
            $table->string('codigo')->nullable(); //numero de ticket
            $table->string('monto')->nullable();
            $table->string('litro')->nullable();
            $table->string('estado')->nullable();
            $table->string('observacion')->nullable();
            $table->unsignedBigInteger('user_id')->nullable();
            $table->foreign('user_id')->references('id')->on('users')->onDelete('set null')->onUpdate('cascade');
            $table->unsignedBigInteger('car_id')->nullable();
            $table->foreign('car_id')->references('id')->on('cars')->onDelete('set null')->onUpdate('cascade');
            $table->unsignedBigInteger('persona_id')->nullable();
            $table->foreign('persona_id')->references('id')->on('personas')->onDelete('set null')->onUpdate('cascade');
            $table->unsignedBigInteger('tiket_id')->nullable();
            $table->foreign('tiket_id')->references('id')->on('tikets')->onDelete('set null')->onUpdate('cascade');
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
        Schema::dropIfExists('conbustibles');
    }
}
