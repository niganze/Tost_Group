
<?php $__env->startSection('page-title',''); ?>
<?php $__env->startSection('breadcrumb'); ?>
    <?php echo $__env->make('admin.partials.crumb',[
    'crumbs'=>[
            route('admin.dashboard')=>__('default.dashboard'),
            '#'=>isset($pageTitle)?$pageTitle:''
        ]], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
<?php $__env->stopSection(); ?>

<?php $__env->startSection('content'); ?>
<div>

    <form id="filterform"  role="form"  method="get" action="<?php echo e(adminUrl(['controller'=>'certificate','action'=>'track'])); ?>">

<div class="row">
    <div class="mb-3 col-md-5">
        <input placeholder="<?php echo e(__lang('tracking-no-name-email')); ?>" class="form-control" type="text" name="query" id="query" value="<?php echo e(@$_GET['query']); ?>">
    </div>

    <div class="col-md-6">
        <button type="submit" class="btn btn-primary"> <i class="fa fa-search"></i> <?php echo e(__lang('search')); ?></button>
        <button type="button" onclick="$('#filterform input, #filterform select').val(''); $('#filterform').submit();" class="btn btn-inverse"><?php echo e(__lang('clear')); ?></button>

    </div>
</div>


    </form>
</div>
<?php if($paginator): ?>


<div>
    <table class="table table-striped">
        <thead>
        <tr>
            <th><?php echo e(__lang('student')); ?></th>
            <th><?php echo e(__lang('certificate')); ?></th>
            <th><?php echo e(__lang('course-session')); ?></th>
            <th><?php echo e(__lang('tracking-number')); ?></th>
            <th><?php echo e(__lang('downloaded-on')); ?></th>
        </tr>
        </thead>

        <tbody>

        <?php $__currentLoopData = $paginator; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $student): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
<?php
$certificate = \App\Certificate::find($student->certificate_id);
 ?>
            <tr>
                <td><a class="viewbutton" style="text-decoration: underline"   data-id="<?php echo e($student->student_id); ?>" data-bs-toggle="modal" data-bs-target="#simpleModal" href=""><?php echo e($student->name); ?> <?php echo e($student->last_name); ?></a></td>
                <td><?php echo e($certificate->name); ?></td>
                <td><?php echo e($certificate->course->name); ?></td>
                <td><?php echo e($student->tracking_number); ?></td>
                <td><?php echo e(showDate('d/M/Y',$student->created_at)); ?></td>
            </tr>

        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>

        </tbody>

    </table>

</div>
<div>
    <?php
    // add at the end of the file after the table
    paginationControl(
    // the paginator object
        $paginator,
        // the scrolling style
        'sliding',
        // the partial to use to render the control
        null,
        // the route to link to when a user clicks a control link
        array(
            'route' => 'admin/default',
            'controller'=>'certificate',
            'action'=>'track'
        )
    );
    ?>
</div>
<?php endif; ?>

<?php $__env->stopSection(); ?>

<?php $__env->startSection('footer'); ?>
    <!-- START SIMPLE MODAL MARKUP -->
    <div class="modal fade" id="simpleModal" tabindex="-1" role="dialog" aria-labelledby="simpleModalLabel" aria-hidden="true">
        <div class="modal-dialog  modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title" id="simpleModalLabel"><?php echo e(__lang('Student Details')); ?></h4>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-hidden="true">&times;</button>


                </div>
                <div class="modal-body" id="info">

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" data-bs-dismiss="modal"><?php echo e(__lang('close')); ?></button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->
    <!-- END SIMPLE MODAL MARKUP -->

    <script type="text/javascript">
        $(function(){
            $('.viewbutton').click(function(){
                $('#info').text('Loading...');
                var id = $(this).attr('data-id');
                $('#info').load('<?php echo e(url('admin/student/view')); ?>'+'/'+id);
            });
        });
    </script>

<?php $__env->stopSection(); ?>

<?php echo $__env->make('layouts.admin', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH C:\Users\ALAIN\Desktop\traineasy\traineasy\traineasy\resources\views/admin/certificate/track.blade.php ENDPATH**/ ?>