<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Proyecto extends Model
{
    use HasFactory;
    protected $table ='proyectos';

    protected $fillable = [
            "codigo",
            "nombre",
            "fecha",
            "hora",
            "link",
            "precio",
            "plazo",
            "lotes",
            "programa_id",
            "tipo_id",
            "departamento_id"
    ];
    protected $hidden =['created_at','updated_at'];
    //relacion uno a muchos inversa
    public function departamento(){
        return $this->belongsTo(Departamento::class);
    }
    public function tipo(){
        return $this->belongsTo(Tipo::class);
    }
    public function programa(){
        return $this->belongsTo(Programa::class);
    }
    //relacion uno a muchos
    public function detalles(){
        return $this->hasMany(Detalle::class);
     }
}
