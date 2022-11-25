<?php

namespace App\Http\Controllers;

use App\Models\Adjudicado;
use Illuminate\Http\Request;
use App\Models\Persona;
use App\Models\Empresa;
use App\Models\Sociedad;

class AdjudicadoController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return Adjudicado::with(['proyecto','proyecto.codigos','proyecto.empresas', 'proyecto.sociedads','proyecto.sociedads.empresas','proyecto.personas','empresas','personas','sociedads','sociedads.empresas','archivos','dependientes'])->orderByDesc('id')->get();
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $adjudicado=Adjudicado::create($request->all());
        return \response()->json(['res'=> true, 'message'=>'insertado correctamente'],200);
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Adjudicado  $adjudicado
     * @return \Illuminate\Http\Response
     */
    public function show(Adjudicado $adjudicado)
    {
        return $adjudicado;
        return \response()->json($adjudicado,200);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Adjudicado  $adjudicado
     * @return \Illuminate\Http\Response
     */
    public function edit(Adjudicado $adjudicado)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Adjudicado  $adjudicado
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Adjudicado $adjudicado)
    {
        $adjudicado->update($request->all());
        return \response()->json(['res'=> true, 'message'=>'modificado  correctamente'],200);

    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Adjudicado  $adjudicado
     * @return \Illuminate\Http\Response
     */
    public function destroy(Adjudicado $adjudicado)
    {
        $adjudicado->delete();
        return response()->json(['res'=>'Borrado exitoso'],200);
    }

// caso especial
            public function personaadjudicados(Request $request,Adjudicado $adjudicado){
                $persona= Persona::find($request->id);
                $adjudicado->personas()->attach($persona,['oficial'=>$request->monto]);
            }
            public function personaadjudicadosdetach(Request $request,Adjudicado $adjudicado){
                $persona= Persona::find($request->id);
                $adjudicado->personas()->detach($persona->id);
            }
            public function empresaadjudicados(Request $request,Adjudicado $adjudicado){
                $empresa= Empresa::find($request->id);
                $adjudicado->empresas()->attach($empresa,['oficial'=>$request->monto]);

            }
            public function empresaadjudicadosdetach(Request $request,Adjudicado $adjudicado){
                $empresa= Empresa::find($request->id);
                $adjudicado->empresas()->detach($empresa->id);
            }

            public function sociedadadjudicados(Request $request,Adjudicado $adjudicado){
                $sociedad= Sociedad::find($request->id);
                $adjudicado->sociedads()->attach($sociedad,['oficial'=>$request->monto]);
            }
            public function sociedadadjudicadosdetach(Request $request,Adjudicado $adjudicado){
                $sociedad= Sociedad::find($request->id);
                $adjudicado->sociedads()->detach($sociedad->id);
            }
}
