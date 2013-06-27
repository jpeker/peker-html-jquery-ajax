<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <script type="text/javascript"
        src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.7.2.js">
    </script>
    <script type="text/javascript" src="/Scripts/modernizr-2.6.2.js" ></script>
    <script type="text/javascript" >

// sin workers
/*
        $(document).ready(function () {
            if (!Modernizr.webworkers) {
                alert("This browser doesn't support HTML5 Web Workers!");
                return;
            }
            $("#button1").click(function () {
                alert("Processing started!");
                var date = new Date();
                var currentDate = null;
                do {
                    currentDate = new Date();
                }
                while (currentDate - date < 10000);
                alert("Processing done!");
            });
        });*/
        var worker; 
       
        $(document).ready(function () {
           /*  $("#btnStart").click(function () {// hilo dedidcado
                worker = new Worker("Scripts/processing.js");
                worker.addEventListener("message", ReceiveMessageFromWorker, false);
              worker.addEventListener("error", HandleError, false);
                worker.postMessage("Hello Worker!");
                
            });
            function ReceiveMessageFromWorker(evt) {
                alert(evt.data);
            }
            function HandleError(evt) {
                var msg = "There was an error in the worker thread!\r\n";
                msg += "Message : " + evt.message + "\r\n";
                msg += "Source : " + evt.filename + "\r\n";
                msg += "Line No. : " + evt.lineno;
                alert(msg);
            }*/
            $("#btnStart").click(function () {//hilo compartido
                worker = new SharedWorker("scripts/SharedProcessing.js");
                worker.port.addEventListener("message", ReceiveMessageFromWorker, false);
                worker.port.start();
                worker.port.postMessage("Hello Shared Worker!");
            });
            function ReceiveMessageFromWorker(evt) {
                alert(evt.data);
            }
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <input id="btnStart" type="button" value="Click" />
    </div>
    </form>
</body>
</html>
