<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Adjudicado extends Model
{
    use HasFactory;
    protected $table ='adjudicados';

    protected $fillable = [
            "nro1",
            "nro2",
            "nombre",
            "cite",
            "seguimiento",
            "numero",
            "literal",
            "rpc",
            "rpa",
            "mosca",
            "programa",
            "resolucion",
            "adjudicado",
            "fecha1",
            "fecha2",
            "gestion",
            "montobs",
            "montosus",
            "positivo",
            "status",
            "observaciones",
            "proyecto_id",
    ];

    protected $hidden =['created_at','updated_at'];

    //relacion muchos a muchos inversa polimorfica
    public function personas(){
        return $this->morphedByMany('App\Models\Persona','detalleadjudicado')->withPivot(['monto']);
   }

    public function empresas(){
        return $this->morphedByMany('App\Models\Empresa','detalleadjudicado')->withPivot(['monto']);
    }
     public function sociedads(){
        return $this->morphedByMany('App\Models\Sociedad','detalleadjudicado')->withPivot(['monto']);
    }
   //relacion uno a muchos inversa
    public function proyecto(){
       return $this->belongsTo('App\Models\Proyecto');
    }
}
