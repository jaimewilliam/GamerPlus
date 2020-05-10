
var globalLetter = "All";
function Select(clickedDiv) {
    $('.console_leftdiv').css('background-color', '');
    $('.console_rightdiv').css('background-color', '');
    $(clickedDiv).find('.console_leftdiv').css('background-color', '#fff');
    $(clickedDiv).find('.console_rightdiv').css('background-color', 'rgba(0, 0, 0, 0.5)');
    $('.rightside').animate({ scrollTop: 0 }, "slow");
    
    var consoleid = $(clickedDiv).find(".consolename").attr("data-consoleId");
    globalconsoleID = consoleid;

    $.ajax({
        url: "Home/Carousel",
        data: {
            consoleId: consoleid
        },
        type: 'GET',
        async: false,
        contentType: 'application/json; charset=utf-8',
        cache: true,
        success: function (data) {
            $('.carousel_main').children().remove();
            $('.carousel_main').html(data);
            $('.Simage').children().eq(0).appendTo($('.Simage'));

            $.ajax({
                url: "Home/GenreList",
                data: {
                    consoleId: consoleid,
                    alpa: globalLetter
                },
                type: 'GET',
                async: false,
                contentType: 'application/json; charset=utf-8',
                cache: true,
                success: function (data) {
                    $('.gamelist').children().remove();
                    $('.gamelist').html(data);
                    var countgenremain_div2 = $(".genremain_div2");
                    for (var i = 0; i < countgenremain_div2.length; i++) {
                        var thisGenre = countgenremain_div2[i];
                        var countimagemain_div0 = $(thisGenre).find(".imagemain_div0");
                        if (parseInt($(countimagemain_div0).css("width")) - 2 < parseInt($(thisGenre).css("width"))) {
                            $(thisGenre).find(".floatbtn1_div").css('display', 'none');
                            $(thisGenre).find(".floatbtn2_div").css('display', 'none');
                        }
                        else {
                            $(thisGenre).find(".floatbtn1_div").css('display', 'block');
                            $(thisGenre).find(".floatbtn2_div").css('display', 'block');
                        }
                    }
                },
                error: function (response) { console.log(response.responseText); },
                failure: function (response) { console.log(response.responseText); }
            });

            $.ajax({
                url: "Home/AllGameList",
                data: {
                    consoleId: consoleid,
                    alpa: globalLetter
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
        },
        error: function (response) { console.log(response.responseText); },
        failure: function (response) { console.log(response.responseText); }
    });
}

$(document).ready(function () {
    var consolname_div = $(".consolname_div");
    for (var i = 0; i < consolname_div.length; i++) {
        var consolname_divarr = consolname_div[0];
        $(consolname_divarr).find('.console_leftdiv').css('background-color', '#fff');
        $(consolname_divarr).find('.console_rightdiv').css('background-color', 'rgba(0, 0, 0, 0.5)');
    }
});