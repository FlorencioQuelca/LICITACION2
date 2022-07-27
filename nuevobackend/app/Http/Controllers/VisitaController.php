<?php

namespace App\Http\Controllers;

use App\Models\Visita;
use App\Models\Persona;
use Illuminate\Http\Request;

class VisitaController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        // return Visita::all();
         return Visita::with(['personas'])->whereDate('fecha',now())->orderByDesc('id')->get();
        //   return $visitas= Visita::whereDate('fecha',now())->get();

    }
    public function visitafecha($id){
        return Visita::with(['personas','user'])->whereDate('fecha',$id)->get();
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
        //$imput = $request->all();
       // Visita::create($imput);
        $visita=new Visita();
        $visita->num=$request->num;
        $visita->fecha=date('Y-m-d');
        $visita->horain=date('H:i:s');
      //  $visita->horaout=date('H:i:s');
        $visita->motivo=$request->motivo;
        $visita->empresa=$request->empresa;
        $visita->mochila=$request->mochila;
        $visita->user_id=$request->user_id;
        $visita->departamento_id=$request->departamento_id;
        $visita->save();
        return \response()->json(['res'=> true, 'message'=>'insertado correctamente'],200);
    }
    public function registrarSalida(Visita $visita){
       // $visita = Visita::find($id);
        $visita->update([
            'horaout'=>date('H:i:s')
        ]);
      return \response()->json(['res'=> true, 'message'=>'modificado  correctamente'],200);

    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Visita  $visita
     * @return \Illuminate\Http\Response
     */
    public function show(Visita $visita)
    {
        return $visita::with(['personas'])->get();

        //return Visita::with(['personas'])->whereDate('fecha',now())->orderByDesc('id')->get();
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Visita  $visita
     * @return \Illuminate\Http\Response
     */
    public function edit(Visita $visita)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Visita  $visita
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request,  $id){
        $imput = $request->all();
        $solicitud= Visita::find($id);
        $solicitud->update($imput);
        return \response()->json(['res'=> true, 'message'=>'modificado  correctamente'],200);

    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Visita  $visita
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
     //   $id=Visita::find($id)
        Visita::destroy($id);
       return response()->json(['res'=>'Borrado Exitoso'],200);
    }

    public function personavisitas(Request $request,Visita $visita){
        $persona= Persona::find($request->id);
        $visita->personas()->attach($persona,['tipo'=>$request->tipo]);
        return \response()->json(['res'=> true, 'message'=>'adicionado correctamente'],200);
     }
     public function personavisitadetach(Request $request,Visita $visita){
        $persona= Persona::find($request->id);
        $visita->personas()->detach($persona->id);

     }

}
