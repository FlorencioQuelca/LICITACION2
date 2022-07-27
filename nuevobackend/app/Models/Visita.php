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
        "num",
        "empresa",
        "mochila",
        "funcionario",
        "observacion",
        "user_id",
        "departamento_id",
        "status"
    ];
    protected $hidden =['created_at','updated_at'];

    //relacion muchos a muchos
    public function personas(){
        return $this->BelongsToMany(Persona::class,'persona_visita')->withPivot(['tipo','mochila','observacion']);
    }
    public function departamento(){
        return $this->belongsTo(Departamento::class);
    }
    public function user(){
        return $this->belongsTo(User::class);
    }

}
