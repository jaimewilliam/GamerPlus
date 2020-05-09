

var fullurl = location.protocol + '//' + location.hostname + (location.port ? ":" + location.port : '') + '/';
var globalconsoleID = 1;
//var animInterval;

$(document).ready(function () {

    

    var letters = ["All", "A", "B", "C", "D", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"];
    for (var i = 0; i < letters.length; i++) {
        var letterdiv = $('<div class="letter_div0" onclick="SelectLetter(this);">' +
            '<span class="letter">' + letters[i] + '</span>' +
            '</div>');
        $(".letters_div").append(letterdiv);
    }

    
    $("#btnTitle").unbind('click').on('click', function () {
        $(".gamelist").css('display', 'none');
        $(".gamelist_").css('display', 'block');
    });

    $("#btnGenre").unbind('click').on('click', function () {
        $(".gamelist").css('display', 'block');
        $(".gamelist_").css('display', 'none');
    });


    //$('.Simage').children().eq(0).appendTo($('.Simage'));
    //carousel();
    //$("#carouselmain").unbind("mouseenter").on("mouseenter", function () {
    //    $(".div_imgdetails").css({ 'bottom': '0', 'transition': '0.5s ease-in' });
    //    clearInterval(animInterval);
    //}).unbind("mouseleave").on("mouseleave", function () {
    //    $(".div_imgdetails").css({ 'bottom': '-20%', 'transition': '0.5s ease-out' });
    //    carousel();
    //});

});

//function carousel() {

//    animInterval = setInterval(function () {

//        $('.Limage').css({ 'top': '-100%', 'transition': '1s' });
//        setTimeout(function () {
//            $('.Limage').children().eq(0).appendTo($('.Limage'));
//            $('.Limage').css({ 'top': '0', 'transition': '0s' });
//        }, 1000);

//        $('.Simage').css({ 'top': '-33%', 'transition': '1s' });
//        setTimeout(function () {
//            $('.Simage').children().eq(0).appendTo($('.Simage'));
//            $('.Simage').css({ 'top': '0', 'transition': '0s' });
//        }, 1000);

//    }, 5000);
//}

function SelectLetter(letter_div0) {


    var letter = $(letter_div0).find(".letter").html();
    globalLetter = letter;


    $.ajax({
        url: "Home/GenreList",
        data: {
            consoleId: globalconsoleID,
            alpa: letter
        },
        type: 'GET',
        async: false,
        contentType: 'application/json; charset=utf-8',
        cache: true,
        success: function (data) {
            //console.log(data);

            $('.gamelist').children().remove();
            $('.gamelist').html(data);
        },
        error: function (response) { console.log(response.responseText); },
        failure: function (response) { console.log(response.responseText); }
    });

    $.ajax({
        url: "Home/AllGameList",
        data: {
            consoleId: globalconsoleID,
            alpa: letter
        },
        type: 'GET',
        async: false,
        contentType: 'application/json; charset=utf-8',
        cache: true,
        success: function (data) {
            //console.log(data);

            $('.gamelist_').children().remove();
            $('.gamelist_').html(data);
        },
        error: function (response) { console.log(response.responseText); },
        failure: function (response) { console.log(response.responseText); }
    });

}