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
       // $id = Persona::find($this.persona)
       // $persona->update($request->all());
        return [
            //
            //'ci'=> "required|unique:personas,ci,".$this->persona,
           
            'ci'=> "required|unique:personas,ci,".$this->persona,
            'paterno'=> "required|min:3|max:100",
            'nombres'=> "required|min:3|max:100",
            'fono1'=> "required|min:3",
            'email'=> "required",
            
        ];
    }
}
