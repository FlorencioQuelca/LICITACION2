<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

//adicionado
use App\Models\ProyectoEmpresa;
use App\Http\Requests\CreateProyectoEmpresaRequest;
use App\Http\Requests\UpdateProyectoEmpresaRequest;

class ProyectoEmpresaController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        //
        try{
         
      
             $proyectoEmpresa = ProyectoEmpresa::where('hora','<=',$request->hora)
                                                        ->where('fecha','<=',$request->fecha)
                                                        ->where('departamento','<=',$request->departamento)->get();
           //return $personas;
              return \response()->json($proyectoEmpresa,200);
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
    public function store(CreateProyectoEmpresaRequest $request)
    {
        $imput = $request->all();
        $proyectoEmpresa= ProyectoEmpresa::create($imput);
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
        $proyectoEmpresa = ProyectoEmpresa::findOrFail($id);
        return \response()->json($proyectoEmpresa,200);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(UpdateProyectoEmpresaRequest $request, $id)
    {
        $imput = $request->all();
        $proyectoEmpresa = ProyectoEmpresa::find($id);
        $proyectoEmpresa ->update($imput);
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
            ProyectoEmpresa::destroy($id);
            return \response()->json(['res'=> true, 'message'=>'Eliminado Correctamente'],200);
        }
        catch(\Exception $e){
            return \response()->json(['res'=> false, 'message'=>$e->getMessage()],200);
        }

    }
}
