<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PresentadosProyectoEmpresa extends Model
{
    use HasFactory;
    protected $table ='presentadosProyectoEmpresas';

    protected $fillable = [
    "num",
    "monto",
    "empresa_id",
    "proyectoEmpresa_id",
    "user_id",
    ];
    protected $hidden =['created_at','updated_at'];
    //relaciones
    public function empresa(){
        return $this->belongsTo(Empresa::class);
    }
    public function proyectoEmpresa(){
        return $this->belongsTo(ProyectoEmpresa::class);
    }
    public function user(){
        return $this->belongsTo(User::class);
    }
}
 