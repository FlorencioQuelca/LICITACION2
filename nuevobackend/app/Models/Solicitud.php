<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Solicitud extends Model
{
    use HasFactory;
    protected $table="solicituds";
    protected $fillable =[
        "seguimiento",
        "fechaini",
        "fechafin",
        "status",
        "taller_id",
        "car_id"
    ];


    protected $hidden =['created_at','updated_at'];
    //relacion uno a muchos inversa
    public function car(){
        return $this->belongsTo(Car::class);
    }
    public function taller(){
        return $this->belongsTo(Taller::class);
    }
    public function trabajos(){
        return $this->hasMany(Trabajo::class);
    }
}
