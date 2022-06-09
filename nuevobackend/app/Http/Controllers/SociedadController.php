<?php

namespace App\Http\Controllers;


use App\Models\Sociedad;
use App\Models\Empresa;
use Illuminate\Http\Request;

use App\Http\Requests\CreateSociedadAccidentalRequest;
use App\Http\Requests\UpdateSociedadAccidentalRequest;


class SociedadController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        try{
            $sociedad= Sociedad::with(['proyectos','proyectos.departamento','empresas','contratos'])->orderByDesc('id')->get();
           //$sociedad = Sociedad::with('empresas')->orderByDesc('id')->get();
              return \response()->json($sociedad,200);
           }
           catch(\Exception $e){
            return \response()->json(['res'=> false, 'message'=>$e->getMessage()],200);
           }
    }
    public function detalle1(){

     $detalles = Sociedad::with('empresas')->get();
      return \response()->json($detalles, 200);
    }

    public function store(Request $request)
    {
        $imput = $request->all();
        $sociedadAccidental = Sociedad::create($imput);
        return \response()->json(['res'=> true, 'message'=>'insertado correctamente'],200);
    }


    public function show($id)
    {
        //
        $sociedadAccidental = Sociedad::findOrFail($id);
        return \response()->json($sociedadAccidental,200);

    }


    public function update(Request $request, $id)
    {
        $imput = $request->all();
        $sociedadaccidental = Sociedad::find($id);
        $sociedadaccidental->update($imput);
        return \response()->json(['res'=> true, 'message'=>'modificado  correctamente'],200);
    }


    public function destroy($id)
    {
        try{
            Sociedad::destroy($id);
            return \response()->json(['res'=> true, 'message'=>'eliminado Correctamente'],200);
        }
        catch(\Exception $e){
            return \response()->json(['res'=> false, 'message'=>$e->getMessage()],200);
        }
    }
    public function sociedadcodigo($id){
        return Sociedad::where('codigo',$id)->get();
    }
    public function empresaSociedad(Request $request, Sociedad $sociedad){
        $empresa = Empresa::find($request->id);
     //   $sociedad = Sociedad::find($sociedad->id);
        $sociedad->empresas()->attach($empresa,['participacion'=>$request->participacion]);
     }
     public function empresasociedaddetach(Request $request,Sociedad $sociedad){
        $empresa = Empresa::find($request->id);
        $sociedad->empresas()->detach($empresa->id);
     }


}
