<?php

namespace App\Notifications;
namespace App\Notifications;

use Illuminate\Bus\Queueable;
use Illuminate\Notifications\Messages\MailMessage;
use Illuminate\Notifications\Notification;

class SiteUpdateNotification extends Notification
{
    use Queueable;

    protected $title;
    protected $description;

    public function __construct($title, $description)
    {
        $this->title = $title;
        $this->description = $description;
    }

    public function via($notifiable)
    {
        return ['mail'];
    }

    public function toMail($notifiable)
    {
        return (new MailMessage)
            ->subject("New Update: {$this->title}")
            ->line($this->description)
            ->action('View More', url('/'))
            ->line('Thank you for subscribing to our updates!');
    }
}

