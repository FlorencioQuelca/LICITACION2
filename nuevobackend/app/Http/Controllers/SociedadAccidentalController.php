<?php

namespace App\Http\Controllers;
use Illuminate\Http\Request;

use App\Models\SociedadAccidental;

use App\Http\Requests\CreateSociedadAccidentalRequest;
use App\Http\Requests\UpdateSociedadAccidentalRequest;


class SociedadAccidentalController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        try{
         
            $sociedadAccidentals = SociedadAccidental::where('nombre','like',"%{$request->txtBuscar}%")
                                                    ->orWhere('codigo', 'like', "%{$request->txtBuscar}%")
                                                    ->get();
           //return $personas;
              return \response()->json($sociedadAccidentals,200);
           }
           catch(\Exception $e){
            return \response()->json(['res'=> false, 'message'=>$e->getMessage()],200);
           }
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(CreateSociedadAccidentalRequest $request)
    {
        $imput = $request->all();
        $sociedadAccidental = SociedadAccidental::create($imput);
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
        $sociedadAccidental = SociedadAccidental::findOrFail($id);
        return \response()->json($sociedadAccidental,200);
        
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(UpdateSociedadAccidentalRequest $request, $id)
    {
        $imput = $request->all();
        $sociedadaccidental = SociedadAccidental::find($id);
        $sociedadaccidental->update($imput);
        return \response()->json(['res'=> true, 'message'=>'modificado  correctamente'],200);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        try{
            SociedadAccidental::destroy($id);
            return \response()->json(['res'=> true, 'message'=>'eliminado Correctamente'],200);
        }
        catch(\Exception $e){
            return \response()->json(['res'=> false, 'message'=>$e->getMessage()],200);
        }
    }
}
