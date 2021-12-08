<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
//adicionado
use App\Models\PresentadosProyectoSociedad;

use App\Http\Requests\CreatePresentadosProyectoSociedadRequest;
use App\Http\Requests\UpdatePresentadosProyectoSociedadRequest;


class PresentadosProyectoSociedadController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        try{
            $presentadosProyectoSociedad = PresentadosProyectoSociedad::where('id',' <=',"%{$request->txtBuscar}%")->get();
           //return $personas;
              return \response()->json($presentadosProyectoSociedad,200);
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
    public function store(CreatePresentadosProyectoSociedadRequest $request){
        $imput = $request->all();

        $presentadosProyectoSociedad = PresentadosProyectoSociedad::create($imput);
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
        $presentadosProyectoSociedad = PresentadosProyectoSociedad::findOrFail($id);
        //return $persona;
        return \response()->json($presentadosProyectoSociedad,200);
    }
    

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(UpdatePresentadosProyectoSociedadRequest $request, $id)
    {
        $imput = $request->all();
        $presentadosProyectoSociedad = PresentadosProyectoSociedad::find($id);
        $presentadosProyectoSociedad ->update($imput);
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
            PresentadosProyectoSociedad::destroy($id);
            return \response()->json(['res'=> true, 'message'=>'Eliminado Correctamente'],200);
        }
        catch(\Exception $e){
            return \response()->json(['res'=> false, 'message'=>$e->getMessage()],200);
        }
    }
}
