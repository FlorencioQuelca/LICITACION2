<?php

namespace Database\Factories;

use App\Models\Persona;
use Illuminate\Database\Eloquent\Factories\Factory;

class PersonaFactory extends Factory
{
    /**
     * The name of the factory's corresponding model.
     *
     * @var string
     */
    protected $model = Persona::class;

    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        return [
            "ci"=>$this->faker->unique()->postcode,
            "paterno"=>$this->faker->streetName,
            "nombres"=>$this->faker->lastName,
            "grado"=>$this->faker->suffix,
            "direccion"=>$this->faker->countryCode,
            "fechaNacimiento"=>$this->faker->date,
            "fono1"=>25285129,
            "fono2"=>75402473,
            "datosp"=>"florencio quelca",
            "nit"=>15112454,
            "email"=>$this->faker->unique()->safeEmail(),
            "genero"=>"female",
            "materno"=>$this->faker->firstName,
            "observacion"=>$this->faker->text
        ];
        
    }
}
