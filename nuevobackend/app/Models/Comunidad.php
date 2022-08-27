<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Comunidad extends Model
{
    use HasFactory;
    use HasFactory;
    protected $table="comunidads";
    protected $fillable =[
        "nombre"

    ];
    protected $hidden =['created_at','updated_at'];

    public function registros(){
        return $this->belongsToMany(Registro::class);
    }


}
