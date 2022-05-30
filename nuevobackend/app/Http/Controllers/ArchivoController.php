<?php

namespace App\Http\Controllers;

use App\Models\Archivo;
use Illuminate\Http\Request;

class ArchivoController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
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
        // realizar aqui
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Archivo  $archivo
     * @return \Illuminate\Http\Response
     */
    public function show(Archivo $archivo)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Archivo  $archivo
     * @return \Illuminate\Http\Response
     */
    public function edit(Archivo $archivo)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Archivo  $archivo
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Archivo $archivo)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Archivo  $archivo
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {

        try{
         //  $empresa = Empresa::findOrFail($id);
             $archivo=Archivo::findOrFail($id);
            //$archivo->delete();
            Archivo::destroy($archivo->id);
            return \response()->json(['res'=> true, 'message'=>'Eliminado Correctamente'],200);
        }
        catch(\Exception $e){
            return \response()->json(['res'=> false, 'message'=>$e->getMessage()],200);
        }
    }

    public function getContrato($id)
    {
        /**

        * $contrato = Archivo::findOrFail($id);
       * $file= public_path().'/contratos/'.$contrato->url;
        *        $file= public_path().'/contratos/'.$contrato->url;
         *   $headers = [
          *     // 'Content-Type' => 'application/pdf',
          *       'Content-Type'=> 'application/x-www-form-urlencoded',
         *       //'responseType'=> 'blob'
         *       'Accept'=> 'application/json'
          *  ];
        *    return response()->download($file, $contrato->url, $headers);


        */
        $contrato = Archivo::findOrFail($id);
        if ($contrato->url==''){
            return '';
        }
        $path = 'contratos/'.$contrato->url;
        $type = pathinfo($path, PATHINFO_EXTENSION);
        $data = file_get_contents($path);
        $base64 = 'data:application/' . $type . ';base64,' . base64_encode($data);
        return $base64;

    }

}
