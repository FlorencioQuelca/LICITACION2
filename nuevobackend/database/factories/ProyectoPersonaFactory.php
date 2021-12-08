<?php

namespace Database\Factories;

use App\Models\ProyectoPersona;
use Illuminate\Database\Eloquent\Factories\Factory;

class ProyectoPersonaFactory extends Factory
{
    /**
     * The name of the factory's corresponding model.
     *
     * @var string
     */
    protected $model = ProyectoPersona::class;

    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        return [
        "codigo"=> $this->faker->numberBetween(1000, 9999),
        "nombre"=> $this->faker->name,
        "fecha" =>$this->faker->date,
        "hora" =>$this->faker->time,
        "link" => $this->faker->imageUrl(200, 100),
        "programa" => $this->faker->name,
        "precio"=> $this->faker->randomNumber(2),
        "plazoEntrega"=> rand(0,180),
        "lote" => rand(0,10),
            "departamento" =>"LA PAZ"
        ];
              
    }
}
