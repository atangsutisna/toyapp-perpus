$('document').ready(function(){
    var api_uri = app.base_uri + app.base_path + '/api';
    $('#tenant').select2({
        theme: 'bootstrap',
        escapeMarkup: function(markup) {
            return markup;
        },
        templateResult: function(data) {
            return data.html;
        },
        templateSelection: function(data) {
            return data.text;
        },
        ajax: {
            url: api_uri + '/tenant',
            dataType: 'json',
            data: function(params) {
                return {
                    search: {
                        value: params.term
                    },
                    page: params.page || 1,
                    length: 25,
                    draw: 1
                }
            },
            processResults: function(response) {
                var data = response.data.map(function(raw) {
                    return {
                        id: raw.id,
                        text: raw.organization_name,
                        html: raw.organization_name + '<br/>\
                        <em>'+ raw.tenant +'</em>'
                    }
                });

                return {
                    results: data,
                    pagination: {
                        more: true
                    }
                }
            }
        }
    });    
});