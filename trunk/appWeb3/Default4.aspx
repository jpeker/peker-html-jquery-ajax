<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default4.aspx.cs" Inherits="Default4" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
 <script type="text/javascript" src="../Scripts/jquery-1.8.2.min.js"></script>
    <script type="text/javascript" src="../Scripts/modernizr-2.6.2.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            if (!Modernizr.canvas) {
                alert("This browser doesn't support HTML5 Canvas!");
            }
            var canvas = $("#MyCanvas").get(0);
            var context = canvas.getContext("2d");
            //lineas
            /*
            context.lineWidth = 10;
            context.beginPath();
            context.moveTo(20, 100);
            context.lineTo(180, 100);
            context.lineCap = "butt";
            context.stroke();
            context.beginPath();
            context.moveTo(20, 120);
            context.lineTo(180, 120);
            context.lineCap = "round";
            context.stroke();
            context.beginPath();
            context.moveTo(20, 140);
            context.lineTo(180, 140);
            context.lineCap = "square";
            context.stroke();*/
            // es un arco
           /* var x = canvas.width / 2;
            var y = canvas.height / 2;
            var radius = 100;
            var start_angle = 0.5 * Math.PI;
            var end_angle = 1.75 * Math.PI;
            context.arc(x, y, 75, start_angle, end_angle, false);
            context.lineWidth = 20;
            context.stroke();*/
            // es un cuadrado
           /* var x = 25;
            var y = 50;
            var width = 150;
            var height = 100;
            var radius = 20;
            context.lineWidth = 10;
            // top and top right corner
            context.moveTo(x + radius, y);
            context.arcTo(x + width, y, x + width, y + radius, radius);
            // right side and bottom right corner
            context.arcTo(x + width, y + height, x + width - radius, y + height, radius);
            // bottom and bottom left corner
           context.arcTo(x, y + height, x, y + height - radius, radius);
            // left and top left corner
           context.arcTo(x, y, x + radius, y, radius);
            context.stroke();*/
            //dibujo de una cara
            /*context.beginPath();
            //face
            context.arc(100, 100, 80, 0, Math.PI * 2, false);
            //smile
            context.moveTo(160, 100);
            context.arc(100, 100, 60, 0, Math.PI, false);
            //left eye
            context.moveTo(75, 70);
            context.arc(65, 70, 10, 0, Math.PI * 2, true);
            //right eye
            context.moveTo(135, 70);
            context.arc(125, 70, 10, 0, Math.PI * 2, true);
            context.stroke();
            context.lineWidth = 5;
            context.stroke();*/
            //triangulo
           /* context.beginPath();
            context.moveTo(50, 20);
            context.lineTo(50, 100);
            context.lineTo(150, 100);
            context.closePath();
            context.lineWidth = 10;
            context.strokeStyle = 'red';
            context.fillStyle = 'blue';
            context.stroke();
            context.fill();*/
            //texto
          /*  var x = canvas.width / 2;
            var y = canvas.height / 2;
            context.font = "30px Arial";
            context.textBaseline = "middle";
            context.textAlign = "center";
            context.lineWidth = 1;
            context.strokeStyle = "red";
            context.fillStyle = "blue";
            context.strokeText("Hello Canvas!", x, y - 50);
            context.fillText("Hello Canvas!", x, y + 50);*/
            //imagen
          /* var img = new Image();
            $(img).load(function () {
               // context.drawImage(img, 10, 20);
                context.drawImage(img, 0, 0, canvas.width, canvas.height);// ajusta la imagen
              //  context.drawImage(img, 0, 0, 200, 40, 0, 0, canvas.width / 2, canvas.height / 2);
            });
            img.src = "Imagenes/01.jpg";
            //efectos
            /*context.shadowColor = "#808080";
            context.shadowBlur = 5;
            context.shadowOffsetX = 10;
            context.shadowOffsetY = 10;
            context.fillRect(20, 20, 150, 80);
            context.shadowColor = "red";
            context.shadowBlur = 15;
            context.shadowOffsetX = -5;
            context.shadowOffsetY = 5;
            context.fillStyle = "blue";
            context.textAlign = "center";
            context.font = "bold 30px Arial";
            context.fillText("Hello Canvas!", 100, 150);*/
            //transparencia
            /*context.fillStyle = "black";
            context.fillRect(20, 20, 150, 80);
            context.fillStyle = "rgb(255, 0, 0)";
            context.fillRect(40, 40, 150, 80);
            context.fillStyle = "black";
            context.fillRect(20, 150, 150, 80);
            context.fillStyle = "rgba(255, 0, 0,0.5)";
            context.fillRect(40, 170, 150, 80);*/
            //Relleno
           /* var radialGradient = context.createRadialGradient(100, 100, 5, 100, 100, 100);
            radialGradient.addColorStop(0, "blue");
            radialGradient.addColorStop(0.5, "green");
            radialGradient.addColorStop(1, "red");
            context.fillStyle = radialGradient;
            context.fillRect(0, 0, 200, 200);*/
            //patron
           // var canvas = $("#MyCanvas").get(0);
           /* var img = new Image();
            $(img).load(function () {
                var pattern = context.createPattern(img, "repeat");
                context.fillStyle = pattern;
                context.fillRect(0, 0, 200, 200);
            });
            img.src = "Imagenes/patroncircicle.jpg";*/
            //default state
            //Save EStado
           /* context.lineWidth = 5;
            context.fillStyle = 'blue';
            context.fillRect(10, 120, 150, 50);
            context.save();
            //change state
            context.lineWidth = 10;
            context.fillStyle = 'red';
            context.fillRect(20, 130, 150, 50);
            //restore state
            context.restore();
            context.fillRect(30, 140, 150, 50);*/
            //guardar imagen
           // context.fillRect(20, 20, 160, 160);
           // var data = canvas.toDataURL("Imagenes/pep.png");
            //$("#imgCanvas").attr("src", data);
            //guardar imagen falta terminarlo
            /*context.fillRect(20, 20, 160, 160);
            $('#btnSave').click(function () {
                var data = canvas.toDataURL();
                data = data.replace('data:image/png;base64,', '');
                $.ajax({
                    type: 'POST',
                    url: '/default4.aspx/SaveToDb',
                    data: '{ "data" : "' + data + '" }',
                    contentType: 'application/json; charset=utf-8',
                    dataType: 'json',
                    success: function (msg) {
                        alert('Image data saved to SQL Server database!');
                    }
                });
            });*/
            //guardar en el servidor
            context.fillRect(20, 20, 160, 160);
            $('#btnSave').click(function () {
                var data = canvas.toDataURL();
                data = data.replace('data:image/png;base64,', '');
                alert(data);
                $.ajax({
                    type: 'POST',
                    url: '/Default4.aspx/SaveAsImageFile',
                    data: '{ "data" : "' + data + '" }',
                    contentType: 'application/json; charset=utf-8',
                    dataType: 'json',
                    success: function (msg) {
                        alert('Image saved on the server!');
                    }
                });
            });
        
        });
</script>
<style>
canvas {
border: 2px solid #808080;
}
</style>

</head>
<body>
    <form id="form1" runat="server">
   <canvas id="MyCanvas" height="300" width="200"></canvas>
         <br />
          <input id="btnSave" type="button" value="Convert" />
    </form>
</body>
</html>
