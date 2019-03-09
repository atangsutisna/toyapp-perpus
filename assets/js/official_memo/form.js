var base_uri = window.location.origin;
$('#id_rek_belanja').on('change', function(){
    var id = $(this).val();
    $.ajax({
        type: "GET",
        url: base_uri + "/ajax_dest/show_destination_choices/" + id,
        success: function(data, textStatus, jqXHR) {
            $('#destination_choices').html(data);
        },
        error: function(jqXHR, textStatus, errorThrown) {
            if (jqXHR.status == 500) {
                alert('Internal server error');
            }
        },
    });     
});