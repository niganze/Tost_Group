
<?php $__env->startSection('pageTitle',$pageTitle); ?>
<?php $__env->startSection('innerTitle',$pageTitle); ?>
<?php $__env->startSection('breadcrumb'); ?>
    <?php echo $__env->make('admin.partials.crumb',[
    'crumbs'=>[
            route('student.dashboard')=>__lang('dashboard'),
            '#'=>$pageTitle
        ]], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
<?php $__env->stopSection(); ?>

<?php $__env->startSection('content'); ?>




        <div class="d-md-none d-lg-none">
        <?php  foreach($paginator as $row):  ?>
            <div class="card">
                <div class="card-header">
                    <h3 class="card-title"><?php echo e($row->certificate_name); ?></h3>
                </div>
                <div class="card-body">
                    <table class="table table-striped">
                        <tr>
                            <td><?php echo e(__lang('Document Name')); ?></td>
                        </tr>
                        <tr>
                            <td><strong><?php echo e($row->certificate_name); ?></strong>
                                <p><?php echo clean($row->description); ?></p></td>
                        </tr>
                        <tr>
                            <td><?php echo e(__lang('course-session')); ?></td>
                        </tr>
                        <tr>
                            <td><?php echo e($row->name); ?></td>
                        </tr>
                        <tr>
                            <td><?php echo e(__lang('classes-required')); ?></td>
                        </tr>
                        <tr>
                            <td><?php  $tl= $clTable->getTotalForCertificate($row->certificate_id); echo (empty($tl))? __lang('None'):$tl;  ?></td>
                        </tr>
                        <tr>
                            <td><?php echo e(__lang('Tests Required')); ?></td>
                        </tr>
                        <tr>
                            <td><?php  $tt= $ctTable->getTotalForCertificate($row->certificate_id); echo (empty($tt))? __lang('None'):$tt;  ?></td>
                        </tr>
                        <tr>
                            <td> <?php  if(false): ?>
                                    <a  onclick="return window.open('<?php echo e(route('student.student.certificate',['id'=>$row->certificate_id])); ?>', '_blank', 'toolbar=no,scrollbars=yes,resizable=yes,top=100,left=100,width=<?php echo e(($row->orientation=='l')? '862':'615'); ?>,height=<?php echo e(($row->orientation=='l')? '615':'882'); ?>')"  href="#" class="btn btn-primary " ><i class="fa fa-eye"></i> <?php echo e(__lang('View')); ?></a>
                                <?php  endif;  ?>
                                <a href="<?php echo e(route('student.student.downloadcertificate',['id'=>$row->certificate_id])); ?>" class="btn btn-primary " ><i class="fa fa-download"></i> <?php echo e(__lang('Download')); ?></a>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        <?php  endforeach;  ?>
    </div>
        <div class="card d-none d-sm-none d-md-block">
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-hover">
                    <thead>
                    <tr>
                        <th><?php echo e(__lang('Document Name')); ?></th>
                        <th><?php echo e(__lang('course-session')); ?></th>
                        <th><?php echo e(__lang('Classes Required')); ?></th>
                        <th><?php echo e(__lang('Tests Required')); ?></th>
                        <th class="text-right1" ><?php echo e(__lang('Actions')); ?></th>
                    </tr>
                    </thead>
                    <tbody>
                    <?php  foreach($paginator as $row):  ?>
                    <tr>

                        <td class="pt-3"><h5><?php echo e($row->certificate_name); ?></h5>
                            <p><?php echo $row->description; ?>   </p>
                        </td>
                        <td><?php echo e($row->name); ?></td>
                        <td><?php  $tl= $clTable->getTotalForCertificate($row->certificate_id); echo (empty($tl))? __lang('None'):$tl;  ?></td>
                        <td><?php  $tt= $ctTable->getTotalForCertificate($row->certificate_id); echo (empty($tt))? __lang('None'):$tt;  ?></td>
                        <td class="text-center">
                         <?php if($row->payment_required==1 && !hasCertificatePayment($row->certificate_id)): ?>
                                <strong><?php echo e(price($row->price)); ?></strong>
                                <a href="<?php echo e(route('cart.add-certificate',['certificate'=>$row->certificate_id])); ?>" class="btn btn-success"><i class="fa fa-cart-plus"></i> <?php echo e(__lang('make-payment')); ?></a>
                             <?php else: ?>
                            <a href="<?php echo e(route('student.student.downloadcertificate',['id'=>$row->certificate_id])); ?>" class="btn btn-primary " ><i class="fa fa-download"></i> <?php echo e(__lang('Download')); ?></a>
                            <?php endif; ?>
                        </td>

                    </tr>


                    <?php  endforeach;  ?>

                    </tbody>
                </table>
            </div>
            <?php
                // add at the end of the file after the table
                echo paginationControl(
                // the paginator object
                    $paginator,
                    // the scrolling style
                    'sliding',
                    // the partial to use to render the control
                    null,
                    // the route to link to when a user clicks a control link
                    route('student.student.certificates')

                );
            ?>
        </div>
        </div>




<!--container ends-->
<script>
    function openPop(url,width,height){
        window.open(url, "_blank", "toolbar=no,scrollbars=yes,resizable=yes,top=100,left=100,width="+width+",height="+height+"");
        return false;
    }
</script>
<?php $__env->stopSection(); ?>

<?php echo $__env->make('layouts.student', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH C:\Users\ALAIN\Desktop\traineasy\traineasy\traineasy\resources\views/student/student/certificates.blade.php ENDPATH**/ ?>