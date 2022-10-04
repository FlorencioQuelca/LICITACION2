<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Proyecto extends Model
{
    use HasFactory;
    protected $table ='proyectos';

    protected $fillable = [
            "nombre",
            "cuce",
            "fecha",
            "hora",
            "link",
            "precio",
            "plazo",
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

     //relacion muchos a muchos
     public function codigos(){
        return $this->belongsToMany(Codigo::class);
    }
    public function funcionarios(){
        return $this->belongsToMany(Persona::class,'persona_proyecto');
     }
    //relacion muchos a muchospolimorfica
    public function empresas(){
        return $this->morphedByMany('App\Models\Empresa','detalle')->withPivot(['monto']);
     }
     //relacion muchos a muchos polimorfica
    public function personas(){
        return $this->morphedByMany('App\Models\Persona','detalle')->withPivot(['monto']);
     }
     //relacion uno a muchos
    public function sociedads(){
        return $this->morphedByMany('App\Models\Sociedad','detalle')->withPivot(['monto']);
     }
     // relacion uno a muchos
    public function contrato(){
        return $this->hasOne(Contrato::class);
    }
    //relacion uno a muchos
    public function lotes(){
        return $this->hasMany('\App\Models\Lote');
    }

}
