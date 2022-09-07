<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Ficha extends Model
{
    use HasFactory;
    protected $table ='fichas';

    protected $fillable = [
        "nombre",
        "ubicacion",
        "zona",
        "circunscripcion",
        "distrito",
        "direccion",
        "coordenadas",
        "observacion",
        "observacion4",
        "observacion5a",
        "observacion5b",
        "observacion5c",
        "observacion5d",
        "observacion6",
        "priorizado",
        "planimetria",
        "status",
        "inspeccionado",
        "aprobado",
        "foto1",
        "foto2",
        "foto3",
        "foto4",
        "fecha",
        "dias",
        "agua",
        "alcantarillado",
        "electricidad",
        "gasnatural",
        "tierra",
        "empedrado",
        "otro",
        "ejecutado",
        "porejecutar",
        "longitudporejecutar",
        "longitud",
        "ancho",
        "area",
        "latitud",
        "longituddecimal",

    ];
    protected $hidden =['created_at','updated_at'];
    //relacion uno a uno

    public function registro(){

        return $this->belongsTo(Registro::class);
    }

}
