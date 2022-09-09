<?php

namespace App\Http\Controllers;

use App\Models\Ficha;
use Illuminate\Http\Request;

class FichaController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return Ficha::all();
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {

    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {

        $ficha=new Ficha();
        $ficha->registro_id =$request->registro_id;
       // $ficha->nombre =$request->nombre;
        //$ficha->ubicacion =$request->ubicacion;
        //$ficha->zona =$request->zona;
        //$ficha->circunscripcion =$request->circunscripcion;
        //$ficha->distrito =$request->distrito;
        //$ficha->direccion =$request->direccion;
        //$ficha->coordenadas =$request->coordenadas;
      //  $ficha->latitud =$request->latitud;
       // $ficha->longitud =$request->longitud;
       // $ficha->observacion=$request->observacion;
       // $ficha->observacion4=$request->observacion4;
       // $ficha->observacion5a=$request->observacion5a;
       // $ficha->observacion5b=$request->observacion5b;
       // $ficha->observacion5c=$request->observacion5c;
       // $ficha->observacion5d=$request->observacion5d;
        //$ficha->observacion6=$request->observacion6;
        //$ficha->priorizado=$request->priorizado;
        //$ficha->planimetria=$request->planimetria;
        //$ficha->status=$request->status;
       // $ficha->inspeccionado=$request->inspeccionado;
       // $ficha->aprobado=$request->aprobado;
       // $ficha->foto1=$request->foto1;
      //  $ficha->foto2=$request->foto2;
       // $ficha->foto3=$request->foto3;
        //$ficha->foto4=$request->foto4;
       // $ficha->fecha=$request->fecha;
        //$ficha->dias=$request->dias;
       // $ficha->agua=$request->agua;
       // $ficha->alcantarillado=$request->alcantarillado;
       // $ficha->electricidad=$request->electricidad;
        //$ficha->gasnatural=$request->gasnatural;
        //$ficha->tierra=$request->tierra;
        //$ficha->empedrado=$request->empedrado;
        //$ficha->otro=$request->otro;
       // $ficha->ejecutado=$request->ejecutado;
        //$ficha->porejecutar=$request->porejecutar;
       // $ficha->longitudporejecutar=$request->longitudporejecutar;
        //$ficha->longitud=$request->longitud;
        //$ficha->ancho=$request->ancho;
        //$ficha->area=$request->area;


        $ficha->save();
        return \response()->json(['res'=> true, 'message'=>'insertado correctamente'],200);
      //  return Ficha::create($request->all());
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Ficha  $ficha
     * @return \Illuminate\Http\Response
     */
    public function show(Ficha $ficha)
    {
        return $ficha;
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Ficha  $ficha
     * @return \Illuminate\Http\Response
     */
    public function edit(Ficha $ficha)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Ficha  $ficha
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Ficha $ficha)
    {
        $ficha->update($request->all());
        return \response()->json(['res'=> true, 'message'=>'Modificado correctamente'],200);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Ficha  $ficha
     * @return \Illuminate\Http\Response
     */
    public function destroy(Ficha $ficha)
    {
        return  $ficha->delete();
    }

     //oficial
     public function uploadPhoto(Request $request){

        if ($request->hasFile('photo')){
            $file=$request->file('photo');
            //$size=$file->getSize();  //tamaño en bytes // hay que convertir
            $url=$request->departamento."_".$request->codigo."_".$request->nombre."_".time().'.'.$file->getClientOriginalExtension();
            $file->move(\public_path('fichasdeinspeccion'),$url);
            $ficha = Ficha::find($request->ficha_id);
              if($request->nombre==="foto1"){
                  $ficha->foto1=$url;
              }else if($request->nombre==="foto2"){
                  $ficha->foto2=$url;
              }else{
                  $ficha->foto3=$url;
              }
            $ficha->save();
            return $ficha;
        }else{
            return "no existe el Photo";
        }
    }
    public function base64ficha(Request $request){
        if ($request->imagen1!='') {
             if($request->imagen2!=''){
                 if( $request->imagen3!=''){
                    $path1 = 'fichasdeinspeccion/'.$request->imagen1;
                    $path2 = 'fichasdeinspeccion/'.$request->imagen2;
                    $path3 = 'fichasdeinspeccion/'.$request->imagen3;
                    $type1 = pathinfo($path1, PATHINFO_EXTENSION);
                    $type2 = pathinfo($path1, PATHINFO_EXTENSION);
                    $type3 = pathinfo($path1, PATHINFO_EXTENSION);
                    $data1 = file_get_contents($path1);
                    $data2 = file_get_contents($path2);
                    $data3 = file_get_contents($path3);
                    $base64a = 'data:image/' . $type1 . ';base64,' . base64_encode($data1);
                    $base64b = 'data:image/' . $type2 . ';base64,' . base64_encode($data2);
                    $base64c = 'data:image/' . $type3 . ';base64,' . base64_encode($data3);
                    return [$base64a,$base64b,$base64c];
                 }else{
                    $path1 = 'fichasdeinspeccion/'.$request->imagen1;
                    $path2 = 'fichasdeinspeccion/'.$request->imagen2;
                    $type1 = pathinfo($path1, PATHINFO_EXTENSION);
                    $type2 = pathinfo($path1, PATHINFO_EXTENSION);
                    $data1 = file_get_contents($path1);
                    $data2 = file_get_contents($path2);
                    $base64a = 'data:image/' . $type1 . ';base64,' . base64_encode($data1);
                    $base64b = 'data:image/' . $type2 . ';base64,' . base64_encode($data2);
                    return [$base64a,$base64b,null];

                 }
             }else if($request->imagen3!=''){
                    $path1 = 'fichasdeinspeccion/'.$request->imagen1;
                    $path3 = 'fichasdeinspeccion/'.$request->imagen2;
                    $type1 = pathinfo($path1, PATHINFO_EXTENSION);
                    $type3 = pathinfo($path1, PATHINFO_EXTENSION);
                    $data1 = file_get_contents($path1);
                    $data3 = file_get_contents($path3);
                    $base64a = 'data:image/' . $type1 . ';base64,' . base64_encode($data1);
                    $base64c = 'data:image/' . $type3 . ';base64,' . base64_encode($data3);
                    return [$base64a,null, $base64c];
                }else{
                    $path1 = 'fichasdeinspeccion/'.$request->imagen1;
                    $type1 = pathinfo($path1, PATHINFO_EXTENSION);
                    $data1 = file_get_contents($path1);
                    $base64a = 'data:image/' . $type1 . ';base64,' . base64_encode($data1);
                    return [$base64a,null,null];
                }
        }else if($request->imagen2!=''){
                if($request->imagen3!=''){
                    $path2 = 'fichasdeinspeccion/'.$request->imagen2;
                    $path3 = 'fichasdeinspeccion/'.$request->imagen3;
                    $type2 = pathinfo($path2, PATHINFO_EXTENSION);
                    $type3 = pathinfo($path3, PATHINFO_EXTENSION);
                    $data2 = file_get_contents($path2);
                    $data3 = file_get_contents($path3);
                    $base64b = 'data:image/' . $type2 . ';base64,' . base64_encode($data2);
                    $base64c = 'data:image/' . $type3 . ';base64,' . base64_encode($data3);
                    return [null,$base64b,$base64c];

                    }else{
                        return [null,null,null];
                    }
        }else if($request->imagen3!=''){
                $path3 = 'fichasdeinspeccion/'.$request->imagen3;
                $type3 = pathinfo($path3, PATHINFO_EXTENSION);
                $data3 = file_get_contents($path3);
                $base64c = 'data:image/' . $type3 . ';base64,' . base64_encode($data3);
                return [null,null,$base64c];

                }else{
                    return [null,null,null];
                }



    }
}
