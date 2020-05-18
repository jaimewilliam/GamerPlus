function AddtoCart(addtocart) {
    $('.bagModalMain').css("display", "block");
    setTimeout(function () {
        $(".bagModalMain").css({ 'opacity': '1', 'transition': '0.5s' });
        setTimeout(function () {
            $('.bagModal').css({'top': '45%','transition': '0.5s ease-in'});
            setTimeout(function () {
                $('.bagModal').css({
                    'top': '50%',
                    'transition': '0.5s ease-in'
                });
            }, 600);
            $('.reddot').css('display', 'block');

            //setTimeout(function () {
            //    $(".bagModal").css({
            //        'opacity': '0',
            //        'transition': '0.5s ease-out'
            //    });
            //    setTimeout(function () {
            //        $('.bagModalMain').css({
            //            'opacity': '0',
            //            'transition': '0.5s ease-out',
            //            'display': 'none'
            //        });
            //    }, 500);
            //}, 4000);
        }, 500);
    }, 200);
}

var clicked = false;

function PrevSS(detailbtnPrev) {
    var gameprev_mainWidthprev = parseFloat($(detailbtnPrev).parent().parent().find(".gameprev_main").css('width')) / parseFloat($(detailbtnPrev).parent().parent().find(".gameprev_main").children().length);
    if (clicked === false) {
        clicked = true;
        var leftpos = $(detailbtnPrev).parent().parent().find(".gameprev_main").css('left');
        var leftpos0 = parseFloat(leftpos);
        if (leftpos0 !== 0) {
            $(detailbtnPrev).parent().parent().find(".gameprev_main").css({
                'left': '+=' + gameprev_mainWidthprev + 'px', 'transition': '1s'
            });
            $(detailbtnPrev).parent().parent().find(".detailbtn2_div").css({ 'visibility': 'visible', 'opacity': '1' });
            $(detailbtnPrev).parent().parent().unbind("mouseenter").on("mouseenter", function () {
                $(detailbtnPrev).parent().parent().find(".detailbtn1_div").css({ 'visibility': 'visible', 'opacity': '1' });
                $(detailbtnPrev).parent().parent().find(".detailbtn2_div").css({ 'visibility': 'visible', 'opacity': '1' });
            }).unbind("mouseleave").on("mouseleave", function () {
                $(detailbtnPrev).parent().parent().find(".detailbtn1_div").css({ 'visibility': 'hidden', 'opacity': '0' });
                $(detailbtnPrev).parent().parent().find(".detailbtn2_div").css({ 'visibility': 'hidden', 'opacity': '0' });
            });
        }
        if (leftpos0 + (gameprev_mainWidthprev + 1) >= 0) {
            $(detailbtnPrev).parent().parent().find(".detailbtn1_div").css({ 'visibility': 'hidden', 'opacity': '0' });
            $(detailbtnPrev).parent().parent().unbind("mouseenter").on("mouseenter", function () {
                $(detailbtnPrev).parent().parent().find(".detailbtn2_div").css({ 'visibility': 'visible', 'opacity': '1' });
            }).unbind("mouseleave").on("mouseleave", function () {
                $(detailbtnPrev).parent().parent().find(".detailbtn2_div").css({ 'visibility': 'hidden', 'opacity': '0' });
            });
        }
        setTimeout(function () {
            clicked = false;
        }, 1000);
    }
}

function NextSS(detailbtnNext) {
    var gameprev_mainWidth = parseFloat($(detailbtnNext).parent().parent().find(".gameprev_main").css('width')) / parseFloat($(detailbtnNext).parent().parent().find(".gameprev_main").children().length);
    if (clicked === false) {
        clicked = true;
        var widthdetailbody_div0 = $(detailbtnNext).parent().parent().css('width');
        var widthgameprev_main = $(detailbtnNext).parent().parent().find(".gameprev_main").css('width');
        var moveleft = $(detailbtnNext).parent().parent().find(".gameprev_main").css('left');
        var newwidthgameprev_main = parseFloat(widthgameprev_main) - Math.abs(parseFloat(moveleft)) + 'px';
        if (parseFloat(newwidthgameprev_main) > parseFloat(widthdetailbody_div0)) {
            $(detailbtnNext).parent().parent().find(".gameprev_main").css({ 'left': '-=' + gameprev_mainWidth + 'px', 'transition': '1s' });
            $(detailbtnNext).parent().parent().find(".detailbtn1_div").css({ 'visibility': 'visible', 'opacity': '1' });
            $(detailbtnNext).parent().parent().unbind("mouseenter").on("mouseenter", function () {
                $(detailbtnNext).parent().parent().find(".detailbtn1_div").css({ 'visibility': 'visible', 'opacity': '1' });
                $(detailbtnNext).parent().parent().find(".detailbtn2_div").css({ 'visibility': 'visible', 'opacity': '1' });
            }).unbind("mouseleave").on("mouseleave", function () {
                $(detailbtnNext).parent().parent().find(".detailbtn1_div").css({ 'visibility': 'hidden', 'opacity': '0' });
                $(detailbtnNext).parent().parent().find(".detailbtn2_div").css({ 'visibility': 'hidden', 'opacity': '0' });
            });
        }

        if (parseFloat(newwidthgameprev_main) - gameprev_mainWidth < parseFloat(widthdetailbody_div0)) {
            $(detailbtnNext).parent().parent().find(".detailbtn2_div").css({ 'visibility': 'hidden', 'opacity': '0' });
            $(detailbtnNext).parent().parent().unbind("mouseenter").on("mouseenter", function () {
                $(detailbtnNext).parent().parent().find(".detailbtn1_div").css({ 'visibility': 'visible', 'opacity': '1' });
            }).unbind("mouseleave").on("mouseleave", function () {
                $(detailbtnNext).parent().parent().find(".detailbtn1_div").css({ 'visibility': 'hidden', 'opacity': '0' });
            });
        }
        setTimeout(function () {
            clicked = false;
        }, 1000);
    }


}