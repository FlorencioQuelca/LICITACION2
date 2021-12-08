<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Asociado extends Model
{

    use HasFactory;
    protected $table ='asociados';

    protected $fillable = [
        "num",
        "empresa_id",
        "sociedadAccidental_id",
        "participacion",
    ];

    protected $hidden =['created_at','updated_at'];
    // relaciones
    

    //relacion uno a muchos (inversa)
    public function sociedad(){
        return $this->belongsTo(Sociedad::class);
    }
    //relacion uno a muchos (inversa)
    public function empresa(){
        return $this->belongsTo(Empresa::class);
    }
}
