<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Municipio extends Model
{
    use HasFactory;

    protected $table ='municipios';

    protected $fillable = [
        "cod_municipio",
        "municipio",
        "id-area",
        "municipio_codigo",
        "observacion",
        "departamento_id"
    ];
    protected $hidden =['created_at','updated_at'];
    //relacion uno a muchos
    public function departamentos(){
       return $this->hasMany(Departamento::class);
    }
}
