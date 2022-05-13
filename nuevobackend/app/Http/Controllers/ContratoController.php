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
        return Contrato::with(['proyecto','empresas','personas','sociedads','archivos','firmas'])->get();
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

       // $contrato=new Contrato();
      //  $contrato->nombre=strtoupper($request->nombre);
       // $contrato->fecha=date('Y-m-d');
       // $contrato->hora=date('H:i:s');
      //  $contrato->save();
      $contrato=Contrato::create($request->all());
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
         $contrato->nombre=strtoupper($request->nombre);
        $contrato->categoria_id=$request->categoria_id;
        $contrato->user_id=$request->user_id;
        $contrato->fecha=date('Y-m-d');
        $contrato->hora=date('H:i:s');
        $contrato->save();
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
        $contrato->url = $this->cargarPdf($request->file, $id);
        $contrato->save();

        return \response()->json(['res' => true, 'message'=>'archivo cargado corretamente'], 200);

      /*   $contrato = Contrato::findOrFail($id);

            $file=$request->file;

            $nombre = "pdf_".time().".".$file->guessExtension();

            $ruta = public_path("pdf/".$nombre);
            $contrato->url = $ruta;
            $contrato->nombre = $nombre;
            $contrato->save();
            if($file->guessExtension()=="pdf"){
                copy($file, $ruta);
            }else{
                return response()->json(['res'=>'NO ES PDF'],200);
            }
     // } */
    }

    private function cargarPdf($file, $id)
    {
        // nombeArchivo = 7897877987_55.png

        $nombreArchivo = "pdf_".time() . "_{$id}.".$file->getClientOriginalExtension();
      //  $ruta = public_path("archivos/".$nombreArchivo);
       // if($file->guessExtension()=="pdf"){
    //    copy($file, $ruta);
       // }
        $file->move(\public_path('archivos'), $nombreArchivo);
        return $nombreArchivo;
    }
    public function getPdf1($id)
    {
        $contrato = Contrato::find($id);
       /*  $file = Storage::disk('public')->get($contrato->url);
        return (new Response($file, 200))
              ->header('Content-Type', 'file/pdf'); */
              $file = \public_path('archivos\\'.$contrato->url);
              $headers =  [
                'Content-Type' => 'application/pdf',
                'responseType'=> 'arraybuffer'
            ];
      return response()->download($file,$contrato->url,$headers);
     // return response()->download(public_path('archivos/'.$contrato->url));
      //return Contrato::findOrFail($contrato->id);
     // window.open(`http://mysite.test/api/getdload/${id}`);
      /*
      $pdf = \PDF::loadView('imprimir');
      return $pdf->download('imprimir.pdf'); */
    }
    public function getPdf($id)
    {
        $contrato = Contrato::find($id);
        $file= public_path().'/archivos/'.$contrato->url;

        $headers = [
              'Content-Type' => 'application/pdf',
              'responseType'=> 'blob'
           ];

    return response()->download($file, $contrato->url, $headers);
    }
}
