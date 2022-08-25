<?php

namespace App\Http\Controllers;

use App\Models\Municipio;
use Illuminate\Http\Request;

class MunicipioController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return Municipio::all();
    }
    public function municipioid($id){
        return Municipio::where('departamento_id',$id)->get();
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
     * @param  \App\Models\Municipios  $municipios
     * @return \Illuminate\Http\Response
     */
    public function show(Municipios $municipios)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Municipios  $municipios
     * @return \Illuminate\Http\Response
     */
    public function edit(Municipios $municipios)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Municipios  $municipios
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Municipios $municipios)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Municipios  $municipios
     * @return \Illuminate\Http\Response
     */
    public function destroy(Municipios $municipios)
    {
        //
    }
}
