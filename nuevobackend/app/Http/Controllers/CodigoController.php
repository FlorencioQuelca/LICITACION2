<?php

namespace App\Http\Controllers;

use App\Models\Codigo;
use Illuminate\Http\Request;

class CodigoController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return Codigo::all();
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
        return Codigo::create($request->all());
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Codigo  $codigo
     * @return \Illuminate\Http\Response
     */
    public function show(Codigo $codigo)
    {
        return $codigo;
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Codigo  $codigo
     * @return \Illuminate\Http\Response
     */
    public function edit(Codigo $codigo)
    {
        
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Codigo  $codigo
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Codigo $codigo)
    {
        $codigo->update($request->all());
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Codigo  $codigo
     * @return \Illuminate\Http\Response
     */
    public function destroy(Codigo $codigo)
    {
        $codigo->deete();
    }
    public function codigofound($id){
        return Codigo::where('nombre',$id)->get();
    }
}
