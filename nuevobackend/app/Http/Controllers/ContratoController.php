<?php

namespace App\Http\Controllers;

use App\Models\Contrato;
use App\Models\Archivo;
use App\Models\Persona;
use App\Models\Empresa;
use App\Models\Sociedad;


use Illuminate\Http\Request;



class ContratoController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(){
        return Contrato::with(['proyecto','proyecto.codigos','proyecto.empresas', 'proyecto.sociedads','proyecto.sociedads.empresas','proyecto.personas','empresas','personas','sociedads','sociedads.empresas','archivos','dependientes'])->orderByDesc('id')->get();
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
      return \response()->json(['res'=> true, 'message'=>'insertado correctamente'],200);
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
        return \response()->json($contrato,200);
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
       //  $contrato->nombre=strtoupper($request->nombre);
      //  $contrato->categoria_id=$request->categoria_id;
       // $contrato->user_id=$request->user_id;
       // $contrato->fecha=date('Y-m-d');
       // $contrato->hora=date('H:i:s');
       // $contrato->save();
        //return $contrato;
        $contrato->update($request->all());
        return \response()->json(['res'=> true, 'message'=>'modificado  correctamente'],200);

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


    //oficial
    public function upload(Request $request){
        if ($request->hasFile('archivo')){
            $file=$request->file('archivo');
            $size=$file->getSize();  //tamaño en bytes // hay que convertir
            $url=time().'.'.$file->getClientOriginalExtension();
            $file->move(\public_path('contratos'),$url);

            $archivo=new Archivo;// Persona()::find($request->persona_id);
            $archivo->url=$url;
            $archivo->categoria_id=$request->categoria_id;
            $archivo->user_id=$request->user_id;
           // $archivo->contrato_id=$request->contrato_id;
            $archivo->nombre=$request->nombre;
           // $archivo->archivotable_type='App\Models\Contrato';
           /// $archivo->archivotable_id=$request->contrato_id;
            $archivo->tamanio=$size;
            $archivo->tipo=$file->getClientOriginalExtension();
            $contrato = Contrato::find($request->contrato_id);
            $contrato->archivos()->save($archivo);
            //$archivo->save();
            return $archivo;
        }else{
            return "no existe el archivo";
        }
    }
    public function base64(Request $request){
        if ($request->imagen==''){
            return '';
        }
        $path = 'imagenes/'.$request->imagen;
        $type = pathinfo($path, PATHINFO_EXTENSION);
        $data = file_get_contents($path);
        $base64 = 'data:image/' . $type . ';base64,' . base64_encode($data);
        return $base64;

    }

    public function personacontratos(Request $request,Contrato $contrato){
        $persona= Persona::find($request->id);
        $contrato->personas()->attach($persona,['oficial'=>$request->monto]);
     }
     public function personacontratosdetach(Request $request,Contrato $contrato){
        $persona= Persona::find($request->id);
        $contrato->personas()->detach($persona->id);
     }
            public function empresacontratos(Request $request,Contrato $contrato){
                $empresa= Empresa::find($request->id);
                $contrato->empresas()->attach($empresa,['oficial'=>$request->monto]);

            }
            public function empresacontratosdetach(Request $request,Contrato $contrato){
                $empresa= Empresa::find($request->id);
                $contrato->empresas()->detach($empresa->id);
            }

            public function sociedadcontratos(Request $request,Contrato $contrato){
                $sociedad= Sociedad::find($request->id);
                $contrato->sociedads()->attach($sociedad,['oficial'=>$request->monto]);
            }
            public function sociedadcontratosdetach(Request $request,Contrato $contrato){
                $sociedad= Sociedad::find($request->id);
                $contrato->sociedads()->detach($sociedad->id);
            }
// caso especial
        public function dependientecontratos(Request $request,Contrato $contrato){
            $persona = Persona::find($request->id);
            $contrato->dependientes()->attach($persona, ['categoria'=>$request->categoria]);
         }
         public function dependientecontratosdetach(Request $request,Contrato $contrato){
            $persona = Persona::find($request->id);
            $contrato->dependientes()->detach($persona->id);
         }

}
