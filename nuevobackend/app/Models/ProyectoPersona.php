<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ProyectoPersona extends Model
{
    use HasFactory;
    protected $table ='proyectoPersonas';

    protected $fillable = [
        "codigo",
        "nombre",
        "fecha",
        "hora",
        "link",
        "programa",
        "precio",
        "plazoEntrega",
        "lote",
        "departamento"
    ];
    protected $hidden =['created_at','updated_at'];
    public function presentadosProyectoPersonas()
    {
        return $this->hasMany(PresentadosProyectoPersonas::class);
    }
}
