<?php

namespace App\Http\Controllers;

use App\Models\Solicitud;
use Illuminate\Http\Request;

class SolicitudController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $solicituds = Solicitud::with(['taller','car'])->orderByDesc('id')->get();
        return \response()->json($solicituds, 200);

    }
    public function solicitudid(Solicitud $solicitud)
    {
        $solicitud = Solicitud::with(['taller','car','trabajos']) ->orWhere('id', '=', $solicitud->id)->get();
        return \response()->json($solicitud, 200);

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
      //  $imput = $request->all();
       // Solicitud::create($imput);
        $solicitud=new Solicitud();
        $solicitud->seguimiento=strtoupper($request->nombre);
        $solicitud->car_id=$request->car_id;
        $solicitud->taller_id=$request->taller_id;
        $solicitud->fechaini=date('Y-m-d');
        $solicitud->fechafin=date('Y-m-d');
        $solicitud->save();
        return \response()->json(['res'=> true, 'message'=>'insertado correctamente'],200);
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Solicitud  $solicitud
     * @return \Illuminate\Http\Response
     */
    public function show(Solicitud $solicitud)
    {
        return $solicitud;
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Solicitud  $solicitud
     * @return \Illuminate\Http\Response
     */
    public function edit(Solicitud $solicitud)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Solicitud  $solicitud
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {

       // return $solicitud->update($request->all);
        $imput = $request->all();
        $solicitud= Solicitud::find($id);
        $solicitud->update($imput);
        return \response()->json(['res'=> true, 'message'=>'modificado  correctamente'],200);

    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Solicitud  $solicitud
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
       //$solicitud->delete();
         Solicitud::destroy($id);
       return response()->json(['res'=>'Borrado exitoso'],200);
    }
}
