<?php

namespace App\Http\Controllers;
use App\Models\Trabajo;
use App\Models\Archivo;

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
    public function show(Trabajo $trabajo)
    {
       return $trabajo;
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
    public function update(Request $request, $id)
    {
        $imput = $request->all();
        $trabajo = Trabajo::find($id);
        $trabajo->update($imput);

     //   $trabajo->update($request->all());

        return \response()->json(['res'=> true, 'message'=>'modificado  correctamente'],200);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Trabajos  $trabajos
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //$solicitud->delete();
        Trabajo::destroy($id);
        return response()->json(['res'=>'eliminacion exitosa'],200);

    }
     //oficial
     public function uploadPhotos(Request $request){
        if ($request->hasFile('photo')){

                $file=$request->file('photo');
                $size=$file->getSize();  //tamaño en bytes // hay que convertir
                $url=$request->nombre.'_'.time().'.'.$file->getClientOriginalExtension();
                $file->move(\public_path('imagenes'),$url);

                $archivo=new Archivo;//
                $archivo->url=$url;
                $archivo->categoria_id=$request->categoria_id;
                $archivo->user_id=$request->user_id;
                $archivo->nombre=$request->nombre;
                $archivo->tamanio=$size;
                $archivo->tipo=$file->getClientOriginalExtension();

                $trabajo = Trabajo::find($request->trabajo_id);
                $trabajo->archivos()->save($archivo);
                return \response()->json(['res' => true, 'message'=>'imagen subida correctamente'], 200);

     }else{
                 return \response()->json(['res' => false, 'message'=>'error al cargar'], 200);
        }
    }
}
