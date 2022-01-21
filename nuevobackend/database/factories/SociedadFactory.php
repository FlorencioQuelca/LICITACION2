<?php

namespace Database\Factories;

use App\Models\Sociedad;
use Illuminate\Database\Eloquent\Factories\Factory;

class SociedadFactory extends Factory
{
    /**
     * The name of the factory's corresponding model.
     *
     * @var string
     */
    protected $model = Sociedad::class;

    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        return [
        "nombreEmpresa"=>$this->faker->lastName,
        "codigo"=>$this->faker->unique()->numberBetween(577513,59999999),
        "nombreLegal"=>$this->faker->name,
        "direccion"=>$this->faker->text,
        "fono1"=>rand(75402473,99999999),   
        "fono2"=>rand(75402473,99999999),   
        "email"=>$this->faker->unique()->safeEmail(),
        "departamento"=>$this->faker->city,
        ];
    }
}
