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
            $table->double('tiempo')->nullable();
            $table->integer('num')->nullable();
            $table->decimal('monto',10,2)->default(0);
            $table->unsignedBigInteger('proyecto_id')->nullable();
            
            $table->unsignedBigInteger('detalletable_id');
            $table->string('detalletable_type');

            $table->foreign('proyecto_id')->references('id')->on('proyectos')->onDelete('set null');
            
            
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
