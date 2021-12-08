<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class UpdatePersonaRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            //
            'ci'=> "required|unique:personas,ci,".$this->persona,
            'paterno'=> "required|min:3|max:100",
            'nombres'=> "required|min:3|max:100",
            'fechaNacimiento'=> "required|date|after:1921-10-27|before:today",
            'fono1'=> "required",
            'email'=> "required",
            'genero'=> "required",
            'nit'=> "required",
            
        ];
    }
}
