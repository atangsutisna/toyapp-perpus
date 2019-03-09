<script src="<?php echo base_url("assets/js/moment.min.js") ?>"></script>   
<!-- datatable --> 
<script src="<?php echo base_url("assets/vendor/data-tables/datatables.min.js") ?>"></script>
<!-- select2 -->
<script src="<?php echo base_url("assets/vendor/select2/js/select2.min.js") ?>"></script>
<script src="https://cdn.datatables.net/buttons/1.5.2/js/dataTables.buttons.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.36/pdfmake.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.36/vfs_fonts.js"></script>
<script src="https://cdn.datatables.net/buttons/1.5.2/js/buttons.html5.min.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<?php if (isset($js_resources)) : ?>
<?php foreach ($js_resources as $file_path) : ?>
<script src="<?php echo base_url($file_path) ?>"></script>
<?php endforeach; ?>
<?php endif; ?>