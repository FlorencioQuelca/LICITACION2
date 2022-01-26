<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class ContratoSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
         DB::table('contratos')->insert([
            ["id"=>1,"categoria_id"=>1,"user_id"=>1,"nombre"=>"ARCHIVO 1","fecha"=>"2021-01-01","hora"=>"10:30"],
            ["id"=>2,"categoria_id"=>2,"user_id"=>1,"nombre"=>"ARCHIVO 2","fecha"=>"2021-01-01","hora"=>"10:30"],
            

        ]);
    }
}
