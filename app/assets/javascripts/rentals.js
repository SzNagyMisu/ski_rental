function Rental() {

    var eventClass = '.rental',
        $query_rental,
        $days, $price,
        payed_days, daily_price;

    construct();

    function construct() {
        $query_rental = $('#query_rental').off(eventClass).on('click' + eventClass, ':submit', submitQueryForm);

        $days = $('#rental_days').off(eventClass).on('change' + eventClass, countPrice);
        $price = $('#rental_price');
        payed_days = $days.data('payed');
        daily_price = $price.data('daily');
    }


    function submitQueryForm(e) {
        // see problem (turbolilnks vs form in table) here:
        // http://stackoverflow.com/questions/22281918/rails-turbolinks-break-submit-remote-form#22282497
        e.preventDefault();
        $query_rental.find('form').submit();
    }

    function countPrice() {
        $price.val(($days.val() - payed_days) * daily_price);
    }

}



var rental;

$(document).on('turbolinks:load', function () {
    if ($('body').hasClass('rentals')) rental = new Rental();
});
