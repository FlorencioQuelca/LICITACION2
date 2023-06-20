<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Tiket extends Model
{
    use HasFactory;
    protected $table = "tikets";
    protected $fillable = [
            "nombre",
            "tipo",
            "monto",
            "litros",
            "descripcion",

    ];

    protected $hidden =['created_at','updated_at'];
    //public function solicituds(){
      //  return $this->hasMany(Solicitud::class);
   // }
}
