<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class CodigoProyectoSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('codigo_proyecto')->insert([
            ['codigo_id'=>1,'proyecto_id'=>1],
            ['codigo_id'=>2,'proyecto_id'=>1],
            ['codigo_id'=>3,'proyecto_id'=>1],
            ['codigo_id'=>3,'proyecto_id'=>2],
            ['codigo_id'=>2,'proyecto_id'=>2],
            ['codigo_id'=>1,'proyecto_id'=>2],
            
        ]);
    }
}
