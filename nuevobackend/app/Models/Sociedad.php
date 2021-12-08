<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Sociedad extends Model
{
    use HasFactory;
    protected $table ='sociedads';
    protected $fillable = [
        "nombre",
        "nombreLegal",
        "direccion",
        "fono1",
        "fono2",
        "email",
        "observacion",
        "departamento",
        "codigo",
        
    ];
    
    protected $hidden =['created_at','updated_at'];
    //relaciones de uno a muchos
    public function asociados(){
        return $this->hasMany(Asociado::class)->with('empresa');
    }
    //relacion uno a muchos polimorfica
   public function detalles(){
    return $this->morphMany('App\Models\Detalle','detalletable');
}

   
}
