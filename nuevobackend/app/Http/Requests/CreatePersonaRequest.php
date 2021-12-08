<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class CreatePersonaRequest extends FormRequest
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
            'ci'=> "required|unique:personas,ci",
            'paterno'=> "required|min:3|max:255",
            'nombres'=> "required|min:3|max:255",
            'fono1'=> "required",
            'email'=> "required",
        ];
    }
}
