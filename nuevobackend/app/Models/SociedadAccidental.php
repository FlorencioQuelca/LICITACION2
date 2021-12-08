<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class SociedadAccidental extends Model
{
    use HasFactory;
    protected $table ='sociedadAccidentals';
    protected $fillable = [
        "nombre",
        "nombreLegal",
        "direccion",
        "fono1",
        "fono2",
        "email",
        "observacion",
        "departamento",
        "codigo",
        
    ];
    
    protected $hidden =['created_at','updated_at'];
    //relaciones de uno a muchos
  //  public function asociados(){
   //     return $this->hasMany(Asociado::class);
    //}
   
}
