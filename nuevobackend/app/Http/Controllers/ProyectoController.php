<?php

namespace App\Http\Controllers;

use App\Models\Proyecto;
use App\Models\Codigo;
use App\Models\Persona;
use App\Models\Empresa;
use App\Models\Sociedad;
use App\Models\User;
use Illuminate\Http\Request;

class ProyectoController extends Controller
{
    public function index(){
        $proyectos = Proyecto::with(['sociedads.empresas','personas','empresas','programa', 'tipo', 'departamento','codigos', 'funcionarios','lotes'])->orderByDesc('id')->get();
        return \response()->json($proyectos, 200);
    }
    public function proyectoslibre(){
        $proyectos = Proyecto::with(['sociedads.empresas','personas','empresas','programa', 'tipo', 'departamento','codigos', 'funcionarios'])->orderByDesc('id')->get();
        return \response()->json($proyectos, 200);
    }
    public function proyectoid(Proyecto $proyecto){
        $proyecto =Proyecto::with(['sociedads.empresas','personas','empresas','programa', 'tipo', 'departamento','codigos', 'funcionarios','lotes','lotes.personas','lotes.empresas','lotes.sociedads','lotes.sociedads.empresas', 'contratos','contratos.personas','contratos.empresas','contratos.sociedads'])
                            ->orWhere('id', '=', $proyecto->id)->get();

        return \response()->json($proyecto,200);
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
    public function update(Request $request, Proyecto $proyecto) {
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

     public function personaproyectos(Request $request,Proyecto $proyecto){
        $persona= Persona::find($request->id);
        $proyecto->personas()->attach($persona);
     }
     public function personaproyectosdetach(Request $request,Proyecto $proyecto){
        $persona= Persona::find($request->id);
        $proyecto->personas()->detach($persona->id);
     }

     public function empresaproyectos(Request $request,Proyecto $proyecto){
        $empresa= Empresa::find($request->id);
        $proyecto->empresas()->attach($empresa,['monto'=>$request->monto]);

     }
     public function empresaproyectosdetach(Request $request,Proyecto $proyecto){
        $empresa= Empresa::find($request->id);
        $proyecto->empresas()->detach($empresa->id);
     }

     public function sociedadproyectos(Request $request,Proyecto $proyecto){
        $sociedad= Sociedad::find($request->id);
        $proyecto->sociedads()->attach($sociedad,['monto'=>$request->monto]);
     }
     public function sociedadproyectosdetach(Request $request,Proyecto $proyecto){
        $sociedad= Sociedad::find($request->id);
        $proyecto->sociedads()->detach($sociedad->id);
     }

        public function funcionarioproyectos(Request $request,Proyecto $proyecto){
            $funcionario = Persona::find($request->id);
            $proyecto->funcionarios()->attach($funcionario);
         }
         public function funcionarioproyectosdetach(Request $request,Proyecto $proyecto){
            $funcionario = Persona::find($request->id);
            $proyecto->funcionarios()->detach($funcionario->id);
         }

}
