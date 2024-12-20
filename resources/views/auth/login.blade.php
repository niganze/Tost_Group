@extends('layouts.auth')
@section('page-title',__lang('login'))
@if($enableRegistration)
@section('page-class')
    class="col-12 col-sm-10 offset-sm-1 col-md-8 offset-md-2 col-lg-8 offset-lg-2 col-xl-8 offset-xl-2"
@endsection
@endif
@section('content')

    <div class="card card-primary">
        <div class="card-header"><h4>{{ __lang('login') }}</h4></div>

        <div class="card-body">
            <div id="login-info-box"></div>

            <div class="row">
                <div class="col-md-{{ $enableRegistration ? 6:12 }} mb-5">
                    <form method="POST" action="{{ route('login') }}" class="needs-validation"   >
                        @csrf
                        <div class="mb-3">
                            <label for="email">{{ __lang('email') }}</label>
                            <input id="email" type="email" class="form-control login-email @error('email') is-invalid @enderror"  name="email" tabindex="1"  value="{{ old('email') }}"   required autofocus autocomplete="email" >

                            <div class="invalid-feedback">
                                {{ __lang('email-required') }}
                            </div>
                            @error('email')
                            <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                            @enderror
                        </div>

                        <div class="mb-3">
                            <div class="d-block">
                                <label for="password" class="control-label">{{ __lang('password') }}</label>
                                <div class="float-end">
                                    <a href="{{ route('password.request') }}" class="text-small">
                                        {{ __lang('lost-password') }}
                                    </a>
                                </div>
                            </div>
                            <input id="password" type="password" class="form-control login-password @error('password') is-invalid @enderror" name="password" tabindex="2" required  autocomplete="current-password" >
                            <div class="invalid-feedback">
                                {{ __lang('fill-password') }}
                            </div>
                            @error('password')
                            <span class="invalid-feedback" role="alert">
                                            <strong>{{ $message }}</strong>
                        </span>
                            @enderror
                        </div>

                        <div class="mb-3">
                            <div class="form-check">
                                <input type="checkbox" name="remember" class="form-check-input" tabindex="3" id="remember-me"  {{ old('remember') ? 'checked' : '' }} >
                                <label class="form-check-label" for="remember-me">{{ __lang('remember-me') }}</label>
                            </div>
                        </div>

                        <div class="mb-3">
                            <button type="submit" class="btn btn-primary btn-lg w-100" tabindex="4">
                                {{ __lang('sign-in') }}
                            </button>
                        </div>
                    </form>

                    @if(setting('social_enable_facebook')==1 || setting('social_enable_google')==1)
                        <div class="text-center mt-4 mb-3">
                            <div class="text-job text-muted">{{ __lang('social-login') }}</div>
                        </div>
                        <div class="row sm-gutters">
                            @if(setting('social_enable_facebook')==1)
                                <div class="col-6">
                                    <a href="{{ route('social.login',['network'=>'facebook']) }}" class="btn w-100 btn-social btn-facebook">
                                        <span class="fab fa-facebook"></span> {{ __lang('facebook') }}
                                    </a>
                                </div>
                            @endif
                            @if(setting('social_enable_google')==1)
                                <div class="col-6">
                                    <a href="{{ route('social.login',['network'=>'google']) }}" class="btn w-100 btn-social btn-google">
                                        <span class="fab fa-google"></span> {{ __lang('google') }}
                                    </a>
                                </div>
                            @endif

                        </div>
                    @endif
                </div>
                @if($enableRegistration)
                <div class="col-md-6 text-center pt-3 pe-5 ps-5">
                    <h4>{{ __lang('new-user') }}</h4>
                    <br>
                    <h1><i class="fa fa-user"></i></h1>
                    <br>
                    <a href="{{ route('register') }}" class="btn btn-primary w-100 btn-lg">{{ __lang('register') }}</a>
                </div>
                @endif


            </div>




        </div>
    </div>
    @if($enableRegistration)

    <div class="mt-5 text-muted text-center">
        {{ __lang('dont-have-account') }} <a href="{{ route('register') }}">{{ __lang('create-one') }}</a>
    </div>
    @endif


@endsection
