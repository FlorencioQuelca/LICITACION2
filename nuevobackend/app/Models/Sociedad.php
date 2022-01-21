<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Sociedad extends Model
{
    use HasFactory;
    protected $table ='sociedads';
    protected $fillable = [
        "codigo",
        "nombreEmpresa",
        "nombreLegal",
        "direccion",
        "fono1",
        "fono2",
        "email",
        "observacion",
        "departamento",
    ];
    
    protected $hidden =['created_at','updated_at'];
    //relaciones de uno a muchos
    //public function asociados(){
      //  return $this->hasMany(Asociado::class)->with('empresa');
    //}
     public function empresas(){
       return $this->belongsToMany(Empresa::class)->withPivot(['participacion']);
    }
   
    //relacion uno a muchos polimorfica
    //relacion muchos a muchos polimorfica
    public function proyectos(){
        return $this->morphToMany('App\Models\Proyecto','detalle');
    }

   
}
