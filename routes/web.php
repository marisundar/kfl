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
//Auction starting
//Route::get('/auction','AuctionController@index');


Route::get('/newPlayer', 'AuctionController@assign');
Route::get('/displayPlayer', 'AuctionController@display');
Route::get('/raiseAmount', 'AuctionController@raiseAmount');

Route::get('/auction', function () {
    return view('auction.chat');
});
Route::get('/pushmessages','AuctionController@transmitter');
Route::get('/previousMessages','AuctionController@loadPreviousMessages');
Route::get('/push/{message}', function($message) {
	 $options = array(
    'encrypted' => true
  );
  echo "message is ".$message;
  $pusher = new Pusher(
    env('PUSHER_APP_KEY'),
    env('PUSHER_APP_SECRET'),
    env('PUSHER_APP_ID'),
    $options
  );

	$data['message'] = $message;
  $pusher->trigger('kfl-auction', 'chatting', $data);
  var_dump($pusher);
});
//Auction ending
//end testing