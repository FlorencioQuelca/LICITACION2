<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Codigo extends Model
{  use HasFactory;
    protected $table ="codigos";
    protected $fillable = [
        "nombre", 
    ];

    protected $hidden =['created_at','updated_at'];
    //relacion muchos a muchos
    public function proyectos(){
        return $this->belongsToMany(Proyecto::class);
        
    }
}
