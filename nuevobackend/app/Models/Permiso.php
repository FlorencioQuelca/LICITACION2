<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Permiso extends Model
{
    protected $table ='permisos';

    protected $fillable = [
            "nombre",
        
    ];
    protected $hidden =['created_at','updated_at'];

    use HasFactory;
public function users(){
    return $this->belongsToMany(Permiso::class);
}
}
