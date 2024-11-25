<?php

use App\Setting;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        if(!Setting::where('settings.key','mail_smtp_encryption')->exists()){
            Setting::insert([
                'key'=>'mail_smtp_encryption',
                'type'=>'select',
                'options'=>'tls=TLS,ssl=SSL',
                'class'=>'',
            ]);
        }
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        //
    }
};
