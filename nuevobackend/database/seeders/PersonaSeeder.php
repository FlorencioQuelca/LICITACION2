<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class PersonaSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        //
        DB::table('personas')->insert([
            ['ci'=>5775077,'paterno'=>"QUELCA",'materno'=>"MAMANI","nombres"=>"FLORENCIO", "datosp"=>"FLORENCIO QUELCA MAMANI", "nit"=>5775077013, "grado"=>"ING.",'direccion'=>"AV. MECAPACA ENTRE CALLE 23",'fechaNacimiento'=>"1989-10-27", 'fono1'=>"75402473","fono2"=>"77156517",'email'=>"florens.lonwe@gmail.com","genero"=>"MA"],
            ['ci'=>5775078,'paterno'=>"QUELCA",'materno'=>"MAMANI","nombres"=>"FLORENCIO", "datosp"=>"FLORENCIO2 QUELCA MAMANI", "nit"=>5775077013, "grado"=>"ING.",'direccion'=>"AV. MECAPACA ENTRE CALLE 23",'fechaNacimiento'=>"1989-10-27", 'fono1'=>"75402473","fono2"=>"77156517",'email'=>"florens.lonwe@gmail.com","genero"=>"MA"],
        ]);
       
    }
}
