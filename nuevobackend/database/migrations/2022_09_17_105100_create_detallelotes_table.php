<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateDetallelotesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('detallelotes', function (Blueprint $table) {
            $table->id();
            $table->integer('num')->nullable();
            $table->integer('tiempo')->nullable();
            $table->string('descripcion')->nullable();
            $table->string('tipo')->nullable();
            $table->decimal('monto',10,2)->default(0)->nullable();
            $table->string('observacion')->nullable();
            $table->unsignedBigInteger('detallelote_id');
            $table->string('detallelote_type');
            $table->unsignedBigInteger('lote_id')->nullable();
            $table->foreign('lote_id')->references('id')->on('lotes')->onDelete('set null')->onUpdate('cascade');

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
        Schema::dropIfExists('detallelotes');
    }
}
