$(document).ready(function () { 

    /*$("#sidebar").hide();
    $("#toggler").on("click", function () {
        console.log("this is working");
        var sidebarLen = $(".sidebarView").length;
        console.log(sidebarLen);
        console.log("dgf", $(".sidebarView").length);
        if (sidebarLen <= 0) {
            $(".sidebar").addClass("sidebarView");
            $("#sidebar").show();
        } 
        else {
            $(".sidebar").removeClass("sidebarView");
            $("#sidebar").hide();
        }

    })*/



    $("#sidebar").hide();
   $("#toggler").on("click", function () {
       console.log("this is working");
       var sidebarLen = $(".sidebarView").length;
       console.log(sidebarLen);
       console.log("dgf", $(".sidebarView").length);
       if (sidebarLen <= 0) {
           $("#sidebar").addClass("sidebarView");
           $("#sidebar").show();
       } 
       else {
           $("#sidebar").removeClass("sidebarView");
           $("#sidebar").hide();
       }

   })

});