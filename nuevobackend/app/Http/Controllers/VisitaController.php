<?php

namespace App\Http\Controllers;

use App\Models\Visita;
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
        return Visita::all();
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
        ///  $imput = $request->all();
       // Solicitud::create($imput);
        $visita=new Visita();
        $visita->num=$request->num;
        $visita->fecha=date('Y-m-d');
        $visita->horain=time();
        $visita->horaout=time();
        $visita->motivo=$request->motivo;
        $visita->empresa=$request->empresa;
        $visita->mochila=$request->mochila;
        $visita->user_id=$request->user_id;
        $visita->departamento_id=$request->departamento_id;
        $visita->save();
        return \response()->json(['res'=> true, 'message'=>'insertado correctamente'],200);
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Visita  $visita
     * @return \Illuminate\Http\Response
     */
    public function show(Visita $visita)
    {
        return $visita;
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
    public function update(Request $request, Visita $id)
    {
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
    public function destroy(Visita $id)
    {

        Visita::destroy($id);
       return response()->json(['res'=>'Borrado Exitoso'],200);
    }
}
