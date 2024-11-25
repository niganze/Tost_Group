<?php

namespace App\Livewire\Admin\Settings;

use Livewire\Component;
use  Livewire\WithFileUploads;
use Illuminate\Support\Facades\Storage;
use Livewire\Attributes\Validate;

class AppUpdate extends Component
{
    use WithFileUploads;

    #[Validate('required|file|mimes:zip')]
    public $file;

    public $progress = 0;
    public $uploading = false;
    public $message='';
    public $filePresent = false;

    public function mount(){
        $this->filePresent = Storage::disk('update')->exists('app.zip');
    }


    public function render()
    {
        return view('livewire.admin.settings.app-update');
    }


    public function uploadFile()
    {
        if(config('app.demo-mode')==true){
            $this->message = __('default.not-allowed-in-demo');
            return false;
        }

       $this->validate([
            'file' => 'required|file|mimes:zip', // Max file size: 10MB
        ]);

        $originalName = $this->file->getClientOriginalName();
        if ($originalName != 'app.zip') {
            $this->message = __('default.invalid-file');
            return false;
        }

        $this->uploading = true;

        $this->file->storeAs('.', 'app.zip','update');

        $this->uploading = false;

        // Reset the file input and progress
        $this->file = null;
        $this->progress = 0;
        $this->filePresent = true;

        // Emit a success message (you can customize this as needed)
        $this->message = __('default.file-upload-successful');
    }



}
