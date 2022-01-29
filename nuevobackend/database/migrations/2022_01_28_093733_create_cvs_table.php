<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCvsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('cvs', function (Blueprint $table) {
            $table->id();
            $table->string('nombre')->unique();
            $table->string('url')->nullable();
            $table->date('fecha')->nullable();
            $table->time('hora')->nullable();
            $table->unsignedBigInteger('persona_id')->nullable();
            $table->foreign('persona_id')
                          ->references('id')
                          ->on('personas')
                          ->onDelete('set null')->onUpdate('cascade');
           
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
        Schema::dropIfExists('cvs');
    }
}
