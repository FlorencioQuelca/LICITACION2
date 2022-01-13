<?php

namespace Database\Seeders;

use App\Models\Proyecto;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class DetalleSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('detalles')->insert([
            ["id"=>1,"num"=>1,"proyecto_id"=>1,"detalle_id"=>1,"detalle_type"=>"App\Models\Empresa"],
            ["id"=>2,"num"=>2,"proyecto_id"=>1,"detalle_id"=>2,"detalle_type"=>"App\Models\Empresa"],
            ["id"=>3,"num"=>3,"proyecto_id"=>1,"detalle_id"=>3,"detalle_type"=>"App\Models\Empresa"]
            ]);

    }
}
