<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class DescripcionSociedadAccidental extends Model
{
    use HasFactory;
    protected $table ='descripcionSociedadAccidentals';

    protected $fillable = [
        "num",
        "empresa_id",
        "sociedadAccidental_id",
        "participacion",
    ];

    protected $hidden =['created_at','updated_at'];
    // relaciones
    
    
    public function empresa(){
        return $this->belongsTo(Empresa::class);
    }
    public function sociedadAccidental(){
        return $this->belongsTo(SociedadAccidental::class);
    }
   

}


