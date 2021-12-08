<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class DepartamentoSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('departamentos')->insert([
            ["id"=>1,"nombre"=>"LA PAZ"],
            ["id"=>2,"nombre"=>"ORURO"],
            ["id"=>3,"nombre"=>"POTOSI"],
            ["id"=>4,"nombre"=>"COCHABAMBA"],
            ["id"=>5,"nombre"=>"SANTA CRUZ"],
            ["id"=>6,"nombre"=>"BENI"],
            ["id"=>7,"nombre"=>"PANDO"],
            ["id"=>8,"nombre"=>"CHUQUISACA"],
            ["id"=>9,"nombre"=>"TARIJA"],
            ["id"=>10,"nombre"=>"CENTRAL"],
            ]);
    }
}
