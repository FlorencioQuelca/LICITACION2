<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Testing\Fluent\Concerns\Has;

class UserSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('users')->insert([
            [
                'id'=>1,
                'email'=>'fqm@gmail.com',
                'name'=>'ADMINISTRADOR',
                'tipo'=>'admin',
                'ci'=>'0001',
                'password'=>Hash::make('123456')
            ],
            [
                'id'=>2,
                'email'=>'pmarco@fps.gob.bo',
                'name'=>'PATRICIA MARCO',
                'tipo'=>'USUARIO',
                'ci'=>'123',
                'password'=>Hash::make('123456')
            ]
         ]);
    }
}
