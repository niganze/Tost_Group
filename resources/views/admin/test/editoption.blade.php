
<form action="{{ adminUrl(['controller'=>'test','action'=>'editoption','id'=>$id]) }}" method="post">
  @csrf  <div class="mb-3">
        <label for="option">{{ __lang('option') }}</label>
        {{ formElement($option) }}
    </div>
    <div class="mb-3">
        <label for="is_correct">{{ __lang('is-correct-option') }}</label>
        {{ formElement($select) }}
    </div>
    <button class="btn btn-primary w-100" type="submit">{{__lang('save')}}</button>
</form>
