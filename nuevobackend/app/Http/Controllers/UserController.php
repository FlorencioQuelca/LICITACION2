<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

//importado
use App\Models\User;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Str;
use App\Models\Permiso;
//
use App\Http\Requests\CreateUserRequest;


class UserController extends Controller
{

    // funcion login
    public function login(Request $request)
    {


        if (!Auth::attempt($request->all())) {
            return response()->json(['res'=> false, 'message'=>"No existe usuario"], 400);
        }
       if (User::where('email', $request->email)->whereDate('fechalimite', '>', now())->get()->count() == 0) {
           return response()->json(['res' => 'Su usuario sobre paso el limite de ingreso'], 200);
        }

        $user = User::where('email', $request->email)->with(['permisos','registros'])->firstOrFail();
        $token = $user->createToken('auth_token')->plainTextToken;
        return response()->json(['token' => $token, 'user' => $user], 200);
    }
    public function logout(Request $request)
    {
        $request->user()->currentAccessToken()->delete();
        return response()->json(['res' => 'salido exitosamente'], 200);
    }

    //CRUD
    public function index(){
        return User::
        with('permisos')->get();
    }

    public function userid($id){
        try{
       // return Persona::get();
         $personas= User::where('ci',$id)->get();
          return \response()->json($personas,200);
        }
        catch(\Exception $e){
         return \response()->json(['res'=> false, 'message'=>$e->getMessage()],200);
        }
     }

    public function listuser(){
        return User::
//            ->with('permisos')
            all();
    }
    public function store(Request $request){
        //        return ;
                $user=new User();
                $user->name=$request->name;
                $user->email=$request->email;
                $user->fechalimite=$request->fechalimite;
                $user->password= Hash::make($request->password) ;
              //adicionado
                $user->status = $request->departamento;
                $user->ci = $request ->departamento_id;
                $user->tipo = $request ->tipo;


                $user->save();
                $permisos= array();
                foreach ($request->permisos as $permiso){
        //            echo $permiso['estado'].'  ';
                    if ($permiso['estado']==true)
                        $permisos[]=$permiso['id'];
                }
                $permiso = Permiso::find($permisos);
                $user->permisos()->attach($permiso);

            }
    public function update(Request $request, User $user)
    {
        $user->update($request->all());
        return $user;
    }
    public function updatepermisos(Request $request, User $user){
        $permisos= array();
        foreach ($request->permisos as $permiso){
            if ($permiso['estado']==true)
                $permisos[]=$permiso['id'];
        }
        $permiso = Permiso::find($permisos);
        $user->permisos()->detach();
        $user->permisos()->attach($permiso);
    }
    public function pass(Request $request,  $id){
        $user=User::find($id);
        $user->password =Hash::make($request->password);
        $user->save();
        // $user->update([
        //     'password' => Hash::make($request->password)
        // ]);
        return $user;
    }
    public function destroy(User $user){
        $user->delete();
    }
    public function me(Request $request){
        $user=User::where('id',$request->user()->id)
        //            ->with('unid')
                    ->with('permisos')
                    ->firstOrFail();
                return $user;
    }
    public function userci($id){
        return User::where('ci',$id)->get();
    }
}
