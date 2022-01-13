<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class ProyectoSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('proyectos')->insert([
            ["id"=>1,"departamento_id"=>1,"programa_id"=>1,"tipo_id"=>1,"nombre"=>"CONST. S.A.P. HAUNACANE","fecha"=>"2021-01-01","hora"=>"10:30","link"=>"google.com/asd-asd-asd"],
            ["id"=>2,"departamento_id"=>1,"programa_id"=>1,"tipo_id"=>1,"nombre"=>"CONST. S.A.P. CALACOTO","fecha"=>"2021-01-01","hora"=>"10:30","link"=>"gasdoogle.com/asd-asd-asd"],
            

        ]);
    }
}
