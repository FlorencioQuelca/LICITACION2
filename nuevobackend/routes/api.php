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

//Route::middleware('auth:api')->get('/user', function (Request $request) {
//    return $request->user();
//});
// Ejemplo pr
//http://localhost:8000/api/prueba

//Route::get("/prueba",function(){
//   return \App\Models\Empresa::all();
//});

Route::get('proyectoslibre',[\App\Http\Controllers\ProyectoController::class,'proyectoslibre'])->name('proyectoslibre'); //CRUD de proyectos;
Route::get('/proyectoid/{proyecto}',[\App\Http\Controllers\ProyectoController::class,'proyectoid'])->name('proyectoid');; //un solo proyecto

//login
Route::post('/login',[\App\Http\Controllers\UserController::class,'login'])->name('login');
Route::group(['middleware'=>"auth:sanctum"],function (){
   Route::apiResource('/consultor',\App\Http\Controllers\PersonaController::class); //CRUD de Personas;
   Route::get('/consultorci/{id}',[\App\Http\Controllers\PersonaController::class,'consultorci']); //CRUD de Personas;
   Route::apiResource('/empresa',\App\Http\Controllers\EmpresaController::class); //CRUD de Empresa;
   Route::get('/empresanit/{id}',[\App\Http\Controllers\EmpresaController::class,'empresanit']); //CRUD de Empresa;
   Route::apiResource('/sociedad',\App\Http\Controllers\SociedadController::class); //CRUD de SociedadAccidental;
   Route::get('/sociedadcodigo/{id}',[\App\Http\Controllers\SociedadController::class,'sociedadcodigo']); //CRUD de SociedadAccidental;
   Route::get('/userci/{id}',[\App\Http\Controllers\UserController::class,'userci']); //CRUD de Personas;

   Route::put('empresaSociedad/{sociedad}',[\App\Http\Controllers\SociedadController::class,'empresaSociedad']); //CRUD de SociedadAccidental;
   Route::put('empresasociedaddetach/{sociedad}',[\App\Http\Controllers\SociedadController::class,'empresasociedaddetach']); //CRUD de SociedadAccidental;

   //proyecto
  Route::apiResource('proyectos',\App\Http\Controllers\ProyectoController::class); //CRUD de proyectos;
  Route::apiResource('programas',\App\Http\Controllers\ProgramaController::class); //CRUD de SociedadAccidental;
  Route::apiResource('departamentos',\App\Http\Controllers\DepartamentoController::class); //CRUD de SociedadAccidental;
  Route::apiResource('tipos',\App\Http\Controllers\TipoController::class); //CRUD de SociedadAccidental;
  Route::apiResource('codigos',\App\Http\Controllers\CodigoController::class); //CRUD de SociedadAccidental;
  Route::get('/codigofound/{id}',[\App\Http\Controllers\CodigoController::class,'codigofound']); //CRUD de SociedadAccidental;
  Route::put('codigoproyectos/{proyecto}',[\App\Http\Controllers\ProyectoController::class,'codigoproyectos']); //CRUD de SociedadAccidental;
  Route::put('codigoproyectos1/{proyecto}',[\App\Http\Controllers\ProyectoController::class,'codigoproyectos1']); //CRUD de SociedadAccidental;
  Route::put('personaproyectos/{proyecto}',[\App\Http\Controllers\ProyectoController::class,'personaproyectos']); //CRUD de SociedadAccidental;
  Route::put('personaproyectosdetach/{proyecto}',[\App\Http\Controllers\ProyectoController::class,'personaproyectosdetach']); //CRUD de SociedadAccidental;

  Route::put('empresaproyectos/{proyecto}',[\App\Http\Controllers\ProyectoController::class,'empresaproyectos']); //CRUD de SociedadAccidental;
  Route::put('empresaproyectosdetach/{proyecto}',[\App\Http\Controllers\ProyectoController::class,'empresaproyectosdetach']); //CRUD de SociedadAccidental;

  Route::put('sociedadproyectos/{proyecto}',[\App\Http\Controllers\ProyectoController::class,'sociedadproyectos']); //CRUD de SociedadAccidental;
  Route::put('sociedadproyectosdetach/{proyecto}',[\App\Http\Controllers\ProyectoController::class,'sociedadproyectosdetach']); //CRUD de SociedadAccidental;
  //funcionario
  Route::put('funcionarioproyectos/{proyecto}',[\App\Http\Controllers\ProyectoController::class,'funcionarioproyectos']); //CRUD de SociedadAccidental;
  Route::put('funcionarioproyectosdetach/{proyecto}',[\App\Http\Controllers\ProyectoController::class,'funcionarioproyectosdetach']); //CRUD de SociedadAccidental;


  Route::apiResource('detalle',\App\Http\Controllers\detalleController::class);
  Route::put('setmonto/{detalle}',[\App\Http\Controllers\detalleController::class,'setmonto']);


  Route::apiResource('contratos',\App\Http\Controllers\ContratoController::class);
  Route::put('setPdf/{contrato}',[\App\Http\Controllers\ContratoController::class,'setPdf']);
  Route::get('getPdf/{contrato}',[\App\Http\Controllers\ContratoController::class,'getPdf']);

  Route::apiResource('categorias',\App\Http\Controllers\CategoriaController::class); //CRUD de SociedadAccidental;
  Route::apiResource('users',\App\Http\Controllers\UserController::class);
  Route::apiResource('permisos',\App\Http\Controllers\PermisoController::class);
  Route::put('/updatepermisos/{user}',[\App\Http\Controllers\UserController::class,'updatepermisos']);

  Route::put('/pass/{user}',[\App\Http\Controllers\UserController::class,'pass']);

  Route::post('/logout',[\App\Http\Controllers\UserController::class,'logout'])->name('logout');
  Route::post('/me',[\App\Http\Controllers\UserController::class,'me']);

  //rutas nuevas
  Route::apiResource('/Tallers',\App\Http\Controllers\TallerController::class);
  Route::apiResource('/Solicituds',\App\Http\Controllers\SolicitudController::class);
  Route::apiResource('/Cars',\App\Http\Controllers\CarController::class);

   Route::post('/upload',[\App\Http\Controllers\ContratoController::class,'upload']);
   Route::post('/base64',[\App\Http\Controllers\ContratoController::class,'base64']);
   Route::get('getContrato/{archivo}',[\App\Http\Controllers\ArchivoController::class,'getContrato']);

   Route::apiResource('/archivos',\App\Http\Controllers\ArchivoController::class);

   // contrato
   Route::put('personacontratos/{contrato}',[\App\Http\Controllers\ContratoController::class,'personacontratos']); //CRUD de SociedadAccidental;
   Route::put('personacontratosdetach/{contrato}',[\App\Http\Controllers\ContratoController::class,'personacontratosdetach']); //CRUD de SociedadAccidental;

   Route::put('empresacontratos/{contrato}',[\App\Http\Controllers\ContratoController::class,'empresacontratos']); //CRUD de SociedadAccidental;
   Route::put('empresacontratosdetach/{contrato}',[\App\Http\Controllers\ContratoController::class,'empresacontratosdetach']); //CRUD de SociedadAccidental;

   Route::put('sociedadcontratos/{contrato}',[\App\Http\Controllers\ContratoController::class,'sociedadcontratos']); //CRUD de SociedadAccidental;
   Route::put('sociedadcontratosdetach/{contrato}',[\App\Http\Controllers\ContratoController::class,'sociedadcontratosdetach']); //CRUD de SociedadAccidental;
   //dependiente  con categoria
   Route::put('dependientecontratos/{contrato}',[\App\Http\Controllers\ContratoController::class,'dependientecontratos']); //CRUD de SociedadAccidental;
   Route::put('dependientecontratosdetach/{contrato}',[\App\Http\Controllers\ContratoController::class,'dependientecontratosdetach']); //CRUD de SociedadAccidental;



});


//Route::post('registrar',[\App\Http\Controllers\UserController::class,'store'])->name('registrar');

//Route::get('proyectoEmpresa',[\App\Http\Controllers\ProyectoEmpresaController::class,'index'])->name('proyectoEmpresa'); //crud empresa
//Route::get('proyectoPersona',[\App\Http\Controllers\ProyectoPersonaController::class,'index'])->name('proyectoPersona');

//Route::get('personas',[\App\Http\Controllers\PersonaController::class,'index'])->name('personas');
//Route::get('empresas',[\App\Http\Controllers\EmpresaController::class,'index'])->name('empresas');
//Route::get('sociedades',[\App\Http\Controllers\SociedadController::class,'index'])->name('sociedades');



//Route::group(['middleware'=>'auth:api'], function(){



   //Route::apiResource('sociedad',[\App\Http\Controllers\SociedadController::class,'sociedad']);
   //ruta asociados sociedad accidental
  // Route::apiResource('asociados',\App\Http\Controllers\AsociadoController::class);

   //Route::apiResource('proyectoPersona',\App\Http\Controllers\ProyectoPersonaController::class,['except' => ['index']]); //CRUD de Proyecto Persona;
   //Route::apiResource('proyectoEmpresa',\App\Http\Controllers\ProyectoEmpresaController::class,['except' => ['index']]);

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
//Route::apiResource('descripcionSociedadAccidentals',\App\Http\Controllers\DescripcionSociedadAccidentalController::class); //CRUD de DescripcionSociedadAccidental;


// DESCRIPCION PROYECTOS Persona
//Route::apiResource('proyectoPersona',\App\Http\Controllers\ProyectoPersonaController::class); //CRUD de Proyecto Persona
// DESCRIPCION PROYECTOS Persona
//Route::apiResource('proyectoEmpresa',\App\Http\Controllers\ProyectoEmpresaController::class); //CRUD de proyecto Empresa;
