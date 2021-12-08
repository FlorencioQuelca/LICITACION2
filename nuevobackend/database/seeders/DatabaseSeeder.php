<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {
       
         \App\Models\User::factory(10)->create();
         \App\Models\Persona::factory(10)->create();
         \App\Models\Empresa::factory(10)->create();
         \App\Models\Sociedad::factory(10)->create();
        
         $this->call([
            TipoSeeder::class,
            ProgramaSeeder::class,
            DepartamentoSeeder::class,
            AsociadoSeeder::class,
            
            UserSeeder::class,
            PermisoSeeder::class,
            PermisoUserSeeder::class,
            ProyectoSeeder::class,
          
        ]);

    }
}
