<?php

namespace App\Listeners;

use Illuminate\Support\Facades\App;
use App\Events\NewEvent;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Contracts\Queue\ShouldQueue;
use Pusher;
class NewEventListener implements ShouldQueue
{
	use InteractsWithQueue;
	protected $message;
    /**
     * Create the event listener.
     *
     * @return void
     */
    public function __construct()
    {
    }

    /**
     * Handle the event.
     *
     * @param  NewEvent  $event
     * @return void
     */
    public function handle(NewEvent $event)
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
		$actualMessage = array(
			'user' => $event->user,
			'message' => $event->message
		  );
		
		  $data['message'] = $actualMessage;
		  $pusher->trigger(env('PUSHER_CHANNEL'),env('PUSHER_EVENT'), $data);
    }
}
