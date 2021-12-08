<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Programa extends Model
{
    use HasFactory;
    protected $table ='programas';

    protected $fillable = [
       
        "nombre",
    ];
    protected $hidden =['created_at','updated_at'];
    public function proyectos(){
        return $this->hasMany(Proyecto::class);
     }
}
