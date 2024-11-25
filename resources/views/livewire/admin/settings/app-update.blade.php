<div>

    <div class="alert alert-primary" role="alert">
        <strong>{{ __lang('update-instructions') }}</strong>
    </div>
    <ul class="nav nav-pills" id="myTab1" role="tablist">
        <li class="nav-item"  wire:ignore >
            <a class="nav-link active" id="tab1-tab" data-bs-toggle="tab" href="#tab1" role="tab" aria-controls="home" aria-selected="true">@lang('default.update')</a>
        </li>
        <li class="nav-item"  wire:ignore >
            <a class="nav-link" id="tab2-tab" data-bs-toggle="tab" href="#tab2" role="tab" aria-controls="tab2" aria-selected="false">@lang('default.upload')</a>
        </li>

    </ul>
    <div class="tab-content" id="myTabContent1">
        <div class="tab-pane fade show active pt-3" id="tab1" role="tabpanel" aria-labelledby="tab1-tab"  wire:ignore.self>
            <div class="card">
                <div class="card-body">


                    @php if($filePresent): @endphp
                    <form method="POST"
                          action="{{ adminUrl( ['controller' => 'setting', 'action' => 'migrate']) }}">
                        @csrf
                        <button class="btn btn-success" type="submit"><i class="fa fa-play-circle"
                                                                         aria-hidden="true"></i> {{ __('default.start') }}</button>
                    </form>
                    @php else:  @endphp
                    <strong> {{ __lang('no-update-file') }}</strong>

                    @php endif;  @endphp





                </div>
            </div>
        </div>
        <div class="tab-pane fade pt-3" id="tab2" role="tabpanel" aria-labelledby="tab2-tab"  wire:ignore.self>

            <div class="card">
            <div class="card-body">


                <div wire:loading wire:target="uploadFile">
                    <i class="fa fa-spinner fa-spin "></i> @lang('default.file-uploading')
                </div>
                @if(!empty($message))
                    <div class="alert alert-primary" role="alert">
                        <strong>{{ $message }}</strong>
                    </div>
                @endif
                <form wire:submit.prevent="uploadFile">
                    <div class="mb-3">
                        <label for="file" class="form-label">@lang('default.choose-zip'). {{ formatSizeUnits(file_upload_max_size()) }}  @lang('default.max')
                            <i class="fa fa-question-circle" aria-hidden="true" data-bs-toggle="tooltip" data-bs-placement="top"
                               title="@lang('default.file-size-hint')"></i>

                        </label>
                        <input wire:model="file" required type="file" class="form-control" id="file" accept=".zip">
                        @error('file') <span class="text-danger">{{ $message }}</span> @enderror
                    </div>

                    <div class="mb-3">
                        <button type="submit" class="btn btn-primary">@lang('default.upload')</button>
                    </div>
                </form>


            </div>
            </div>


        </div>

    </div>


</div>
