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
    //public function asociados(){
     //   return $this->hasMany(Asociado::class)->with('sociedad');
    //}
   // public function empresas(){
  //      return $this->hasMany(Empresa::class);
    //}
    public function sociedads(){
        return $this->belongsToMany(Sociedad::class);
     }
   //relacion muchos a muchos polimorfica
    public function proyectos(){
        return $this->morphToMany('App\Models\Proyecto','detalle');
    }
    public function contratos(){
        return $this->morphToMany('App\Models\Contrato','detalle1');
    }
   

}
