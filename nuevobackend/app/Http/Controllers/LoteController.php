<?php

namespace App\Http\Controllers;

use App\Models\Lote;
use App\Models\Persona;
use App\Models\Empresa;
use App\Models\Sociedad;
use Illuminate\Http\Request;

class LoteController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return Lote::all();
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
        $lote=new Lote();
        $lote->nro=$request->nro;
        $lote->nombre=$request->nombre;
        $lote->monto=$request->monto;
        $lote->proyecto_id=$request->proyecto_id;
        $lote->save();
       // Lote::create($request->all());
        return \response()->json(['res'=> true, 'message'=>'Creado correctamente'],200);
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Lote  $lote
     * @return \Illuminate\Http\Response
     */
    public function show(Lote $lote)
    {
        return $lote;
        return \response()->json($lote,200);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Lote  $lote
     * @return \Illuminate\Http\Response
     */
    public function edit(Lote $lote)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Lote  $lote
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Lote $lote)
    {
        $lote->update($request->all());
        return \response()->json(['res'=> true, 'message'=>'modificado  correctamente'],200);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Lote  $lote
     * @return \Illuminate\Http\Response
     */
    public function destroy(Lote $lote)
    {
        try{
            $lote->delete();
          //  ProyectoPersona::destroy($id);
            return \response()->json(['res'=> true, 'message'=>'Eliminado Correctamente'],200);
        }
        catch(\Exception $e){
            return \response()->json(['res'=> false, 'message'=>$e->getMessage()],200);
        }
    }
    public function personalote(Request $request,Lote $lote){
         $persona= Persona::find($request->id);
       //  $lote= Lote::find($id);
         $lote->personas()->attach($persona,['monto'=>0]);
     }
     public function personalotesdetach(Request $request,Lote $lote){
        $persona= Persona::find($request->id);
        $lote->personas()->detach($persona->id);
     }

     public function empresalotes(Request $request,Lote $lote){
        $empresa= Empresa::find($request->id);
        $lote->empresas()->attach($empresa,['monto'=>$request->monto]);

     }
     public function empresalotesdetach(Request $request,Lote $lote){
        $empresa= Empresa::find($request->id);
        $lote->empresas()->detach($empresa->id);
     }

     public function sociedadlotes(Request $request,Lote $lote){
        $sociedad= Sociedad::find($request->id);
        $lote->sociedads()->attach($sociedad,['monto'=>$request->monto]);
     }
     public function sociedadlotesdetach(Request $request,Lote $lote){
        $sociedad= Sociedad::find($request->id);
        $lote->sociedads()->detach($sociedad->id);
     }

}
