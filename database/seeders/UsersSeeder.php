<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class UsersSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        \App\Role::create(['id'=>'1','name'=>'Admin']);
        \App\Role::create(['id'=>'2','name'=>'Student']);



        $adminRole = new \App\AdminRole();
        $adminRole->id = 1;
        $adminRole->name = 'Super Administrator';
        $adminRole->save();

        $adminRole = new \App\AdminRole();
        $adminRole->id = 2;
        $adminRole->name = 'Administrator';
        $adminRole->save();

        //create seeder for super administrator
        $permissions = \App\Permission::get();

        $adminRole = \App\AdminRole::find(1);
        $permissionList = [];
        foreach($permissions as $permission){
            $permissionList[] = $permission->id;
        }

        $adminRole->permissions()->sync($permissionList);


        //create seeder for administrator
        $permissions = \App\Permission::where('permission_group_id','!=',9)->get();

        $adminRole = \App\AdminRole::find(2);
        $permissionList = [];
        foreach($permissions as $permission){
            $permissionList[] = $permission->id;
        }

        $adminRole->permissions()->sync($permissionList);


             //create seeder for super administrator
    $permissions = \App\Permission::get();

    $adminRole = \App\AdminRole::find(1);
    $permissionList = [];
    foreach($permissions as $permission){
        $permissionList[] = $permission->id;
    }

    $adminRole->permissions()->sync($permissionList);


    if(!\App\User::where('email','admin@email.com')->first()){
        $user = new \App\User();
        $user->name= 'Admin';
        $user->email = 'admin@email.com';
        $user->password = bcrypt('password');
        $user->role_id = 1;
        $user->enabled=1;
        $user->save();
        $admin = $user->admin()->create([
            'about'=>'I am a skilled an qualified instructor',
            'public'=>1,
            'admin_role_id'=>1
        ]);



    }



    }
}
