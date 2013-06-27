<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Target.aspx.cs" Inherits="Target" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
     <script type="text/javascript"
        src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.7.2.js">
    </script>
    <script type="text/javascript" src="/Scripts/modernizr-2.6.2.js" ></script>
    <script>
        var targetOrigin = "http://localhost:50977";
        $(document).ready(function () {
         
            window.addEventListener("message", ReceiveMessage, false);
        });
        function ReceiveMessage(evt) {
            if (evt.origin != targetOrigin)
                return;
            $("#divReceived").append(evt.origin + " : "+ evt.data + "<br/>");
            evt.source.postMessage("Data received successfully!", evt.origin);
        }

    </script>
</head>
<body>
   <form id="form1" runat="server">
<div>Data Received from Main Web Form :</div>
<div id="divReceived"></div>
</form>
</body>
</html>
