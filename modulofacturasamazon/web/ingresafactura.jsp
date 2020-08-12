<%-- 
    Document   : ingresafactura
    Created on : 12-ago-2020, 15:50:46
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
  <title>Ingreso Factura</title>
</head>
<body>

  <!-- Navbar -->
  <nav>
    <div class="nav-wrapper">
      <a href="menu.html" class="brand-logo"><img id="amazon_icon" src="resources/amazon.png" alt="amazon_icon">amazon retail</a>
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

  <!-- Main -->
    <div class="section" style="padding-left: 15px;padding-right: 15px;">
      <div class="row">
  
        <!-- Card Ingresar Datos-->
        <div class="col m6 s12">
          <div class="card">
            <div class="card-content">
              <span class="card-title">Ingresar Datos Factura</span>
              <form class="section" action="#">
                <div class="row">
                  <div class="input-field col s12">
                    <i class="material-icons prefix">search</i>
                    <input placeholder="Buscar..." id="rut_cliente" type="text" class="autocomplete">
                    <label for="rut_cliente">Buscar Rut Cliente</label>
                  </div>
                </div>
                <div class="row">
                  <div class="input-field col s12">
                    <i class="material-icons prefix">date_range</i>
                    <label>Seleccionar Fecha</label>
                    <input id="fecha" type="text" class="datepicker">
                  </div>
                </div>
                <div class="section">
                  <span class="card-title">Adicionar Productos</span>
                </div>
                <br>
                <div class="row valign-wrapper">
                  <div class="input-field col s6">
                    <i class="material-icons prefix">search</i>
                    <input placeholder="Buscar..." id="nom_producto" type="text" class="autocomplete">
                    <label for="nom_producto">Buscar Nombre Producto</label>
                  </div>
                  <div class="input-field col s2 center-align">
                    <input placeholder="" id="cant_producto" type="number" min="1" class="center-align">
                    <label for="cant_producto">Cantidad</label>
                  </div>
                  <div class="col s4 center-align">
                    <button id="btn_add_producto" class="btn waves-effect waves-light" type="button" onclick="agregarProducto()">Agregar
                      <i id="ico_add" class="material-icons right">add</i>
                    </button>
                  </div>
                </div>
              </form>
            </div>
          </div>
        </div>
  
        <!-- Card Previzualizar e Ingresar Factura-->
        <div class="col m6 s12">
          <div class="card lime lighten-5">
            <div class="card-content">
              <span class="card-title center-align">Detalle Factura</span>
              <form action="confirmaingreso.jsp" method="POST">
                <div class="row">
                  <div class="input-field col s6">
                    Rut Cliente:
                    <input class="teal-text text-lighten-2" name="rut_cliente" id="rut_cliente_detalle" type="text" readonly>
                  </div>
                  <div class="input-field col s6">
                    Razón Social:
                    <input class="teal-text text-lighten-2" id="razon_social" type="text" readonly>
                  </div>
                </div>
                <div class="row">
                  <div class="input-field col s6">
                    Dirección:
                    <input class="teal-text text-lighten-2" id="direccion" type="text" readonly>
                  </div>
                  <div class="input-field col s6">
                    Fecha:
                    <input class="teal-text text-lighten-2" name="fecha" id="fecha_detalle" type="text" readonly>
                  </div>
                </div>
                <div class="row">
                  <div class="col s12">
                    <table id="tbl_productos" class="teal-text text-lighten-2">
                      <thead>
                        <tr>
                          <th class="black-text">Cod. Producto</th>
                          <th class="black-text">Descripción</th>
                          <th class="black-text">Precio Uni.</th>
                          <th class="black-text">Cantidad</th>
                          <th class="black-text" id="subtotal">Subtotal</th>
                          <th class="black-text">Eliminar</th>
                        </tr>
                      </thead>
                      <tbody>
                        
                        <!-- Se genera dinámicamente al ingresar productos-->
  
                      </tbody>
                      <tfoot>
                        <tr>
                          <th class="black-text" scope="row" colspan="3" style="padding-right: 24px;">Total Neto</th>
                          <td id="total_neto" colspan="3"></td>
                        </tr>
                        <tr>
                          <th class="black-text" scope="row" colspan="3" style="padding-right: 24px;">IVA</th>
                          <td id="iva" colspan="3"></td>
                        </tr>
                        <tr>
                          <th class="black-text" scope="row" colspan="3" style="padding-right: 24px;">Total</th>
                          <td id="total" colspan="3"></td>
                        </tr>
                      </tfoot>
                    </table>
                  </div>
                </div>
                <br>
                <div class="row">
                  <div class="col s6">
                    <button id="btn_ingresar" class="btn red lighten-2 waves-effect waves-light left" type="submit">
                      Ingresar Factura<i id="ico_send" class="material-icons right">send</i>
                    </button>
                  </div>
                </div>
              </form>
            </div>
          </div>
        </div>
  
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

      // Inicialización datepicker
      var options_date = {
        format: "yyyy-mm-dd",
        onClose: function (){
          fecha_detalle.value = fecha.value;   
        }
      }
      
      var elems = document.querySelectorAll('.datepicker');
      var instances = M.Datepicker.init(elems, options_date);

      // Inicialización input rut cliente
      var options = {
        data: {
          "12345678-9": null,
          "13579246-8": null
        },
        onAutocomplete: function () {
          if (rut_cliente.value === "12345678-9") {
            rut_cliente_detalle.value = rut_cliente.value;
            razon_social.value = `Empresa ABC`;
            direccion.value = `Irarrazabal 123`;
          } else {
            rut_cliente_detalle.value = rut_cliente.value;
            razon_social.value = `Empresa XYZ`;
            direccion.value = `Alameda 456`;
          }

          M.updateTextFields();
        }
      }

      var elems = rut_cliente;
      var instances = M.Autocomplete.init(elems, options);

      // Inicialización input producto
      var options_producto = {
        data: {
          "martillo": null,
          "mascarilla": null
        },
      }

      var elems = nom_producto;
      var instances = M.Autocomplete.init(elems, options_producto);
    
    });

    // Definición de elementos HTML como constantes
    const rut_cliente = document.getElementById('rut_cliente')
    const rut_cliente_detalle = document.getElementById('rut_cliente_detalle')
    const razon_social = document.getElementById('razon_social');
    const direccion = document.getElementById('direccion');
    const fecha = document.getElementById('fecha');
    const fecha_detalle = document.getElementById('fecha_detalle');
    const nom_producto = document.getElementById('nom_producto');
    const cod_producto = document.getElementById('cod_prducto_detalle');
    const cant_producto = document.getElementById('cant_producto');
    const nom_producto_detalle =  document.getElementById('nom_producto_detalle');
    const precio_producto_detalle = document.getElementById('precio_producto_detalle');
    const btn_add_producto = document.getElementById('btn_add_producto');
    const tbl_productos = document.getElementById('tbl_productos');
    const btn_eliminar_producto = `<button class="btn waves-effect waves-light z-depth-1 red darken-2" type="button"  onclick="eliminarProducto(this)"><i class="material-icons">delete</i></button>`;
    const total_neto = document.getElementById('total_neto');
    const iva = document.getElementById('iva');
    const total = document.getElementById('total');
    const input_cod_prod = `<input class="hide" type="text" name="cod_producto" value="" readonly="readonly">`;
    const input_cant_prod = `<input class="hide" type="text" name="cant_producto" value="" readonly="readonly">`;
    const subtotal = document.getElementById('subtotal');

    // Inicialización elementos HTML
    total_neto.innerHTML = 0;
    iva.innerHTML = 0;
    total.innerHTML = 0;

  </script>

  <!-- Funcionalidad botón agregar producto -->
  <script>
    function agregarProducto(){
      if (nom_producto.value !== "" && cant_producto.value !== ""){
        var row = tbl_productos.insertRow(1);
        var cell1 = row.insertCell(0);
        var cell2 = row.insertCell(1);
        var cell3 = row.insertCell(2);
        var cell4 = row.insertCell(3);
        var cell5 = row.insertCell(4);
        var cell6 = row.insertCell(5);

        if (nom_producto.value === "martillo") {
          cell1.innerHTML = '00000001' + input_cod_prod;
          cell2.innerHTML = nom_producto.value;
          cell3.innerHTML = '5000';
          cell4.innerHTML = (cant_producto.value) + input_cant_prod;
          cell5.innerHTML = parseInt(cell3.innerHTML) * parseInt(cell4.innerHTML);
          cell6.innerHTML = btn_eliminar_producto;
        } else {
          cell1.innerHTML = '00000002' + input_cod_prod;
          cell2.innerHTML = nom_producto.value;
          cell3.innerHTML = '3000';
          cell4.innerHTML = (cant_producto.value) + input_cant_prod;
          cell5.innerHTML = parseInt(cell3.innerHTML) * parseInt(cell4.innerHTML);
          cell6.innerHTML = btn_eliminar_producto;
        } 

        calcularTotalNeto();     
        calcularIVA();
        calcularTotal(); 
      } else {
        alert("Por favor, primero seleccione un producto y su cantidad");
      }
    }
  </script>

  <!-- Funcionalidad botón eliminar producto -->
  <script>
    function eliminarProducto(o) {
      var p = o.parentNode.parentNode;
      p.parentNode.removeChild(p);

      calcularTotalNeto();
      calcularIVA();
      calcularTotal();
  }
  </script>

  <!-- Función calcular total_neto -->
  <script>
    function calcularTotalNeto() {
        var sum = 0;

        for (i = 1; i < tbl_productos.rows.length; i++) {

            var celdas = tbl_productos.rows.item(i).cells;

            for (var j = subtotal.cellIndex; j <= subtotal.cellIndex; j++) {
              if(celdas.item(j) !== null){
                sum = sum + parseInt(celdas.item(j).innerHTML);  
              }
            }
            total_neto.innerHTML = sum;
        }
    }
  </script>

  <!-- Función calcular IVA -->
  <script>
    function calcularIVA() {    
      if (total_neto.innerHTML !== 0){
        var calculoIVA = parseFloat(total_neto.innerHTML) * 0.19;
      }

      iva.innerHTML = calculoIVA;
    }
  </script>

  <!-- Función calcular total -->
  <script>
    function calcularTotal() {      
      if (total_neto.innerHTML !== 0 && iva.innerHTML !== 0){
        var calculoTotal = parseFloat(total_neto.innerHTML) + parseFloat(iva.innerHTML);
      }

      total.innerHTML = calculoTotal;
    }
  </script>

</body>
</html>
