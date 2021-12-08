<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class AsociadoSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('asociados')->insert([
            ["id"=>1,"num"=>1,"participacion"=>50,"empresa_id"=>1,"sociedad_id"=>1],
            ["id"=>2,"num"=>2,"participacion"=>30,"empresa_id"=>2,"sociedad_id"=>1],
            ["id"=>3,"num"=>3,"participacion"=>20,"empresa_id"=>3,"sociedad_id"=>1],
            
            ["id"=>4,"num"=>1,"participacion"=>10,"empresa_id"=>1,"sociedad_id"=>2],
            ["id"=>5,"num"=>2,"participacion"=>10,"empresa_id"=>4,"sociedad_id"=>2],
            ["id"=>6,"num"=>3,"participacion"=>80,"empresa_id"=>5,"sociedad_id"=>2],
            
        ]);
    }
}
