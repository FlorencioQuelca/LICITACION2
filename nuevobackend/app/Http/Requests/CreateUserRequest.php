<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class CreateUserRequest extends FormRequest
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
           
            'nit_ci'=> "required|unique:users,nit_ci|min:5|max:10",
            'name'=> "required|min:5|max:100",
            'email'=> "required|min:10|max:50",
            'password'=> "required|min:6|max:25",
        ];
    }
}
