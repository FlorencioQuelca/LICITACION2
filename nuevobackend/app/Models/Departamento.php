<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Departamento extends Model
{
    use HasFactory;
    protected $table ='departamentos';

    protected $fillable = [
        "nombre",
    ];
    protected $hidden =['created_at','updated_at'];
    //relacion uno a muchos 
    public function proyectos(){
       return $this->hasMany(Proyecto::class);
    }
}
