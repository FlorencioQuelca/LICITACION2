<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Trabajo extends Model
{
    use HasFactory;
     protected $table ="trabajos";
     protected $fillable = [
                "nombre",
                "repuesto",
                "detalle",
                "costo",
                "factura",
                "total",
                "descripcion",
                "status",
                "solicitud_id",
     ];


    protected $hidden =['created_at','updated_at'];
    // relacion uno a muchos polimorfica

    public function archivos(){
        return $this->morphMany(Archivo::class,'archivotable');
    }
    public function solicitud(){
        return $this->belongsTo(Solicitud::class);
    }

}
