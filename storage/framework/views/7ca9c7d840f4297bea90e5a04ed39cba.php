 <!-- Or your base layout -->

<?php $__env->startSection('content'); ?>
    <div class="container mx-auto">
        <?php if(session('status')): ?>
            <div class="alert alert-success">
                <?php echo e(session('status')); ?>

            </div>
        <?php endif; ?>

        <?php if(session('error')): ?>
            <div class="alert alert-danger">
                <?php echo e(session('error')); ?>

            </div>
        <?php endif; ?>

        <?php if($certificate): ?>
            <div class="modal bg-gray-100 p-8 rounded-lg shadow-md">
                <h2 class="text-2xl font-bold text-gray-800 mb-4">Certificate Details</h2>
                <p class="text-gray-600 mb-4">Here are the details of your certificate:</p>
                
                <div class="mb-4">
                    <strong>Name:</strong> <?php echo e($certificate->name); ?>

                </div>
                <div class="mb-4">
                    <strong>Session/Course:</strong> <?php echo e($certificate->course_name); ?>

                </div>
                <div class="mb-4">
                    <strong>Description:</strong> <?php echo e($certificate->description); ?>

                </div>
                <div class="mb-4">
                    <strong>Price:</strong> $<?php echo e(number_format($certificate->price, 2)); ?>

                </div>

                <button class="btn btn-primary" onclick="closeModal()">Close</button>
            </div>
        <?php endif; ?>
    </div>
<?php $__env->stopSection(); ?>

<?php $__env->startSection('scripts'); ?>
    <script>
        function closeModal() {
            // Logic to close the modal (you can use JavaScript, or just redirect back, depending on your preference)
            window.history.back();
        }
    </script>
<?php $__env->stopSection(); ?>

<?php echo $__env->make('layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH C:\Users\ALAIN\Desktop\traineasy\traineasy\traineasy\resources\views/site/certificate/details.blade.php ENDPATH**/ ?>