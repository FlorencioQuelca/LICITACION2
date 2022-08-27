<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Evaluacion extends Model
{
    use HasFactory;
    protected $table="evaluacions";
    protected $fillable =[
"nombre",
"tipo",
"valor",
"descripcion",
"observacion",
"status"
    ];

    protected $hidden =['created_at','updated_at'];


    public function registros(){
        return $this->belongsToMany(Registro::class);
    }

}
