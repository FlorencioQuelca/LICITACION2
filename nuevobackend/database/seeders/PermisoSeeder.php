<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class PermisoSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('permisos')->insert([
            ["id"=>1,"nombre"=>"Empresas"],
            ["id"=>2,"nombre"=>"Usuarios"],
            ["id"=>3,"nombre"=>"Asociaciones"],
            ["id"=>4,"nombre"=>"Consultores"],
            ["id"=>5,"nombre"=>"Asociados"],
            ["id"=>6,"nombre"=>"Proyectos"],
           
             
        ]);
    }
}
