<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Detalle extends Model
{
    use HasFactory;
    protected $table ='Detalles';

    protected $fillable = [
        "num",
        "tiempo",
        "monto",
        "detalle_id",
        "proyecto_id",
        "detalletable_id",
        "detalle_type",
    ];
    protected $hidden =['created_at','updated_at'];
    //tabla polimorgica
    public function detalletable(){
        return $this->morphTo();
    }
    
    public function proyecto(){
        return $this->belongsTo(Proyecto::class);
    }

    
   
}
