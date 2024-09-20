<!--if session key not present-->
<cfif !StructKeyExists(session, "email")>
  <cflocation  url="../login/loginform.cfm">
</cfif>

<!--only admin can access everything-->
<cfquery datasource="Nikhildb" name="admin_access">
  select * from user left join admin on user.Id=admin.user_id where Email = <cfqueryparam value="#session.email#" cfsqltype = "cf_sql_varchar">;
</cfquery>

<!--if is_admin/user is admin = 1 then only display the page else not-->
<cfif admin_access.is_admin eq 1>

<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Crud Operations</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="emplist.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/@sweetalert2/theme-dark@4/dark.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.js"></script>

    <style >
      .switch {
        position: relative;
        display: inline-block; 
        width: 50px;
        height: 25px;
      }
      a {
        text-decoration: none;
        color: white;
      }
      .switch input {
        opacity: 0;
        width: 0;
        height: 0;
      }

      .slider {
        position: absolute;
        cursor: pointer;
        top: 0;
        left: 0;
        right: 0;
        bottom: 0;
        background-color: #ccc;
        -webkit-transition: 0.4s;
        transition: 0.4s;
      }

      .slider:before {
        position: absolute;
        content: "";
        height: 20px;
        width: 20px;
        left: 2.5px;
        bottom: 3px;
        background-color: white;
        -webkit-transition: 0.4s;
        transition: 0.4s;
      }

      input:checked + .slider {
        background-color: #2196F3;
      }

      input:focus + .slider {
        box-shadow: 0 0 1px #2196F3;
      }

      input:checked + .slider:before {
        -webkit-transform: translateX(26px);
        -ms-transform: translateX(26px);
        transform: translateX(26px);
      }

      /* Rounded sliders */
      .slider.round {
        border-radius: 34px;
      }

      .slider.round:before {
        border-radius: 50%;
      }
      .img {
        width: 100px;
        height: 100px;
        border-radius: 60px;
      }
      .modal-header {
        display: grid;
        place-items: center;
      }
    </style>

  </head>

  <body>
    <div class="container-fluid">
      <div class="row">
        <div class="col-md-6">
          <h2>Employee List</h2>
        </div>
      </div>

      <div class="row">
        <div class="col-md-1">
          <label for="search" class="form-label">Search:</label>
        </div>
        <div class="col-md-10">
          <input type="text" class="form-control form-control-sm" id="search" name="search">
          <div></div>
        </div>
      </div>

      <br>

      <div class="row">
        <div class="col-md-1"></div>
        <div class="col-md-5 d-grid">
          
            <button type="button" class="btn btn-success"><a href="http://localhost:8500/nikhil/registration/form.cfm">Add Employee</a></button>
          
        </div>
        <div class="col-md-5 d-grid">
          <button type="button" class="btn btn-info" id="Search">Search Employee</button>
        </div>
      </div>
      <br>

      <div class="row">
        <div class="col-md-1"></div>
        <div class="col-md-10">
          <table class="table table-striped">
            <thead>
              <thead>
                <tr>
                  <th>ID</th>
                  <th>Fullname</th>
                  <th>Mobile</th>
                  <th>Email</th>
                  <th>Profile</th>
                  <th>Make admin</th>
                  <th>Action</th>
                </tr>
              </thead>
              <tbody id="userlist">
                <cfquery datasource="Nikhildb" name="select">
                  select * from user left join admin on user.Id=admin.user_id;
                </cfquery>
                <cfloop query="select">
                  <tr>
                    <td id="search_id">
                      <cfoutput>
                        #Id#
                      </cfoutput>
                    </td>

                    <td id="search_fname_lname">
                      <cfoutput>
                        #select.Firstname# #select.Lastname#</cfoutput>
                    </td>
                    <td id="search_mob">

                      <cfoutput>
                        #select.Phone_number#</cfoutput>
                    </td>
                    <td>
                      <cfoutput>
                        #select.Email#</cfoutput>
                    </td>

                    <td search="search_image"><img src="../Images/<cfoutput>#select.Photo#</cfoutput>" style = "width:40px; height:40px; border-radius:50%;">

                    <td>

                      <label class="switch">
                        <input type="checkbox" onchange="make_admin(<cfoutput>#select.Id#</cfoutput>)" <cfif select.is_admin eq 1>
                          checked
                         </cfif>>
                        <span class="slider round"></span>
                      </label>

                    </td>

                    <td>
                      <!-- Button trigger modal -->
                      <button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#exampleModal" onclick="viewdata(<cfoutput>#select.Id#</cfoutput>)">
                        View
                      </button>

                      <a href="../registration/form.cfm?id=<cfoutput>#select.Id#</cfoutput>">
                        <button type="button" class="btn btn-info">
                          Edit
                        </button>
                      </a>

                      <button type="button" class="btn btn-danger delete_emp" value="<cfoutput>#select.Id#</cfoutput>">
                        Delete</button>
                    </td>
                  </tr>
                </cfloop>
              </tbody>
            </table>
            <div class="col-md-1"></div>
          </div>
        </div>

        <!-- Modal -->
        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">

                <img src="" id="img" class="img">

                <!---<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>--->
              </div>
              <div class="modal-body">

                <div class="row">
                  <div class="col-md-4">
                    <label class="form-label">
                      Firstame:</label>
                    <span id="info_Firstname"></span>
                  </div>
                  <div class="col-md-4">
                    <label for="name" class="form-label">
                      Lastname:</label>
                    <span id="info_Lastname">
                      rite lname here</span>
                  </div>
                  <div class="col-md-4">
                    <label for="name" class="form-label">
                      Email:</label>
                    <span id="info_Email">
                      rite Email here</span>
                  </div>
                </div>
                <br>
                <div class="row">
                  <div class="col-md-4">
                    <label for="name" class="form-label">
                      Phone number:</label>
                    <span id="info_Phone">
                      write Mob here</span>
                  </div>
                  <div class="col-md-4">
                    <label for="name" class="form-label">
                      DOB:</label>
                    <span id="info_Dob">
                      write dob here</span>
                  </div>
                  <div class="col-md-4">
                    <label for="name" class="form-label">
                      Marital status:</label>
                    <span id="info_Ms">
                      write marital status here</span>
                  </div>
                </div>
                <br>
                <div class="row">
                  <div class="col-md-4">
                    <label for="name" class="form-label">
                      Gender:</label>
                    <span id="info_Gender">
                      write Gender here</span>
                  </div>
                  <div class="col-md-4">
                    <label for="name" class="form-label">
                      Technology:</label>
                    <span id="info_Technology">
                      write tech here</span>
                  </div>
                  <div class="col-md-4">
                    <label for="name" class="form-label">
                      Address:</label>
                    <span id="info_Address">
                      write Address here</span>
                  </div>
                </div>
                <br>
                <div class="row">
                  <div class="col-md-4">
                    <label for="name" class="form-label">
                      City:</label>
                    <span id="info_City">
                      write city here</span>
                  </div>
                  <div class="col-md-4">
                    <label for="name" class="form-label">
                      Pin:</label>
                    <span id="info_Pin">
                      write pin here</span>
                  </div>
                  <div class="col-md-4">
                    <label for="name" class="form-label">
                      State:</label>
                    <span id="info_State">
                      write state here</span>
                  </div>
                </div>
                <br>
                <div class="row">
                  <div class="col-md-4">
                    <label for="name" class="form-label">
                      Country:</label>
                    <span id="info_Country">
                      write country here</span>
                  </div>
                </div>

              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">
                  Close</button>
                <button type="button" class="btn btn-primary">
                  Save changes</button>
              </div>
            </div>
          </div>
        </div>

      </body>
      <script>

        <!---view button--->
        function viewdata(value) {
          $.ajax({
            url: "emplist.cfc?method=view_Data",
            type: "POST",
            dataType: "json",
            data: {
              Id: value
            },
            success: function (res) {
              console.log(res);
              // var test = JSON.parse(res);
              // console.log(test.Address);
              $("#img").attr("src", "../Images/" + res.Img);
              $("#info_Firstname").text(res.Firstname);
              $("#info_Lastname").text(res.Lastname);
              $("#info_Email").text(res.Email);
              $("#info_Phone").text(res.Phone_no);
              $("#info_Dob").text(res.Dob);
              $("#info_Ms").text(res.Marital_status);
              $("#info_Gender").text(res.Gender);
              $("#info_Technology").text(res.Technology);
              $("#info_Address").text(res.Address);
              $("#info_City").text(res.City);
              $("#info_Pin").text(res.Pin);
              $("#info_State").text(res.State);
              $("#info_Country").text(res.Country);
            }
          });
        }

        <!---make admin--->
        function make_admin(data) {
          console.log(data)
          $.ajax({
            type: "POST",
            url: "emplist.cfc?method=toggle_data",
            dataType: "json",
            data: {
              empid: data
            },
            success: function (result) {
              console.log(result);

            }
          });
        }


        <!---search button--->
        $("#Search").on("click", function(){
          var id = $("#search").val(); 
          console.log(id);
          $.ajax({
            type: "POST",
            url: "emplist.cfc?method=search_btn",
            dataType: "json",
            data: {
              search: id
            },
            success: function (res){
              console.log(res);
               $("#userlist").html("");
               res.DATA.length
               console.log(res.DATA.length);
               for(let i=0;i<res.DATA.length;i++){
                console.log(res.DATA[i]);
                var id = res.DATA[i][0];
                var fname = res.DATA[i][1];
                var lname = res.DATA[i][2];
                var email = res.DATA[i][3];
                var photo = res.DATA[i][14];
                var mob = res.DATA[i][4];
                var is_admin = res.DATA[i][19];

               $("#userlist").append(`
                    <tr>\
                    <td>`+id+`</td>\

                    <td>`+fname+` `+lname+`</td>\

                    <td>`+mob+`</td>\

                    <td>`+email+`</td>\

                    <td search="search_image"><img src="../Images/`+photo+`" style = "width:40px; height:40px; border-radius:50%;">
                    <td>\

                    <td>\
                      <label class="switch">\
                        <input type="checkbox" onchange="make_admin(`+id+`)" (`+is_admin+` == 1) ? checked : ''>\
                        <span class="slider round"></span>\
                      </label>\

                    </td>\

                    <td>\
                      <button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#exampleModal" onclick="viewdata(`+id+`)">\
                        View\
                      </button>\

                      <a href="../registration/form.cfm?id=`+id+`">\
                        <button type="button" class="btn btn-info">Edit</button>\
                      </a>\

                      <button type="button" class="btn btn-danger delete_emp" value="`+id+`">Delete\
                      </button>\
                    </td>\
                  </tr>`);

                console.log(id);
                console.log(fname);
                console.log(lname);
                console.log(email);
                console.log(mob);

               }
                              
            }
          });
        })

        $(".delete_emp").on("click", function () {
          var id = $(this).val();
          console.log(id);

          Swal.mixin({
            customClass: {
              confirmButton: "btn btn-success",
              cancelButton: "btn btn-danger"
            },
            buttonsStyling: false
          });
          Swal
            .fire({
              title: "Are you sure?",
              text: "You won't be able to revert this!",
              icon: "warning",
              showCancelButton: true,
              confirmButtonText: "Yes, delete it!",
              cancelButtonText: "No, cancel!",
              reverseButtons: true
            })
            .then((result) => {
              if (result.isConfirmed) {

                $.ajax({
                  type: "POST",
                  url: "emplist.cfc?method=delete_Data",
                  dataType: "json",
                  data: {
                    del: id
                  },
                  success: function (result) {
                    console.log(result);

                    if (result) {

                      Swal
                        .fire({title: "Deleted!", text: "Your file has been deleted.", icon: "success"})
                        .then((result) => {
                          location.reload();
                        })
                    } else if (
                    /* Read more about handling dismissals below */
                    result.dismiss === Swal.DismissReason.cancel) {
                      Swal.fire({title: "Cancelled", text: "Your imaginary file is safe :)", icon: "error"});
                    }
                  }
                });

              }
            });
        });
      </script>
    </html>

    <cfelse>
      <cflocation  url="../login/loginform.cfm">
</cfif>