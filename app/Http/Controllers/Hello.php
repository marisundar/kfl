<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use DB;
use Mail;
class Hello extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return Response
     */
    public function index()
    {
		/*$users = DB::select('select * from users');
		Mail::send('test', array('users' => $users), function ($message) {
		$message->from('admin@kflt20.com', 'Laravel');

		$message->to('marisundar2006@gmail.com')->cc('marisundar@gmail.com');
		});
		*/
		
		
        return view('testIndex');
    }
	
	public function getPlayerDetails($playerId){
		$client = new \Guzzle\Service\Client();
        $res = $client->get('https://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20cricket.players%20where%20player_id%3D'.$playerId.'&format=json&diagnostics=true&env=store%3A%2F%2F0TxIGQMQbObzvU4Apia0V0&callback=');
		$response= $res->send();
        $array1 = json_decode($response->getBody(), true);
		return $array1["query"]["results"]["Player"];
	}
	public function addPlayers(){
	for ($counter=1; $counter<63788; $counter++) {	
	try{
		echo "Started";
		$players="";
			$players=$this->getPlayerDetails($counter);
			echo count($players);
			if(count($players)>0){
			echo $players["PersonalDetails"]["FirstName"];
			$name = $players["PersonalDetails"]["FirstName"]." ".$players["PersonalDetails"]["LastName"];
		DB::insert('insert into users (name) values (?)',[$name]);
		}
		echo "Done";
	}catch(Exception $ex){
		echo $ex;
	}
		}
		return view('hello',array('name' => $counter));
	}
    /**
     * Show the form for creating a new resource.
     *
     * @return Response
     */
    public function create()
    {
        //
    }
	
	/**
     * Show the form for creating a new resource.
     *
     * @return Response
     */
    public function getDatabaseNames()
    {
        $users = DB::select('select * from users');
        return  array('users' => $users);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  Request  $request
     * @return Response
     */
    public function getMatchDetails($matchId)
    {
		$client = new \Guzzle\Service\Client();
        $res = $client->get('https://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20cricket.scorecard%20where%20match_id%3D'.$matchId.'&format=json&diagnostics=true&env=store%3A%2F%2F0TxIGQMQbObzvU4Apia0V0&callback=');
		$response= $res->send();
        $array = json_decode($response->getBody(), true);
	
        return $array;
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return Response
     */
    public function show($name)
    {
		DB::insert('insert into users ( name) values (?)', [$name]);
        return view('hello',array('name' => $name));
    }
	
	public function test()
    {
		DB::insert('insert into users ( name) values (\'Testing\')');
        return "inserted successfully";
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  Request  $request
     * @param  int  $id
     * @return Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return Response
     */
    public function destroy($id)
    {
        //
    }
}
