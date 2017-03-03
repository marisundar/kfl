<?php

namespace App\Listeners;
use Carbon\Carbon;
use App\Events\AuctionEvent;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Contracts\Queue\ShouldQueue;
use Pusher;
class AuctionEventListener
{
    /**
     * Create the event listener.
     *
     * @return void
     */
    public function __construct()
    {
        //
    }

    /**
     * Handle the event.
     *
     * @param  AuctionEvent  $event
     * @return void
     */
    public function handle(AuctionEvent $event)
    {
        $options = array(
			'encrypted' => true
		  );
			$pusher = new Pusher(
			env('PUSHER_APP_KEY'),
			env('PUSHER_APP_SECRET'),
			env('PUSHER_APP_ID'),
			$options
		  );
		  
		  $mess="After DB- ".microtime(true);
		  
		$actualMessage = array(
			'playerName' => $event->playerName,
			'playerPrice' => $event->playerPrice,
			'message' => $event->message
		  );
		
		  $data['message'] = $actualMessage;
		  $pusher->trigger(env('PUSHER_CHANNEL'),env('PUSHER_EVENT_AUCTION'), $data);
    }
}
