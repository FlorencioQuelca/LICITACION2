<?php

namespace App\Http\Controllers;

use App\Models\proyecto;
use Illuminate\Http\Request;

class ProyectoController extends Controller
{
   
    public function index(){
        $proyectos = Proyecto::with(['detalles'])->get();
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

   
    public function show(proyecto $proyecto)
    {
        return $proyecto;
        return \response()->json($proyecto,200);
    }

    
    public function edit(proyecto $proyecto)
    {
        //
    }

   
    public function update(Request $request, proyecto $proyecto)
    {
        $proyecto->update($request->all());
        return \response()->json(['res'=> true, 'message'=>'modificado  correctamente'],200);
    }

    
    public function destroy(proyecto $proyecto)
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
}
