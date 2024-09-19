<cfparam name="url.val" default=0>
<cfif isDefined("url.val") and url.val eq 1>
  <script>
    alert("invalid user password");
  </script>
</cfif>

<!DOCTYPE html>
<html lang="en">
  <head>
    <title></title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <link rel="stylesheet" href="loginform.css">
    <script src="loginform.js"></script>

  </head>
  <body>

      <div class="container-fluid">
        <div class="row">
          <div class="col-md-3"></div>
          <div class="col-md-6">
          <form action="login_query.cfm" method="POST">

            <div class="row" id="header">
              <div class="col-md-3"></div>

              <div class="col-md-8">
                <h1>Login</h1>
              </div>
              <div class="col-md-1"></div>
            </div>

            <br>

            <div class="row">
              <div class="col-md-3"></div>
              <div class="col-md-6">

                <label for="name" class="form-label">Email<span >*</span></label>
                <input type="text" class="form-control form-control-sm" id="email" name="email">
                <span id="eemail"></span>
              </div>
              <div class="col-md-3"></div>
            </div>

            <div class="row">
              <div class="col-md-3"></div>
              <div class="col-md-6">

                <label for="psw" class="form-label">Password<span >*</span></label>
                <input type="password" class="form-control form-control-sm" id="psw" name="psw">
                <span id="epsw"></span>
              </div>

              <div class="col-md-3"></div>
            </div>

            <div class="row">
              <div class="col-md-6"></div>
              <div class="col-md-3">

                <p>
                  <a href="##">Forgot password?</a>
                </p>
              </div>
              <div class="col-md-3"></div>
            </div>

            <div class="row">
              <div class="col-md-3"></div>
              <button type="submit" id="login" class="btn btn-success mt-3 col-md-6">Login</button>
              <div class="col-md-3"></div>
            </div>
            <br>

            <div class="row">
              <div class="col-md-3"></div>
              <div class="col-md-6">

                <p>Not have a account!
                  <a href="../registration/form.cfm">Sign up</a>
                </p>
              </div>
              <div class="col-md-3"></div>
            </div>
            </form>
          </div>
          <div class="col-md-3"></div>
        </div>

    </body>
  </html>
