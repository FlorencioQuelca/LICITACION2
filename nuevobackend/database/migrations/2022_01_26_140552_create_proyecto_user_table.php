<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateProyectoUserTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('proyecto_user', function (Blueprint $table) {
            $table->id();
           /*  $table->unsignedBigInteger('user_id')->nullable();
            $table->unsignedBigInteger('proyecto_id')->nullable();
            $table->foreign('proyecto_id')
                            ->references('id')
                            ->on('proyectos')
                            ->onDelete('set null')->onUpdate('cascade');                   
          $table->foreign('user_id')
                          ->references('id')
                          ->on('users')
                          ->onDelete('set null')->onUpdate('cascade'); */
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
        Schema::dropIfExists('proyecto_user');
    }
}
