<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
//adicionado
use App\Models\ProyectoPersona;

//adicion de request
use App\Http\Requests\CreateProyectoPersonaRequest;
use App\Http\Requests\UpdateProyectoPersonaRequest;


class ProyectoPersonaController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        try{
            //$imput = $request->all();
            $proyectoPersona = ProyectoPersona::where('hora','<=',$request->hora)
                                                ->where('fecha','<=',$request->fecha)
                                                ->where('departamento','<=',$request->departamento)->get();
                                               // ->AndWhere('hora',' <=',"%{$request->txtBuscar2}%")->get();
           //return $personas;
              return \response()->json($proyectoPersona,200);
           }
           catch(\Exception $e){
            return \response()->json(['res'=> false, 'message'=>$e->getMessage()],200);
           }
           //if(!is_null($user) && \Hash::check($request->password,$user->password ) &&$request->nit_ci==$user->nit_ci ){

    
    }

    /** 
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(CreateProyectoEmpresaRequest $request)
    {
        $imput = $request->all();
        //return $imput;
     //   $imput['user_id'] = 1
        $proyectoPersona = ProyectoPersona::create($imput);
        return \response()->json(['res'=> true, 'message'=>'insertado correctamente'],200);
       // return \response()->json($persona,200);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $proyectoPersona = ProyectoPersona::find($id);
        //return $persona;
        return \response()->json($proyectoPersona,200);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(UpdateProyectoPersonaRequest $request, $id)
    {
         
         $imput = $request->all();
         $proyectoPersona = ProyectoPersona::find($id);
         $proyectoPersona ->update($imput);
         return \response()->json(['res'=> true, 'message'=>'modificado  correctamente'],200);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        try{
            ProyectoPersona::destroy($id);
            return \response()->json(['res'=> true, 'message'=>'Eliminado Correctamente'],200);
        }
        catch(\Exception $e){
            return \response()->json(['res'=> false, 'message'=>$e->getMessage()],200);
        }
    }
}
