<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Detallelote extends Model
{
    use HasFactory;
    protected $table ='detallelotes';

    protected $fillable = [
        "num",
        "tiempo",
        "monto",

    ];
    protected $hidden =['created_at','updated_at'];



}
