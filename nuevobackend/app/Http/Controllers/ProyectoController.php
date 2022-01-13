<?php

namespace App\Http\Controllers;

use App\Models\Proyecto;
use App\Models\Codigo;
use Illuminate\Http\Request;

class ProyectoController extends Controller
{
   
    public function index(){
        $proyectos = Proyecto::with(['sociedads','personas','empresas','programa', 'tipo', 'departamento','codigos'])->get();
        return \response()->json($proyectos, 200);
    }

    
    public function create()
    {
        //
    }

    
    public function store(Request $request)
    {
       Proyecto::create($request->all());
      return \response()->json(['res'=> true, 'message'=>'insertado correctamente'],200);
       
    }

   
    public function show(Proyecto $proyecto)
    {
        return $proyecto;
        return \response()->json($proyecto,200);
    }

    
    public function edit(Proyecto $proyecto)
    {
        //
    }

   
    public function update(Request $request, Proyecto $proyecto)
    {
        $proyecto->update($request->all());
        return \response()->json(['res'=> true, 'message'=>'modificado  correctamente'],200);
    }

    
    public function destroy(Proyecto $proyecto)
    {
       
        try{
            $proyecto->delete();
          //  ProyectoPersona::destroy($id);
            return \response()->json(['res'=> true, 'message'=>'Eliminado Correctamente'],200);
        }
        catch(\Exception $e){
            return \response()->json(['res'=> false, 'message'=>$e->getMessage()],200);
        }
    }
    //asociar
    public function codigoproyectos1(Request $request,Proyecto $proyecto){
        $codigo = Codigo::find($request->id);
        $proyecto->codigos()->attach($codigo);       
    }
    //adesarociar
    public function codigoproyectos(Request $request,Proyecto $proyecto){
        $codigo = Codigo::find($request->id);
       $proyecto->codigos()->detach($codigo->id);       
     }
     
    

}
