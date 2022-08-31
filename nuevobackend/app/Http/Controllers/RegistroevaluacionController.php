<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Registroevaluacion;


class RegistroevaluacionController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return Registroevaluacion::all();
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        Registroevaluacion::create($request->all());
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show(Registroevaluacion $registroevaluacion)
    {
        return $registroevaluacion;
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        // return true;


       $registroevaluacion = Registroevaluacion::find($id);

       $registroevaluacion->update($request->all());

       return \response()->json(['res'=> true, 'message'=>'modificado  correctamente'],200);

    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy(Registroevaluacion $registroevaluacion)
    {
        $registroevaluacion->delete();
    }
}
