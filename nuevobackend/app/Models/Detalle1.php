<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Detalle1 extends Model
{
    use HasFactory;
    protected $table ="detalle1s";
    protected $fillable = [
        "observacion",
        "categoria",

    ];
    protected $hiden =["created_at", "update_ad"];
     //tabla polimorgica
     public function detalle1table(){
        return $this->morphTo();
    }
    // relacion con el contrato
    public function contrato(){
        return $this->belongsTo(Contrato::class);
    }

    //si quieres subir archivos no es necesario
    public function archivos(){
        return $this->morphMany('App\Models\Archivos','archivotable');
    }
}
