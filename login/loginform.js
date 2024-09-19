$(document).ready(function () {
    $("#login").click(function (e) {
        // e.preventDefault();
        return validateloginform();
    });


    function validateloginform() {
        console.log('hello');
        //email validation
        const emailReg = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        const email = $("#email").val();
        const erremail = $("#eemail");

        if (email == "") {
            console.log("email is vacant");
            erremail.text("Must be filled");
            erremail.css("color", "red");
            erremail.css("fontSize", "small");
            return false;
        }
        else if (email != "") {
            if (!emailReg.test(email)) {
                console.log("email must valid");
                $("#eemail").text("Provide valid email");
                erremail.css("color", "red");
                erremail.css("fontSize", "small");
                return false;
            }
            else {
                console.log("valid email");
                erremail.text("");
            }
        }


        //password validation
        var password = jQuery.trim($("#psw").val());
        const epassword = $("#epsw");
        const pswReg = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[a-zA-Z]).{6,}$/;

        if (password == "") {
            console.log("provide passoword");
            epassword.text("must be filled");
            epassword.css("color", "red");
            epassword.css("fontSize", "small");
            return false;
        }
        else if (password != "") {
            if (!pswReg.test(password)) {
                console.log("weak password");
                epassword.text("weak password");
                epassword.css("color", "red");
                epassword.css("fontSize", "small");
                return false;
            }
            else {
                console.log("valid password");
                epassword.text("");

            }
        }
    }

});
