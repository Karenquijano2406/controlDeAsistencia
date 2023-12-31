<?php
error_reporting(0);
?>

<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Página de bienvenida</title>
    <link rel="stylesheet" href="public/estilos/estilos.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link
        href="https://fonts.googleapis.com/css2?family=Nunito:ital,wght@0,200;0,300;0,400;1,200&family=PT+Sans&display=swap"
        rel="stylesheet">
    <!-- pNotify -->
    <link href="public/pnotify/css/pnotify.css" rel="stylesheet" />
    <link href="public/pnotify/css/pnotify.buttons.css" rel="stylesheet" />
    <link href="public/pnotify/css/custom.min.css" rel="stylesheet" />
    <!-- pnotify -->
    <script src="public/pnotify/js/jquery.min.js">
    </script>
    <script src="public/pnotify/js/pnotify.js">
    </script>
    <script src="public/pnotify/js/pnotify.buttons.js">
    </script>


</head>

<body background="public/images/tuul.jpg">
    <?php
    date_default_timezone_set('America/Merida');
    ?>
    <h1>¡Bienvenido, registre su asistencia!</h1>
    <!-- para dar formato a la hora y fecha -->
    <h2 id="fecha">
        <?= date("d/m/Y, h:i:s") ?>
    </h2>
    <?php
    include "modelo/conexion.php";
    include "controlador/controlador_registrar_asistencia.php";
    ?>
    <div class="container">
        <a class="acceso" href="vista/login/login.php">Iniciar Sesión</a>
        <p class="dni">Ingrese su DNI</p>
        <form action="" method="POST">
            <input type="number" placeholder="DNI del empleado" name="txtdni">
            <div class="botones">
                <button id="entrada" class="entrada" type="submit" name="btnentrada" value="ok">ENTRADA</button>
                <button id="salida" class="salida" type="submit" name="btnsalida" value="ok">SALIDA</button>
            </div>
        </form>
    </div>

    <!-- se esta mostrando la fecha y hora en tiempo real con java script-->
    <script>
        setInterval(() => {
  let fecha = new Date();
  let dia = fecha.getDate();
  let mes = fecha.getMonth() + 1; // Los meses en JavaScript van de 0 a 11, por lo que se suma 1
  let anio = fecha.getFullYear();
  let hora = fecha.getHours();
  let minutos = fecha.getMinutes();
  let segundos = fecha.getSeconds();

  // Agrega ceros a la izquierda para tener siempre dos dígitos en días, meses, horas, minutos y segundos
  dia = dia < 10 ? '0' + dia : dia;
  mes = mes < 10 ? '0' + mes : mes;
  hora = hora < 10 ? '0' + hora : hora;
  minutos = minutos < 10 ? '0' + minutos : minutos;
  segundos = segundos < 10 ? '0' + segundos : segundos;

  let fechaHora = dia + '-' + mes + '-' + anio + ' ' + hora + ':' + minutos + ':' + segundos;
  document.getElementById("fecha").textContent = fechaHora;
}, 1000);


    </script>
    <!-- para limitar el numero de los valores del dni, en su caso solo 8 dígitos-->
    <script>
        let dni = document.getElementById("txtdni");
        dni.addEventListener("input", function () {
            if (this.value.length > 8) {
                this.value = this.value.slace(0, 8)
            }
        })

        //EVENTOS PARA LA ENTRADA Y SALIDA
        document.addEventListener("keyup", function (event) {
            if (event.code == "ArrowLeft") {
                document.getElementById("salida").clic()
            } else {
                if (event.code == "ArrowRight") {
                    document.getElementById("entrada").clic()

                }

            }
        })
    </script>

</body>

</html>