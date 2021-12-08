<?php

namespace App\Http\Controllers;

use App\Models\Empresa;
use Illuminate\Http\Request;
use App\Http\Requests\CreateEmpresaRequest;
use App\Http\Requests\UpdateEmpresaRequest;

class EmpresaController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        try{
            $empresa = Empresa::where('nit','like',"%{$request->txtBuscar}%")
           //return $personas;//->whereCi($request->txtBuscar)
                            ->orWhere('nombreEmpresa', 'like', "%{$request->txtBuscar}%")
                            ->get();
              return \response()->json($empresa,200);
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
    public function store(CreateEmpresaRequest $request)
    {
        $imput = $request->all();
        $empresa = Empresa::create($imput);
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
         $empresa = Empresa::findOrFail($id);
         return \response()->json($empresa,200);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(UpdateEmpresaRequest $request, $id)
    {
        $imput = $request->all();
        $empresa = Empresa::find($id);
        $empresa ->update($imput);
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
            Empresa::destroy($id);
            return \response()->json(['res'=> true, 'message'=>'Eliminado Correctamente'],200);
        }
        catch(\Exception $e){
            return \response()->json(['res'=> false, 'message'=>$e->getMessage()],200);
        }
    }
}
