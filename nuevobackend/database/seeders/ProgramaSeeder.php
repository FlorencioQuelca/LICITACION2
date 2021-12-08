<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class ProgramaSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('programas')->insert([
            ["id"=>1,"nombre"=>"MI RIEGO"],
            ["id"=>2,"nombre"=>"MI AGUA"],
            ["id"=>3,"nombre"=>"PAR"],
            ["id"=>4,"nombre"=>"PIU"],
            ["id"=>5,"nombre"=>"FOCCIP"],
            ]);
    }
}
