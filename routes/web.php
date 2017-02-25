<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});


Route::get('/registerAdmin', function () {
    return view('registration.registerAdmin');
});
Route::get('/registerUser/{leagueCode}', function ($leagueCode) {

  $controller = app()->make('App\Http\Controllers\Register');
  $response=$controller->callAction('getLeagueName', $parameters = array($leagueCode));
	if (count($response)>0){
	return View::make('registration.registerUser', [
        'leagueName' => $response[0]->LEAGUE_NAME,
		'leagueCode' => $leagueCode
    ]);}
	return "League Not found"; 
});

Route::post('/registerAdmin', 'Register@admin');
Route::post('/registerUser', 'Register@user');

Route::get('/teamsInLeague/{leagueCode}', 'Register@getTeamsInLeague');


// testing
Route::get('hello', 'Hello@index');

Route::get('/hello/{name}', 'Hello@show');
Route::get('/hellotest/', 'Hello@test');
Route::get('/helloList/', 'Hello@getDatabaseNames');
Route::get('/checkInsert/', 'Hello@addPlayers');
Route::get('/getPlayerDetails/{playerId}', 'Hello@getPlayerDetails');
Route::get('/helloList/{matchId}', 'Hello@getMatchDetails');

//end testing