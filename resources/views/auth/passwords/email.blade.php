@extends('layouts.auth')
@section('page-title',__lang('password-reset'))
@section('content')


            <div class="card card-primary">
                <div class="card-header">{{ __lang('password-reset') }}</div>

                <div class="card-body">
                    @if (session('status'))
                        <div class="alert alert-success" role="alert">
                            {{ session('status') }}
                        </div>
                    @endif

                    <form method="POST" action="{{ route('password.email') }}">
                        @csrf

                        <div class="mb-3 ">
                            <label for="email"  >{{ __lang('email') }}</label>

                            <div>
                                <input id="email" type="email" class="form-control @error('email') is-invalid @enderror" name="email" value="{{ old('email') }}" required autocomplete="email" autofocus>

                                @error('email')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                            </div>
                        </div>

                        <div class="mb-3  mb-0">
                            <div>
                                <button type="submit" class="btn btn-primary w-100">
                                    {{ __lang('submit') }}
                                </button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>

@endsection
