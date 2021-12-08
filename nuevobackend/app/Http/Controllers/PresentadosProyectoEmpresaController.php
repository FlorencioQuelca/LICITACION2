<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;



//adicionado
use App\Models\PresentadosProyectoEmpresa;
use App\Http\Requests\CreatePresentadosProyectoEmpresaRequest;
use App\Http\Requests\UpdatePresentadosProyectoEmpresaRequest;


class PresentadosProyectoEmpresaController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        try{
         
            $presentadosProyectoEmpresa = PresentadosProyectoEmpresa::where('id',' <=',"%{$request->txtBuscar1}%")->get();
           //return $personas;
              return \response()->json($presentadosProyectoEmpresa,200);
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
    public function store(CreatePresentadosProyectoEmpresaRequest $request)
    {
        $imput = $request->all();
        $presentadosProyectoEmpresa= PresentadosProyectoEmpresa::create($imput);
        return \response()->json(['res'=> true, 'message'=>'insertado correctamente'],200);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $presentadosProyectoempresa = PresentadosProyectoEmpresa::findOrFail($id);
        return \response()->json($presentadosProyectoEmpresa,200);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(UpdatePresentadosProyectoEmpresaRequest $request, $id)
    {
        $imput = $request->all();
        $presentadosProyectoEmpresa = PresentadosProyectoEmpresa::find($id);
        $presentadosProyectoEmpresa ->update($imput);
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
            PresentadosProyectoEmpresa::destroy($id);
            return \response()->json(['res'=> true, 'message'=>'Eliminado Correctamente'],200);
        }
        catch(\Exception $e){
            return \response()->json(['res'=> false, 'message'=>$e->getMessage()],200);
        }
    }
}
