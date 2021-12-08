<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PresentadosProyectoSociedad extends Model
{
    use HasFactory;
    protected $table ='presentadosProyectoSociedad';

    protected $fillable = [
        "num",
    "monto",
    "sociedadAccidental_id",
    "proyectoEmpresa_id",
    "user_id",
    ];
    protected $hidden =['created_at','updated_at'];
    public function sociedadAccidental(){
        return $this->belongsTo(SociedadAccidental::class);
    }
    public function proyectoSocidad(){
        return $this->belongsTo(Proyectosociedad::class);
    }
    public function user(){
        return $this->belongsTo(User::class);
    }
}
