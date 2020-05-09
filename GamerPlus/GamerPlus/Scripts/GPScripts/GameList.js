﻿

var fullurl = location.protocol + '//' + location.hostname + (location.port ? ':' + location.port : '') + '/';

$(document).ready(function () {

});

function ChooseGame(chooseG) {

    var gid = $(chooseG).find(".gameimage").attr("data-gameid");

    $.ajax({
        url: "Home/GameDetails",
        data: {
            gameid: gid
        },
        type: 'GET',
        async: false,
        contentType: 'application/json; charset=utf-8',
        cache: true,
        success: function (data) {
            //console.log(data);

            $('.modalMain').css("display", "block");
            setTimeout(function () {
                $(".modalMain").css('opacity', '1');
                $(".modalMain").css('transition', '0.5s');

                setTimeout(function () {
                    $('.modalGameDetails').css({
                        'opacity': '1',
                        'transition': '0.5s'
                    });
                }, 500);

            }, 200);

            $('.modalGameDetails').children().not('.closeModal').remove();
            //TODO: Convert object to HTML
            var olddata = $('.closeModal').get(0).outerHTML;
            $('.modalGameDetails').html(data + olddata);


            $.ajax({
                url: "Home/GamePreview",
                data: {
                    gameid: gid
                },
                type: 'GET',
                async: false,
                contentType: 'application/json; charset=utf-8',
                cache: true,
                success: function (data) {
                    //console.log(data);
                    $('.detailbody_div').children().remove();
                    $('.detailbody_div').html(data);
                },
                error: function (response) { console.log(response.responseText); },
                failure: function (response) { console.log(response.responseText); }
            });
        },
        error: function (response) { console.log(response.responseText); },
        failure: function (response) { console.log(response.responseText); }
    });

}