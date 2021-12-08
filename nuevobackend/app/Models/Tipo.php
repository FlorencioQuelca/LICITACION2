<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Tipo extends Model
{
    use HasFactory;
    protected $table ='tipos';

    protected $fillable = [
        "nombre",
    ];
    protected $hidden =['created_at','updated_at'];
    //relacion uno a muchos 
   
    public function proyectos(){
        return $this->hasMany(Proyecto::class);
     }
}
