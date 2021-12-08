<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Empresa extends Model
{
    use HasFactory;
    protected $table ='empresas';

    protected $fillable = [
        "nombreEmpresa",
        "nit",
        "nombreLegal",
        "direccion",
        "fono1",
        "fono2",
        "email",
        "departamento",
        "observacion",
    ];
    // ocultar
    protected $hidden =['created_at','updated_at'];

    //relacion uno a muchos
    public function empresas(){
        return $this->hasMany(Empresa::class);
    }
   //relacion uno a muchos polimorfica
   public function detalles(){
       return $this->morphMany('App\Models\Detalle','detalletable');
   }
   

}
