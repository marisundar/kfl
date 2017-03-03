<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use DB;
class Register extends Controller
{
	/**
     * Register user with values passed in the request. Create league if passed and assign that user to it
	 * @Arguments
	 * 		Request request - passed from the registerAdmin page
     *
     * @return league id created for the league
     */
    public function user(Request $request)
    {
		try{
		$user_id=$this->insertUser($request,false);
		echo $request->input('teamName');
		echo $request->input('leagueCode');
		
		$team_id = DB::table('TEAM_INFO')->insertGetId(
		['TEAM_NAME' => $request->input('teamName')
		, 'LEAGUE_ID' => $request->input('leagueCode')]);
		
		DB::table('USER_TEAM_INFO')->insert(
		['TEAM_ID' => $team_id
		, 'USER_ID' => $user_id
		]);
		
		}catch(Exception $ex ){
			return "Error: Cannot register the user. Please try again Later";
		}
		//Need to redirect to the page for first page;
		return $user_id;
	}
	
	 /**
     * Register League and the admin with values passed in the request.
	 * @Arguments
	 * 		Request request - passed from the registerAdmin page
     *
     * @return league id created for the league
     */
    public function admin(Request $request)
    {
		try{
		$admin_id=$this->insertUser($request,true);

		//create league for the user
		$league_id = DB::table('LEAGUE_INFO')->insertGetId(
		['LEAGUE_NAME' => $request->input('leagueName')
		, 'ADMIN_ID' => $admin_id]);
		}catch(Exception $ex ){
			return "Error: Cannot register the League. Please try again Later";
		}
		return $league_id;
    }
	
	/**
     * Registers user/admin with values passed in the request.
	 * @Arguments
	 * 		Request request - passed from the registerAdmin/registerUser page
	 * 		boolean isAdmin - whether the user is admin or normal user
     *
     * @return user id created for the user
     */
	public function insertUser(Request $request,$isAdmin){
		$user_id = DB::table('USER_INFO')->insertGetId(
		['USER_FIRST_NAME' => $request->input('firstName')
		, 'USER_LAST_NAME' => $request->input('lastName')
		, 'IS_ADMIN' => $isAdmin
		, 'EMAIL_ID' => $request->input('email')
		, 'PASSWORD' => $request->input('password')]);
		return $user_id;
	}
	
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function getLeagueName($leagueCode)
    {
		$league_Name = DB::select('select LEAGUE_NAME from LEAGUE_INFO where LEAGUE_ID='.$leagueCode);
        return  $league_Name;

    }

    /**
     * Show the form for creating a new resource.
     *
     * @return Response
     */
    public function getTeamsInLeague($leagueId)
    {
        $teams = DB::select('select TEAM_ID,TEAM_NAME from TEAM_INFO where LEAGUE_ID='.$leagueId);
        return  array('teams' => $teams);
    }
}
