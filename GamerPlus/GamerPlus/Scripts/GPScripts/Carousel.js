
var animInterval;

$(document).ready(function () {
    $('.Simage').children().eq(0).appendTo($('.Simage'));
    carousel();
    $("#carouselmain").unbind("mouseenter").on("mouseenter", function () {
        $(".div_imgdetails").css({ 'bottom': '0', 'transition': '0.5s ease-in' });
        clearInterval(animInterval);
    }).unbind("mouseleave").on("mouseleave", function () {
        $(".div_imgdetails").css({ 'bottom': '-20%', 'transition': '0.5s ease-out' });
        carousel();
    });
});

function carousel() {
    animInterval = setInterval(function () {
        $('.Limage').css({ 'top': '-100%', 'transition': '1s' });
        setTimeout(function () {
            $('.Limage').children().eq(0).appendTo($('.Limage'));
            $('.Limage').css({ 'top': '0', 'transition': '0s' });
        }, 1000);
        $('.Simage').css({ 'top': '-33%', 'transition': '1s' });
        setTimeout(function () {
            $('.Simage').children().eq(0).appendTo($('.Simage'));
            $('.Simage').css({ 'top': '0', 'transition': '0s' });
        }, 1000);
    }, 5000);
}