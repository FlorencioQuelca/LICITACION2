<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Sociedad extends Model
{
    use HasFactory;
    protected $table ='sociedads';
    protected $fillable = [
        "codigo",
        "nombreEmpresa",
        "nombreLegal",
        "direccion",
        "fono1",
        "fono2",
        "email",
        "observacion",
        "departamento",
        "ci",
        "matricula",
    ];

    protected $hidden =['created_at','updated_at'];

     public function empresas(){
       return $this->belongsToMany(Empresa::class)->withPivot('participacion');
    }

    //relacion muchos a muchos polimorfica
    public function proyectos(){
        return $this->morphToMany('App\Models\Proyecto','detalle');
    }
    //
    public function contratos(){
        return $this->morphToMany('App\Models\Contrato','detalle1');
    }
    public function lotes(){
        return $this->morphToMany('App\Models\Lote','detallelote');
    }



}
