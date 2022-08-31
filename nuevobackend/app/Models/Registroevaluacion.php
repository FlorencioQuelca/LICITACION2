<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Registroevaluacion extends Model
{
    use HasFactory;
    protected $table="evaluacion_registro";
    protected $fillable =[

        "nombre",
        "descripcion",
        "presenta",
        "calificacion",
        "tipo",
        "puntaje",

    ];
    protected $hidden =['created_at','updated_at'];
}
