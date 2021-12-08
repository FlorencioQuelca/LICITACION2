<?php

namespace App\Http\Controllers;

use App\Models\Asociado;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
class AsociadoController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
     //   return Asociado::all();
     $asociados = Asociado::with(['empresa','sociedad'])->get();
                              //  ->whereId($request->txtBuscar)
                                //->orWhere('nombre', 'like', "%{$request->txtBuscar}%")
                                //->get();

        return \response()->json($asociados, 200);
    }
   public function  detalle(){

    $asociado=DB::select('(select * from asociados
      )
    ');
   

     return \response()->json($asociado, 200);
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
        Asociado::create($request->all());
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Asociado  $asociado
     * @return \Illuminate\Http\Response
     */
    public function show(Asociado $asociado)
    {
        return $asociado;
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Asociado  $asociado
     * @return \Illuminate\Http\Response
     */
    public function edit(Asociado $asociado)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Asociado  $asociado
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Asociado $asociado)
    {
     $asociado->update($request->all());
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Asociado  $asociado
     * @return \Illuminate\Http\Response
     */
    public function destroy(Asociado $asociado)
    {
        $asociado->delete();
    }
}
