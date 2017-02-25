<!DOCTYPE html>

<body>

{!! Form::open(array('url' => 'registerUser', 'method' => 'post')) !!}
    {!! Form::token();!!}
		Registering for League - {{$leagueName}}
		<br>
		  LeagueCode - 
		  {!! Form::text('leagueCode', $leagueCode, array('name'=>'leagueCode','class' => 'cssCalssName','readonly')) !!}
		<br>
		<br>
		{!! Form::label('teamNameLabel', 'Team Name', array('class' => 'cssCalssName')) !!}
		{!! Form::text('teamName', '') !!}
		<br>
		<br>		
		{!! Form::label('firstNameLabel', 'First Name', array('class' => 'cssCalssName')) !!}
		{!! Form::text('firstName', '') !!}
		<br>
		<br>
		{!! Form::label('lastNameLabel', 'Last Name', array('class' => 'cssCalssName')) !!}
		{!! Form::text('lastName', '') !!}
		<br>
		<br>
		{!! Form::label('emailLabel', 'Email', array('class' => 'cssCalssName')) !!}
		{!! Form::text('email', '') !!}	
		<br>
		<br>
	<!--	<br>
		<br>
		{!! Form::label('userNameLabel', 'User Name', array('class' => 'cssCalssName')) !!}
		{!! Form::text('userName', '') !!}
		<br>
		<br> 
		-->
		{!! Form::label('passwordLabel', 'Password', array('class' => 'cssCalssName')) !!}
		{!! Form::password('password') !!}
		<br>
		<br>
		
		{!! Form::submit('SignUp!') !!}
		
{!! Form::close() !!}

</body>
</html>