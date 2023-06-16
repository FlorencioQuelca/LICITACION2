<?php

namespace App\Http\Controllers;


//adicionado
use App\Models\Persona;
//adicion de request
use Illuminate\Http\Request;
use App\Http\Requests\CreatePersonaRequest;
use App\Http\Requests\UpdatePersonaRequest;




class PersonaController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */

     //sirve para listar y buscar dentro de una tabla

    public function index(Request $request)
    {
        //return $request->all();
        //listado
        // select * from Persona (ORM, laravel ... Eloquent)
          //     $personas = Persona::all();
         //      return $personas;
        //busqueda
         //select * from Persona where ci like %par% or...
       //  $imput = $request->all();
       try{
        $personas= Persona::with(['proyectos','proyectos.departamento','contratos','visitas','visitas.departamento','visitas.user'])->orderByDesc('id')->get();

       // $personas = Persona::where('ci','like',"%{$request->txtBuscar}%")
                            //->whereCi($request->txtBuscar)
       //                     ->orWhere('datosp', 'like', "%{$request->txtBuscar}%")
     //                       ->orderByDesc('id')->get();
       //return $personas;
          return \response()->json($personas,200);
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
    public function store(CreatePersonaRequest $request)
    {
        //

        $imput = $request->all();
        //return $imput;
     //   $imput['user_id'] = 1
        $persona = Persona::create($imput);
        return \response()->json(['res'=> true, 'message'=>'insertado correctamente'],200);
       // return \response()->json($persona,200);
   }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */

     //recoge un solo registro de la base de datos
    public function show($id)
    {
        // select * from Persona where id = $id
        $persona = Persona::find($id);
        //return $persona;
        return \response()->json($persona,200);

    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request,  $id)
    {
        // update Persona set nombre = $request ... where id =$id
       // $imput = $request->all();
        $persona = Persona::find($id);
        $persona->update($request->all());
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
        //Eliminar registro   delete from persona where id =$id
        try{
            Persona::destroy($id);
            return \response()->json(['res'=> true, 'message'=>'Eliminado Correctamente'],200);
        }
        catch(\Exception $e){
            return \response()->json(['res'=> false, 'message'=>$e->getMessage()],200);
        }
    }
    public function consultorci($id){
        return Persona::where('ci',$id)->get();
    }
    public function funcionarios(){
        try{
       // return Persona::get();
         $personas= Persona::where('status', '=','SERVIDOR PUBLICO')->get();
          return \response()->json($personas,200);
        }
        catch(\Exception $e){
         return \response()->json(['res'=> false, 'message'=>$e->getMessage()],200);
        }
     }
     public function visitantes(){
        try{
       // return Persona::get();
         $personas= Persona::where('status', '!=','SERVIDOR PUBLICO')->orderByDesc('id')->get();
          return \response()->json($personas,200);
        }
        catch(\Exception $e){
         return \response()->json(['res'=> false, 'message'=>$e->getMessage()],200);
        }

     }
     public function consultores(){
        try{
            $personas= Persona::with(['proyectos','proyectos.departamento','contratos','visitas','visitas.departamento','visitas.user'])->orderByDesc('id')->get();
           // $empresa= Empresa::with(['proyectos','proyectos.departamento','sociedads','contratos','contratos.proyecto','contratos.proyecto.departamento'])->orderByDesc('id')->get();

            return \response()->json($personas,200);
           }
           catch(\Exception $e){
            return \response()->json(['res'=> false, 'message'=>$e->getMessage()],200);
           }


    }
    public function todos(){
        try{
       // return Persona::get();
         $personas= Persona::all();
          return \response()->json($personas,200);
        }
        catch(\Exception $e){
         return \response()->json(['res'=> false, 'message'=>$e->getMessage()],200);
        }

     }
}
