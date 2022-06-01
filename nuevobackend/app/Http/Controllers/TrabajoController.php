<?php

namespace App\Http\Controllers;

use App\Models\Trabajo;
use Illuminate\Http\Request;

class TrabajoController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return Trabajo::with(['archivos','solicitud'])->orderByDesc('id')->get();
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
        $trabajo=Trabajo::create($request->all());
        return \response()->json(['res'=> true, 'message'=>'creado correctamente'],200);
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Trabajos  $trabajos
     * @return \Illuminate\Http\Response
     */
    public function show(Trabajo $trabajos)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Trabajos  $trabajos
     * @return \Illuminate\Http\Response
     */
    public function edit(Trabajo $trabajos)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Trabajos  $trabajos
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Trabajo $trabajos)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Trabajos  $trabajos
     * @return \Illuminate\Http\Response
     */
    public function destroy(Trabajo $trabajos)
    {
        //
    }
}
