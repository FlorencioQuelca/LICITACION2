<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Categoria extends Model
{
    use HasFactory;
    protected $table ="categorias";
    protected $fillable = [
        "nombre", 
    ];

    protected $hidden =['created_at','updated_at'];
    //relacion uno a muchos
    public function contratos(){
        return $this->hasMany(Contrato::class);
    }
}
