<!DOCTYPE html>
<html>
    <head>

        <title>Laravel</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">

        <link href="//fonts.googleapis.com/css?family=Lato:100" rel="stylesheet" type="text/css">

        <style>
            html, body {
                height: 100%;
            }

            body {
                margin: 0;
                padding: 0;
                width: 100%;
                display: table;
                font-weight: 100;
                font-family: 'Lato';
            }

            .container {
                text-align: center;
                display: table-cell;
                vertical-align: middle;
            }

            .content {
                text-align: center;
                display: inline-block;
            }

            .title {
                font-size: 96px;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <div class="content">
                <div class="title">Hello {{$name}}, welcome to Laraland! : )</div>
				
				
            </div>
        </div>
		 <div class="container">
      <div class="content">
        <h1>Laravel 5 and Pusher is fun!</h1>
        <ul id="messages" class="list-group">
        </ul>
      </div>
	  	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
    <script src="https://js.pusher.com/3.1/pusher.min.js"></script>
    <script>
      //instantiate a Pusher object with our Credential's key
      var pusher = new Pusher("954f7837810bcfd56ec4");

      //Subscribe to the channel we specified in our Laravel Event
      var channel = pusher.subscribe('kfl-auction');
	console.log(channel);
      //Bind a function to a Event (the full Laravel class)
      channel.bind('chatting', function (data) {
		  console.log(data);
        var listItem = $("<li class='list-group-item'></li>");
        listItem.html(data.message);
        $('#messages').prepend(listItem);
      });

      
    </script>
    </body>
</html>