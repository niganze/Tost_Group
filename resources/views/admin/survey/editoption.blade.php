
<form action="{{ adminUrl(['controller'=>'survey','action'=>'editoption','id'=>$id]) }}" method="post">
 @csrf   <div class="mb-3">
        <label for="option">{{ __lang('option') }}</label>
        {{ formElement($option) }}
    </div>
    <button class="btn btn-primary w-100" type="submit">{{__lang('save')}}</button>
</form>
