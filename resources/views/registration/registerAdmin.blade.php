<!DOCTYPE html>

<body>

{!! Form::open(array('url' => 'registerAdmin', 'method' => 'post')) !!}
    {!! Form::token();!!}
		{!! Form::label('leagueNameLabel', 'League Name', array('class' => 'cssCalssName')) !!}
		{!! Form::text('leagueName', '') !!}
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