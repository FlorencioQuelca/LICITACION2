<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ProyectoEmpresa extends Model
{
    use HasFactory;
    protected $table ='proyectoEmpresas';

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
    public function presentadosProyectoEmpresas()
    {
        return $this->hasMany(PresentadosProyectoEmpresa::class);
    }
    public function presentadosProyectoSociedads()
    {
        return $this->hasMany(PresentadosProyectoSocidad::class);
    }
}
