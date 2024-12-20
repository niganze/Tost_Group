<div class="accordion">
    <div class="accordion-header" id="heading{{ $menu->id }}" data-bs-toggle="collapse" data-bs-target="#collapse{{ $menu->id }}" aria-expanded="false" aria-controls="collapse{{ $menu->id }}">
        <h4>
                {{ $menu->label }}
        </h4>
    </div>
    <div id="collapse{{ $menu->id }}" class="collapse" aria-labelledby="heading{{ $menu->id }}">
        <div class="accordion-body">
            <span class="float-end"><small>{{ $menu->name }}</small></span>
            <form method="post" class="menuform" action="{{ route('admin.menus.update-header',['headerMenu'=>$menu->id]) }}">
                @csrf
                <div class="mb-3">
                    <label for="label">@lang('default.label')</label>
                    <input class="form-control" type="text" name="label" value="{{ $menu->label }}"/>
                </div>
                @if($menu->type=='c')
                    <div class="mb-3">
                        <label for="url">URL</label>
                        <input class="form-control" type="text" name="url" value="{{ $menu->url }}"/>
                    </div>
                @endif

                <div class="mb-3">
                    <label for="sort_order">@lang('default.sort-order')</label>
                    <input class="form-control number" type="text" name="sort_order" value="{{ $menu->sort_order }}"/>
                </div>

                <div class="mb-3">
                    <label for="parent_id">@lang('default.parent')</label>
                    <select class="form-select" name="parent_id" id="parent_id">
                        <option value="0">@lang('default.none')</option>
                        @foreach(\App\HeaderMenu::where('parent_id',0)->orderBy('sort_order')->get() as $option)
                            <option @if($menu->parent_id==$option->id) selected @endif value="{{ $option->id }}">{{ $option->label }}</option>
                        @endforeach
                    </select>
                </div>
                <div class="form-check">
                    <input class="form-check-input" name="new_window" type="checkbox" value="1" @if($menu->new_window==1) checked @endif id="new_window{{ $menu->id }}">
                    <label class="form-check-label" for="new_window{{ $menu->id }}">
                        @lang('default.new-window')
                    </label>
                </div>
                <br/>

                <a onclick="return confirm('@lang('default.confirm-delete')')" class="btn btn-danger deletemenu" href="{{ route('admin.menus.delete-header',['headerMenu'=>$menu->id]) }}">@lang('default.delete')</a>
                <button class="btn btn-primary float-end">@lang('default.save-changes')</button>

            </form>
        </div>
    </div>
</div>
