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
    Route::apiResource('departamentos',\App\Http\Controllers\DepartamentoController::class); //CRUD de departamentos;
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


  Route::apiResource('/contratos',\App\Http\Controllers\ContratoController::class);
  Route::put('setPdf/{contrato}',[\App\Http\Controllers\ContratoController::class,'setPdf']);
  Route::get('getPdf/{contrato}',[\App\Http\Controllers\ContratoController::class,'getPdf']);

  Route::apiResource('/categorias',\App\Http\Controllers\CategoriaController::class); //CRUD de SociedadAccidental;
  Route::apiResource('users',\App\Http\Controllers\UserController::class);
  Route::apiResource('/permisos',\App\Http\Controllers\PermisoController::class);
  Route::put('/updatepermisos/{user}',[\App\Http\Controllers\UserController::class,'updatepermisos']);

  Route::put('/pass/{user}',[\App\Http\Controllers\UserController::class,'pass']);

  Route::post('/logout',[\App\Http\Controllers\UserController::class,'logout'])->name('logout');
  Route::post('/me',[\App\Http\Controllers\UserController::class,'me']);

  //rutas nuevas
  Route::apiResource('/Tallers',\App\Http\Controllers\TallerController::class);
  Route::apiResource('/Solicituds',\App\Http\Controllers\SolicitudController::class);
  Route::get('get_all',[\App\Http\Controllers\SolicitudController::class,'get_all'])->name('get_all');

  Route::apiResource('/Trabajos',\App\Http\Controllers\TrabajoController::class);
  Route::post('/uploadPhotos',[\App\Http\Controllers\TrabajoController::class,'uploadPhotos'])->name('uploadPhotos');;

  Route::get('/solicitudid/{solicitud}',[\App\Http\Controllers\SolicitudController::class,'solicitudid'])->name('solicitudid'); //un solo proyecto

  Route::apiResource('/Cars',\App\Http\Controllers\CarController::class);

  Route::post('/upload',[\App\Http\Controllers\ContratoController::class,'upload']);
  Route::post('/base64',[\App\Http\Controllers\ContratoController::class,'base64']);
  Route::post('getContrato/{archivo}',[\App\Http\Controllers\ArchivoController::class,'getContrato']);

  Route::apiResource('/archivos',\App\Http\Controllers\ArchivoController::class);
  Route::get('proyectoslibre',[\App\Http\Controllers\ProyectoController::class,'proyectoslibre'])->name('proyectoslibre'); //CRUD de proyectos;
  Route::get('/proyectoid/{proyecto}',[\App\Http\Controllers\ProyectoController::class,'proyectoid'])->name('proyectoid'); //un solo proyecto

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

   //visitas
   Route::apiResource('/visitas',\App\Http\Controllers\VisitaController::class);
   Route::get('/visitafecha/{id}',[\App\Http\Controllers\VisitaController::class,'visitafecha']);
   Route::put('registrarSalida/{visita}',[\App\Http\Controllers\VisitaController::class,'registrarSalida'])->name('registrarSalida'); //CRUD de SociedadAccidental;

   Route::get('/funcionarios',[\App\Http\Controllers\PersonaController::class,'funcionarios'])->name('funcionarios');
   Route::get('/visitantes',[\App\Http\Controllers\PersonaController::class,'visitantes'])->name('visitantes');
   Route::put('personavisitas/{visita}',[\App\Http\Controllers\VisitaController::class,'personavisitas']);
   Route::put('personavisitadetach/{visita}',[\App\Http\Controllers\VisitaController::class,'personavisitadetach']);
  // BOL34

  Route::apiResource('municipios',\App\Http\Controllers\MunicipioController::class); //CRUD de Municipios;
  Route::get('municipioid/{municipio}',[\App\Http\Controllers\MunicipioController::class,'municipioid'])->name('municipioid');
  Route::apiResource('registros',\App\Http\Controllers\RegistroController::class); //CRUD de registros
  Route::apiResource('ficha',\App\Http\Controllers\FichaController::class); //CRUD de Ficha
  Route::apiResource('evaluacions',\App\Http\Controllers\EvaluacionController::class); //CRUD de
  Route::get('/registroid/{registro}',[\App\Http\Controllers\RegistroController::class,'registroid'])->name('registroid');
  Route::get('/registrodepa/{registro}',[\App\Http\Controllers\RegistroController::class,'registrodepa'])->name('registrodepa');
  Route::get('/registrodepaorder/{registro}',[\App\Http\Controllers\RegistroController::class,'registrodepaorder'])->name('registrodepaorder');
  Route::get('userid/{user}',[\App\Http\Controllers\UserController::class,'userid'])->name('userid');
  Route::put('registrouser/{registro}',[\App\Http\Controllers\RegistroController::class,'registrouser']);
  Route::put('registrouserdetach/{registro}',[\App\Http\Controllers\RegistroController::class,'registrouserdetach']);

  Route::put('registroevaluacion/{registro}',[\App\Http\Controllers\RegistroController::class,'registroevaluacion']);
  Route::put('registroevaluaciondetach/{registro}',[\App\Http\Controllers\RegistroController::class,'registroevaluaciondetach']);

  Route::put('registrocomunidad/{registro}',[\App\Http\Controllers\RegistroController::class,'registrocomunidad']);
  Route::put('registrocomunidaddetach/{registro}',[\App\Http\Controllers\RegistroController::class,'registrocomunidaddetach']);
  Route::apiResource('registroevaluacion1',\App\Http\Controllers\RegistroevaluacionController::class);
  Route::get('registrados',[\App\Http\Controllers\RegistroController::class,'registrados'])->name('registrados');
  Route::post('/uploadPhoto',[\App\Http\Controllers\FichaController::class,'uploadPhoto']);
  Route::post('/base64ficha',[\App\Http\Controllers\FichaController::class,'base64ficha']);


  //lotes nueva mejora
  Route::apiResource('lote',\App\Http\Controllers\LoteController::class);

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
