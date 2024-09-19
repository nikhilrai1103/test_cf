$(document).ready(function () {
    $("#login").click(function (e) {
        e.preventDefault();
        validateloginform();
    });

    function validateloginform() {

        //username valdation
        const userReg = /^[A-Za-z]+$/;

        const user = $("#user").val();
        const erruser = $("#euser");
        console.log(user)
        if (userReg.test(user)) {
            console.log(user);
        }
        else {
            erruser.text("must be alphabet");
            erruser.css("color", "red");
            erruser.css("fontSize", "small");
        }
        if (user == "") {
            erruser.text("Must be filled");
        }
        else {
            erruser.text("");
        }


        //email validation
        const emailReg = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        const email = $("#email").val();
        const erremail = $("#eemail");
        if (emailReg.test(email)) {
            erremail.text("");
            console.log(email);
        }
        else {
            erremail.text("Provide valid email");
            erremail.css("color", "red");
            erremail.css("fontSize", "small");
        }
        if (email == "") {
            erremail.text("Must be filled");
        }

        //password validation
        const pswReg = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[a-zA-Z]).{6,}$/;
        var psw = $("#psw").val();
        const errpsw = $("#epsw");
        if (pswReg.test(psw)) {
            errpsw.text("");
            console.log(psw);
        }
        else {
            errpsw.text("Altleast 6 digit with upper lower and mix characters");
            errpsw.css("color", "red");
            errpsw.css("fontSize", "small");
        }
        if (psw == "") {
            errpsw.text("Must be filled");
        }

        //current password validation
        const cpsw = $("#cpsw").val();
        var psw = $("#psw").val();
        const errcpsw = $("#ecpsw");

        if (cpsw === psw) {
            console.log(cpsw);
            errcpsw.text("");

        }
        else {
            errcpsw.text("Password and confirm password should be same");
            errcpsw.css("color", "red");
            errcpsw.css("fontSize", "small");
        }

    }

});
