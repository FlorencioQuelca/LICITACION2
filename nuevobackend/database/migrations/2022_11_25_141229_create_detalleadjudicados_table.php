<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateDetalleadjudicadosTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('detalleadjudicados', function (Blueprint $table) {
            $table->id();

            $table->integer('num')->nullable();
            $table->integer('tiempo')->nullable();
            $table->string('descripcion')->nullable();
            $table->string('tipo')->nullable();
            $table->decimal('monto',10,2)->default(0)->nullable();
            $table->string('observacion')->nullable();

            $table->unsignedBigInteger('detalleadjudicado_id');
            $table->string('detalleadjudicado_type');

            $table->unsignedBigInteger('adjudicado_id')->nullable();
            $table->foreign('adjudicado_id')->references('id')->on('adjudicados')->onDelete('set null')->onUpdate('cascade');

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
        Schema::dropIfExists('detalleadjudicados');
    }
}
