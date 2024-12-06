@extends('layouts.app') <!-- Or your base layout -->

@section('content')
    <div class="container mx-auto">
        @if(session('status'))
            <div class="alert alert-success">
                {{ session('status') }}
            </div>
        @endif

        @if(session('error'))
            <div class="alert alert-danger">
                {{ session('error') }}
            </div>
        @endif

        @if($certificate)
            <div class="modal bg-gray-100 p-8 rounded-lg shadow-md">
                <h2 class="text-2xl font-bold text-gray-800 mb-4">Certificate Details</h2>
                <p class="text-gray-600 mb-4">Here are the details of your certificate:</p>
                
                <div class="mb-4">
                    <strong>Name:</strong> {{ $certificate->name }}
                </div>
                <div class="mb-4">
                    <strong>Session/Course:</strong> {{ $certificate->course_name }}
                </div>
                <div class="mb-4">
                    <strong>Description:</strong> {{ $certificate->description }}
                </div>
                <div class="mb-4">
                    <strong>Price:</strong> ${{ number_format($certificate->price, 2) }}
                </div>

                <button class="btn btn-primary" onclick="closeModal()">Close</button>
            </div>
        @endif
    </div>
@endsection

@section('scripts')
    <script>
        function closeModal() {
            // Logic to close the modal (you can use JavaScript, or just redirect back, depending on your preference)
            window.history.back();
        }
    </script>
@endsection
