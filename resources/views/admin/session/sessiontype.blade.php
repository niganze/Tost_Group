 <form method="post" action="{{ adminUrl(['controller'=>'session','action'=>'sessiontype','id'=>$id]) }}" >
    @csrf
     <div class="mb-3">
     {{ formElement($select) }}
    </div>
<button type="submit" class="btn btn-primary">{{ __lang('submit') }}</button>
</form>
