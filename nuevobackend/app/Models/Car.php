<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Car extends Model
{
    use HasFactory;
    protected $table ="cars";
    protected $fillable = [
        "codigo", 
        "descripcion",
        "fechaingreso",
        "tipo",
        "estado",
        "marca",
        "modelo",
        "placa",
        "chofer",        
        "asignado",     
        "status",        
        "ubservacion",
    ];
    protected $hidden =['created_at','updated_at'];

    //relacion polimorfica
    public function archivos(){
        return $this->morphMany('App\Models\Archivos','archivotable');
    }
    //relacion polimorfica
    public function solicituds(){
        return $this->hasMany(Solicitud::class);
    }
}
