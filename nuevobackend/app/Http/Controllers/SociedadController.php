<?php

namespace App\Http\Controllers;
use Illuminate\Http\Request;

use App\Models\Sociedad;

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
            $sociedades = Sociedad::with('asociados')->get();
              return \response()->json($sociedades,200);
           }
           catch(\Exception $e){
            return \response()->json(['res'=> false, 'message'=>$e->getMessage()],200);
           }
    }
    public function detalle1(){
      
     $detalles = Sociedad::with('asociados')->get();
      return \response()->json($detalles, 200);
    }

    public function store(CreateSociedadAccidentalRequest $request)
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

    
    public function update(UpdateSociedadAccidentalRequest $request, $id)
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
}
