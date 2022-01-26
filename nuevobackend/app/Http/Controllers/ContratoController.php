<?php

namespace App\Http\Controllers;

use App\Models\Contrato;
use Illuminate\Http\Request;

class ContratoController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return Contrato::with(['categoria','user'])->get();
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
        $input=$request->all();
        //        $input['imagen']=$ruta;
        $contrato=Contrato::create($input);
        return $contrato;
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Contrato  $contrato
     * @return \Illuminate\Http\Response
     */
    public function show(Contrato $contrato)
    {
        return $contrato;
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Contrato  $contrato
     * @return \Illuminate\Http\Response
     */
    public function edit(Contrato $contrato)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Contrato  $contrato
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Contrato $contrato)
    {
        $contrato->update($request->all());
        return $contrato;
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Contrato  $contrato
     * @return \Illuminate\Http\Response
     */
    public function destroy(Contrato $contrato)
    {
         $contrato->delete();
        return response()->json(['res'=>'Borrado exitoso'],200);
    }
    public function setPdf(Request $request, $id)
    {
        $contrato = Contrato::findOrFail($id);
        $contrato->url = $this->cargarPdf($request->imagen, $id);
        $contrato->save();

        return \response()->json(['res' => true, 'message'=>'archivo cargado corretamente'], 200);
    }

    private function cargarPdf($file, $id)
    {
        // nombeArchivo = 7897877987_55.png
        $nombreArchivo = time() . "_{$id}." . $file->getClientOriginalExtension();
        $file->move(\public_path('archivos'), $nombreArchivo);
        return $nombreArchivo;
    }
}
