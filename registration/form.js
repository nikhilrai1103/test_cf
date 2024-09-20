$(document).ready(function () {
    $("#submit").click(function (e) {
        /*e.preventDefault();*/
        return validateform();
    });

    $("body").on("click", function () {
        console.log("body onclick event");
        const red = Math.floor(Math.random() * 256);
        const green = Math.floor(Math.random() * 256);
        const blue = Math.floor(Math.random() * 256);

        document.body.style.background = "rgb(" + red + ", " + green + ", " + blue + ")";

       //$(".body").css("background" ,"rgb(", red + ", " + green + ", " + blue+")");
    })


    $("#cpsw").on("input", function () {
        
        console.log("oninput");
        const password = jQuery.trim($("#psw").val());
        const confirm_password = $("#cpsw").val();
        const ecpw = $("#ecpsw")

        if (password != confirm_password) {
            $("#submit").prop("disabled", true);
            ecpw.text("wrong passwords");
            return false;
        }
        else {
            $("#submit").prop("disabled", false);
            ecpw.text("");
        }

    })

    //marital status and gender
    $("#hname").hide();
    $("#wname").hide();
    $("#father_name").hide();

    $("#ms").on("change", function () {
        console.log("onchange marital status");
        const ms = $("#ms").val();
        const gender = $('input[name="gender"]:checked').val();

        const male = $("#male").val();
        const female = $("#female").val();

        if (ms == "Married" && gender == male) {
            $("#hname").hide();
            $("#father_name").hide();
            $("#wname").show();
        }
        else if (ms == "Married" && gender == female) {
            $("#wname").hide();
            $("#father_name").hide();
            $("#hname").show();
        }
        else if (ms == "Unmarried") {
            $("#hname").hide();
            $("#wname").hide();
            $("#father_name").show();
        }
    })

    $('[name="gender"]').on("change", function () {

        const ms = $("#ms");
        ms.prop("selectedIndex",0);
        
    })

    function validateform() {

        console.log('hello')
        //firstname valdation
        const nameReg = /^[A-Za-z]+$/;
        const name = $("#name").val();
        const errname = $("#ename");

        if (name == "") {
            console.log("please fill");
            $("#ename").text("must be filled");
            errname.css("color", "red");
            errname.css("fontSize", "small");
            return false;
        }

        else if (name != "") {
            console.log("4344")
            if (!nameReg.test(name)) {
                console.log("must be alpha");
                $("#ename").text("must be alphabet");
                errname.css("color", "red");
                errname.css("fontSize", "small");
                return false;
            }
            else {
                console.log("valid name");
                $("#ename").text("");
            }
        }


        //lastname valdation
        const lnameReg = /^[A-Za-z]+$/;
        const lname = $("#lname").val();
        const errlname = $("#elname");
        console.log(lname)

        if (lname == "") {
            console.log("lastname vacant");
            $("#elname").text("Must be filled");
            errlname.css("color", "red");
            errlname.css("fontSize", "small");
            return false;
        }
        else if (lname != "") {

            if (!lnameReg.test(lname)) {
                console.log("name alpha");
                $("#elname").text("Must be alphabet");
                errlname.css("color", "red");
                errlname.css("fontSize", "small");
                return false;
            }
            else {
                console.log("valid lastname");
                $("#elname").text("");
            }
        }


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
                console.log("valid email")
                erremail.text("");
            }
        }


        //phone number validation
        const phoneReg = /^\d{10}$/;
        const phone = $("#mob").val();
        const errphone = $("#emob");

        if (phone == "") {
            errphone.text("must be filled");
            errphone.css("color", "red");
            errphone.css("fontSize", "small");
            return false;
        }
        else if (phone != "") {
            if (!phoneReg.test(phone)) {
                console.log(phone);
                $("#emob").text("must be 10 digit");
                errphone.css("color", "red");
                errphone.css("fontSize", "small");
                return false;
            }
            else {
                console.log("valid phone");
                $("#emob").text("");
            }

        }

        //dob validation
        var dob = $("#dob").val();
        var errdob = $("#edob");

        if (dob != "") {
            var today = new Date();
            var birthDate = new Date(dob);
            var age = today.getFullYear() - birthDate.getFullYear();
            var m = today.getMonth() - birthDate.getMonth();
            if (m < 0 || (m === 0 && today.getDate() < birthDate.getDate())) {
                age--;
            }
            if (age < 18) {
                console.log("underage");
                errdob.text("Underage");
                errdob.css("color", "red");
                errdob.css("fontSize", "small");
                return false;
            }
        }
        else if (dob == "") {
            console.log("dob be filled");
            errdob.text("Must be filled");
            errdob.css("color", "red");
            errdob.css("fontSize", "small");
            return false;
        }

        //gender validation
        var gender = $('input[name="gender"]:checked').val();
        var errgender = $("#egender");
        console.log(gender);
        if (gender == null) {
            errgender.text("Must be selected");
            errgender.css("color", "red");
            errgender.css("fontSize", "small");
            return false;

        }
        else {
            errgender.text("");
        }

        //technology validation
        var technology = $('input[type="checkbox"]:checked').val();
        var errtech = $("#etech");
        var tech_val = [];
        

        $('input[type="checkbox"]:checked').each(function () {
            tech_val.push($(this).val());
        })
        console.log(tech_val);
        console.log(technology);


        if (tech_val == "") {
            errtech.text("Must be filled");
            errtech.css("color", "red");
            errtech.css("fontSize", "small");
            return false;

        }
        else {
            errtech.text("");
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

        //confirm password validation
        const confirm_password = $("#cpsw").val();
        const echangepassword = $("#ecpsw");
        console.log(confirm_password)
        if (confirm_password == "") {
            console.log("must be filled");
            echangepassword.text("must be filled");
            echangepassword.css("color", "red");
            echangepassword.css("fontSize", "small");
            return false;
        }
        else if (confirm_password != "") {
            console.log(confirm_password != password)
            if (confirm_password != password) {

                console.log("both should same");
                echangepassword.text("both should same");
                echangepassword.css("color", "red");
                echangepassword.css("fontSize", "small");
                return false;
            }
            else {
                console.log("valid both are same");
                echangepassword.text("");

            }
        }


        //marital validation
        var ms = $("#ms").val();
        var ems = $("#ems");

        console.log(ms);
        if (ms == "") {
            ems.text("Must be selected");
            ems.css("color", "red");
            ems.css("fontSize", "small");
            return false;

        }
        else {
            ems.text("");
        }

        //address validation
        var address = $("#add").val();
        var erraddress = $("#eadd");
        console.log(address);
        if (address == "") {
            erraddress.text("Must be filled");
            erraddress.css("color", "red");
            erraddress.css("fontSize", "small");
            return false;

        }
        else {
            erraddress.text("");
        }

        //city validation
        var city = $("#city").val();
        var errcity = $("#ecity");
        console.log(city);
        if (city == "") {
            errcity.text("Must be filled");
            errcity.css("color", "red");
            errcity.css("fontSize", "small");
            return false;

        }
        else {
            errcity.text("");
        }

        //pin validation
        var pin = $("#pin").val();
        var errpin = $("#epin");
        console.log(pin);
        if (pin == "") {
            errpin.text("Must be filled");
            errpin.css("color", "red");
            errpin.css("fontSize", "small");
            return false;

        }
        else {
            errpin.text("");
        }

        //state validation
        var state = $("#state").val();
        var errstate = $("#estate");
        console.log(state);
        if (state == "") {
            errstate.text("Must be filled");
            errstate.css("color", "red");
            errstate.css("fontSize", "small");
            return false;

        }
        else {
            errstate.text("");
        }

        //country validation
        var country = $("#country").val();
        var errcountry = $("#ecountry");
        console.log(country);
        if (country == "") {
            errcountry.text("Must be filled");
            errcountry.css("color", "red");
            errcountry.css("fontSize", "small");
            return false;

        }
        else {
            errcountry.text("");
        }

        return true;
    }
});
function getAgeee() {

    const dobString = $("#dob").val();
    const today = new Date();
    const birthDate = new Date(dobString);
    var age = today.getFullYear() - birthDate.getFullYear();
    var m = today.getMonth() - birthDate.getMonth();
    if (m < 0 || (m === 0 && today.getDate() < birthDate.getDate())) {
        age--;
    }
    if (age < 0) {
        age = 0;
    }
    var errdob = $("#edob");
    errdob.text("age is" + age + "years old");
    errdob.css("color", "green");
    errdob.css("fontSize", "small");


}

function imgfun(event) {

    alert("dfdf");

    console.log("function is running");
    frame.src = URL.createObjectURL(event.target.files[0]);

    $("#frame").removeAttr("style");

    $("#img").css("display", "none");
}





