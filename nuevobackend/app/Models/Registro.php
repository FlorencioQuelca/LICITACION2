<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Registro extends Model
{
    use HasFactory;
    protected $table="registros";
    protected $fillable =[
        "codigo",
        "interno",
        "nro",
        "nombre",
        "cite",
        "fecha",
        "monto1",
        "monto2",
        "monto3",
        "total",
        "municipio",
        "comunidades",
        "presentado_por",
        "firmado_por",
        "autoridad",
        "url",
        "status",
        "observacion",
        "carta_a",
        "carta_via",
        "carta_de",
        "carta_ref",
        "carta_fecha",
        "carta_cite",
        "cumple",
        "mosca",
        "copia",
        "adjunto",
        "vinculo",
        "departamento_id",
        "puntaje",
        "puntaje1",
        "puntaje2",
        "puntaje3",
        "puntaje4"
    ];
    protected $hidden =['created_at','updated_at'];
    //relacion uno a muchos inversa
    public function users(){
        return $this->belongsToMany(User::class);
    }
    public function evaluacions(){
        return $this->belongsToMany(Evaluacion::class)->withPivot(['nombre','descripcion','presenta','puntaje','id','tipo']);

    }
    public function comunidads(){
        return $this->belongsToMany(Comunidad::class)->withPivot(['provincia']);
    }
    public function departamento(){
        return $this->belongsTo(Departamento::class);
    }
    //relacion uno a uno
    public function ficha(){
        // $ficha = Ficha::where("registro_id", $this->id)->first();
        // return $ficha;
        return $this->hasOne(Ficha::class);
     }


}
