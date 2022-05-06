<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Archivo extends Model
{
    use HasFactory;
    protected $table ="archivos";
    protected $fillable = [
        "url", 
        "nombre",
        "detalle",
        "tipo",
        "tamanio",
        "user_id",
        "categoria_id"        
    ];



    protected $hidden =['created_at','updated_at'];
    //relacion polimorfica
    public function archivotable(){
        return $this->morphTo();
    }
}
