<div class="mb-3">
    @if(isset($label))
    <label>{{ $label }}</label>
    @endif

    <div class="input-group myColorPicker">

        <input type="text" class="form-control colorpicker-full"  name="{{ @$name }}" value="{{ @${@$name} }}">

    </div>
</div>
