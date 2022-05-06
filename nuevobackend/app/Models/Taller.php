<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Taller extends Model
{
    use HasFactory;
    protected $table = "tallers";
    protected $fillable = [
            "nit",
            "nombre",
            "representante",
            "direccion",
            "fono1",
            "fono2",
            "status",
            "url",
            "observacion",
    ];
    
    protected $hidden =['created_at','updated_at'];
    //
    public function solicituds(){
        return $this->hasMany(Solicitud::class);
    }
}
