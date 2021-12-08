<?php

namespace App\Http\Controllers;

use App\Models\DescripcionSociedadAccidental;


use Illuminate\Http\Request;

class DescripcionSociedadAccidentalController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
      $descripcion = DescripcionSociedadAccidental::with(['sociedadAccidental:fono1,id,nombre','empresa:id,nombreEmpresa,email,nit'])->get();
     // $descripcion = DescripcionSociedadAccidental::all();
      return $descripcion;

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
        $imput = $request->all();
        //return $imput;
        $imput['empresa_id'] = auth()->empresa()->id;
      //  $imput['Socieda_id'] = auth()->empresa()->id;
        $persona = DescripcionSociedadAccidental::create($imput);
        return \response()->json(['res'=> true, 'message'=>'insertado correctamente'],200);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
      $descripcions = DescripcionSociedadAccidental::with(['sociedadAccidental:fono1,id,nombre','empresa:id,nombreEmpresa,email,nit'])->find($id);
      return $descripcions;

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
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
