<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Visita extends Model
{
    use HasFactory;
    protected $table ='visitas';

    protected $fillable = [
        "fecha",
        "horain",
        "horaout",
        "motivo",
        "mun",
        "empresa",
        "mochila",
        "funcionario",
        "observacion",
        "user_id",
        "departamento_id",
        "departamento_id",
        "status"
    ];
    protected $hidden =['created_at','updated_at'];

    //relacion uno a muchos
    public function personas(){
        return $this->morphToMany(Persona::class,'persona_visita')->withPivot(['tipo','mochila','observacion']);
    }

}
