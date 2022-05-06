<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Persona extends Model
{
    use HasFactory;
    protected $table ='personas';

    protected $fillable = [
        "ci",
        "paterno",
        "materno",
        "nombres",
        "datosp",
        "nit",
        "grado",
        "direccion",
        "fechaNacimiento",
        "fono1",
        "fono2",
        "email",
        "genero",
        "observacion",
    ];
    protected $hidden =['created_at','updated_at'];
    
    //relacion uno a muchos polimorfica
    public function proyectos(){
        return $this->morphToMany('App\Models\Proyecto','detalle');
    }
// funciona para el funcionario
    public function proyects(){
        return $this->belongsToMany(Proyecto::class,'persona_proyecto');
     }

    public function contratos(){
        return $this->morphToMany('App\Models\Contrato','detalle1');
    }
    // firma el contrato
    public function firmas(){
        return $this->belongsToMany(Contrato::class,'contrato_persona');
     }

}
   
