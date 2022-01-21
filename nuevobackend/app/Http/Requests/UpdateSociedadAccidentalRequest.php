<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class UpdateSociedadAccidentalRequest extends FormRequest
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
            'codigo'=> "required|unique:sociedads,codigo,".$this->sociedadAccidental,
            'nombreEmpresa'=> "required|min:5|max:200",
            'nombreLegal'=> "required|min:8|max:200",
            'fono1'=> "required",
            'email'=> "required",
        ];
    }
}
