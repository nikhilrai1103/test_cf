<!--if session key not present-->
<cfif !StructKeyExists(session, "email")>
  <cflocation url="../login/loginform.cfm">
</cfif>

<!---<cfdump var="#session#">--->
<!DOCTYPE html>
<html lang="en">
 <head>
    <title></title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <link rel="stylesheet" href="../Home/home.css">
    <!--<link rel="stylesheet" href="Home/home.css">-->
    <script src="../Home/home.js"></script>
</head>
<style>
body{
  padding:2px;
}
    #sidebar{
      color: #818181;
      height:700px;
      background-color: #111;
      position :fixed;
    }

    #nav-item a:hover{
     color: #f1f1f1;
    }

    #toggler{
        cursor:pointer;
    }

    #nav-item{
      font-size: 20px;
      padding: 8px 8px 8px 32px;
      margin-top: 10px;

    }

    .openbtn{
      font-size: 20px;
      cursor: pointer;
      background-color: #111;
      color: white;
      padding: 10px 15px;
      border: none;
    }

  .openbtn:hover {
   background-color: #333;
   }
   #logoutDropdown{
    margin-top:130px;
    margin-left:32px;
   }


</style>

<body>
<!--navbar-->

<div class="container-fluid">
<div class="row">
 <nav class="navbar navbar-expand-lg bg-body-tertiary">


  <button class="openbtn" id="toggler">Open Sidebar</button>
   <!--<span class="navbar-toggler-icon" id="toggler" target="#navbarSupportedContent"></span>-->
      <div class="col-md-2"></div>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="#">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="#">About</a>
        </li>
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="#">Contact</a>
        </li>
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="#">Services</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Link</a>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            Dropdown
          </a>
          <ul class="dropdown-menu">
            <li>
              <a class="dropdown-item" href="#">Action</a>
            </li>
            <li>
              <a class="dropdown-item" href="#">Another action</a>
            </li>
            <li>
              <hr class="dropdown-divider"></li>
              <li>
                <a class="dropdown-item" href="#">Something else here</a>
              </li>
            </ul>
          </li>
          <li class="nav-item">
            <a class="nav-link disabled" aria-disabled="true">Disabled</a>
          </li>
        </ul>
        <form class="d-flex" role="search">
          <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
            <button class="btn btn-outline-success" type="submit">Search</button>
        </form>
    </div>
 </nav>
 </div>
 </div>



<!--Sidebar-->
<div class="col-md-2" id="sidebar" class="sidebar">

    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
      <div class="sidebarlist">
        <li class="nav-item" id="nav-item">
          <a class="nav-link active" aria-current="page" href="#">Dashboard</a>
        </li>
      </div>
      <div class="sidebarlist">
        <li class="nav-item" id="nav-item">
          <a class="nav-link active" aria-current="page" href="#">Orders</a>
        </li>
      </div>
      <div class="sidebarlist">
        <li class="nav-item" id="nav-item">
          <a class="nav-link active" aria-current="page" href="#">Product</a>
        </li>
      </div>
      <div class="sidebarlist">
        <li class="nav-item" id="nav-item">
          <a class="nav-link active" aria-current="page" href="#">Customers</a>
        </li>
      </div>
      <div class="sidebarlist">
        <li class="nav-item dropdown" id="nav-item" >
         <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
         Dropdown
        </a>
        <ul class="dropdown-menu">
          <li>
            <a class="dropdown-item" href="#">Action</a>
          </li>
          <li>
            <a class="dropdown-item" href="#">Another action</a>
          </li>
          <li>
            <hr class="dropdown-divider"></li>
          <li>
            <a class="dropdown-item" href="#">Something else here</a>
          </li>
        </ul>
        </li>
      </div>

    <div class="dropdown pb-4" id="logoutDropdown">
      <a href="#" class="d-flex align-items-center text-white text-decoration-none dropdown-toggle" id="dropdownUser1" data-bs-toggle="dropdown" aria-expanded="false">
      <img src="https://github.com/mdo.png" alt="hugenerd" width="30" height="30" class="rounded-circle">
      <span class="d-none d-sm-inline mx-1">User</span>
    </a>
      <ul class="dropdown-menu dropdown-menu-dark text-small shadow">
        <li>
          <a class="dropdown-item" href="#">Settings</a>
        </li>
        <li>
          <a class="dropdown-item" href="#">Profile</a>
        </li>
        <li>
        <hr class="dropdown-divider"></li>
        <li>
          <a class="dropdown-item" href="#">Logout</a>
        </li>
      </ul>
    </div>

  </ul>

    
</div>
        
 </body>
</html>