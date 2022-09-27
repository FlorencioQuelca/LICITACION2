<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Lote extends Model
{
    use HasFactory;
    protected $table ='lotes';

    protected $fillable = [
            "nro",
            "nombre",
            "lote",
            "codigo",
            "nrolote",
            "status",
            "precio",
            "total",
            "monto",
            "plazo",
            "cantidad",
            "observacion",
    ];

    protected $hidden =['created_at','updated_at'];

    //relacion muchos a muchos inversa polimorfica
    public function personas(){
        return $this->morphedByMany('App\Models\Persona','detallelote')->withPivot(['monto']);
   }

    public function empresas(){
        return $this->morphedByMany('App\Models\Empresa','detallelote')->withPivot(['monto']);
    }
     public function sociedads(){
        return $this->morphedByMany('App\Models\Sociedad','detallelote')->withPivot(['monto']);
    }
   //relacion uno a muchos inversa
    public function proyecto(){
       return $this->belongsTo('App\Models\Proyecto');
    }
}
