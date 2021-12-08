<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PresentadosProyectoPersona extends Model
{
    use HasFactory;
    protected $table ='presentadosProyectoPersonas';

    protected $fillable = [
        "num",
    "persona_id",
    "proyectoPersona_id",
    "user_id",
    ];
    protected $hidden =['created_at','updated_at'];
    public function persona(){
        return $this->belongsTo(Persona::class);
    }
    public function proyectoEmpresa(){
        return $this->belongsTo(ProyectoPersona::class);
    }
    public function user(){
        return $this->belongsTo(User::class);
    }
}
