<?php

namespace App\Http\Controllers;
use Illuminate\Http\Request;
use Illuminate\Foundation\Support\Providers\EventServiceProvider;
use App\Events\NewEvent;
use App\Events\AuctionEvent;
use Pusher;
use DB;
use Carbon\Carbon;
use Config;
class AuctionController extends Controller
{
	private $playerName;
	private $playerPrice;
	

	public function assign(Request $request){
		 $this->updateDb($request->input('playerName'),$request->input('playerPrice'),"New player admin");
	}
	
	public function updateDb($playerName,$playerPrice,$message){
		DB::table('AUCTION_PLAYER_INFO')->where('AUCTION_ID', 1)
            ->update(['PLAYER_NAME' => $playerName
			, 'PRICE' => $playerPrice
			]);
		$playerDetails=$this->display();
		event(new AuctionEvent($playerDetails[0]->PLAYER_NAME,$playerDetails[0]->PRICE,$message)); 
	}
	public function raiseAmount(Request $request){
		
		$playerDetails=$this->display();
		$currentPrice=$request->input('playerPrice');
		$currentPlayerName=$request->input('playerName');
		$userName=$request->input('user');
		$currentAmount=$request->input('amount');
		
		
		if($currentPlayerName==$playerDetails[0]->PLAYER_NAME && $playerDetails[0]->PRICE==$currentPrice){
			$t=microtime(true);
		$this->updateDb($currentPlayerName,$currentPrice+$currentAmount,$userName." raised ".$currentAmount);
				return array('matching'=>true,"timestamp"=>"before db - ".$t." after event ".microtime(true));
		}
		
		return array('matching'=>false);
	}
	
	public function display(){
		$currentPlayer = DB::select('select PLAYER_NAME,PRICE from AUCTION_PLAYER_INFO');
		return $currentPlayer;
	}
	
	public function index($name){
		//return view('auction.chat',array('name' => $name));
		return view('auction.chat');
	}
	public function loadPreviousMessages(){
		$messages = DB::select('select USER_NAME,MESSAGE from AUCTION_MESSAGES_INFO where UPDATE_DTM<NOW()');
		
        return  array('messages' => $messages);
	}
	
     public function transmitter(Request $request){
		 
		 $user=$request->input('user');
		 $message=$request->input('message');
		 $userId=$request->input('userId');
		 
		event(new NewEvent($user,$message)); 
		  
		  DB::table('AUCTION_MESSAGES_INFO')->insert(
			['USER_NAME' => $user
			, 'MESSAGE' => $message
			,'USER_ID' =>$userId
			]);
			
			return array(
			'status' => true
		  );
	 }
}

