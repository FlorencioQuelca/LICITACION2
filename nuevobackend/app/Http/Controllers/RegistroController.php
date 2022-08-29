<?php

namespace App\Http\Controllers;

use App\Models\Registro;
use App\Models\User;
use Illuminate\Http\Request;

class RegistroController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return Registro::with(['departamento','users'])->orderByDesc('nro')->get();
      //  return Registro::all();

    }
    public function registroid(Registro $registro){
        $registro =Registro::with(['departamento','users'])
                            ->orWhere('id', '=', $registro->id)->get();

        return \response()->json($registro,200);
    }



    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        return Registro::create($request->all());
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Registro  $registro
     * @return \Illuminate\Http\Response
     */
    public function show(Registro $registro)
    {
    return $registro;
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Registro  $registro
     * @return \Illuminate\Http\Response
     */
    public function edit(Registro $registro)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Registro  $registro
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Registro $registro)
    {
        return $registro->update($request->all());

    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Registro  $registro
     * @return \Illuminate\Http\Response
     */
    public function destroy(Registro $registro)
    {
        return  $registro->delete();
    }
    public function registrouser(Request $request,Registro $registro){
        $user= User::find($request->id);
        $registro->users()->attach($user);
        return \response()->json(['res'=> true, 'message'=>'adicionado correctamente'],200);
     }
     public function registrouserdetach(Request $request,Registro $registro){
        $user= User::find($request->id);
        $registro->users()->detach($user->id);

     }
}
