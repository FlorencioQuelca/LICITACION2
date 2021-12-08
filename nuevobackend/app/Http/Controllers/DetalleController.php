<?php

namespace App\Http\Controllers;

use App\Models\Detalle;
use Illuminate\Http\Request;

class DetalleController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $detalle = Detalle::with(['proyecto'])->get();
        return \response()->json($detalle, 200);
    
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
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Detalle  $detalle
     * @return \Illuminate\Http\Response
     */
    public function show(Detalle $detalle)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Detalle  $detalle
     * @return \Illuminate\Http\Response
     */
    public function edit(Detalle $detalle)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Detalle  $detalle
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Detalle $detalle)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Detalle  $detalle
     * @return \Illuminate\Http\Response
     */
    public function destroy(Detalle $detalle)
    {
        //
    }
}
