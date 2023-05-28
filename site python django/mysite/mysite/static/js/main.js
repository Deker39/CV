// product_page.html and search_product.html
        $('[id^="card-"]').click(function() {
        let cardId = $(this).attr('id');
        let link = cardId.slice(5)
        window.location.href = link;
         });
// -------------------- //
// personal_page.html
    $('#change').click(function() {
        $('.secret').toggle();
        $('.non-secret').toggle();
    })
// -------------------- //

// main_page.html
    $('.carousel-item').first().addClass('active')

    $('[id^="main-card-"]').click(function() {
    let cardId = $(this).attr('id');
    let link = cardId.slice(10)
    window.location.href = link;
     });
// -------------------- //
// checkout _page.html
    const expireDateInput = document.getElementById('expireDateInput');

        expireDateInput.addEventListener('input', function(event) {
          const input = event.target;
          const inputValue = input.value;

          if (inputValue.length === 2) {
            input.value = inputValue + '/';
          }
        });
// -------------------- //
