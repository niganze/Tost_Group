<?php

namespace App\Http\Controllers\Site;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

use App\V2\Model\Subscription;

class SubscriptionController extends Controller
{
   
    public function store(Request $request)
    {
        // Validate the email input
        $request->validate([
            'email' => 'required|email|unique:subscriptions,email',
        ]);

        // Save the email to the database
        Subscription::create([
            'email' => $request->email,
        ]);

        // Redirect back with a success message
        return redirect()->back()->with('success', 'Thank you for subscribing!');
    }
}
