<?php
namespace Database\Seeders;
use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {
        // $this->call(UsersTableSeeder::class);
        $this->call(SettingSeeder::class);
        $this->call(PermissionSeeder::class);
        $this->call(TemplatesSeeder::class);
        $this->call(UsersSeeder::class);
    }
}
