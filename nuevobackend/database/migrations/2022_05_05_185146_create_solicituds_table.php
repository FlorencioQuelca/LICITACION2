<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateSolicitudsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('solicituds', function (Blueprint $table) {
            $table->id();
            $table->string('seguimiento')->nullable();
            $table->date('fechaini')->nullable();
            $table->date('fechafin')->nullable();
            $table->string("status")->default("activo");
            $table->unsignedBigInteger("taller_id")->nullable();
            $table->foreign("taller_id")->references("id")->on("tallers")->onDelete('set null')->onUpdate('cascade');
            $table->unsignedBigInteger("car_id")->nullable();
            $table->foreign("car_id")->references("id")->on("cars")->onDelete('set null')->onUpdate('cascade');
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
        Schema::dropIfExists('solicituds');
    }
}
