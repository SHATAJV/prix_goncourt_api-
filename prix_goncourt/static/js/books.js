
$(document).ready(function() {

    $('#load-books').click(function() {

        $('#books').html('<p>Chargement...</p>');


        $.ajax({
            url: '/api/books',
            method: 'GET',
            dataType: 'json',
            success: function(data) {

                let html = '<table><thead><tr><th>ID</th><th>Titre</th><th>Auteur</th></tr></thead><tbody>';
                data.forEach(function(book) {
                    html += `<tr>
                                <td>${book.id_book}</td>
                                <td>${book.title}</td>
                                <td>${book.author}</td>
                             </tr>`;
                });
                html += '</tbody></table>';
                $('#books').html(html);
            },
            error: function(xhr, status, error) {

                $('#books').html('<p>Erreur lors du chargement des livres.</p>');
            }
        });
    });


    $('#load-books-by-date').click(function() {
    let date = $('#selection-date').val();

   
    if (!date) {
        alert('Veuillez choisir une date de sélection.');
        return;
    }


    $('#books').html('<p>Chargement...</p>');


    $.ajax({
        url: '/api/selection/date/' + date,
        method: 'GET',
        dataType: 'json',
        success: function(data) {

                let html = '<table><thead><tr><th>ID</th><th>Titre</th><th>Auteur</th></tr></thead><tbody>';
                data.forEach(function(book) {
                    html += `<tr>
                                <td>${book.id_book}</td>
                                <td>${book.title}</td>
                                <td>${book.author}</td>
                             </tr>`;
                });
                html += '</tbody></table>';
                $('#books').html(html);
            },

        error: function(xhr, status, error) {
            $('#books').html('<p>Erreur lors du chargement des livres pour cette date.</p>');
        }
    });
});

});
