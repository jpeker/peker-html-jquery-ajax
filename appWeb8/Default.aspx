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
    <script>


        var targetOrigin = "http://localhost:50977";
        $(document).ready(function () {
            if (!Modernizr.postmessage) {
                alert("This browser doesn’t support the HTML5 postMessage API!");
                return;
            }
            //var targetWindow = $("#target").get(0).contentWindow;
            var targetWindow = window.open(targetOrigin + "/Target.aspx");
            window.addEventListener("message", ReceiveMessage, false);
            $("#btnSend").click(function () {
                targetWindow.postMessage($("#txtData").val(), targetOrigin);
            });
            function ReceiveMessage(evt) {
                if (evt.origin != targetOrigin)
                    return;
                $("#divReceived").append(evt.origin + " : " + evt.data + "<br/>");
            }
        });
    </script>
</head>
<body>
   <form id="form1" runat="server">
<div>Send Data :</div>
<input id="txtData" type="text" /><input id="btnSend" type="button" value="Send" />
<div>Data Received from Target Web Form :</div>
<div id="divReceived"></div>
<h3>Target Page in IFRAME</h3>
<iframe id="target" src="http://localhost:50100/Target.aspx">
</iframe>
</form>
</body>
</html>
