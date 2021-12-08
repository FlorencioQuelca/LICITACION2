<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
*/

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});
// Ejemplo pr
//http://localhost:8000/api/prueba

Route::get("/prueba",function(){
   return \App\Models\Empresa::all();
});


//login
Route::post('login',[\App\Http\Controllers\UserController::class,'login'])->name('login');
Route::post('registrar',[\App\Http\Controllers\UserController::class,'store'])->name('registrar');

Route::get('proyectoEmpresa',[\App\Http\Controllers\ProyectoEmpresaController::class,'index'])->name('proyectoEmpresa'); //crud empresa
Route::get('proyectoPersona',[\App\Http\Controllers\ProyectoPersonaController::class,'index'])->name('proyectoPersona');

Route::get('personas',[\App\Http\Controllers\PersonaController::class,'index'])->name('personas');
Route::get('empresas',[\App\Http\Controllers\EmpresaController::class,'index'])->name('empresas');
Route::get('sociedades',[\App\Http\Controllers\SociedadController::class,'index'])->name('sociedades');



//Route::group(['middleware'=>'auth:api'], function(){


   Route::apiResource('personas',\App\Http\Controllers\PersonaController::class,['except' => ['index']]); //CRUD de Personas;
   Route::apiResource('empresas',\App\Http\Controllers\EmpresaController::class,['except' => ['index']]); //CRUD de Empresa;
  //sociedad
   Route::apiResource('sociedades',\App\Http\Controllers\SociedadController::class,['except' => ['index']]); //CRUD de SociedadAccidental;
  //proyecto
  Route::apiResource('proyectos',\App\Http\Controllers\ProyectoController::class); //CRUD de SociedadAccidental;
  Route::apiResource('detalle',\App\Http\Controllers\detalleController::class);
   
   //Route::apiResource('sociedad',[\App\Http\Controllers\SociedadController::class,'sociedad']);
   //ruta asociados sociedad accidental
   Route::apiResource('asociados',\App\Http\Controllers\AsociadoController::class);
   
   Route::apiResource('proyectoPersona',\App\Http\Controllers\ProyectoPersonaController::class,['except' => ['index']]); //CRUD de Proyecto Persona;
   Route::apiResource('proyectoEmpresa',\App\Http\Controllers\ProyectoEmpresaController::class,['except' => ['index']]); 
   
  //  Route::post('logout',[\App\Http\Controllers\UserController::class,'logout'])->name('logout');
    
//});
//Route::get('personas',[\App\Http\Controllers\PersonaController::class,'index']);
//Route::get('personas/{persona}',[\App\Http\Controllers\PersonaController::class,'show']);
//Route::delete('personas/{persona}',[\App\Http\Controllers\PersonaController::class,'destroy']);
//Route::post('personas',[\App\Http\Controllers\PersonaController::class,'store']);
//Route::put('personas/{persona}',[\App\Http\Controllers\PersonaController::class,'update']);
//PERSONAS
//Route::apiResource('personas',\App\Http\Controllers\PersonaController::class); //CRUD de Personas
//EMPRESA
//Route::apiResource('empresas',\App\Http\Controllers\EmpresaController::class); //CRUD de Empresa;

// SOCIEDAD ACCIDENTAL
//Route::apiResource('sociedadAccidentals',\App\Http\Controllers\SociedadAccidentalController::class); //CRUD de SociedadAccidental;

// DESCRIPCION SOCIEDAD ACCIDENTAL
Route::apiResource('descripcionSociedadAccidentals',\App\Http\Controllers\DescripcionSociedadAccidentalController::class); //CRUD de DescripcionSociedadAccidental;


// DESCRIPCION PROYECTOS Persona
//Route::apiResource('proyectoPersona',\App\Http\Controllers\ProyectoPersonaController::class); //CRUD de Proyecto Persona
// DESCRIPCION PROYECTOS Persona
//Route::apiResource('proyectoEmpresa',\App\Http\Controllers\ProyectoEmpresaController::class); //CRUD de proyecto Empresa;
