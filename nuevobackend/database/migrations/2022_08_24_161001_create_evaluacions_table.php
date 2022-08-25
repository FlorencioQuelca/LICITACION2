<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateEvaluacionsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('evaluacions', function (Blueprint $table) {
            $table->id();
            $table->string('nombre')->nullable();
            $table->string('tipo')->nullable();
            $table->string('valor')->nullable();
            $table->string('descripcion')->nullable();
            $table->string('observacion')->nullable();
            $table->string('status')->default("ACTIVO");
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
        Schema::dropIfExists('evaluacions');
    }
}
