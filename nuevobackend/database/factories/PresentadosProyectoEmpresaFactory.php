<?php

namespace Database\Factories;

use App\Models\PresentadosProyectoEmpresa;
use Illuminate\Database\Eloquent\Factories\Factory;

class PresentadosProyectoEmpresaFactory extends Factory
{
    /**
     * The name of the factory's corresponding model.
     *
     * @var string
     */
    protected $model = PresentadosProyectoEmpresa::class;

    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        return [
            "num"=> rand(0, 10),
            "monto"=>$this->faker->randomNumber(2),
        ];
    }
}
