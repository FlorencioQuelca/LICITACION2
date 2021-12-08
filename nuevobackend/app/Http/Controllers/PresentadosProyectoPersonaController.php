<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

//adicionado
use App\Models\PresentadosProyectoPersona;
use App\Http\Requests\CreatePresentadosProyectoPersonaRequest;
use App\Http\Requests\UpdatePresentadosProyectoPersonaRequest;

class PresentadosProyectoPersonaController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        try{
         
            $presentadosProyectoPersona = PresentadosProyectoPersona::where('id',' <=',"%{$request->txtBuscar}%")->get();
           //return $personas;
              return \response()->json($presentadosProyectoPersona,200);
           }
           catch(\Exception $e){
            return \response()->json(['res'=> false, 'message'=>$e->getMessage()],200);
           }
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(CreatePresentadosProyectoPersonaRequest $request)
    {
        $imput = $request->all();

        $presentadosProyectoPersona = PresentadosProyectoPersona::create($imput);
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
        $presentadosProyectoPersona = PresentadosProyectoPersona::findOrFail($id);
        //return $persona;
        return \response()->json($presentadosProyectoPersona,200);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(UpdatePresentadosProyectoPersonaRequest $request, $id)
    {
        $imput = $request->all();
        $presentadosProyectoPersona = PresentadosProyectoPersona::find($id);
        $presentadosProyectoPersona ->update($imput);
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
            PresentadosProyectoPersona::destroy($id);
            return \response()->json(['res'=> true, 'message'=>'Eliminado Correctamente'],200);
        }
        catch(\Exception $e){
            return \response()->json(['res'=> false, 'message'=>$e->getMessage()],200);
        }
    }
}
