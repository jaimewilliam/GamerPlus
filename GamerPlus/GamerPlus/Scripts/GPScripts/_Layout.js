
function closeModal() {
    setTimeout(function () {
        $(".modalGameDetails").css({
            'opacity': '0',
            'transition': '0.5s ease-out'
        });
        setTimeout(function () {
            $('.modalMain').css({
                'opacity': '0',
                'transition': '0.5s ease-out',
                'display': 'none'
            });
        }, 500);
    }, 200);
}