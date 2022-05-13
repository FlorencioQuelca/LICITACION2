<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class Contrato extends Model
{
    use HasFactory;
    protected $table ="contratos";
    protected $fillable = [
        "nombre",
        "url",
        "fecha",
        "hora",
        "fechaini",
        "fechafin",
        "duracion",
        "seguimiento",
        "status",
        "montosus",
        "montobs",
        "onservacion",
        "proyecto_id",
    ];

    protected $hidden =['created_at','updated_at'];


    // relacion uno a muchos
    public function proyecto(){
        return $this->belongsTo(Proyecto::class);
    }
     //relacion polimorfica
     public function archivos(){
        return $this->morphMany('App\Models\Archivo','archivotable');
    }

    //relacion muchos a muchospolimorfica
    public function empresas(){
        return $this->morphedByMany('App\Models\Empresa','detalle1')->withPivot(['categoria']);
     }
     //relacion muchos a muchos polimorfica
    public function personas(){
        return $this->morphedByMany('App\Models\Persona','detalle1')->withPivot(['categoria']);
     }
     //relacion uno a muchos
    public function sociedads(){
        return $this->morphedByMany('App\Models\Sociedad','detalle1')->withPivot(['categoria']);
     }
     //persona que firma
     public function firmas(){
        return $this->belongsToMany(Persona::class,'contrato_persona');
     }
}
