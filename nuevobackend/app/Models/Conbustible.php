<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Conbustible extends Model
{
    use HasFactory;
    protected $table = "combustible";
    protected $fillable = [
            "fecha",
            "hora",
            "empresa",
            "motivo",
            "razon",
            "proyecto",
            "ruta",
            "km",
            "codigo",
            "monto",
            "litro",
            "estado",
            "observacion",
            "user_id",
            "car_id",
            "persona_id",
            "tiket_id",

    ];

    protected $hidden =['created_at','updated_at'];
}
