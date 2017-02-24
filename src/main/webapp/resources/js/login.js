/* OnPageLoad */
$(function () {
    $("#signinlink").click(function () {
        $('#signupbox').hide();
        $('#loginbox').show();
    });
    $("#signuplink").click(function () {
        $('#loginbox').hide();
        $('#signupbox').show();
    });
    /*$("#btn-singup").click(function () {
        var name = $("#name").val();
        var email = $("#email").val();
        var password = $("#password").val();

        $.ajax({
            type: "POST",
            url: "/ajax/profile",
            contentType: "application/json",
            data: JSON.stringify({
                name: name,
                email: email,
                password: password
            }),
            success: function(data) {

            }
        });
    });*/
});