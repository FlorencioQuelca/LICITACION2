<?php

namespace App\Http\Controllers;

use App\Models\Registro;
use App\Models\User;
use App\Models\Evaluacion;
use App\Models\Comunidad;
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
        try{
            $registro= Registro::with(['departamento','users'])->orderByDesc('nro')->get();
            return \response()->json($registro,200);
        }
        catch(\Exception $e){
            return \response()->json(['res'=> false, 'message'=>$e->getMessage()],200);
           }

      //  return Registro::all();

    }
    public function registroid(Registro $registro){
        try{
            $registro =Registro::with(['departamento','users','evaluacions','ficha'])
                                ->orWhere('id', '=', $registro->id)->get();
            return \response()->json($registro,200);
        }
        catch(\Exception $e){
            return \response()->json(['res'=> false, 'message'=>$e->getMessage()],200);
           }
    }
    public function registrodepa(Registro $registro){
        $registro =Registro::with(['departamento','users','evaluacions','ficha'])
                            ->orWhere('departamento_id', '=', $registro->id)->orderByDesc('nro')->get();

        return \response()->json($registro,200);
    }
    public function registrodepaorder(Registro $registro){
        $registro =Registro::with(['departamento','users','evaluacions','ficha'])
                            ->orWhere('departamento_id', '=', $registro->id)->orderBy('nro')->get();

        return \response()->json($registro,200);
    }
    public function registrados()
    {
          try{
              $registro =Registro::with(['departamento','users','evaluacions','ficha'])->orderBy('nro')->get();
              return \response()->json($registro,200);
          }
          catch(\Exception $e){
            return \response()->json(['res'=> false, 'message'=>$e->getMessage()],200);
           }

      //  return Registro::all();

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
     public function registroevaluacion(Request $request,Registro $registro){
        $evaluacion= Evaluacion::find($request->id);
        $registro->evaluacions()->attach($evaluacion,['descripcion'=>$request->descripcion,'presenta'=>$request->presenta,'nombre'=>$request->nombre,'puntaje'=>$request->puntaje, 'tipo'=>$request->tipo]);
        return \response()->json(['res'=> true, 'message'=>'adicionado correctamente'],200);
     }
     public function registroevaluaciondetach(Request $request,Registro $registro){
        $evaluacion= Evaluacion::find($request->id);
        $registro->evaluacions()->detach($evaluacion->id);

     }
     public function registrocomunidad(Request $request,Registro $registro){
        $comunidad= Comunidad::find($request->id);
        $registro->comunidads()->attach($comunidad);
        return \response()->json(['res'=> true, 'message'=>'adicionado correctamente'],200);
     }
     public function registrocomunidaddetach(Request $request,Registro $registro){
        $comunidad= Comunidad::find($request->id);
        $registro->comunidads()->detach($comunidad->id);

     }
}
