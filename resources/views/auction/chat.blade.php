<!DOCTYPE html>
<html>
    <head>

        <title>Laravel</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">

        <link href="//fonts.googleapis.com/css?family=Tangerine:100" rel="stylesheet" type="text/css">

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
	
	<p id="userId" hidden>1</p>
		 <div class="container">
      <div class="content">
        <h1>Laravel 5 and Pusher is fun!</h1>
		<!--<button type="button" class="btn btn-info" id="loadPrevious">loadPrevious</button>-->
		<div>
		<label id="playerName"></label>:
		<label id="playerPrice"></label>
		<input type="text" id="userName" value="mari"/>
		<textarea class="form-control" style="min-width: 100%" id="aboutDescription" rows="3" cols="50" 
    style="resize: none;"></textarea>
		<button type="button" class="btn btn-success" id="sendMessage" hidden>send</button>
		<button type="button" class="btn btn-success" id="raise10">raise 10</button>
		
		</div>
        <ul id="messages" class="list-group">
        </ul>
      </div>
	  	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
    <script src="https://js.pusher.com/3.1/pusher.min.js"></script>
    <script>
	$(document).ready(function(){
		var username=$("#userName").val();
		$.get("/kfl/displayPlayer",data , function(result){
					console.log(result[0]);
					$('#playerName').text(result[0].PLAYER_NAME);
					$('#playerPrice').text(result[0].PRICE);
			});	
		var data= {user:"admin",message:username+" has joined the auction",userId:$("#userId").text()};
		console.log(data);
		$.get("/kfl/pushmessages",data , function(result){
					console.log(result);
			});
	});
	
      //instantiate a Pusher object with our Credential's key
      var pusher = new Pusher("954f7837810bcfd56ec4");
      //Subscribe to the channel we specified in our Laravel Event
      var channel = pusher.subscribe('kfl-auction');
	  console.log(channel);
      //Bind a function to a Event (the full Laravel class)
      channel.bind('chatting', function (data) {
		  console.log(data);
		  displayToList(data.message,true);
		});
	  
	  channel.bind('playerInfo', function (data) {
		  //displayToList("on Message Recieved js: "+((new Date()).getTime()));
		  $("#raise10").prop("disabled",true);
		  console.log(data);
		  setTimeout(enableButtons, 1000)
		  
          $('#playerName').text(data.message.playerName);
		  $('#playerPrice').text(data.message.playerPrice);
		  displayToList(data.message.message);
		});
	function enableButtons() {
			$("#raise10").prop("disabled",false);
	}
      
    </script>
	<script>
	$("#sendMessage").click(function(){
		var data= {user:$("#userName").val(),message:$("#aboutDescription").val(),userId:$("#userId").text()};
		console.log(data);
		$.get("/kfl/pushmessages",data , function(result){
					console.log(result);
					if(result.status){
						$("#aboutDescription").val("");
					}
					console.log(result);
			});
	});
	function millisecondsToTime(milli)
	{
      var milliseconds = milli % 1000;
      var seconds = Math.floor((milli / 1000) % 60);
      var minutes = Math.floor((milli / (60 * 1000)) % 60);

      return minutes + ":" + seconds + "." + milliseconds;
	}

	$("#raise10").click(function(){
		//displayToList("on Click js: "+((new Date()).getTime()));
		var data= {
					 user       : $("#userName").val()
					,playerName : $('#playerName').text()
					,playerPrice: $('#playerPrice').text()
					,userId     : $("#userId").text()
					,amount     : 10
					};
		
		console.log(data);
		$.get("/kfl/raiseAmount",data , function(result){
				console.log(result);
				if(result.matching)
				{
					//displayToList(result.timestamp);
				}
		});
	});
	
	
	$("#loadPrevious").click(function(){
			$.get("/kfl/previousMessages","", function(result){
				//console.log(result.messages);
				var messages=result.messages;
				var i;
				for (i = 0; i < messages.length; ++i) {
						console.log(messages[i]);
						displayToList(messages[i]);
				}
				
			});
	});
	
	function displayToList(message,isWithUserName){
		var listItem = $("<li class='list-group-item'></li>");
		
		if(isWithUserName){
			listItem.html(message.user+" by "+message.message);	
		}
		else{
			listItem.html(message);	
		}
		
		$('#messages').prepend(listItem);
	}
	</script>
	

	
	
	
	
    </body>
</html>