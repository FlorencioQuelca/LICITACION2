<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class Contrato extends Model
{
    use HasFactory;
    protected $table ="contratos";
    protected $fillable = [
        "nombre", 
        "fecha",
        "hora",
        "url",
        "user_id",
        "categoria_id"        
    ];

    protected $hidden =['created_at','updated_at'];

    //relacion uno a muchos inversa
    public function user(){
        return $this->belongsTo(User::class);
    }
    public function categoria(){
        return $this->belongsTo(Categoria::class);
    }
}
