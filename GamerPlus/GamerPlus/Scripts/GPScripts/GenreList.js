

$(window).resize(function () {
    var countgenremain_div2 = $(".genremain_div2");
    for (var i = 0; i < countgenremain_div2.length; i++) {
        var thisGenre = countgenremain_div2[i];

        var countimagemain_div0 = $(thisGenre).find(".imagemain_div0");
        //alert($(countimagemain_div0).css("width") + ',' + $(thisGenre).css("width"));
        if (parseInt($(countimagemain_div0).css("width")) - 2 < parseInt($(thisGenre).css("width"))) {
            $(thisGenre).find(".floatbtn1_div").css('display', 'none');
            $(thisGenre).find(".floatbtn2_div").css('display', 'none');
        }
        else {
            $(thisGenre).find(".floatbtn1_div").css('display', 'block');
            $(thisGenre).find(".floatbtn2_div").css('display', 'block');
        }
    }
});

$(document).ready(function () {

    var countgenremain_div2 = $(".genremain_div2");
    for (var i = 0; i < countgenremain_div2.length; i++) {
        var thisGenre = countgenremain_div2[i];

        var countimagemain_div0 = $(thisGenre).find(".imagemain_div0");
        //alert($(countimagemain_div0).css("width") + ',' + $(thisGenre).css("width"));
        if (parseInt($(countimagemain_div0).css("width")) - 2 < parseInt($(thisGenre).css("width"))) {
            $(thisGenre).find(".floatbtn1_div").css('display', 'none');
            $(thisGenre).find(".floatbtn2_div").css('display', 'none');
        }
        else {
            $(thisGenre).find(".floatbtn1_div").css('display', 'block');
            $(thisGenre).find(".floatbtn2_div").css('display', 'block');
        }
    }

});


var clicked = false;

function Prev(btnPrev) {
    var previmagemain_div0Width = (parseFloat($(btnPrev).parent().parent().find(".imagemain_div0").css('width')) / $(btnPrev).parent().parent().find(".imagemain_div0").children().length);

    if (clicked === false) {
        clicked = true;
        var leftpos = $(btnPrev).parent().parent().find(".imagemain_div0").css('left');
        var leftpos0 = parseFloat(leftpos);

        if (leftpos0 !== 0) {
            $(btnPrev).parent().parent().find(".imagemain_div0").css({
                'left': '+=' + previmagemain_div0Width + 'px', 'transition': '1s'
            });
            $(btnPrev).parent().parent().find(".floatbtn2_div").css({ 'visibility': 'visible', 'opacity': '1' });

            $(btnPrev).parent().parent().unbind("mouseenter").on("mouseenter", function () {
                $(btnPrev).parent().parent().find(".floatbtn1_div").css({ 'visibility': 'visible', 'opacity': '1' });
                $(btnPrev).parent().parent().find(".floatbtn2_div").css({ 'visibility': 'visible', 'opacity': '1' });
            }).unbind("mouseleave").on("mouseleave", function () {
                $(btnPrev).parent().parent().find(".floatbtn1_div").css({ 'visibility': 'hidden', 'opacity': '0' });
                $(btnPrev).parent().parent().find(".floatbtn2_div").css({ 'visibility': 'hidden', 'opacity': '0' });
            });
        }
        //alert(leftpos0 + previmagemain_div0Width);
        if (leftpos0 + (previmagemain_div0Width + 1) >= 0) {

            $(btnPrev).parent().parent().find(".floatbtn1_div").css({ 'visibility': 'hidden', 'opacity': '0' });

            $(btnPrev).parent().parent().unbind("mouseenter").on("mouseenter", function () {
                $(btnPrev).parent().parent().find(".floatbtn2_div").css({ 'visibility': 'visible', 'opacity': '1' });
            }).unbind("mouseleave").on("mouseleave", function () {
                $(btnPrev).parent().parent().find(".floatbtn2_div").css({ 'visibility': 'hidden', 'opacity': '0' });
            });
        }

        setTimeout(function () {
            clicked = false;
        }, 1000);
    }

}

function Next(btnNext) {
    var nextimagemain_div0Width = (parseFloat($(btnNext).parent().parent().find(".imagemain_div0").css('width')) / $(btnNext).parent().parent().find(".imagemain_div0").children().length);
    //$(btnNext).parent().parent().find(".imagemain_div0").css({ 'left': '-=169px', 'transition': '1s' });

    if (clicked === false) {
        clicked = true;

        var width1 = $(btnNext).parent().parent().css('width');
        var width2 = $(btnNext).parent().parent().find(".imagemain_div0").css('width');
        var leftpos = $(btnNext).parent().parent().find(".imagemain_div0").css('left');
        var newwidth2 = parseFloat(width2) - Math.abs(parseFloat(leftpos)) + 'px';

        //alert(newwidth2 + ', ' + width1);
        if (parseFloat(newwidth2) > parseFloat(width1)) {
            //$(btnNext).parent().parent().parent().find(".imagemain_div0").css({ 'left': '-=165px', 'transition': '1s' });
            $(btnNext).parent().parent().find(".imagemain_div0").css({
                'left': '-=' + nextimagemain_div0Width + 'px',
                'transition': '1s'
            });
            $(btnNext).parent().parent().find(".floatbtn1_div").css({ 'visibility': 'visible', 'opacity': '1' });

            $(btnNext).parent().parent().unbind("mouseenter").on("mouseenter", function () {
                $(btnNext).parent().parent().find(".floatbtn1_div").css({ 'visibility': 'visible', 'opacity': '1' });
                $(btnNext).parent().parent().find(".floatbtn2_div").css({ 'visibility': 'visible', 'opacity': '1' });
            }).unbind("mouseleave").on("mouseleave", function () {
                $(btnNext).parent().parent().find(".floatbtn1_div").css({ 'visibility': 'hidden', 'opacity': '0' });
                $(btnNext).parent().parent().find(".floatbtn2_div").css({ 'visibility': 'hidden', 'opacity': '0' });
            });
        }
        //alert(parseFloat(newwidth2) - nextimagemain_div0Width + ',' + parseFloat(width1));
        if (parseFloat(newwidth2) - (nextimagemain_div0Width + 5) <= parseFloat(width1)) {
            $(btnNext).parent().parent().find(".floatbtn2_div").css({ 'visibility': 'hidden', 'opacity': '0' });

            $(btnNext).parent().parent().unbind("mouseenter").on("mouseenter", function () {
                $(btnNext).parent().parent().find(".floatbtn1_div").css({ 'visibility': 'visible', 'opacity': '1' });
            }).unbind("mouseleave").on("mouseleave", function () {
                $(btnNext).parent().parent().find(".floatbtn1_div").css({ 'visibility': 'hidden', 'opacity': '0' });
            });
        }

        setTimeout(function () {
            clicked = false;
        }, 1000);
    }


}