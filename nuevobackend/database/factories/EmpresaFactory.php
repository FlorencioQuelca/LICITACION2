<?php

namespace Database\Factories;

use App\Models\Empresa;
use Illuminate\Database\Eloquent\Factories\Factory;

class EmpresaFactory extends Factory
{
    /**
     * The name of the factory's corresponding model.
     *
     * @var string
     */
    protected $model = Empresa::class;

    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        return [
            "nombreEmpresa" =>$this->faker->streetName,
            "nit"=>$this->faker->unique()->numberBetween(5775077013,5999999999),
            "nombreLegal"=>$this->faker->name,
            "direccion"=>$this->faker->address,
            "fono1" =>rand(75402473,99999999),
            "fono2" =>rand(75402473,99999999),
            "email"=> $this->faker->unique()->safeEmail(),
            "departamento"=>$this->faker->city,
            "observacion"=>$this->faker->text
        ];
    }

    
}
