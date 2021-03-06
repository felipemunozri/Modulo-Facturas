<%-- 
    Document   : confirmaingreso
    Created on : 12-ago-2020, 15:56:57
    Author     : felipe
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <!--Import Font -->
  <link
    href="https://fonts.googleapis.com/css2?family=Lato:ital,wght@0,100;0,300;0,400;0,700;0,900;1,100;1,300;1,400;1,700;1,900&display=swap"
    rel="stylesheet">

  <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

  <!-- Compiled and minified CSS -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">

  <!-- CSS -->
  <link rel="stylesheet" href="style.css">

  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Confirmación Ingreso</title>
</head>
<body>

  <!-- Navbar -->
  <nav>
    <div class="nav-wrapper">
      <a href="index.html" class="brand-logo"><img id="amazon_icon" src="resources/amazon.png" alt="amazon_icon">amazon retail</a>
      <a href="#" data-target="mobile-demo" class="sidenav-trigger"><i class="material-icons">menu</i></a>
      <ul id="nav-mobile" class="right hide-on-med-and-down">
        <li><a href="ingresafactura.html">Ingresar Facturas</a></li>
        <li><a href="cargafacturas.html">Cargar Facturas</a></li>
        <li><a href="consultafacturas.html">Consultar Facturas</a></li>
        <li><a href="anulafactura.html">Anular Factura</a></li>
      </ul>
    </div>
  </nav>

  <!-- Sidenav -->
  <ul class="sidenav section" id="mobile-demo" style="background-color: #131921;">
    <li><a href="ingresafactura.html">Ingresar Facturas</a></li>
    <li><a href="cargafacturas.html">Cargar Facturas</a></li>
    <li><a href="consultafacturas.html">Consultar Facturas</a></li>
    <li><a href="anulafactura.html">Anular Factura</a></li>
  </ul>

  <!-- main -->
  <div class="container section">
    <div class="row" style="margin-top: 10%;">
      <div class="col s2"></div>
      <div class="col s8 ">
        <div class="card center-align">
          <div class="card-content">
            <span class="card-title">Factura ingresada correctamente!</span>
          </div>
          <div class="card-action">
            <a href="ingresafactura.jsp" class="waves-effect waves-light btn">Volver</a>
          </div>
        </div>
      </div>
      <div class="col s2"></div>
    </div>
  </div>

  <!-- Compiled and minified JavaScript -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>

  <!-- Inicialización Documento HTML -->
  <script>
    document.addEventListener('DOMContentLoaded', function () {      

      // Inicialización sidenav
      var elems = document.querySelectorAll('.sidenav');
      var instances = M.Sidenav.init(elems);
    });
  </script>

</body>
</html>
