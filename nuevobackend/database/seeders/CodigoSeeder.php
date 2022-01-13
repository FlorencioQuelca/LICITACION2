<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class CodigoSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('codigos')->insert([
            ["id"=>1,"nombre"=>"FPS-02-00004535"],
            ["id"=>2,"nombre"=>"FPS-02-00004525"],
            ["id"=>3,"nombre"=>"FPS-02-00009999"],
            
            ]);
    }
}
