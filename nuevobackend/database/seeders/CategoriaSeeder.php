<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class CategoriaSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('categorias')->insert([
            ["id"=>1,"nombre"=>"PROYECTO A DISEÑO FINAL"],
            ["id"=>2,"nombre"=>"CONTRATO"],
            ["id"=>3,"nombre"=>"ACTA DE CIERRE"],
            ["id"=>4,"nombre"=>"INSTITUCIONAL"],
            ["id"=>5,"nombre"=>"CAPACITACION VIDEOS"],
            ["id"=>6,"nombre"=>"CONVENIOS"],
            ["id"=>7,"nombre"=>"PROGRAMAS"],
            ["id"=>8,"nombre"=>"VARIOS"],
            ["id"=>9,"nombre"=>"SIN CATEGORIA"]
            ]);
    }
}
