window.addEventListener('message', function(event) {

    let wallet = event.data.wallet;
    let blackMoney = event.data.black_money;
    let bank = event.data.bank;
    let society = event.data.society;
    let control = event.data.control;

    $("#bank").text(bank);
    $("#wallet").text(wallet);
    $("#blackMoney").text(blackMoney);
    $("#society").text(society);

    let display = false;


    if (event.data.control === 'k' && display === false) {

        display = true;
        $('#wrapperHUD').animate({
                marginLeft: "-8px",
                opacity: "1.0"
            },
            300,
            function() {

            });
        window.setTimeout(function() {
            $('#bank, #wallet, #blackMoney, #society').fadeIn(500);
        }, 300);

        window.setTimeout(function() {
            display = false;
            $('#wrapperHUD').animate({
                    marginLeft: "-20vw",
                    opacity: "0"
                },
                200,
                function() {

                });
            window.setTimeout(function() {
                $('#bank, #wallet, #blackMoney, #society').fadeOut(300);
            }, 300);

        }, 3000)
    }

});