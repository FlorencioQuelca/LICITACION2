<?php

namespace App\Http\Controllers;
use Illuminate\Http\Request;
//importado
use App\Models\User;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Str;
//
use App\Http\Requests\CreateUserRequest;


class UserController extends Controller
{
    // funcion login
    public function login(Request $request){
     
        // user/email:  florens.lonwe@gmail.com 
         //pasword : 123456
        $user = User::whereEmail($request->email)->first();

        if(!is_null($user) && \Hash::check($request->password,$user->password ) &&$request->nit_ci==$user->nit_ci ){

            $user->api_token = Str::random(150);
            $user->save();
            return \response()->json(['res' => true, 'token' => $user->api_token, 'user' => $user, 'message'=>'Bienvenido al sistema'], 200);
        }else
        {
            return \response()->json(['res'=>false, 'message'=>'Nit_CI,Cuenta o  Password Incorrecto'],200);
        }
    }
        public function logout(){
            $user = auth()->user(); //usuario actualmente autenticado
            $user->api_token = null;
            $user->save();
    
            return \response()->json(['res' => true, 'message'=>'Hasta luego gracias por su Visita'], 200);
        }

    public function store(CreateUserRequest $request)
    {
       $imput = $request->all();
       $user = User::create($imput);
        return \response()->json(['res'=> true, 'message'=>'insertado correctamente'],200);
      
    }

    
}
