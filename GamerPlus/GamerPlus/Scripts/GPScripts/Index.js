
var fullurl = location.protocol + '//' + location.hostname + (location.port ? ":" + location.port : '') + '/';
var globalconsoleID = 1;
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
});

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
            $('.gamelist_').children().remove();
            $('.gamelist_').html(data);
        },
        error: function (response) { console.log(response.responseText); },
        failure: function (response) { console.log(response.responseText); }
    });
}