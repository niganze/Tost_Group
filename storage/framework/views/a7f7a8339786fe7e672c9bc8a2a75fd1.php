<div style="position: absolute;z-index:1;right: 20px">
  <!--[if BLOCK]><![endif]--><?php if($course->pinned==1): ?>
        <a wire:click="setPinned(0)"   data-bs-toggle="tooltip" data-bs-placement="top" title="<?php echo app('translator')->get('default.unpin-item'); ?>" href="javascript:;"><i class="fa fa-thumbtack"></i></a>

    <?php else: ?>
        <a wire:click="setPinned(1)"  class="text-light"  data-bs-toggle="tooltip" data-bs-placement="top" title="<?php echo app('translator')->get('default.pin-item'); ?>"  href="javascript:;"><i class="fa fa-thumbtack"></i></a>
    <?php endif; ?><!--[if ENDBLOCK]><![endif]-->
</div>
<?php /**PATH C:\Users\ALAIN\Desktop\traineasy\traineasy\traineasy\resources\views/livewire/admin/course/pinned-course.blade.php ENDPATH**/ ?>